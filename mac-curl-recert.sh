#!/bin/bash
#
# Replace /etc/ssl/cert.pm with a newer one so that curl on older
# macOS will work with https sites that use letsencrypt.
#
# https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/

case `whoami` in
    root) ;;
    *)
        echo "I need sudo powers. Try instead: sudo ./mac-curl-recert.sh"
        exit 1
        ;;
esac

cp /etc/ssl/cert.pem /etc/ssl/cert.pem.$(date +%Y-%m-%dT%H.%M.%S).bak
cp bigsur.pem /etc/ssl/cert.pem
