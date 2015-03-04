include_recipe "mongodb"

execute "lets see if mongo is up yet" do
  command 'mongo --eval "{ping: 1}"'
  action :run
  retries 6
  retry_delay 10
end

node.set[:mongodb][:users] = [{
  'username' => node[:buildingdb][:mongodb][:user][:name],
  'password' => node[:buildingdb][:mongodb][:user][:password],
  'roles' => %w(readWrite),
  'database' => node[:buildingdb][:mongodb][:database]
}]
include_recipe "mongodb::user_management"
