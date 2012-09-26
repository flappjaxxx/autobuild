START=$(date +%s)
clear
. build/envsetup.sh
wget http://rootdev.org/aospxxx/local_manifest.xml
mv local_manifest.xml .repo/local_manifest.xml
vendor/cm/get-prebuilts
brunch cm_quincyatt-eng
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
