# Self-Hosted GitLab using docker-compose
Minimal docker-compose setup to run GitLab on your own server. To update GitLab automatically, I wrote a simple update script which checks for a new GitLab version. The update script `check_gitlab_update.sh` installs minor version updates and patches automatically. Major version updates will not be installed automatically because they might the installation. It is advised to check whether there is an update paths or intermediate steps to be done first before updating to a new major version of GitLab.

If you want to run `check_gitlab_update.sh` regulary, you can use a crontab task.

## Requirements
- docker
- docker-compose

## Configuration

## Scripts

## Update GitLab
Run `check_gitlab_update.sh`.
