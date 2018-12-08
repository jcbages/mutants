for folder in */ ; do
    # get in folder
    cd $folder

    # sign apk
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore mileage.apk androiddebugkey -storepass android

    # print message
    echo "Done signing $folder"

    # go back again
    cd ..
done
