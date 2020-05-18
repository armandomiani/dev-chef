include_recipe 'apache2'

execute 'a2enmod cache'
execute 'a2enmod cache_disk'

bash 'Configure Cache' do
  user 'root'
  code <<-EOH
    CACHE_CONFIG=/etc/apache2/mods-enabled/cache_disk.conf
    START="$(cat -n ${CACHE_CONFIG} | grep CacheRoot | awk '{ print $1 }')"

    sed -i "${START}i #Custom Config" ${CACHE_CONFIG}
    sed -i "${START}i CacheLockMaxAge 900" ${CACHE_CONFIG}

    sed -i 's/CacheDirLevels 2/CacheDirLevels 1/g' ${CACHE_CONFIG}
    sed -i 's/CacheDirLength 1/CacheDirLength 2/g' ${CACHE_CONFIG}
    sed -i 's/#CacheEnable/CacheEnable/g' ${CACHE_CONFIG}
  EOH
end
