current_dir = $(shell pwd)
local_bin = /usr/local/bin

install:
	mkdir -p $(current_dir)/bin
	sudo cp $(current_dir)/aws-ssh.sh bin/aws-ssh.sh && sudo chmod 755 bin/aws-ssh.sh
	sudo cp $(current_dir)/aws-ssm.sh bin/aws-ssm.sh && sudo chmod 755 bin/aws-ssm.sh
	sudo unlink /usr/local/bin/aws-ssh
	sudo unlink /usr/local/bin/aws-ssm
	sudo ln -s $(current_dir)/bin/aws-ssh.sh $(local_bin)/aws-ssh
	sudo ln -s $(current_dir)/bin/aws-ssm.sh $(local_bin)/aws-ssm

setup:
	brew install jq
	brew install awscli
	brew install peco