#!/bin/bash
input="input.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces create-workspaces --workspaces DirectoryId=d-906770332b,UserName=$line,BundleId=wsb-x3l278677,WorkspaceProperties="{RunningMode="AUTO_STOP",RunningModeAutoStopTimeoutInMinutes=60}",Tags=["{Key=Project,Value=laser-ws-colombia}"]
done < "$input"
