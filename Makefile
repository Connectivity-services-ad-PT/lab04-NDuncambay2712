# FIT4110 Lab 03 Makefile

.PHONY: install lint mock server test clean

install:
	npm install --legacy-peer-deps

lint:
	npx spectral lint contracts/notification.openapi.yaml --ruleset campus-spectral.yaml

mock:
	npx prism mock contracts/notification.openapi.yaml --port 4010

mock-notification:
	npx prism mock contracts/notification.openapi.yaml --port 4010

server:
	node server.js

test:
	powershell -ExecutionPolicy Bypass -File ./scripts/run_tests.ps1

clean:
	rm -rf reports/*
