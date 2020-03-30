#!/bin/bash
input="input.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces create-workspaces --workspaces DirectoryId=d-906770ef9c,UserName=$line,BundleId=wsb-k1jc6g24h,WorkspaceProperties="{RunningMode="AUTO_STOP",RunningModeAutoStopTimeoutInMinutes=120}",Tags=["{Key=Project,Value=laser-ws-abs}"]
done < "$input"
