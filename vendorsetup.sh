devices=( 'coral' 'crosshatch' 'oriole' 'raven' 'sunfish')

function lunch_devices() {
    add_lunch_combo crooked_${device}-user
    add_lunch_combo crooked_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
