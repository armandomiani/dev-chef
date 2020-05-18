execute 'update' do
  command 'apt-get update'
end

package 'install_packages' do
  package_name node['apache2']['packages']
  action :install
end

service 'apache2' do
  action [ :enable, :restart ]
end
