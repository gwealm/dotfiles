idd=$(xinput --list | grep 'SynPS/2 Synaptics TouchPad' | awk '{print $6}'| cut -d'=' -f2)

xinput --set-prop $idd 306 1
xinput --set-prop $idd 314 1
