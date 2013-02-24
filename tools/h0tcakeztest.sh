clear
make clobber
cp -f autobuild/manifests/test_local_manifest.xml .repo/local_manifest.xml
repo sync
. build/envsetup.sh
lunch cm_quincyatt-userdebug
mka bootimage
rm -rf autobuild/hotcakez-Test/boot.img
rm -rf autobuild/hotcakez-Test/system/lib/modules
cp out/target/product/quincyatt/boot.img autobuild/h0tcakez-Test/boot.img
cp -r out/target/product/quincyatt/system/lib/modules autobuild/h0tcakez-Test/system/lib/modules
cd autobuild/h0tcakez-Test
zip -r h0tcakez-JB-Kernel-$(date -u +%Y%m%d)-Test.zip *
mv h0tcakez-JB-Kernel-$(date -u +%Y%m%d)-Test.zip ../h0tcakez-JB-Kernel-$(date -u +%Y%m%d)-Test.zip
echo "h0tcakez-JB-Kernel-$(date -u +%Y%m%d)-Test.zip now in autobuild directory"
echo "Finished."
