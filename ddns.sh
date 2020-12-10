#设置domain
domain="dfwzr.com"
#设置name
name="home"
#设置key
key="kkkkkkkkkkkkkkk"
#设置secret
secret="sssssssssssss"
#获取本地公网IP
currentIp=$(wget -qO- -t1 -T2 ipv4.icanhazip.com)
#构建header
echo "当前公网IP："$currentIp
headers="Authorization: sso-key $key:$secret"
#获取当前DNS
result=$(curl -k -X GET -H "$headers" "https://api.godaddy.com/v1/domains/$domain/records/A/$name")
dnsIp=$(echo $result | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}")
echo "$name.$domain当前DNS："$dnsIp
#构建本地数据
request='[{"data":"'$currentIp'","name":"'$name'","ttl":600,"type":"A"}]'
#比对服务器端数据与本地数据，若不符则更新服务器数据
	if [ "$result" != "$request" ]
		then
			nresult=$(curl -k -H "$headers" -H "Content-Type: application/json" -X PUT -d "$request" https://api.godaddy.com/v1/domains/$domain/records/A/$name)
			echo `date` >> ddns_godaddy.log
			echo "$dnsIp ====> $currentIp" >> ddns_godaddy.log
		else
			echo "Nothing changed"
			#echo `date` >> ddns_godaddy.log
			#echo "Nothing changed" >> ddns_godaddy.log
	fi
