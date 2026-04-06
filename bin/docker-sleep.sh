#!/bin/bash
STATE_FILE="/tmp/.docker-running-containers"

case "$1" in
  sleep)
    # Save names of currently running containers, then stop only those
    docker ps --format '{{.Names}}' > "$STATE_FILE"
    if [ -s "$STATE_FILE" ]; then
      xargs docker stop < "$STATE_FILE"
    fi
    ;;
  wake)
    # Restart only the containers that were running before sleep
    if [ -f "$STATE_FILE" ]; then
      xargs docker start < "$STATE_FILE"
      rm "$STATE_FILE"
    fi
    ;;
esac
