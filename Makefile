
DOMAIN ?=


build:
	docker build -t aoj/certbook:latest --rm --no-cache .

renew:
	docker run                                                                 \
	--rm                                                                       \
	-ti                                                                        \
	--user $(id -u letsencrypt):$(id -g letsencrypt)                           \
	-v /etc/letsencrypt:/etc/letsencrypt                                       \
	-v /var/log/letsencrypt:/var/log/letsencrypt                               \
	aoj/certbook:latest                                                        \
	certbot                                                                    \
	  renew                                                                 \
	  --dns-digitalocean                                                       \
	  --dns-digitalocean-credentials /etc/letsencrypt/digitalocean.ini         \
	  --logs-dir /var/log/letsencrypt                                          \
	  --config-dir /etc/letsencrypt                                            \
	  --work-dir /etc/letsencrypt/work

issue:
	test -n "$(DOMAIN)"
	docker run                                                                 \
	--rm                                                                       \
	-ti                                                                        \
	--user $(id -u letsencrypt):$(id -g letsencrypt)                           \
	-v /etc/letsencrypt:/etc/letsencrypt                                       \
	-v /var/log/letsencrypt:/var/log/letsencrypt                               \
	aoj/certbook:latest                                                        \
	certbot                                                                    \
	  certonly                                                                 \
	  --dns-digitalocean                                                       \
	  --dns-digitalocean-credentials /etc/letsencrypt/digitalocean.ini         \
	  --logs-dir /var/log/letsencrypt                                          \
	  --config-dir /etc/letsencrypt                                            \
	  --work-dir /etc/letsencrypt/work                                         \
	  -d "$(DOMAIN)

.PHONY: build renew issue

