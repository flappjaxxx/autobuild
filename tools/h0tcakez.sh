START=$(date +%s)
clear
make clobber
cp -f autobuild/manifests/local_manifest.xml .repo/local_manifest.xml
repo sync
. build/envsetup.sh
lunch cm_quincyatt-userdebug
mka bootimage
rm -rf autobuild/hotcakez/boot.img
rm -rf autobuild/hotcakez/system/lib/modules
cp out/target/product/quincyatt/boot.img autobuild/h0tcakez/boot.img
cp -r out/target/product/quincyatt/system/lib/modules autobuild/h0tcakez/system/lib/modules
cd autobuild/h0tcakez
zip -r h0tcakez-JB-Kernel-$(date -u +%Y%m%d).zip *
mv h0tcakez-JB-Kernel-$(date -u +%Y%m%d).zip ../h0tcakez-JB-Kernel-$(date -u +%Y%m%d).zip
echo "h0tcakez-JB-Kernel-$(date -u +%Y%m%d).zip now in autobuild directory"
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
