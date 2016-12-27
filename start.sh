#!/bin/bash

# 更新源
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# 安装依赖
yum install docker-engine wget unzip -y
systemctl enable docker.service
systemctl start docker
rpm -ivh 'https://cli.run.pivotal.io/stable?release=redhat64&source=github'
cf install-plugin -f https://static-ice.ng.bluemix.net/ibm-containers-linux_x64

wget 'http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_0.4.5_amd64.tar.gz'
tar -zxf Bluemix_CLI_0.4.5_amd64.tar.gz
cd Bluemix_CLI
./install_bluemix_cli
bluemix config --usage-stats-collect false
cd ..

# 初始化环境
org=$(openssl rand -base64 8 | md5sum | head -c8)
cf login -a https://api.ng.bluemix.net
bx iam org-create $org
sleep 3
cf target -o $org
bx iam space-create dev
sleep 3
cf target -s dev
cf ic namespace set $(openssl rand -base64 8 | md5sum | head -c8)
sleep 3
cf ic init

# 拉取库
wget -O box-maker.zip https://github.com/puteulanus/box-maker/archive/master.zip
unzip box-maker.zip
cd box-maker-master

# 生成密码
passwd=$(openssl rand -base64 8 | md5sum | head -c12)
echo -n $passwd > docker/passwd.txt

# 构建镜像
cd docker
cf ic build -t pt:v1 .

# 运行容器
cf ic ip bind $(cf ic ip request | cut -d \" -f 2 | tail -1) $(cf ic run -m 2048 --name=pt -p 80 -p 443 -p 3306 -p 3306/udp registry.ng.bluemix.net/`cf ic namespace get`/pt:v1)

# 显示信息
while ! cf ic inspect pt | grep PublicIpAddress | awk -F\" '{print $4}' | grep -q .
do
	echo -e "\n"
	curl https://api.lwl12.com/hitokoto/main/get
	sleep 5
done

echo -e "\n\n\n"

echo -e "IP:"
cf ic inspect pt | grep PublicIpAddress | awk -F\" '{print $4}'
echo -e "\nPassword:\n"${passwd}"\n"
