<h1 align="center" id="title">k8s-security-assessment</h1>

<p align="center"><img src="https://socialify.git.ci/prasbara/k8s-security-assessment/image?language=1&amp;owner=1&amp;name=1&amp;stargazers=1&amp;theme=Light" alt="project-image"></p>

<p id="description">Proyek ini lahir murni karena gabut + lagi galau daripada nangis mending bikin cluster yang juga butuh pelukan. Hasil: minikube nangis juga tapi setidaknya CVE-nya aman dari patah hati. ❤️🛠️</p>

<p align="center"><img src="https://img.shields.io/badge/ngoding-sambil_nangis-blueviolet" alt="shields"><img src="https://img.shields.io/badge/WARNING-APOCALYPSE-ff3300?style=for-the-badge" alt="shields"><img src="https://img.shields.io/badge/SECUREMODE-HARDENED_AF-003366" alt="shields"><img src="https://img.shields.io/badge/feeling-null-purple" alt="shields"></p>

<h2>🛠️ Installation Steps:</h2>

<p>1. Create the Kubernetes Cluster</p>

```
You can use either `kind` or `minikube` to create a local Kubernetes cluster.
```

<p>2. Build the Vulnerable Docker Image</p>

```
Navigate to the `poc/secret-in-image-demo` directory and build the Docker image
```

<p>3. Deploy the Vulnerable Application</p>

```
kubectl apply -f infra/manifests/pentest-namespace.yaml kubectl apply -f infra/manifests/vulnerable-app/deployment.yaml kubectl apply -f infra/manifests/vulnerable-app/service.yaml
```

<p>4. Run the Security Scans</p>

```
ow you can run the security scans using the provided scripts in the `scans` directory.
```

<h2>🍰 Contribution Guidelines:</h2>

Pedoman kontribusi ini disusun untuk menjaga keteraturan dan nilai akademis dalam proyek yang berawal dari rasa iseng dan sedikit galau. Sebagian besar kode dalam proyek ini dihasilkan oleh kecerdasan buatan (AI) sementara penulis berperan dalam memaksimalkan menguji serta menyesuaikannya agar tetap sesuai dengan kaidah penelitian ilmiah di bidang keamanan sistem informasi. Walaupun prosesnya tidak sepenuhnya konvensional pendekatan ini mencerminkan integrasi antara kreativitas personal dan metodologi akademis. Kontributor dipersilakan memberikan saran kritik membangun atau pembenahan teknis yang bersifat objektif. Mohon hindari bentuk hujatan karena tujuan utama proyek ini bukan kesempurnaan melainkan eksplorasi dan validasi pembelajaran. Setiap masukan yang memperkuat aspek traceability keamanan dan dokumentasi akan sangat dihargai dalam semangat kolaborasi terbuka.

  
  
<h2>💻 Built with</h2>

Technologies used in the project:

*   Trivy
*   Falco
*   Artifacts / report
*   Kubernetes

<h2>💖Like my work?</h2>

Sebagai catatan dukungan meskipun bersifat opsional kami mengundang pemangku kepentingan untuk menyediakan dukungan teknis dan administratif yang relevan. Di tengah keheningan laboratorium yang kadang terasa sepi dan melelahkan setiap bentuk bantuan terarah (kontak personel akses sumber daya atau alokasi waktu) akan sangat meringankan beban analisis meningkatkan reproducibility dan mempercepat penyelesaian penilaian ini.
