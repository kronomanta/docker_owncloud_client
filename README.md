# docker_owncloud_client
A Docker container to download and run the latest [Owncloud Desktop client](https://owncloud.com/desktop-app) for CLI access.

## Requirements
You need to install both [Docker Engine](https://docs.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install).

## Setup variables
Set up the environment variables in the **docker-compose.yml**
* **USER** and **PASS** are the credentials to use. **Attention**, these will be saved in a plaintext in the crontab file.
* **SERVER_URL** and **SERVER_PORT** are obvious. In case you want to sync only part of the data, you can set the path for a subfolder with **SERVER_SUBFOLDER**, start it with a slash ('/'), for example **/Music**.
* **CRON_SCHEDULE** is to fine-tune the refresh period, it accepts any standard **cron** format, the default is every minute (* * * * *).

## Setup volumes
* **/owncloud/data**: this is the folder to be synced

## Run
Finally, run it as a daemon by typing **docker-compose up -d**


