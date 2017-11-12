# Install Postgres - this seems to get 9.2, might not be compatible

#wget https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-3.noarch.rpm

#sudo yes | yum install postgresql-server-9.4.3 postgresql-contrib-9.4.3

sudo yes | yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb

# make a data directory for PGSQL

sudo cd /var/lib
sudo mkdir data/

# cheat the permissions by starting in trust mode
sudo cp -f /vagrant/non_yum_installer_files/config_files/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf