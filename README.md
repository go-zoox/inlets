# LightHouse - An Easy Self Hosted DNS Server

[![PkgGoDev](https://pkg.go.dev/badge/github.com/go-zoox/lighthouse)](https://pkg.go.dev/github.com/go-zoox/lighthouse)
[![Build Status](https://github.com/go-zoox/lighthouse/actions/workflows/lint.yml/badge.svg?branch=master)](https://github.com/go-zoox/lighthouse/actions/workflows/lint.yml)
[![Go Report Card](https://goreportcard.com/badge/github.com/go-zoox/lighthouse)](https://goreportcard.com/report/github.com/go-zoox/lighthouse)
[![Coverage Status](https://coveralls.io/repos/github/go-zoox/lighthouse/badge.svg?branch=master)](https://coveralls.io/github/go-zoox/lighthouse?branch=master)
[![GitHub issues](https://img.shields.io/github/issues/go-zoox/lighthouse.svg)](https://github.com/go-zoox/lighthouse/issues)
[![Release](https://img.shields.io/github/tag/go-zoox/lighthouse.svg?label=Release)](https://github.com/go-zoox/lighthouse/tags)

## Features
* [x] Plain DNS
	* [x] Plain DNS in UDP
	* [x] Plain DNS in TCP
* [ ] DNS-over-TLS (DoT)
* [ ] DNS-over-HTTPS (DoH)
* [ ] DNS-over-QUIC (DoQ)


## Installation
To install the package, run:
```bash
go install github.com/go-zoox/lighthouse@lighthouse
```

## Quick Start

```bash
# start lighthouse, cached in memory, default udp port: 53
sudo lighthouse

# start lighthouse with config (see conf/lighthouse.yml for more options)
sudo lighthouse -c lighthouse.yml
```

## Configuration
See the [configuration file](conf/lighthouse.yml).

## License
GoZoox is released under the [MIT License](./LICENSE).
