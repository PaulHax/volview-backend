#!/bin/env bash

# google-chrome "http://localhost:8080/?names=[foo.dcm]&urls=[http://localhost:9999/1-001.dcm,http://localhost:9999/config.json]"
# google-chrome "http://localhost:8080/?names=[volview.zip]&urls=[http://localhost:9999/session.volview.zip,http://localhost:9999/configLabels.json]"
# google-chrome "http://localhost:8080/?&urls=[http://localhost:9999/3DUS-Fetus.mha,http://localhost:9999/3DUS-Fetus.0.segmentation.nrrd]"

http://localhost:8080/?&urls=[http://localhost:9999/3DUS-Fetus.mha]
http://localhost:8080/?&urls=[http://localhost:9999/config-save-format.json,http://localhost:9999/3DUS-Fetus.mha,http://localhost:9999/3DUS-Fetus.0.seg.nrrd]
http://localhost:8080/?&urls=[http://localhost:9999/remote-manifest.json]
http://localhost:8080/?&urls=[http://localhost:9999/config-save-format.json]
http://localhost:8081/?&urls=[http://localhost:9999/prostate-fetus-manifest.json]
http://localhost:8081/?&urls=[http://localhost:9999/prostate-remote-manifest.json]


http://localhost:8081/?&urls=[http://localhost:9999/ct-seg.zip]

http://localhost:8081/?&urls=[http://localhost:9999/oct/series-000003/image-000001.dcm]

http://localhost:8081/?urls=%5Bhttp%3A%2F%2Flocalhost%3A9999%2Foct%2Fseries-000003%2Fimage-000001.dcm%5D

# source ~/.bashrc
npm run start

# /home/paul/.nvm/versions/node/v20.15.1/bin/npx http-server --cors --port 9999

read -p "Press ctrl+c to exit"

