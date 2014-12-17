
Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.synced_folder ".", "/var/www"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline <<-SHELL
     apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade && apt-get -y install nginx php5 php5-cli php5-cgi spawn-fcgi php5-mysql php5-mcrypt php5-curl php5-gd php5-fpm openssl php-apc php5-mcrypt mcrypt redis-server mariadb-server-5.5 mariadb-client-5-5 && ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/fpm/conf.d/20-mcrypt.ini && php5enmod mcrypt && service php5-fpm restart && service nginx start
  SHELL

end
