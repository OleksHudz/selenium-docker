FROM bellsoft/liberica-openjdk-alpine:17.0.8

# install curl and jq
RUN apk add curl jq

# workspace
WORKDIR /home/selenium-docker

# add required files to run the test
ADD target/docker-resources ./
ADD https://raw.githubusercontent.com/vinsguru/selenium-docker/master/06-jenkins-ci-cd/selenium-docker/runner.sh runner.sh

# Start the runner.sh
ENTRYPOINT sh runner.sh