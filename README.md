# apsim-web

Web infrastructure around [APSIM](https://github.com/APSIMInitiative/ApsimX)

## How to bring all services up and down

* Most services can be deployed using the `./deploy.sh all` command directly under the apsim-web directory.
* Most services do not require local images to be built. Httpd is the exception here which needs to be rebuilt to include additional `.conf` files.
* most docker images used here can be found [here](https://hub.docker.com/u/apsiminitiative)

### Vault

This is a special case and cannot be deployed from the root docker-compose.yml file as the root level .env interferes with container settings causing it not to work. It will launch, however will not be functional.

### Registration

This image is built locally. Any updates will require the image to be rebuilt on the host machine.

### All other services/containers

All services other than vault can be launched via `./deploy.sh all`.

### Adding new services

To make the services available:

* create a new `.conf` and place this under the hosts directory in the httpd project directory.
* Rebuild the httpd image by using the command from the apsim-web directory `cd httpd && docker build -t httpd:apsim .`
* then redeploy the apsim-web stack by using the command `./deploy.sh all`
