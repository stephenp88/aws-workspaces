#!/bin/bash
input="input.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces create-workspaces --workspaces DirectoryId=d-90677036e8,UserName=$line,BundleId=wsb-gvn6kt8qn,WorkspaceProperties="{RunningMode="AUTO_STOP",RunningModeAutoStopTimeoutInMinutes=120}",Tags=["{Key=Project,Value=laser-ws-equador}"]
done < "$input"
