#!/bin/bash
input="id.txt"
while IFS= read -r line
do
  otpt=$(aws workspaces describe-workspaces-connection-status --workspace-ids $line --query 'WorkspacesConnectionStatus[*].LastKnownUserConnectionTimestamp' --output text)
  uname=$(aws workspaces describe-workspaces --query "Workspaces[?WorkspaceId=='$line'][UserName]" --output text)
  directory=$(aws workspaces describe-workspaces --query "Workspaces[?WorkspaceId=='$line'][DirectoryId]" --output text)
  if test -z "$otpt"
  then
    echo "$uname,$directory,Never"
  else
    echo "$uname,$directory,$otpt"
  fi 

done < "$input"
