# mac-curl-recert

Has curl on your macOS Mojave, macOS High Sierra, macOS Sierra
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

# end result

    curl https://letsencrypt.org/ # should now work

# shasum

17882fdb36d15b6fec96b30c3b7c425fba05e8dc  bigsur.pem
