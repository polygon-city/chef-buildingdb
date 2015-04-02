node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'
node.set[:mongodb][:package_version] = node[:buildingdb][:mongodb][:version]
node.set[:mongodb][:install_method] = 'mongodb-org'

node.set['mongodb']['ruby_gems']['mongo'] = '~> 1.12'

include_recipe 'mongodb::mongo_gem'
include_recipe 'mongodb'

execute "lets see if mongo is up yet" do
  command 'mongo --eval "{ping: 1}"'
  action :run
  retries 12
  retry_delay 10
end

node.set[:mongodb][:users] = [{
  'username' => node[:buildingdb][:mongodb][:user][:name],
  'password' => node[:buildingdb][:mongodb][:user][:password],
  'roles' => %w(readWrite),
  'database' => node[:buildingdb][:mongodb][:database]
}]
include_recipe "mongodb::user_management"
