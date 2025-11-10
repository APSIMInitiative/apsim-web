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

## Updating SSL/TLS certificates

1. On the server, change into root user using `sudo -i`
2. Use the command to generate a csr file: `openssl req -new -newkey rsa:2048 -nodes -keyout apsim.info.key -out apsim.info.csr`
3. Provide the contents of the `.csr` file to your SSL certificate provider e.g. GoDaddy.
4. Finish steps in certificate providers site until you get your .crt files. You'll need two.
5. Move these to `httpd/.certs`.
6. Move the apsim.info.key file to `httpd/.certs`.
7. Rename these three files to match the names specified in `httpd-ssl.conf`.
8. Redeploy the docker services using the deploy.sh script.
9. Check that your web services can be accessed via https protocol.
10. Done.

### Common certificate generation issues

- if openssl has trouble with missing libraries/packages. Simply reinstall on the server.