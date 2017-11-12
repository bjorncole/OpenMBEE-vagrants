# Install ElasticSearch from its server and then cleanup

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.2.rpm
sudo rpm --install elasticsearch-5.3.2.rpm
rm elasticsearch-5.3.2.rpm

sudo cp -f /vagrant/non_yum_installer_files/config_files/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml