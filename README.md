# Chainguard Interview Project 🚀

## Overview

This project is part of my preparation for the **Associate Software Engineer (DevOps)** interview at Chainguard. It showcases my skills in setting up and managing Kubernetes clusters on AWS using Terraform and Helm, specifically deploying a **Chainguard NGINX** application. The project demonstrates my understanding of infrastructure as code (IaC) tools, Kubernetes, and Helm.

## Project Components 🛠️

### 1. Terraform Configuration (terraform/)

- **eks.tf**: Defines the configuration for setting up an Amazon EKS cluster. The cluster is configured to use **three availability zones** for high availability and resilience. It includes managed node groups, network configurations, and essential add-ons like **CoreDNS, Kube-Proxy,** and **VPC-CNI**.
- **provider.tf**: Specifies the AWS provider and sets up local variables for region, cluster name, and networking details.
- **vpc.tf**: Manages the VPC, including public, private, and intra subnets across three availability zones. The intra subnets are specifically designed for the EKS control plane.

### 2. Kubernetes Manifests (manifests/)

- **deployment.yml**: Initially used to deploy the **Chainguard NGINX** application with three replicas.
- **service.yml**: Defines the **LoadBalancer** service to expose the NGINX application externally.

### 3. Helm Chart (chainguard-nginx/)

- **Helm Chart Overview**: The Helm chart manages the NGINX deployment and was derived from the Kubernetes manifests. It offers a more scalable and manageable approach to deployment.
- **values.yaml**: Customizable parameters for the Helm chart, including the **Chainguard NGINX** image and service configuration.
- **Chart.yaml**: Defines metadata for the Helm chart, including the chart and application versions.

### 4. .gitignore 📝

- The **.gitignore** file ensures that sensitive or unnecessary files, such as Terraform state files and Helm packaging outputs, are not committed to version control.

## Project Execution ⚙️

### Initial Setup

- I started by defining my infrastructure using Terraform. The Terraform files set up the necessary AWS components, including the VPC, subnets, and the EKS cluster with managed node groups.

### Kubernetes Manifests

- I deployed the **NGINX** application using basic Kubernetes manifests (`deployment.yml` and `service.yml`). This approach helped me understand the manual process of deploying applications on Kubernetes.

### Transition to Helm

- I then transitioned to using **Helm** for managing the NGINX deployment. I derived the Helm chart (`chainguard-nginx/`) from the Kubernetes manifests, which allowed for more flexibility, scalability, and easier management of the application.

## Usage of Chainguard Images 🛡️

- **Chainguard Images** were chosen for this project due to their **zero CVEs** (Common Vulnerabilities and Exposures) policy, ensuring that the deployed containers are secure by default. This is critical for maintaining a robust security posture, especially in production environments. The images are also optimized for minimal size and attack surface, reducing the risk of vulnerabilities and improving performance.

- By using Chainguard Images, I demonstrate an understanding of best practices in container security, which is essential for the role at Chainguard. The ability to deploy secure, compliant applications without the need for constant patching aligns with Chainguard’s mission of securing the software supply chain by default.

## Steps to Deploy 🚀

1. **Set up the infrastructure using Terraform:**

   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

   This command sets up the AWS infrastructure, including the VPC, subnets, and the EKS cluster.

2. **Deploy the NGINX application using Kubernetes manifests:**

   ```bash
   kubectl apply -f manifests/deployment.yml
   kubectl apply -f manifests/service.yml
   ```

   This deploys the NGINX application and exposes it via a LoadBalancer service.

3. **Deploy the NGINX application using Helm:**

   ```bash
   helm install chainguard-nginx ./chainguard-nginx
   ```

   This deploys the NGINX application using the Helm chart, providing a more scalable and manageable deployment method.

4. **Access the NGINX application:**

   Once deployed, you can access the NGINX application via the LoadBalancer's external IP or DNS name.

## Project Benefits 🎯

This project showcases my ability to set up and manage cloud infrastructure using Terraform and Kubernetes and to transition from manual deployment using manifests to a more automated and scalable approach using Helm. It demonstrates my understanding of key DevOps principles and tools relevant to the **Associate Software Engineer (DevOps)** role at Chainguard.

## Conclusion 🏁

This project serves as a practical demonstration of my skills in cloud infrastructure management, Kubernetes, and Helm. It aligns with the responsibilities outlined in the job description and reflects my readiness to contribute effectively to the Chainguard team.
