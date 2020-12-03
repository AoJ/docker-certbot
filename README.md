# docker-certbot

## Usage

generate Digital ocean api token and save it to `/etc/letsencrypt/digitalocean.ini` as

```
dns_digitalocean_token = xxx
```

```
make build
make DOMAIN=xx issue
make renew
```
