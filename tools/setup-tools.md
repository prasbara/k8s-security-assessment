# Tool Installation Guide (Windows)

This guide provides instructions for installing the necessary tools for the Kubernetes security assessment on a Windows system. It is recommended to use PowerShell as an administrator to run the commands.

## 1. Docker Desktop

Docker is required to build and run containerized tools.

1.  **Download and Install:**
    *   Go to the official Docker website: [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)
    *   Download the installer and run it.
    *   Ensure you enable the **WSL 2 backend** during installation, as it is required by default.

2.  **Verify Installation:**
    ```powershell
    docker --version
    ```

## 2. kubectl (Kubernetes Command-Line Tool)

`kubectl` is used to interact with your Kubernetes cluster.

*   **Recommended Method (winget):**
    ```powershell
    winget install -e --id Kubernetes.kubectl
    ```

*   **Alternative (Chocolatey):**
    ```powershell
    choco install kubernetes-cli
    ```

*   **Verify Installation:**
    ```powershell
    kubectl version --client
    ```

## 3. Trivy (Image Vulnerability Scanner)

Trivy is used to scan container images for vulnerabilities.

1.  **Download the binary:**
    *   Go to the [Trivy GitHub Releases page](https://github.com/aquasecurity/trivy/releases).
    *   Download the latest `trivy_*_Windows-64bit.zip` file.
2.  **Extract and place `trivy.exe`** in a directory that is in your system's PATH, for example `C:\Program Files\trivy\`. You may need to create this directory and adjust your system's PATH environment variable.

*   **Verify Installation:**
    ```powershell
    trivy --version
    ```

## 4. Kubescape (K8s Misconfiguration Scanner)

Kubescape scans for misconfigurations and security risks in your cluster.

*   **Recommended Method (PowerShell):**
    ```powershell
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force
    iwr -useb https://raw.githubusercontent.com/kubescape/kubescape/master/install.ps1 | iex
    ```

*   **Verify Installation:**
    ```powershell
    kubescape version
    ```

## 5. Kube-hunter (Penetration Testing Tool)

Kube-hunter looks for security weaknesses in Kubernetes clusters. It requires Python.

1.  **Install Python:**
    *   If you don't have Python, install it from the [official Python website](https://www.python.org/downloads/windows/) or using winget:
    ```powershell
    winget install -e --id Python.Python.3
    ```
    *   Ensure "Add Python to PATH" is checked during installation.

2.  **Install Kube-hunter using pip:**
    ```powershell
    pip install kube-hunter
    ```

3.  **Verify Installation:**
    ```powershell
    kube-hunter --version
    ```

## 6. Kube-bench (CIS Benchmark Checker)

`kube-bench` checks whether Kubernetes is deployed securely by running the checks documented in the CIS Kubernetes Benchmark.

The most common and recommended way to run `kube-bench` is as a job within your Kubernetes cluster, not by installing it on your local machine.

1.  **Go to the `kube-bench` repository:** [https://github.com/aquasecurity/kube-bench](https://github.com/aquasecurity/kube-bench)
2.  Follow the documentation to run `kube-bench` for your specific Kubernetes version and environment (e.g., minikube, kind). This typically involves applying a `job.yaml` file to your cluster, for example:
    ```powershell
    # Example command, check docs for the correct file for your version
    kubectl apply -f job.yaml
    ```
The script `scans/kube-bench/run-kube-bench.sh` contains a note about this process.
