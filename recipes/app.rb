package 'mongodb-clients'
include_recipe 'nodejs::nodejs_from_source'
%w(bower grunt-cli).each do |package|
  nodejs_npm package
end

application node[:buildingdb][:application] do
  path node[:buildingdb][:deploy_to]
  owner node[:buildingdb][:node][:user]
  group node[:buildingdb][:node][:group]
  packages ["git"]
  environment(
    'NODE_ENV' => node[:buildingdb][:node][:environment]
  )
  environment_name node[:buildingdb][:node][:environment]

  repository node[:buildingdb][:git][:src]
  revision node[:buildingdb][:git][:revision]

  before_deploy do
    directory "#{new_resource.shared_path}/config"
    directory "#{new_resource.shared_path}/tmp"

    template "#{new_resource.shared_path}/config/config.js" do
      source "config.js.erb"
    end
  end

  before_symlink do
    execute "grunt sass" do
      cwd "#{new_resource.release_path}"
      user "www-data"
      command "grunt sass"
    end

    execute "bower install" do
      cwd "#{new_resource.release_path}"
      command "bower install --allow-root"
    end

    execute "load mongodb indexes" do
      cwd "#{new_resource.release_path}"
      command "for file in `ls schema`; do mongo #{node[:buildingdb][:mongodb][:host]}/#{node[:buildingdb][:mongodb][:database]} -u #{node[:buildingdb][:mongodb][:user]} -p #{node[:buildingdb][:mongodb][:password]}  < schema/$file; done;"
    end
  end

  symlinks "config/config.js" => "config/config.js",
     "config/setup.js" => "config/setup.js",
     "schema" => "schema",
     "tmp" => "tmp"

  nodejs do
    template 'upstart.conf.erb'
    entry_point 'bin/www'
  end
end
