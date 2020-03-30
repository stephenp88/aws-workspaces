#!/bin/bash
input="input.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces create-workspaces --workspaces DirectoryId=d-906770ef21,UserName=$line,BundleId=wsb-k2r3bkn7w,WorkspaceProperties="{RunningMode="AUTO_STOP",RunningModeAutoStopTimeoutInMinutes=60}",Tags=["{Key=Project,Value=laser-ws-brazil}"]
done < "$input"
