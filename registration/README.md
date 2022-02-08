# Registration Website Configuration

## Local (debug) deployment

To deploy the registration website locally, you will need to set the following environment variables:

- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USER`
- `SMTP_TOKEN`
- `REGO_DB_CONNECT_STRING`: this should look like `server=registration-db;uid=${MARIADB_USER};pwd=${MARIADB_PASSWORD};Database=${MARIADB_DATABASE}`

Once these are set, just run the deploy script in this directory.