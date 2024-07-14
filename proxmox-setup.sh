#! /bin/bash
echo "
                                                        .                                                               
                                                         ..
                                                          :..
                                                          ',.'.
                                                           ;''',
                                                           ;'''',
                                                           ,''',,.
                                                           ;,,,,,:
                                          .                .;,,,,,:.
                                         ,,.       ,      ,,,,,,;;'
                                        .,,..    ..,.   .,,,,,,;;;,
                                       ;lc:;;,..';;;;,..,,,,;;;;;;'
                                     .oolc:;;;;;;;;,,;;,,,,;;;;;;:
                                    .kxolc:;;,,;;;,,,,,,,,,;;;;;;.
                                    OOxolc:;;,,,;,,,,,,,,,,;;;;;.
                                    Kkdlc:;;,,' .,,,,, .',,,;;,
                                    0xoc:;;,,.    .'       '.
                                    0dl:;;,,.
                                    xdl:;;,;
                                    cdc:;,:,
                                     xc:;,o'
                                     'l:;,o;
                                      'c;,cO
                                        c;,K'
                                          ;cX
                                            .d
                                              .

"

echo "                            scripts by NAVEEN VARMA 
"
sleep 1s

echo  "                        Initializing Proxmox Basic Setup 
"
sleep 1s

read -p "Did you removed the local-lvm ( y / n ) : " initans
if [ $initans == "y" ]
then 
    lvremove /dev/pve/data
    lvresize -l +100%FREE /dev/pve/root
    resize2fs /dev/mapper/pve-root
    apt update && apt upgrade -y
    apt install curl wget git -y
    cp /etc/systemd/logind.conf /etc/systemd/logind.conf.bk

    #Change for lid switch state
    search_word=\#HandleLidSwitch=suspend
    replace_word=HandleLidSwitch=ignore
    filename=/etc/systemd/logind.conf
    # Check if the file exists
    if [ ! -f "$filename" ]; then
        echo "File $filename does not exist."
        exit 1
    fi
    # Use sed to replace the word
    # -i for in-place editing (remove -i for no in-place editing)
    sed -i.bak "s/$search_word/$replace_word/g" "$filename"
    echo "Replacement complete. Backup created as $filename.bak"
    #Change for docked state
    search_word=\#HandleLidSwitchDocked=ignore
    replace_word=HandleLidSwitchDocked=ignore
    filename=/etc/systemd/logind.conf
    # Check if the file exists
    if [ ! -f "$filename" ]; then
        echo "File $filename does not exist."
        exit 1
    fi
    # Use sed to replace the word
    # -i for in-place editing (remove -i for no in-place editing)
    sed -i.bak "s/$search_word/$replace_word/g" "$filename"
    echo "Replacement complete. Backup created as $filename.bak"
    systemctl restart systemd-logind.service

    cp /etc/default/grub /etc/default/grub.bk
    # change for sleep mode
    search_word=GRUB_CMDLINE_LINUX=\"\"
    replace_word=GRUB_CMDLINE_LINUX=\"consoleblank=300\"
    filename=/etc/default/grub

    # Check if the file exists
    if [ ! -f "$filename" ]; then
        echo "File $filename does not exist."
        exit 1
    fi

    # Use sed to replace the word
    # -i for in-place editing (remove -i for no in-place editing)
    sed -i.bak "s/$search_word/$replace_word/g" "$filename"

    echo "Replacement complete. Backup created as $filename.bak"
    update-grub

else 
    echo "Please Remove local-lvm volume to use the entire disk"
    echo "Navigate Datacenter -> Storage and remove local-lvm "
    echo ":)"
fi