# Kubernetes & Docker Commands Cheat Sheet

A comprehensive list of frequently used commands in Kubernetes and Docker environments, organized for quick reference.

## Kubernetes Commands

### Cluster and Node Management
- `kubectl apply -f [file.yaml]`: Apply a configuration to a resource from a file.
- `kubectl get pods`: List all pods in the Kubernetes cluster.
- `kubectl get nodes`: List all nodes in the Kubernetes cluster.
- `kubectl delete deployment [deployment-name]`: Delete a specific deployment.
- `kubectl delete pod [pod-name]`: Delete a specific pod.
- `kubectl delete service [service-name]`: Delete a specific service.
- `kubectl delete statefulset [statefulset-name]`: Delete a specific statefulset.
- `kubectl taint nodes --all node-role.kubernetes.io/[role]`: Apply or remove a taint from all nodes for a specific role.
- `kubectl create -f [URL]`: Create a resource in Kubernetes from a configuration file at a specified URL.
- `kubectl get statefulset`: List all statefulsets in the Kubernetes cluster.
- `kubectl get daemonset`: List all daemonsets in the Kubernetes cluster.
- `kubectl get namespace`: List all namespaces in the Kubernetes cluster.
- `kubectl wait --for=delete pod/[pod-name] --timeout=[time]`: Wait for a pod to be deleted within a specified timeout.
- `kubectl get all`: List all resources in the Kubernetes cluster.
- `kubectl version`: Display the version of kubectl.

### Pods and Containers
- `kubectl logs [pod-name]`: View logs for a specific pod.
- `kubectl describe pod [pod-name]`: Show detailed information about a specific pod.
- `kubectl run [name] --restart=Never --rm -i --tty --image [image] -- [command]`: Run a pod in interactive mode with a specific image and command.
- `cat <<EOF | kubectl create -f -`: Create a resource in Kubernetes using a configuration provided directly in the command line.
- `kubectl describe node -A`: Describe all nodes, showing detailed information.

### Cluster Initialization and Reset
- `sudo kubeadm init`: Initialize a Kubernetes control-plane node.
- `kubeadm reset`: Resets the kubeadm installation.

## Docker Commands

- `docker build -f [Dockerfile] -t [tag] .`: Build a Docker image from a Dockerfile.
- `docker push [image]`: Push a Docker image to a registry.
- `sudo docker run [image]`: Run a Docker container from an image.
- `sudo docker run --rm --gpus all [image] [command]`: Run a Docker container with GPU support.
- `docker images`: List all Docker images.
- `docker run --gpus all [image]`: Run a Docker container with all available GPUs.

## System & Networking Commands

- `sudo systemctl [action] kubelet`: Perform an action (like start, stop, restart) on the kubelet service.
- `journalctl -u kubelet`: View logs for the kubelet service.
- `sudo iptables -F`: Flush all iptables rules.
- `ip route show`: Display the IP routing table.
- `sudo nano [file]`: Edit a file using the nano editor.
- `sudo reboot`: Reboot the system.
- `sudo swapoff -a`: Disable swap memory.
- `sudo sed -i '/ swap / s/^/#/' /etc/fstab`: Comment out the swap line in fstab to disable it.
- `sudo sysctl [parameter]`: Set a system control parameter.
- `sudo apt-get remove [package]`: Remove a specific package using apt-get.
- `sudo apt-get install -y [package]`: Install a specific package using apt-get.
- `apt search [package-name]`: Search for a package in the apt repository.

## Kubernetes Secret Management

- `kubectl create secret docker-registry [secret-name]`: Create a new secret for Docker registry authentication.

## Minikube Commands

- `minikube start --driver=docker --addons=[addons]`: Start Minikube with specified driver and addons.
- `minikube start --driver=docker --addons=nvidia-driver-installer,nvidia-gpu-device-plugin `
- `minikube ssh`: SSH into the Minikube VM.
- `minikube addons enable [addon-name]`: Enable a specific addon in Minikube.

## Docker-Compose Commands

- `docker-compose [command]`: Run a docker-compose command, like up, down, scale, or logs.

## Development & Scripting Commands

- `git [command]`: Perform a git operation, such as status, add, commit, or push.
- `pip install [package]`: Install a Python package using pip.
- `conda activate [environment]`: Activate a specific conda environment.
