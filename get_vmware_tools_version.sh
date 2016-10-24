#!/bin/bash

test -f /etc/vmware-tools/manifest.txt && grep vmtoolsd.version /etc/vmware-tools/manifest.txt
