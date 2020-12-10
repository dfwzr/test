base64 list > /home/wwwroot/web_camouflage/abc
echo "订阅已生成"
for((i=30;i>0;i=i-1));
do
	printf "$i秒后关闭订阅\r";
	sleep 1s;
done
printf "\n"
rm /home/wwwroot/web_camouflage/abc
echo "订阅已删除"
