#!/usr/bin/env bash
set -euo pipefail

if [ ! -f "istio-1.14.1-linux-amd64.tar.gz" ]; then
  echo "download istio-1.14.1-linux-amd64.tar.gz"
  curl -O -fL https://github.com/istio/istio/releases/download/1.14.1/istio-1.14.1-linux-amd64.tar.gz
fi

tar zxvf istio-1.14.1-linux-amd64.tar.gz

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
#export PATH=$(pwd)/istio-1.14.1/bin/:$PATH

# istioctl 命令补全
./istio-1.14.1/bin/istioctl completion bash >~/.istioctl.completion.bash.inc
echo 'source ~/.istioctl.completion.bash.inc' >>~/.bashrc

# 安装 istio
./istio-1.14.1/bin/istioctl x precheck
./istio-1.14.1/bin/istioctl install -f istio.yaml
./istio-1.14.1/bin/istioctl verify-install

# 创建 Gateway
kubectl apply -f gateway.yaml
