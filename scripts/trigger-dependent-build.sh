#!/bin/bash -x

# This script lives in each of the upstream repos. Add this to .travis.yml to
# run after each successful build (assuming that the script is in the root of
# the repo):
#   after_success:
#     - ./trigger-dependent-build
#
# There are three variables to set - `$auth_token`, `$endpoint`, and
# `$repo_id` - each is described below.
#

# An authorization token generated by running:
#   gem install travis
#   travis login
#   travis token
#
auth_token=dn57A25LwxDu9Kj_3aaSOg

# The Travis API endpoint. .com and .org are the commercial and free versions,
# respectively; enterprise users will have their own hostname.
#
body='{
"request": {
  "branch":"master"
}}'

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $auth_token" \
  -d "$body" \
  https://api.travis-ci.org/repo/alphagov/notifications-functional-tests/requests