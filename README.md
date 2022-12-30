# istio

## 在线安装

```shell
# 下载 istio
curl -L https://istio.io/downloadIstio | sh -
cd istio-*/ && export PATH=$PWD/bin:$PATH && cd ~

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# 或 /etc/profile.d/k3s.sh 
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export PATH=/opt/istio-1.14.1/bin/:$PATH
```

## 离线安装

```shell
./install.sh
```

## 配置


```shell
kubectl create -n istio-system secret generic ingress-cert.dolphin.dementia.com \

# 创建 Gateway SSL 证书配置
--from-file=key=./sslv2/dolphin.dementia-ai.com.key \
--from-file=cert=./sslv2/dolphin.dementia-ai.com_bundle.crt \
--from-file=cacert=./sslv2/dolphin.dementia-ai.com_bundle.pem

```

```shell
⚠️ 注意

# 1. ingress-cert.dolphin.dementia.com, 这个name需要和gateway.yaml里的name一致
# 2. 安装istio的时候， 对机器性能有一定要求，配置较低的会遇到各种阻碍
# 3. 在腾讯云上申请免费证书，`TrustAsia`
# 4. cacert是密钥信息最多的那个文件
# 5. 最后使用curl命令验证是否OK，返回404则表示部署OK

curl http://dolphin.dementia-ai.com
curl https://dolphin.dementia-ai.com

```



