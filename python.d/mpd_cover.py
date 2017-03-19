#!/usr/bin/python
#
# Copyright (C) 2017 Pierre Seimandi
# Under GPL License v3.0 and after.
#
# Description:
#
# Download the ablum cover for the track currently being played by mpd. The
# covers are saved in '~/.covers/'.
#
# Time-stamp: <2017-03-19 19:42:20 seimandp>
# –—————————————————————————————————————————————————————————

import os
import shutil
import subprocess
import urllib.parse
import urllib.request
import urllib.error

# —————

def copycover(album,
              artist,
              file_album,
              file_dest,
              file_default,
              file_nowplaying):

    # Flag to activate debug information
    verbose = False
    # verbose = True

    if os.path.exists(file_album):
        # If the album image exists, copy it to be the cover file
        # print("cover found locally" )
        shutil.copy(file_album, file_dest)

    else:
        # if the album image does not exists, try to download it

        # Define the url used to search for the cover
        # ===========================================
        try:
            search_string = artist + " " + album
            search_string = search_string.replace(" ", "+")

            if verbose:
                print(search_string)

            # amazon.com
            url = "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" + search_string + "&rh=i%3Aaps%2Ck%3A" + search_string

        except Exception as e:
            if verbose:
                print(e)
            shutil.copy(file_default, file_dest)
            quit()

        if verbose:
            print()
            print("Searching for art covert ...")
            print("URL : " + repr(url))

        # Request that url
        # ================
        if verbose:
            print("- requesting ...")

        try:
            req = urllib.request.Request(url)

        except Exception as e:
            if verbose:
                print(e)
            shutil.copy(file_default, file_dest)
            quit()

        # Read the data
        # =============
        if verbose:
            print("- opening ...")
        try:
            html = urllib.request.urlopen(req).read()
        except Exception as e:
            if verbose:
                print(e)
            shutil.copy(file_default, file_dest)
            quit()

        # Change the encoding of the data so it can be parsed without error
        # =================================================================
        if verbose:
            print("- decoding ...")
        try:
            html = html.decode("latin-1")
        except Exception as e:
            html = html.decode("utf-8")
        except Exception as e:
            if verbose:
                print(e)
            shutil.copy(file_default, file_dest)
            quit()

        # Parse the data to extract adress of the image file of the cover
        # ===============================================================
        if verbose:
            print("- parsing ...")

        # Parsing for amazon.com
        image = ""
        for line in html.split('\n'):
            # if 'class="productImage' in line:
            if 'alt="Product Details"' in line:
                image = line.partition('src="')[2].partition('"')[0]
                break

        # Check if an image was found :
        # - If so, download it
        # - If not, copy the default file in the tmp folder
        # =================================================
        if len(image) == 0:
            if verbose:
                print("No art cover found.")
            shutil.copy(file_default, file_dest)
        else:
            if verbose:
                print("Art cover found at", repr(image))
            url = image

            # Now that we got the url of the image, we request and open it
            if verbose:
                print("- requesting ...")
            try:
                # req = urllib.request.Request(url, headers=hdr)
                req = urllib.request.Request(url)

            except Exception as e:
                if verbose:
                    print(e)
                shutil.copy(file_default, file_dest)
                quit()

            if verbose:
                print("- opening ...")
            try:
                img = urllib.request.urlopen(url)
            except Exception as e:
                print(e)
                shutil.copy(file_default, file_dest)
                quit()

            # And finally we copy it in our file_album (cover folder)) and in
            # file_dest (tmp folder).
            fid = open(file_album, 'wb')
            shutil.copyfileobj(img, fid)
            shutil.copy(file_album, file_dest)

    # In order to know that we have searched a cover file for the
    # current song, we update the name of the album currently playing
    # in file_nowplaying.
    open(file_nowplaying, "w").write(artist + ' - ' + album)


if __name__ == "__main__":

    path_home = os.getenv("HOME")
    # Path where the images are saved
    path_img = os.path.join(path_home, ".covers")
    # Image displayed when no image found
    file_noimg = os.path.join(path_img, "nocover.png")
    # Cover displayed by conky
    file_cover = os.path.join("/tmp", "mpd_nowplaying_cover.jpg")
    # Last playing song seen by the script
    file_nowplaying = os.path.join("/tmp", "mpd_nowplaying_album")

    conky_img_cmd = '${image ' + file_cover + ' -p 3,0 -s 88x88}#'

    # Name of current album
    album  = subprocess.getoutput("mpc --format %album% | head -n 1")
    artist = subprocess.getoutput("mpc --format %artist% | head -n 1")
    title  = subprocess.getoutput("mpc --format %title% | head -n 1")

    album = album.replace("ê", "e")
    album = album.replace("é", "e")
    album = album.replace("è", "e")
    album = album.replace("à", "a")
    album = album.replace("ù", "u")
    album = album.replace("'", " ")

    artist = artist.replace("ê", "e")
    artist = artist.replace("é", "e")
    artist = artist.replace("è", "e")
    artist = artist.replace("à", "a")
    artist = artist.replace("ù", "u")
    artist = artist.replace("'", " ")

    title = title.replace("ê", "e")
    title = title.replace("é", "e")
    title = title.replace("è", "e")
    title = title.replace("à", "a")
    title = title.replace("ù", "u")
    title = title.replace("'", " ")

    # If tags are empty, use noimg.
    if album == "":
        if os.path.exists(file_cover):
            os.remove(file_cover)

        if os.path.exists(file_nowplaying):
            os.remove(file_nowplaying)

        if os.path.exists(file_noimg):
            shutil.copy(file_noimg, file_cover)
        else:
            pass

    else:
        file_album  = os.path.join(path_img, artist + " - " + album + ".jpg")
        file_artist = os.path.join(path_img, artist + ".jpg")

        if os.path.exists(file_nowplaying) and os.path.exists(file_cover):
            nowplaying = open(file_nowplaying, 'r').read()

            if nowplaying == artist + ' - ' + album:
                print(conky_img_cmd)
                quit()

        if os.path.exists(file_nowplaying):
            os.remove(file_nowplaying)

        copycover(album, artist, file_album, file_cover, file_noimg, file_nowplaying)

        print(conky_img_cmd)
