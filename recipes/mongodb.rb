directory "/data/db" do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'

node.set[:mongodb][:package_version] = node[:buildingdb][:mongodb][:version]
node.set[:mongodb][:install_method] = 'mongodb-org'
node.set['mongodb']['ruby_gems']['mongo'] = '~> 1.12'
node.set[:mongodb][:instance_name] = 'mongod'
node.set[:mongodb][:default_init_name] = 'mongod'

include_recipe 'mongodb::mongo_gem'
include_recipe 'mongodb'

mongodb_instance "mongod"

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
