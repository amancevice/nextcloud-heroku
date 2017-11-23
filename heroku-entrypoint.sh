#!/bin/bash

echo "Listen ${PORT:-80}" > /etc/apache2/ports.conf

/entrypoint.sh "$@"
