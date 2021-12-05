#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emil237/cccam/main/installer.sh -O - | /bin/sh
#
echo " download and install emu cccam "

version=2.3.9
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emil237/cccam/main"
MY_IPK="cccam-all-images_2.3.9_all.ipk"
MY_DEB="cccam-all-images_2.3.9_all.deb"
##############################################################################

opkg remove enigma2-softcams-cccam-all-images

#################################################################################

echo Temp Cleaner
echo Please Wait

cd /tmp
rm -rf * > /dev/null 2>&1

set -e
# Download and install plugin #

echo "  DOWNLOAD AND INSTALL PLUGIN "

     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
	dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		opkg install --force-reinstall $MY_IPK
	fi
echo "================================="
set +e
chmod 755 /usr/bin/CCcam239
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
		echo "   >>>>   SUCCESSFULLY INSTALLED   <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
	echo '========================================================================================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0























