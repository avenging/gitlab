# Gitlab with minikube on windows for CI/CD
* Install Virtualbox
* Install Vagrant
* Download minikube
* Clone this repo
* vagrant up

During gitlab install keep on unpausing Vagrant VM (if necessary) due to Virtualbox bugs
Go to the IP address presented at the end of the gitlab install in a browser.
Set a password for the gitlab root accout
Then login as root with the password you just set

# Setup git-bash on windows for kuberentes:
`mkdir /c/minikube`

# Download minikube
https://github.com/kubernetes/minikube/releases/latest (download for Windows and rename minikube.exe)

# Download kubectl
`curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/windows/amd64/kubectl.exe`

Set the PATH environment variable so that it has the location of minikube and kubectl in the path
```
export PATH=$PATH:/c/minikube
export MINIKUBE_HOME=/c/minikube
```

# Start minikube
```
minikube start --vm-driver virtualbox
minikube addons enable ingress
```

# In Gitlab
* Spanner for admin area
* settings -> network
* outbound requests -> expand
* Allow outbound requests -> save

# Next create a project in GitLab
* Select operations -> kubernetes on the left
* Click Add Kubernetes cluster
* Click Add existing cluster tab
* Give the cluster a name

# Back in bash
Run:
```
minikube info
sh clusterinfo.sh
```

Create the gitlab RBAC user/role
```
kubectl apply -f gitlab-setup.yml
```

# Back in gitlab and from above output
* Paste in API URL
* Paste in token
* Paste in cert
* Click add Kubernetes cluster
* On the next page
* Add the base domain of <ipaddress of kubernetes master api from above>.nip.io (e.g. 192.168.99.115.nip.io)
* click install helm tiller
* click install gitlab runner
