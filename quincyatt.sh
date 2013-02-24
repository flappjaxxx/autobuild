START=$(date +%s)
clear
make clobber
repo sync
export USE_CCACHE=1
export CCACHE_DIR=/$HOME/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 40G
. build/envsetup.sh
vendor/cm/get-prebuilts
brunch cm_quincyatt-userdebug
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
echo "Finished."
