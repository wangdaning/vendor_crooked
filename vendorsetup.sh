aosp_devices=('blueline' 'bonito' 'crosshatch' 'marlin' 'sailfish' 'sargo')
caf_devices=('oneplus3' 'cheeseburger' 'dumpling')

function lunch_devices() {
    add_lunch_combo scorpion_${device}-user
    add_lunch_combo scorpion_${device}-userdebug
}

if [[ $( grep -i "caf" manifest/README.md) ]]; then
    for device in ${caf_devices[@]}; do
        lunch_devices
    done
else
    for device in ${aosp_devices[@]}; do
        lunch_devices
    done
fi
