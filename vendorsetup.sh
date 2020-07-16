devices=('blueline' 'bonito' 'coral' 'crosshatch' 'taimen' 'walleye')

function lunch_devices() {
    add_lunch_combo scorpion_${device}-user
    add_lunch_combo scorpion_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
