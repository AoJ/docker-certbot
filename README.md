# docker-certbot

## Prepare

```
mkdir /etc/letsencrypt
mkdir /etc/letsencrypt/work
mkdir /var/log/letsencrypt
```

generate Digital ocean api token and save it to `/etc/letsencrypt/digitalocean.ini` as

```
dns_digitalocean_token = xxx
```
## Usage

```
make build
make DOMAIN=xx issue
make renew
```

## cron
cron for renewing
```
6 0 * * * docker run --rm --user $(id -u letsencrypt):$(id -g letsencrypt) -v /etc/letsencrypt:/etc/letsencrypt -v /var/log/letsencrypt:/var/log/letsencrypt aooj/certbot:latest certbot renew --logs-dir /var/log/letsencrypt --config-dir /etc/letsencrypt --work-dir /etc/letsencrypt/work > /dev/null
```

