START=$(date +%s)
clear
echo "Initializing CM10 repo"
sleep 3
repo init -u git://github.com/CyanogenMod/android.git -b jellybean
clear
echo "Downloading custom local_manifest.xml"
sleep 3
wget http://rootdev.org/i717/local_manifest.xml
mv local_manifest.xml .repo/local_manifest.xml
sleep 3
clear
echo "Setting permissions"
chmod a+x build.sh build2.sh
sleep 3
clear
echo "Go grab a drink and some popcorn because we are syncing repo in 16 seconds"
sleep 5
echo "This IS going to take a while"
sleep 5
echo "And"
sleep 1
echo "Here"
sleep 1
echo "We"
sleep 1
echo "Go!"
sleep 3
repo sync
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo ""
echo "Finished syncing repo"
echo ""
echo "Now type ./build.sh to build using ccache"
echo ""
echo "Now type ./build2.sh to build without using ccache"
