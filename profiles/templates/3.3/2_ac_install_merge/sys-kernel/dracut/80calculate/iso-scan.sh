# Calculate chmod=0755
#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

PATH=/usr/sbin:/usr/bin:/sbin:/bin

echo "ISOFILE $1"
isofile=$1

[ -z "$isofile" ] && exit 1

ismounted "/run/initramfs/isoscan" && exit 0

mkdir -p "/run/initramfs/isoscan"

do_iso_scan() {
    local _name
    local dev
    for dev in /dev/disk/by-uuid/*; do
        _name=$(dev_unit_name "$dev")
        [ -e /tmp/isoscan-${_name} ] && continue
        > /tmp/isoscan-${_name}
        mount -t auto -o ro "$dev" "/run/initramfs/isoscan" || continue
        if [ -f "/run/initramfs/isoscan/$isofile" ]; then
            if [ "$root" == "live" ]; then
                /sbin/initqueue --settled --onetime --unique /sbin/dmsquash-live-root `losetup -f --show "/run/initramfs/isoscan/$isofile"`
            else
                losetup -f --show "/run/initramfs/isoscan/$isofile"
            fi
            rm -f -- "$job"
            exit 0
        else
            umount "/run/initramfs/isoscan"
        fi
    done
}

do_iso_scan

rmdir "/run/initramfs/isoscan"
exit 1
