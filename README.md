#### 使用国内源pull镜像以供kubespary安装使用

1. 确认配置好国内的镜像加速器地址，这里以aliyun为例。
```bash
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://5md0553g.mirror.aliyuncs.com"]

}
EOF
```
当然也可以使用其它的诸如daocloud，网易163的镜像加速地址。
然后重启docker daemon。
```bash
systemctl restart docker.service
```
