#!/bin/bash
input="id.txt"
while IFS= read -r line
do
  aws workspaces describe-workspaces --query "Workspaces[?UserName=='$line'][WorkspaceId]" --output text >> remove.txt
done < "$input"
