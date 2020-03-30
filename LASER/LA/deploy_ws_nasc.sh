#!/bin/bash
input="input.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces create-workspaces --workspaces DirectoryId=d-90677153cf,UserName=$line,BundleId=wsb-dr32wyhmh,WorkspaceProperties="{RunningMode="AUTO_STOP",RunningModeAutoStopTimeoutInMinutes=60}",Tags=["{Key=Project,Value=nasc_ws_bcp}"]
done < "$input"