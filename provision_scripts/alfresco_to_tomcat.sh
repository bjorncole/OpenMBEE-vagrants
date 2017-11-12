# Move pre-built Alfresco with MMS integrated into Tomcat to allow it to be run

sudo cp -rf /vagrant/mms/mms-ent/runner/target/tomcat/webapps/alfresco-solr4/ /usr/share/apache-tomcat-7.0.82/webapps/solr4/

sudo cp -rf /vagrant/mms/mms-ent/runner/target/tomcat/webapps/api-explorer/ /usr/share/apache-tomcat-7.0.82/webapps/api-explorer/

sudo cp -rf /vagrant/mms/mms-ent/runner/target/tomcat/webapps/repo/ /usr/share/apache-tomcat-7.0.82/webapps/alfresco/

sudo cp -rf /vagrant/mms/mms-ent/runner/target/tomcat/webapps/share/ /usr/share/apache-tomcat-7.0.82/webapps/share/