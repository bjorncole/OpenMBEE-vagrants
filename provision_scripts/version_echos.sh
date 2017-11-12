# Read out key configuration facts at the end of the setup

echo "Build complete for MMS 3.2.1"
echo "Current PostgreSQL version:"
sudo psql --version

echo "Current Alfresco version: 5.1.g"

echo "Current Tomcat service information:"
bash $CATALINA_HOME/bin/version.sh