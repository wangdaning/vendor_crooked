devices=( 'coral' 'crosshatch' 'oriole' 'raven' 'sunfish')

function lunch_devices() {
    add_lunch_combo crooked_${device}-user
    add_lunch_combo crooked_${device}-userdebug
}

# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android-build

for device in ${devices[@]}; do
    lunch_devices
done
