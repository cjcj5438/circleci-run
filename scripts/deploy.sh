#!/bin/sh
# 构想 https://gist.github.com/motemen/8595451

# 基于 https://github.com/eldarlabs/ghpages-deploy-script/blob/master/scripts/deploy-ghpages.sh
# MIT许可 https://github.com/eldarlabs/ghpages-deploy-script/blob/master/LICENSE

# abort the script if there is a non-zero error
set -e

# 打印当前的工作路径
pwd

user="root"
passwd="CHENjing@10502"

host_list=("47.104.64.78")

#seletc the host
select host in ${host_list[@]}; do
  break
done

#execute the ssh action

echo "开始连接服务器:"
expect -c "
spawn ssh $user@$host
expect {
  \"yes\/no\" { send \"yes\n\"; exp_continue}
  \"password:\" { send \"$passwd\n\" }
}
interact
"
echo "登录服务器成功"
pwd
cd /usr/local/nginx/htm

echo "Finished Deployment!"
