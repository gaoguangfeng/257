if [ $? -ne 0 ];then
	echo "请检查光驱是否链接"
		exit 3
	else
	echo "挂载成功！"
fi
[ -d /etc/yum.repos.d ] && cd /etc/yum.repos.d/
/bin/mv * /etc/yum.repos.d/bak &> /dev/null
cat > /etc/yum.repos.d/local.repo << KOF
[local]
name=yum
baseurl=file:///media/cdrom
gpgcheck=0
enabled=1

KOF

yum -y clean all
yum makecache
exit
