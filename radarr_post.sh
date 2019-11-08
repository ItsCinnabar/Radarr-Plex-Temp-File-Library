#!/bin/sh

HOST=127.0.0.1:*PORT*
API_KEY=*KEY*


imdbId=$radarr_movie_imdbid
id=$(curl --silent $HOST/api/movie -X GET -H "X-Api-Key: $API_KEY" -L\
  | jq ".[] | select(.imdbId == \"${imdbId}\") | .id")

del=$(curl $HOST/api/movie/$id"?addExclusion=true&deleteFiles=true" -X DELETE -H "X-Api-Key: $API_KEY" -L)
