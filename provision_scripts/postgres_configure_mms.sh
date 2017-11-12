# Invoke the various SQL commands to set up PGSQL for use by MMS

sudo psql -U postgres -c "CREATE USER vagrant;"
sudo psql -U postgres -c "CREATE USER mms WITH PASSWORD 'mmspass';"
# so we can run mms.sql
sudo psql -U postgres -c "CREATE USER root;"
# make db
sudo psql -U postgres -c "CREATE DATABASE mms;"
sudo psql -U postgres -c "CREATE DATABASE root;"
# grant needed permissions to the MMS user

sudo psql -c "GRANT ALL ON DATABASE mms TO mms;" -U postgres
sudo psql -c "ALTER USER mms CREATEDB;" -U postgres
sudo psql -c "ALTER DATABASE mms OWNER TO mms;" -U postgres

# sudo can connect to root role after the user has been made
sudo psql -d mms -a -f /vagrant/mms/mms-ent/repo-amp/src/main/java/gov/nasa/jpl/view_repo/db/mms.sql

# mms.sql makes tables - these lines hand them over to mms

sudo psql -c "ALTER TABLE organizations OWNER TO mms;" -U postgres -d mms
sudo psql -c "ALTER TABLE projectmounts OWNER TO mms;" -U postgres -d mms
sudo psql -c "ALTER TABLE projects OWNER TO mms;" -U postgres -d mms

sudo psql -c "GRANT ALL ON TABLE organizations TO mms;" -U postgres -d mms
sudo psql -c "GRANT ALL ON TABLE projectmounts TO mms;" -U postgres -d mms
sudo psql -c "GRANT ALL ON TABLE projects TO mms;" -U postgres -d mms