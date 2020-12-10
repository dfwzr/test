base64 list > /home/wwwroot/web_camouflage/abc
echo "订阅已生成"
for((i=30;i>0;i=i-5));
do
	echo "$i秒后关闭订阅";
	sleep 5s;
done
rm /home/wwwroot/web_camouflage/abc
echo "订阅已删除"
