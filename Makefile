SHELL := /bin/bash

.PHONY: start up setup build

start:
	nix-shell main/shell.nix

up: start

setup:
	sh <(curl -L https://nixos.org/nix/install) --no-daemon

build:
	nix develop ./main
