#!/bin/bash

# This is a quick script, written to cleanup the directory for reprovisioning

rm shell_provisioned
rm -rf .librarian/
rm -rf .tmp/
rm -rf modules/*

exit 0
