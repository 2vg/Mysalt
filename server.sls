vim:
  pkg.installed:
    - name: vim
    
zsh:
  pkg.installed:
    - name: zsh

nginx:
  pkg.installed:
    - name: nginx
    
php-fpm:
  pkg.installed:
    - name: php-fpm
    
nodejs:
  pkg.installed:
    - name: nodejs
    
ufw:
  pkg.installed:
    - name: ufw

useradd:
  user.present:
    - name: nivg
    - shell: /bin/bash
    - home: /home/nivg
    - groups:
      - wheel
      
create_rootdir:
  file.directory:
    - name: /var/www/local
    - user: http
    - group: http
    - mode: 0644

create_vhostdir:
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
    - name: /etc/php/conf.d/www.conf
    - source: ./files/php-fpm/www.conf
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