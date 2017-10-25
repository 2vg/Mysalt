install_packages:
  pkg.installed:
    - pkgs:
      - vim
      - zsh
      - nginx
      - php-fpm
      - ufw
      - nodejs

useradd:
  user.present:
    - name: nivg
    - shell: /bin/bash
    - home: /home/nivg
    - groups:
      - wheel
      
create_nginx_rootdir:
  file.directory:
    - name: /var/www/local
    - user: http
    - group: http
    - mode: 0644

create_nginx_vhostdir:
  file.directory:
    - name: /etc/nginx/vhost.d
    - user: http
    - group: http
    - mode: 0644
   
ngx_conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: ./files/nginx/nginx.conf
    - mode: 0644
    - user: http
    - group: http
    
vhost_conf:
  file.managed:
    - name: /etc/nginx/vhost.d/default.conf
    - source: ./files/nginx/default.conf
    - mode: 0644
    - user: http
    - group: http
  
fpm_conf:
  file.managed:
    - name: /etc/php/conf.d/zzz.conf
    - source: ./files/php-fpm/zzz.conf
    - mode: 0644
    - user: http
    - group: http
  
service_php-fpm:  
  service.running:
    - name: php-fpm
    - enable: True
    
service_nginx:  
  service.running:
    - name: nginx
    - enable: True
    
service_ufw:  
  service.running:
    - name: ufw
    - enable: True
