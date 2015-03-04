define :nginx_site, enable: true do
  if params[:enable]
    execute "nxensite #{params[:name]}" do
      command "/usr/sbin/nxensite #{params[:name]}"
      notifies :reload, "service[nginx]"
      not_if {
        File.symlink?("#{node[:nginx][:dir]}/sites-enabled/#{params[:name]}")
      }
    end
  else
    execute "nxdissite #{params[:name]}" do
      command "/usr/sbin/nxdissite #{params[:name]}"
      notifies :reload, "service[nginx]"
      only_if {
        File.symlink?("#{node[:nginx][:dir]}/sites-enabled/#{params[:name]}")
      }
    end
  end
end
