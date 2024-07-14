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
echo "                          Initiating Docker Installation...
"

sleep 1s

#Update The Machine
apt update && apt upgrade -y

#Install Basic Requirements
apt-get install ca-certificates curl gnupg lsb-release -y
apt-get install ca-certificates curl gnupg lsb-release -y

#Docker Official GPG Key Setup
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Setup Docker Repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

#install Docker Engine
apt-get remove docker docker-engine docker.io containerd runc
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
apt install docker-compose -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
