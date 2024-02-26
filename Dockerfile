FROM bellsoft/liberica-openjdk-alpine:17.0.10

# workspace
WORKDIR /home/workspace/docker

# Add the required files
ADD target/docker-resources ./
ADD runner.sh runner.sh

# Start the runner.sh
ENTRYPOINT sh runner.sh