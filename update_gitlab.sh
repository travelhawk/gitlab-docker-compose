# update gitlab
docker-compose pull
docker-compose down
docker-compose up -d
curl -s https://gitlab.com/gitlab-org/gitlab/-/raw/master/VERSION > VERSION
echo Sucessfully updated to latest version from DockerHub...
