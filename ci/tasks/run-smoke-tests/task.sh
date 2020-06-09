#!/bin/bash
set -eu

DNS_DOMAIN=$(cat env-metadata/dns-domain.txt)
export SMOKE_TEST_API_ENDPOINT="https://api.${DNS_DOMAIN}"
export SMOKE_TEST_APPS_DOMAIN="apps.${DNS_DOMAIN}"
export SMOKE_TEST_USERNAME=admin
export SMOKE_TEST_PASSWORD=$(cat env-metadata/cf-admin-password.txt)
export SMOKE_TEST_SKIP_SSL=true

cf-for-k8s-repo/hack/run-smoke-tests.sh
