#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到阿里云仓库
docker login --username=kewubenben@sina.com registry.cn-zhangjiakou.aliyuncs.com
docker tag $imagepath registry.cn-zhangjiakou.aliyuncs.com/daiming/k8s/$imagename
docker push registry.cn-zhangjiakou.aliyuncs.com/daiming/k8s/$imagename

# push到dockerhub
docker tag $imagepath k8s/$imagename
docker push k8s/$imagename
done
