#!/bin/sh
set -e
############################################################
# Help                                                     #
############################################################
Help()
{
# Display Help
echo "This script will clone a repo from GitHub,
build the dockerfile from the root of the repo
and deploy it to Docker Hub."
echo "Give the repositories as arguments for this script."
echo
echo "Options:"
echo "-h    Show this help message"
echo
echo "Syntax: builder.sh [user/github_repository] [user/DockerHubRepository]"
echo "Example: ./builder.sh mluukkai/express_app mluukkai/testing"
echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":h:" option; do
  case $option in
    h) #display help
      Help
      exit;;
    \?)
      echo "Unknown option provided."
      exit;;
  esac
done

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Please provide the required arguments!"
  Help
  exit 1
fi

if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PWD" ]; then
  echo "No Docker credentials provided!"
  exit 1
fi

echo "All is good! Arguments given: ""$1"" ""$2""".

rm -rf temp \
  && git clone https://github.com/"$1".git ./temp \
  && cd temp || exit \
  && docker build -t "$2" . \
  && docker login -u="$DOCKER_USER" -p="$DOCKER_PWD" || exit \
  && docker push "$2" \
  && cd .. \
  && rm -rf temp

echo "Success!"