FROM ubuntu AS base

RUN apt-get update && apt-get install -y wget unzip pip

RUN pip3 install discord-webhook

FROM base
# this is merely here to be changed on each build, so the previous steps can be cached,  
# but this cannot, because we'll set it with a new value each time, in the build script
ARG CACHEBUST=1 
RUN wget --connect-timeout 5 --read-timeout 1 https://github.com/co8/hds/archive/refs/heads/latest.zip
RUN unzip latest.zip
WORKDIR hds-latest

RUN rm new-activity_history.json

# we actually want the config files to be in a mounted volume
RUN ln -s /hds-latest/activity/config.json config.json
RUN ln -s /hds-latest/activity/activity_history.json activity_history.json
RUN ln -s /hds-latest/activity/new-activity_history.json new-activity_history.json
