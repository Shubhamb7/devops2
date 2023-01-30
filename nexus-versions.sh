#!/usr/bin/bash
continuationTokens=()
versionList=()
element=0
continuationToken="$(curl -s -u admin:nexus123 -X GET 'http://34.229.226.67:8081/service/rest/v1/search/assets?repository=app-snapshots&group=com.spring' | jq '.continuationToken' -r)"
while [ $continuationToken != "null" ]
do
    continuationTokens+=("$continuationToken")
    token=${continuationTokens[$element]}
    continuationToken=$(curl -s -u admin:nexus123 -X GET "http://34.229.226.67:8081/service/rest/v1/search/assets?repository=app-snapshots&group=com.spring&continuationToken=${token}" | jq ".continuationToken" -r)
    ((element++))
done

versions=$(curl -s -u admin:nexus123 -X GET 'http://34.229.226.67:8081/service/rest/v1/search/assets?repository=app-snapshots&group=com.spring' | jq '.items | .[].maven2 | select(.extension == "jar") | .version' -r)
echo "$versions"
for i in $continuationTokens
do
newVersions=$(curl -s -u admin:nexus123 -X GET "http://34.229.226.67:8081/service/rest/v1/search/assets?repository=app-snapshots&group=com.spring&continuationToken=${i}" | jq '.items | .[].maven2 | select(.extension == "jar") | .version' -r)
echo "$newVersions"
done
