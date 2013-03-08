START=$(date +%s)
clear
make clobber
. build/envsetup.sh
lunch full_mako-userdebug
make -j4 otapackage
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
