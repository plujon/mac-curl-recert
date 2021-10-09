# mac-curl-recert

Has your macOS Mojave, macOS High Sierra, macOS Sierra, OS X El
Capitan, or older curl
[recently stopped working with many https sites](https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/)?

If you trust me completely:

    git clone https://github.com/plujon/mac-curl-recert
    cd mac-curl-recert
    sudo ./mac-curl-recert.sh

If you're more cautious, find a working instance of macOS Catalina or newer, copy its /etc/ssl/cert.pem onto the desktop of your older macOS, and run:

    git clone https://github.com/plujon/mac-curl-recert
    cd mac-curl-recert
    cp ~/Desktop/cert.pem ./cert.pem   ## <- you'll need cert.pem from somewhere
    ./mac-curl-recert.rb /etc/ssl/cert.pem cert.pem >bigsur.pem
    sudo ./mac-curl-recert.sh

# shasum

390b2942559d8590f1e27fbb9773d7d4160f56b6  bigsur.pem
