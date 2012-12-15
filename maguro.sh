START=$(date +%s)
clear
make clobber
export USE_CCACHE=1
export CCACHE_DIR=/$HOME/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 50G
. build/envsetup.sh
lunch full_maguro-userdebug
make -j4 otapackage
clear
echo "Welcome to the FJ Autobuild Kitchen!"
echo "Building Final The Unofficial Package in.."
sleep 1
echo "5....."
sleep 1
echo "4...."
sleep 1
echo "3..."
sleep 1
echo "2.."
sleep 1
echo "1."
sleep 1
echo "0"
sleep 1
clear
rm -rf autobuild/full_maguro-ota-eng.ctindall.zip
echo "Copying unfinished ROM"
sleep 3
cp -v out/target/product/maguro/full_maguro-ota-eng.ctindall.zip autobuild
cd autobuild
sleep 1
clear
echo "Removing Old Files"
sleep 3
rm -rfv WORKING_The_Unofficial
rm -fv The_Unofficial-*.zip
sleep 1
clear
echo "Inflating Archive"
sleep 3
unzip full_maguro-ota-eng.ctindall.zip -d WORKING_The_Unofficial
sleep 1
clear
echo "Copying Installer"
sleep 3
cp -fv maguro-updater-script WORKING_The_Unofficial/META-INF/com/google/android/updater-script
sleep 1
clear
echo "Copying GApps"
sleep 3
cp -Rv gapps/system WORKING_The_Unofficial
sleep 1
clear
echo "Zipaligning"
sleep 3
tools/do_zipalign
sleep 1
clear
echo "Zipping Final Package"
sleep 3
cd WORKING_The_Unofficial
zip -r The_Unofficial-maguro-$(date -u +%Y%m%d).zip *
mv -v The_Unofficial-maguro*.zip ../
clear
cd ..
echo "Cleaning Up"
sleep 3
rm -rf full_maguro-ota-eng.ctindall.zip
rm -rf WORKING_The_Unofficial
sleep 1
cd ..
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
echo "Final Package Location autobuild/The_Unofficial-maguro-$(date -u +%Y%m%d).zip"
