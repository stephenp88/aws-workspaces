#!/bin/bash
input="id.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces delete-tags --resource-id $line --tag-keys "Project"
  sleep 1
  aws workspaces create-tags --resource-id $line --tags Key=Project,Value=laser-ws-equador
done < "$input"
