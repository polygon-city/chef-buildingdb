package 'build-essential'
package 'cmake'

git '/srv/assimp' do
  repository 'https://github.com/assimp/assimp.git'
end

execute "ldconfig" do
  command "ldconfig"
  action :nothing
end

file '/etc/ld.so.conf.d/assimp.conf' do
  content '/usr/local/lib'
  notifies :run, "execute[ldconfig]"
end

bash 'install_assimp' do
   cwd '/srv/assimp'
   code <<-EOH
     cmake -G 'Unix Makefiles'
     make install
   EOH
end

