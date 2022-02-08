# Apache configuration

## Local (debug) deployment

To deploy the apache server locally (ie for debugging purposes), you will need to create a .certs directory here containing the dev certificate and private key. A self-signed cert (e.g. generated with openssl) will work
  - server.crt
  - server.key
  - server-chain.crt

Once this is done, just run the deploy script in this directory. This script rebuilds the docker image (from the dockerfile in this directory), then starts an apache docker container with the new image (will stop it first if it's already running). If on windows, you could just run (from within this directory).

```
docker build -t httpd:apsim .
docker-compose down
docker-compose up -d
```
