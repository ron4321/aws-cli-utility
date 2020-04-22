#!/bin/bash
set -eux

main() {
  local user="ec2-user"
  local host=$(aws ec2 describe-instances \
                --region ap-northeast-1 \
                --output json \
                --filters "Name=instance-state-code,Values=16" \
                | jq -r '.Reservations[].Instances[] | [.Tags[] | select(.Key == "Name").Value][] + "\t" +  .InstanceType + "\t" + .PublicIpAddress + "\t" + .Platform' \
                | awk '{if ($4 != "windows") printf "%-45s %-15s %-10s\n",$1,$2,$3}' \
                | sort \
                | peco \
                | awk '{print $3}')
  
  ## replace to your pem path
  local pem_path=~/.ssh/hogehoge.pem

  ssh "$user@$host" -i ${pem_path}
}

main
