#!/bin/bash
if [ -z "$TEAMCITY_SERVER" ]; then
    echo "Missing -e TEAMCITY_SERVER=http://teamcityServer"
    exit 1
fi

while [ 1 ]; do
    wget http://server:8111/update/buildAgent.zip
    if [ $? = 0 ];
        then break;
    fi;
    let waiting+=3
    if [ $waiting -eq 120 ]; then
        echo "Teamcity server did not respond within 120 seconds"...
        exit 42
    fi;
    sleep 3s;

done;
AGENT_FOLDER="/opt/buildAgent"
unzip buildAgent.zip -d $AGENT_FOLDER && rm buildAgent.zip

echo "serverUrl=http://$TEAMCITY_SERVER" >> $AGENT_FOLDER"/conf/buildAgent.properties"

chmod +x $AGENT_FOLDER/bin/agent.sh
sh $AGENT_FOLDER/bin/agent.sh run
