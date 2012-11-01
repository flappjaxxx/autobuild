START=$(date +%s)
clear
wget http://rootdev.org/aospxxx/local_manifest.xml
mv local_manifest.xml .repo/local_manifest.xml
. build/envsetup.sh
vendor/cm/get-prebuilts
brunch cm_maguro-eng
clear
echo "Building The Final AOSPxXx Package"
sleep 5
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
cp -Rv META-INF WORKING_AOSPxXx
sleep 1
clear
echo "Copying User Apps"
sleep 3
cp -Rv data WORKING_AOSPxXx
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
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
echo "Final Package Location autobuild/AOSPxXx-maguro-$(date -u +%Y%m%d).zip"
