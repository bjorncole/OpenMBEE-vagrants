# Load up Postgres for Alfresco and set up users

# Move JDBC libraries to Tomcat

sudo cp -rf /vagrant/non_yum_installer_files/postgresql-9.2-1004.jdbc4.jar $CATALINA_HOME/lib

# Put the required users in the database for Alfresco base

sudo psql -U postgres -c "CREATE USER alfresco WITH PASSWORD 'alfresco';"

# make db
sudo psql -U postgres -c "CREATE DATABASE alfresco;"
# grant needed permissions to the Alfresco user

sudo psql -c "GRANT ALL ON DATABASE alfresco TO alfresco;" -U postgres
sudo psql -c "ALTER USER alfresco CREATEDB;" -U postgres
sudo psql -c "ALTER DATABASE alfresco OWNER TO alfresco;" -U postgres

# also need to tune the Alfresco settings

sudo cp -rf /vagrant/non_yum_installer_files/config_files/alfresco-global.properties $CATALINA_HOME/webapps/alfresco/WEB-INF/classes/alfresco-global.properties