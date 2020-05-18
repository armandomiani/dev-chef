include_recipe 'apache2'

package 'libapache2-mod-passenger' do
  action :install
end

execute 'a2enmod passenger'
