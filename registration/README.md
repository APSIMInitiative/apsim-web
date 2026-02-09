# Registration Website Configuration

## Local (debug) deployment

To deploy the registration website locally, you will need to set the following environment variables:

- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USER`
- `SMTP_TOKEN`
- `REGO_DB_CONNECT_STRING`: this should look like `server=registration-db;uid=${MARIADB_USER};pwd=${MARIADB_PASSWORD};Database=${MARIADB_DATABASE}`

Once these are set, just run the deploy script in this directory.

## Rebuild image for Production

Use the build script in this directory with the following command:

`./build.sh`

Check that the docker image is updated. The creation date should be quite recent for registration-site. The command to do so is:

`docker images`