FROM ubuntu

RUN apt-get update 
RUN apt-get install -y wget 
RUN apt-get install -y unzip 
RUN apt-get install -y pip

RUN wget https://github.com/co8/hds/archive/refs/heads/latest.zip
RUN unzip latest.zip
WORKDIR hds-latest
RUN pip3 install discord-webhook

RUN rm new-activity_history.json

# we actually want the config files to be in a mounted volume
RUN ln -s /hds-latest/activity/config.json config.json
RUN ln -s /hds-latest/activity/activity_history.json activity_history.json
RUN ln -s /hds-latest/activity/new-activity_history.json new-activity_history.json
