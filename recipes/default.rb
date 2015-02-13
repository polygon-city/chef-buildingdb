#
# Cookbook Name:: buildingdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
package "assimp-utils"

include_recipe 'nodejs::nodejs_from_source'
%w(bower grunt-cli).each do |package|
  nodejs_npm package
end
include_recipe "mongodb"

node.set[:mongodb][:users] = [{
  'username' => node[:buildingdb][:mongodb][:user][:name],
  'password' => node[:buildingdb][:mongodb][:user][:password],
  'roles' => %w(readWrite),
  'database' => node[:buildingdb][:mongodb][:database]
}]
include_recipe "mongodb::user_management"

application "buildingdb" do
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

  before_symlink do
    directory "#{new_resource.shared_path}/config"
    directory "#{new_resource.shared_path}/tmp"

    template "#{new_resource.shared_path}/config/config.js" do
      source "config.js.erb"
    end

    template "#{new_resource.shared_path}/config/setup.js" do
      source "setup.js.erb"
    end

    execute "grunt sass" do
      cwd "#{new_resource.release_path}"
      user "www-data"
      command "grunt sass"
    end

    execute "bower install" do
      cwd "#{new_resource.release_path}"
      command "bower install --allow-root"
    end
  end

  symlinks "config/config.js" => "config/config.js",
	   "config/setup.js" => "config/setup.js",
	   "tmp" => "tmp"

  nodejs do
    template 'upstart.conf.erb'
    entry_point 'bin/www'
  end
end
