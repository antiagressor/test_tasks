# 🚀 Azure Linux VM with Terraform

This project provisions a **Linux Virtual Machine** in **Microsoft Azure (West Europe)** using **Terraform**.  
It is designed to be modular, reusable, and ready for integration of monitoring tools or other DevOps components.

## 📦 Features

- Creates:
  - Resource Group
  - Virtual Network
  - Subnet
  - Public IP
  - Network Interface
  - Linux Virtual Machine
- Region: `West Europe`
- Public IP output for direct access
- Parameterized variables via `.tfvars` files
- Environment-based deployment support (`test`, `dev`, `prod`, etc.)
- Suitable for monitoring agent installation

## 🛠️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.4+
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure subscription
- Logged in via `az login` or using a service principal

## 📁 Project Structure

azure-linux-vm/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars.example
├── .gitignore
└── env/
    ├── test.tfvars
    ├── dev.tfvars
    └── prod.tfvars


## ⚙️ Usage

### 1. Initialize the project

terraform init

2. Plan infrastructure (e.g. for dev)

**terraform plan -var-file="env/dev.tfvars"**

3. Apply changes

**terraform apply -var-file="env/dev.tfvars"**

4. Destroy infrastructure (if needed)

**terraform destroy -var-file="env/dev.tfvars"**

🌐 Environment Management
Create a .tfvars file per environment (test, dev, prod).

Example: env/test.tfvars

**resource_group_name = "rg-devops-test"
vm_name             = "vm-test"
admin_username      = "testuser"
admin_password      = "testP@ssw0rd123!"**

Example: env/dev.tfvars

**resource_group_name = "rg-devops-dev"
vm_name             = "vm-dev"
admin_username      = "devuser"
admin_password      = "devP@ssw0rd123!"**

Example: env/prod.tfvars

**resource_group_name = "rg-devops-prod"
vm_name             = "vm-prod"
admin_username      = "produser"
admin_password      = "prodP@ssw0rd123!"**

Use the appropriate file for each environment:

**terraform apply -var-file="env/prod.tfvars"**

🔐 .gitignore

# Terraform files
*.tfstate
*.tfstate.*
.terraform/
crash.log
*.tfvars
*.tfvars.json

# Sensitive files
*.pem
*.key

# Editor files
.vscode/
.idea/
.DS_Store
*.swp
📄 terraform.tfvars.example

resource_group_name = "rg-example"
vm_name             = "example-vm"
admin_username      = "exampleuser"
admin_password      = "ExampleP@ssw0rd!"
This file is safe to commit and shows required input variables without secrets.

🤖 CI/CD Integration
To use in GitHub Actions, Azure DevOps, etc.:

**terraform init
terraform plan -var-file="env/dev.tfvars"
terraform apply -auto-approve -var-file="env/dev.tfvars"**
Store sensitive variables (ARM_CLIENT_ID, etc.) in your pipeline secret store.

📚 Resources
Terraform Azure Provider
Azure Linux VM Docs
Terraform CLI Docs

🧠 Notes
The VM uses password-based authentication for demo purposes. For production, prefer SSH key authentication.

You can extend this setup to:
Use Azure Monitor or Log Analytics Agent
Store state remotely in Azure Storage
Pull secrets from Azure Key Vault

🧼 Cleanup

**terraform destroy -var-file="env/dev.tfvars"**
This will remove all resources created in the selected environment.