#docker buildx build --platform linux/amd64,linux/arm64 -t rdomloge/hds-container:v1.2 . --push
docker build --no-cache -t rdomloge/hds-container:v1.2 .
