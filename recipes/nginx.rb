include_recipe "nginx::default"

template "#{node[:nginx][:dir]}/sites-available/#{node[:buildingdb][:application]}" do
  source 'nginx-site.conf.erb'
  notifies :reload, "service[nginx]"
end

nginx_site node[:buildingdb][:application]
