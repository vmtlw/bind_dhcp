#!/bin/bash
[[ -n $1 ]] || exit 1
DOMAIN=$1
ZONES_PATH="/etc/bind/master"
NEEDLE="Serial"

for ZONE in $(ls -1 $ZONES_PATH) ; do
    curr=$(grep -e "${NEEDLE}$" $ZONES_PATH/${ZONE} | sed -n "s/^\s*\([0-9]*\)\s*;\s*${NEEDLE}\s*/\1/p")
    num=$(($curr + 1))
    serial="${cur}$(printf '%01d' $num )"
    sed -i -e "s/^\(\s*\)[0-9]\{0,\}\(\s*;\s*${NEEDLE}\)$/\1${serial}\2/" ${ZONES_PATH}/${ZONE}
    CHECHING=$(grep "; ${NEEDLE}$" $ZONES_PATH/${ZONE})
    echo "${ZONE}: $CHECHING"
done
LASTIP=$(grep -w  'A' master/vmtlw.ru.zone |sort -nr | head -n1 |cut -d. -f4) 
echo "$DOMAIN		IN      A       10.7.0.$(($LASTIP+1))" >> $ZONES_PATH/vmtlw.ru.zone

echo "$(($LASTIP+1))	IN	PTR		$DOMAIN.vmtlw.ru." >> $ZONES_PATH/vmtlw.ru.rev.zone


