#!/bin/bash
input="remove.txt"
while IFS= read -r line
do
  echo "$line"
  aws workspaces terminate-workspaces --terminate-workspace-requests $line
done < "$input"
