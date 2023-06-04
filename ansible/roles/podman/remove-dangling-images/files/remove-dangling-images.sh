#!/bin/bash

# Delete cache, network etc.
podman rm -v $(podman ps --filter status=exited -q 2>/dev/null) 2>/dev/null
podman rmi $(podman images --filter dangling=true -q 2>/dev/null) 2>/dev/null
podman system prune -f
