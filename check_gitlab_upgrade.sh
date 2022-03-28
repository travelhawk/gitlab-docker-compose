#!/bin/bash

### Check GitLab repo for new version for self-hosted GitLab (Docker setup)
### and updates it if available. Major version upgrades are not updated because
### they eventually need manual steps.
###
### Requirements: docker-compose.yml and VERSION files
###
### NOTICE:
### VERSION in official gitlab repository doesn't necessarily match the latest version at Dockerhub.
### This should be neglectable...
###
### Author: Michael Falk
### Contact: falk@humatects.de

update() {
	# try to update gitlab
	docker-compose pull
	docker-compose down
	docker-compose up -d
	curl -s https://gitlab.com/gitlab-org/gitlab/-/raw/master/VERSION > VERSION
	echo Sucessfully updated to latest version from DockerHub...
}

echo Check for GitLab upgrade...

# get local version
LOCAL_MAJOR_VERSION=$(cat VERSION | cut -d '.' -f1)
LOCAL_MINOR_VERSION=$(cat VERSION | cut -d '.' -f2)

echo Local version: $(cat VERSION)

# download gitlab version and check against local VERSION file
VERSION=$(curl -s https://gitlab.com/gitlab-org/gitlab/-/raw/master/VERSION)
MAJOR_VERSION=$(echo $VERSION | cut -d '.' -f1)
MINOR_VERSION=$(echo $VERSION | cut -d '.' -f2)

echo New version: $VERSION

# check whether upgrade is needed
if [[ "$MAJOR_VERSION" == "$LOCAL_MAJOR_VERSION" ]]
then
	if [[ "$MINOR_VERSION" == "$LOCAL_MINOR_VERSION" ]]
	then
		echo "GitLab doesn't need to be updated."
		exit 0
	else
		echo Minor update found.
		update
	fi
else
	echo Major version update found: "$VERSION"
	echo Please update manually and check possible update paths...
fi
