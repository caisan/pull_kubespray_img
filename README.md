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

2. 在运行kubespary之前，先执行这三个脚本提前准备好镜像。
```bash
bash pull_gcr_io.sh
```
```bash
bash pull_k8s_gcr_io.sh
```
```bash
bash pull_quay_io.sh
```

