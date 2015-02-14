include_recipe "mongodb"

node.set[:mongodb][:users] = [{
  'username' => node[:buildingdb][:mongodb][:user][:name],
  'password' => node[:buildingdb][:mongodb][:user][:password],
  'roles' => %w(readWrite),
  'database' => node[:buildingdb][:mongodb][:database]
}]
include_recipe "mongodb::user_management"
