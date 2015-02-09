#
# Cookbook Name:: buildingdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nodejs"
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
  path "/srv/buildingdb"
  owner "www-data"
  group "www-data"
  packages ["git"]

  repository "https://github.com/polygon-city/building-database.git"

  before_symlink do
    directory "/srv/buildingdb/shared/config"
    directory "/srv/buildingdb/shared/tmp"

    template "/srv/buildingdb/shared/config/config.js" do
      source "config.js.erb"
    end

    template "/srv/buildingdb/shared/config/setup.js" do
      source "setup.js.erb"
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
