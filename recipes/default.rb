#
# Cookbook Name:: buildingdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mongodb"

application "buildingdb" do
  path "/srv/buildingdb"
  owner "www-data"
  group "www-data"
  packages ["git"]

  repository "https://github.com/polygon-city/building-database.git"

  nodejs do
    entry_point "app.js"
  end
end
