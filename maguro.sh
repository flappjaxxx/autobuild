START=$(date +%s)
clear
echo "Fetching manifest and projects..."
cd .repo
rm -rf manifests manifests.git project.list repo manifest.xml local_manifest.xml
cd ../../
repo init -u git://github.com/flappjaxxx/android.git -b jellybean-nexus
repo sync
make clobber
export USE_CCACHE=1
export CCACHE_DIR=/$HOME/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 40G
. build/envsetup.sh
vendor/cm/get-prebuilts
brunch cm_maguro-eng
clear
echo "Welcome to the FJ Autobuild Kitchen!"
echo "Building The Final AOSPxXx Package in.."
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
rm -rf autobuild/cm-AOSPxXx-*.zip
echo "Copying unfinished ROM"
sleep 3
cp -v out/target/product/maguro/cm-AOSPxXx-*.zip autobuild
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
unzip cm-AOSPxXx-*.zip -d WORKING_AOSPxXx
sleep 1
clear
echo "Copying Installer"
sleep 3
cp -Rv META-INF-maguro WORKING_AOSPxXx/META-INF
sleep 1
clear
echo "Copying User Apps"
sleep 3
cp -Rv data-maguro WORKING_AOSPxXx/data
sleep 1
clear
sed -i 's/cm_maguro/aospxxx_maguro/g' WORKING_AOSPxXx/system/build.prop
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
zip -r AOSPxXx-maguro-$(date -u +%Y%m%d).zip *
mv -v AOSPxXx-*.zip ../
clear
cd ..
echo "Cleaning Up"
sleep 3
rm -rf cm-AOSPxXx-*.zip
rm -rf WORKING_AOSPxXx
sleep 1
cd ..
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
cd .repo/manifests
rm -f default.xml
mv default.xml.bak default.xml
echo "Finished."
echo "Final Package Location autobuild/AOSPxXx-maguro-$(date -u +%Y%m%d).zip"
