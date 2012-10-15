START=$(date +%s)
clear
export USE_CCACHE=1
export CCACHE_DIR=/$HOME/.ccache
prebuilt/linux-x86/ccache/ccache -M 40G
wget http://rootdev.org/aospxxx/s3_local_manifest.xml
mv s3_local_manifest.xml .repo/local_manifest.xml
. build/envsetup.sh
vendor/cm/get-prebuilts
brunch cm_d2att-eng
cp out/target/product/d2att/system/app/FJTools-Not.apk vendor/cm/prebuilt/common/apps/FJTools-Note.apk
clear
echo "Building The Final AOSPxXx-d2att Package"
sleep 5
clear
rm -rf autobuild/cm-AOSPxXx-d2att-*.zip
echo "Copying unfinished ROM"
sleep 3
cp -v out/target/product/d2att/cm-AOSPxXx-d2att-*.zip autobuild
cd autobuild
sleep 1
clear
echo "Removing Old Files"
sleep 3
rm -rfv WORKING_AOSPxXx
rm -fv AOSPxXx-*.zip
sleep 1
clear
echo "Inflating Archive"
sleep 3
unzip cm-AOSPxXx-d2att-*.zip -d WORKING_AOSPxXx
sleep 1
clear
echo "Copying GApps"
sleep 3
cp -Rv gapps/system WORKING_AOSPxXx
sleep 1
clear
echo "Copying Installer"
sleep 3
cp -Rv META-INF WORKING_AOSPxXx
sleep 1
clear
echo "Copying User Apps"
sleep 3
cp -Rv data WORKING_AOSPxXx
sleep 1
clear
echo "Removing Unneeded Apps"
sleep 3
rm -f WORKING_AOSPxXx/system/app/Provision.apk
rm -f WORKING_AOSPxXx/system/app/Gallery2.apk
rm -f WORKING_AOSPxXx/system/app/QuickSearchBox.apk
sed -i 's/cm_d2att/aospxxx_d2att/g' WORKING_AOSPxXx/system/build.prop
sleep 1
clear
echo "Zipaligning"
sleep 3
tools/do_zipalign
sleep 1
clear
echo "Zipping Final Package"
sleep 3
cd WORKING_AOSPxXx
zip -r AOSPxXx-d2att-$(date -u +%Y%m%d).zip *
mv -v AOSPxXx-d2att-*.zip ../
clear
cd ..
echo "Cleaning Up"
sleep 3
rm -rf cm-AOSPxXx-*.zip
rm -rf WORKING_AOSPxXx
sleep 1
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
echo "Final Package Location autobuild/AOSPxXx-d2att-$(date -u +%Y%m%d).zip"
