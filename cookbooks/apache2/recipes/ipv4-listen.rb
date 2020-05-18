bash 'Assign IPv4 only' do
  user 'root'
  code <<-EOH
    sed -i 's/^Listen 80/Listen 0.0.0.0:80/' /etc/apache2/ports.conf
  EOH
end
