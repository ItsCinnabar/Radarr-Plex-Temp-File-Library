# Radarr+Plex Temp File Library
## Automate a new temp file library in plex, jellyfin, emby, or any other media player


Do you ever want to download linux isos that contains hardcoded korsubs, or maybe pictures of linux isos taken by cameras, but not have them show up in the standard libraries? Really, who actually wants these to appear with your pristine linux isos? Well this repo contains the script and instructions that you need in order to automate their download and placement into a new temp location.

Firstly, you will need to run two different radarr processes. Download radarr again and create a new startup directory. I use /opt/Radarr and /opt/RadarrTemp. Next, createa  new appdata directory. I use /home/user/.config/Radarr and /home/user/.config/RadarrTemp. Copy paste the config.xml from your old directory into your new one, then edit the ports on it. Create a new reverse proxy location for the new radarr as well if you want. And finally in order to start two radarrs, the initial startup command for them both need to have a -data=/appdata/directory/location flag added to it.

Ok, now that you have two radarrs up and running, set them both up to grab whatever you want. I use stevenlu and trakt lists to automate it all. On RadarrTemp, I use a custom format of `C_RX_\B(?<HCSUB>(\W+SUBS?)\B)|(?<HC>(HC|SUBBED|BLURRED|SUB|KOR|CAM))\B` but you can use whatever you think will work best for you. I then disabled downloading of None custom format, so it only downloads if it matches this, and finally I enabled downloading of hardcoded subs in Indexers. On Radarr, under Indexers, set it to not download BLURRED HC KOR SUB SUBBED.
  
Finally, you need to set up the custom script. Download radarr_post.sh, edit the api_key and port to match RadarrTemp, and set Radarr to run it on grab with a argument of radarr_movie_imdbid.

Congratulations, you now have two radarrs downloading, with the temp radarr grabbing shitty linux isos and placing them into a temp location which gets nuked and blacklisted on RadarrTemp when Radarr downloads a good file. 
