#!/usr/bin/env bash

set -e

sleep 0.5

qs kill

sleep 1

qs --daemonize
