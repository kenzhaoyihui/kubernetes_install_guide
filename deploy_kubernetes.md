# Deployment for Kubernetes via Kubeadm

## Version : v1.5.4

*  ```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://yum.kubernetes.io/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF


`setenforce 0`


*  ``` yum install -y http://yum.kubernetes.io/pool/082436e6e6cad1852864438b8f98ee6fa3b86b597554720b631876db39b8ef04-kubeadm-1.6.0-0.alpha.0.2074.a092d8e0f95f52.x86_64.rpm \
    http://yum.kubernetes.io/pool/2e63c1f9436c6413a4ea0f45145b97c6dbf55e9bb2a251adc38db1292bbd6ed1-kubelet-1.5.4-0.x86_64.rpm \
    http://yum.kubernetes.io/pool/fd9b1e2215cab6da7adc6e87e2710b91ecfda3b617edfe7e71c92277301a63ab-kubectl-1.5.4-0.x86_64.rpm \
    http://yum.kubernetes.io/pool/0c923b191423caccc65c550ef07ce61b97f991ad54785dab70dc07a5763f4222-kubernetes-cni-0.3.0.1-0.07a8a2.x86_64.rpm ```


* ``` yum install -y docker ```

* ``` systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet ```

* ``` kubeadm init --use-kubernetes-version=v1.5.4 --api-advertise-addresses=10.10.10.10 --pod-network-cidr=10.254.0.0/16 --token abcdef.1234567890123456 ```

* ``` kubectl apply -f https://git.io/weave-kube ``` (only the network weave or other type network,such as flannel is up, the kube-dns pod is becoming running status )

* ``` wget https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml && kubectl create -f kubernetes-dashboard.yaml ``` (need to add the nodePort to expose his port to external access)

* ```sh start.sh``` to deploy heapster+InfluxDB+grafana(the master node don't scheduler the relevant pod on the master host, so need to add another host as node to run these pods)

* *** Also you can pre-pull some relevant images if needed. List here:
docker-images.md*** 
