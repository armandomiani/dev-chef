include_recipe 'apache2'

bash 'modify security.conf' do
  user 'root'
  code <<-EOH
    sed -i 's/^ServerTokens .*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
    sed -i 's/^ServerSignature .*/ServerSignature Off/' /etc/apache2/conf-available/security.conf
EOH
end

service 'apache2' do
  action [ :restart ]
end
