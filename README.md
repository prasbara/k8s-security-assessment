Judul: Container & Kubernetes Security Assessment — Lab Dev (minikube/kind)

Ringkasan:
Lakukan penilaian keamanan terhadap cluster Kubernetes pengembangan (lokal) untuk mengidentifikasi misconfiguration, privilege escalation, insecure container images, dan celah lain pada rantai supply (image → runtime → cluster). Penilaian berada dalam lingkungan lab yang kami sediakan; tidak boleh melakukan tes pada sistem produksi atau lingkungan pihak ketiga tanpa izin tertulis.

Tujuan:
1. Mengidentifikasi misconfigurasi K8s (RBAC, PSP/PSP-replacement, admission controllers).
2. Menemukan container dengan privilege berlebih, CAP_DROP/CAP_ADD yang salah, atau filesystem writable.
3. Memindai image untuk vuln (CVEs) dan secret hardcoded.
4. Mengecek konfigurasi node & runtime (Docker/containerd) yang melemahkan keamanan.
5. Menghasilkan laporan teknis + eksekutif, PoC non-destruktif, rekomendasi mitigasi.

Ruang lingkup (scope):
- Cluster: minikube/kind yang disediakan di repo `infra/` (lihat manifests).
- Target: semua namespace kecuali `kube-system` dan `kube-public` untuk tes invasif tertentu — namun scan non-invasif boleh di semua namespace.
- Tools yang boleh dipakai: Trivy, kube-bench, kube-hunter, kubectl, docker, kubescape, Falco (sensor read-only), kubectl-trace (lab-only).
- Durasi: 1 sprint (2 minggu lab), deliverable akhir: laporan + scripts + dashboard.

Aturan / Rules of Engagement:
- Semua tindakan harus non-destruktif (jangan hapus resource, jangan escalate ke jaringan eksternal).
- Simpan semua output scanner dan catatan langkah reproducible.
- Untuk exploit PoC, gunakan container / pod yang dibuat sendiri di namespace `pentest-lab`.
- Dilarang mengeksfiltrasi data nyata — gunakan test secrets / dummy file.

Deliverables:
1. Executive summary (bahasa Indonesia).
2. Technical findings: daftar temuan, severity (CVSS jika relevan), langkah reproduksi, bukti (screenshots/log), dan rekomendasi mitigasi.
3. PoC non-destruktif (script & manifest) di `poc/`.
4. Scan output raw (folder `artifacts/`).
5. Checklist remediation prioritas.

Keberhasilan / Acceptance criteria:
- Minimum 90% coverage check list (lihat `checklists/basic.md`).
- Teridentifikasi & terdokumentasi setidaknya 1 misconfig kritikal (atau alasan kenapa tidak ada).
- Skrip scanning otomatis berjalan (`scripts/scan_all.sh`) dan menghasilkan `artifacts/report-summary.html`.

Kontak & Escalation:
- Project owner: &lt;nama&gt;
- Email: &lt;email&gt;
- Slack: #pentest-lab

---

## Setup Instructions

This project is a template for a Kubernetes security assessment. The configuration files have been populated with sample data to get you started.

### 1. Create the Kubernetes Cluster

You can use either `kind` or `minikube` to create a local Kubernetes cluster.

**Using kind:**

```bash
kind create cluster --config infra/kind-cluster.yaml
```

**Using minikube:**

```bash
minikube start
```

### 2. Build the Vulnerable Docker Image

Navigate to the `poc/secret-in-image-demo` directory and build the Docker image:

```bash
cd poc/secret-in-image-demo
docker build -t vulnerable-image-with-secret:latest .
```

Load the image into your kind cluster:

```bash
kind load docker-image vulnerable-image-with-secret:latest
```

If you are using minikube, you can use the following command:

```bash
minikube image load vulnerable-image-with-secret:latest
```

### 3. Deploy the Vulnerable Application

Apply the manifests to deploy the vulnerable application and the pentest namespace:

```bash
kubectl apply -f infra/manifests/pentest-namespace.yaml
kubectl apply -f infra/manifests/vulnerable-app/deployment.yaml
kubectl apply -f infra/manifests/vulnerable-app/service.yaml
```

### 4. Run the Security Scans

Now you can run the security scans using the provided scripts in the `scans` directory.

For example, to run `kube-hunter`, you can run the following command:

```bash
.\scans\kube-hunter\run-kube-hunter.sh
```

This will save the output to `artifacts/raw/kube-hunter_output.txt`.
