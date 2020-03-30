#!/bin/bash
input="id.txt"
aws workspaces describe-workspaces --query "Workspaces[*][WorkspaceId]" --output text >> id.txt

while IFS= read -r line
do
  otpt=$(aws workspaces describe-tags --resource-id $line --output text)
  uname=$(aws workspaces describe-workspaces --query "Workspaces[?WorkspaceId=='$line'][UserName]" --output text)
  directory=$(aws workspaces describe-workspaces --query "Workspaces[?WorkspaceId=='$line'][DirectoryId]" --output text)
  workspace=$(aws workspaces describe-workspaces --query "Workspaces[?WorkspaceId=='$line'][WorkspaceId]" --output text)
  if test -z "$otpt"
  then
    echo "$uname,$directory,$workspace,Never"
  else
    echo "$uname,$directory,$workspace,$otpt"
  fi 

done < "$input"
