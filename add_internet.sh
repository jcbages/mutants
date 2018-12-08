for folder in */ ; do
    # get in folder
    cd $folder

    # erase prev files if they exist
    rm -rf out
    rm mileage.apk

    # decompile with apktool
    apktool d com.evancharlton.mileage_3110.apk -s -o out

    # get into the out folder
    cd out

    # add internet permission
    sed -i '2i\ <uses-permission android:name="android.permission.INTERNET" />' AndroidManifest.xml

    # go back
    cd ..

    # build again
    apktool b out -f -o mileage.apk

    # print message
    echo "Done $folder"
    echo ""
    echo ""

    # erase out
    rm -rf out

    # go back again
    cd ..
done
