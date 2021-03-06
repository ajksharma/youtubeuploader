#!/bin/bash

> md5-checksums

#(env GOOS=linux GOARCH=arm GOARM=5 go build -o youtubeuploader_linux_armv5; gzip youtubeuploader_linux_armv5) &
#(env GOOS=linux GOARCH=arm GOARM=6 go build -o youtubeuploader_linux_armv6; gzip youtubeuploader_linux_armv6) &
(env GOOS=linux GOARCH=arm GOARM=7 go build -o youtubeuploader_linux_armv7; gzip youtubeuploader_linux_armv7; md5sum youtubeuploader_linux_armv7.gz >> md5-checksums) &
(env GOOS=linux GOARCH=arm64 go build -o youtubeuploader_linux_arm64; gzip youtubeuploader_linux_arm64; md5sum youtubeuploader_linux_arm64.gz >> md5-checksums) &
(env GOOS=linux GOARCH=amd64 go build -o youtubeuploader_linux_amd64; gzip youtubeuploader_linux_amd64; md5sum youtubeuploader_linux_amd64.gz >> md5-checksums) &
(env GOOS=windows GOARCH=amd64 go build -o youtubeuploader_windows_amd64.exe; zip youtubeuploader_windows_amd64.zip youtubeuploader_windows_amd64.exe; rm -f youtubeuploader_windows_amd64.exe; md5sum youtubeuploader_windows_amd64.zip >> md5-checksums) &
(env GOOS=darwin GOARCH=amd64 go build -o youtubeuploader_mac_amd64; gzip youtubeuploader_mac_amd64; md5sum youtubeuploader_mac_amd64.gz >> md5-checksums) &

wait
