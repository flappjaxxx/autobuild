CM10 Build Instructions
=======================
```
Optional:
sudo apt-get install ccache (Do this if you want to utilize ccache)

Required:
mkdir cm10
cd cm10
repo init -u git://github.com/CyanogenMod/android.git -b jellybean
```

Modify your `.repo/local_manifest.xml` as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <manifest>
    <project name="CyanogenMod/android_device_samsung_msm8660-common" path="device/samsung/msm8660-common" />
    <project name="CyanogenMod/android_device_samsung_quincyatt" path="device/samsung/quincyatt" />
    <project name="CyanogenMod/android_device_samsung_quincy-common" path="device/samsung/quincy-common" />
    <project name="flappjaxxx/android_kernel_samsung_msm8660-common" path="kernel/samsung/msm8660-common" revision="jellybean" />
    <project name="flappjaxxx/android_vendor_samsung_quincyatt" path="vendor/samsung/quincyatt" revision ="jellybean" />
    <project name="flappjaxxx/cm10_autobuild" path="autotool" revision="master" />
  </manifest>
```

```
repo sync
chmod a+x autotool/build.sh
autotool/build.sh
```
