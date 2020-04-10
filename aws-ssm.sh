
#!/bin/bash
set -eux

main() {
    local selected=$(aws ec2 describe-instances \
        --instance-ids $(aws ssm get-inventory \
                                --filters "Key=AWS:InstanceInformation.InstanceStatus,Values=Terminated,Type=NotEqual" \
                                --output json \
                                | jq -r '[.Entities[].Id] | join(" ")') \
        --output json \
        --query 'Reservations[].Instances[].{Id:InstanceId, Name:Tags[?Key==`Name`].Value, LaunchTime:LaunchTime}' \
        | jq -r '.[] | (.Id) + "       " + (.Name[0])  + "       " + (.LaunchTime)' \
        | peco)

    local id=$(echo ${selected} | cut -f 1 -d " ")

    aws ssm start-session --target ${id}
}

main