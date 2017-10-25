# Mysalt
> My ArchLinux Server auto Configuration.

## require
- salt

## server setup
> this setup on ArchLinux. you not Arch, you must edit server.sls.

you can not have salt, please install first salt.
``` shell
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh

sudo systemctl start salt-master
```

after install salt, edit salt conf.

``` shell
sudo vim /etc/salt/master
# search 'file_client:' + 'file_roots:'
# and edit
# # file_client: remote => file_client: local
# and, file_roots base comment out.

sudo salt-master -d #reload.
```

after configuration, lets start auto configuration.

``` shell
git clone https://github.com/2vg/Mysalt
cd Mysalt
sudo mkdir -p /srv/salt
sudo mv top.ssl /srv/salt
sudo mv server.ssl /srv/salt

sudo salt-call --local state.apply
# you want to configuration log, you can use this.
# salt-call --local state.apply -l debug
```

All done !!! Enjoy !!!

## Option Zsh and Vim config
my dotfiles setup ;) (All auto config Zsh and Vim.)
``` shell
curl -L https://github.com/2vg/dotfiles/raw/master/install.sh | sh
```