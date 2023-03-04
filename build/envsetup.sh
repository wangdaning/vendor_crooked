function __print_extra_functions_help() {
cat <<EOF
Additional functions:
- repopick:        Utility to fetch changes from Gerrit.
- aospmerge:       Utility to merge AOSP tags.
EOF
}

function mk_timer()
{
    local start_time=$(date +"%s")
    $@
    local ret=$?
    local end_time=$(date +"%s")
    local tdiff=$(($end_time-$start_time))
    local hours=$(($tdiff / 3600 ))
    local mins=$((($tdiff % 3600) / 60))
    local secs=$(($tdiff % 60))
    local ncolors=$(tput colors 2>/dev/null)
    echo
    if [ $ret -eq 0 ] ; then
        echo -n "#### make completed successfully "
    else
        echo -n "#### make failed to build some targets "
    fi
    if [ $hours -gt 0 ] ; then
        printf "(%02g:%02g:%02g (hh:mm:ss))" $hours $mins $secs
    elif [ $mins -gt 0 ] ; then
        printf "(%02g:%02g (mm:ss))" $mins $secs
    elif [ $secs -gt 0 ] ; then
        printf "(%s seconds)" $secs
    fi
    echo " ####"
    echo
    return $ret
}

function breakfast()
{
    target=$1
    CROOKED_DEVICES_ONLY="true"
    unset LUNCH_MENU_CHOICES
    for f in `/bin/ls vendor/crooked/vendorsetup.sh 2> /dev/null`
        do
            echo "including $f"
            . $f
        done
    unset f

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        echo "Nothing to eat for breakfast?"
        lunch
    else
        echo "z$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the Crooked model name
            lunch crooked_$target-userdebug
        fi
    fi
    return $?
}

alias bib=breakfast

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        time m bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function repopick() {
    T=$(gettop)
    $T/vendor/crooked/build/tools/repopick.py $@
}

function aospmerge()
{
    target_branch=$1
    T=$(gettop)
    python3 $T/vendor/crooked/scripts/merge-aosp.py target_branch
}

function pull_bromite()
{
    local TOP=$(gettop)
    if [[ -z "${TOP}" ]]; then
    echo "\$TOP not defined! run build/envsetup.sh"
    exit 1
    fi

    case $1 in
      arm|arm64|x86|x86_64)
      local FETCH_ROOT=${TOP}/vendor/bromite
      mkdir -p ${FETCH_ROOT}/app/$1
      local url_stem="https://github.com/bromite/bromite/releases/download"
      local latest_tag=$(curl -s https://api.github.com/repos/bromite/bromite/releases/latest | $FETCH_ROOT/jq -r '.tag_name')
      if [ ! -f ${FETCH_ROOT}/app/$1/fetched_tag.txt ]; then
        is_latest=0
      else
        local cur_tag=$(cat ${FETCH_ROOT}/app/$1/fetched_tag.txt)
        if [ $cur_tag != $latest_tag ]; then
            is_latest=0
        else
            is_latest=1
        fi
      fi
      if [ $is_latest = 0 ]; then
        echo "Fetching bromite for architecture $1..."
        wget -q --show-progress ${url_stem}/${latest_tag}/$1_ChromePublic.apk -O ${FETCH_ROOT}/app/$1/ChromePublic.apk
        wget -q --show-progress ${url_stem}/${latest_tag}/$1_SystemWebView.apk -O ${FETCH_ROOT}/app/$1/SystemWebView.apk
        echo "$latest_tag" > ${FETCH_ROOT}/app/$1/fetched_tag.txt
      fi
      ;;
      *) echo "unknown architecture $1, skipping Bromite fetch";;
    esac
}
