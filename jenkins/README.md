# Jenkins

Jenkins configuration files.

## Local (debug) deployment

Just the usual `docker-compose up -d` to start and `docker-compose down` to stop. You'll also need to run the httpd service, which is located at `../httpd` directory (see the readme file there for local deployment).

You'll also need a way to access jenkins via its canonical `jenkins.apsim.info` URL. I typically just make a temp change to my hosts file.