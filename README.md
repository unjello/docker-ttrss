[![Docker Pulls](https://img.shields.io/docker/pulls/unjello/ttrss.svg)](https://hub.docker.com/r/unjello/ttrss/)
[![Docker Stars](https://img.shields.io/docker/stars/unjello/ttrss.svg)](https://hub.docker.com/r/unjello/ttrss/)
[![](https://images.microbadger.com/badges/image/unjello/ttrss.svg)](https://microbadger.com/images/unjello/ttrss)
[![](https://images.microbadger.com/badges/version/unjello/ttrss.svg)](https://microbadger.com/images/unjello/ttrss)

# docker-ttrss

Dockerfile for [Tiny Tiny RSS](http://tt-rss.org) feed reader.

The image is available directly from [Docker Hub](https://hub.docker.com/r/unjello/ttrss/)

Repo was hugely inspired by [Christian Lück's](https://github.com/clue) [docker-ttrss](https://github.com/clue/docker-ttrss) container which unfortunately haven't been updated for a while (ie. used php5 which is no longer available in ubuntu 16.04).

Keep your feed history to yourself and access your RSS and atom feeds from everywhere.
You can access it through an easy to use webinterface on your desktop, your mobile browser
or using one of the available apps.


## About Tiny Tiny RSS

> *From [the official readme](http://tt-rss.org/redmine/projects/tt-rss/wiki):*

Tiny Tiny RSS is an open source web-based news feed (RSS/Atom) reader and aggregator,
designed to allow you to read news from any location,
while feeling as close to a real desktop application as possible.

![](https://tt-rss.org/images/17.1/shot.png)

## Quickstart

This section assumes you want to get started quickly, the following sections explain the
steps in more detail. So let's start.

Clone git repo:
```bash
$ git clone https://github.com/unjello/docker-ttrss.git
```

Customize `.env` file for your environment, and then build and run docker swarm with:
```bash
$ docker-compose build
$ docker-compose up
```

Swarm is using official (postgres)[https://hub.docker.com/_/postgres/] and (ubuntu)[https://hub.docker.com/_/ubuntu/] images.

## Accessing your webinterface

The above example exposes the Tiny Tiny RSS webinterface on port 80, so that you can browse to:

http://localhost/

The default login credentials are:

* Username: admin
* Password: password

Obviously, you're recommended to change these as soon as possible.

## Installation Walkthrough

Configuration script handles everything for you. All you need to do is to provide few configuration options:


### Database configuration

```
TTRSS_DB_USER=postgres
TTRSS_DB_PASS=ttrss
TTRSS_DB_NAME=ttrss
```

### Database data files persistence

```
TTRSS_DB_PATH=
```

### Application log files persistence

```
TTRSS_LOG_PATH=
```

### TTRSS_URL

The `TTRSS_URL` config value should be set to the URL where this TinyTinyRSS
will be accessible at. Setting it correctly will enable PUSH support and make
the browser integration work. Default value: `http://localhost`.

For more information check out the [official documentation](https://github.com/gothfox/Tiny-Tiny-RSS/blob/master/config.php-dist#L22).

```
TTRSS_URL=https://example.org/ttrss
```
