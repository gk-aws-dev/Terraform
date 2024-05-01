# Introduction:
- Terraform is an open-source infrastructure as code (IaC) software tool created by HashiCorp. It allows users to define and provision data center infrastructure using a declarative
  configuration language.
- Terraform enables users to manage and automate the deployment and scaling of infrastructure across various cloud providers, such as AWS, Azure, Google Cloud Platform, and others,
  as well as on-premises infrastructure.
- HashiCorp and the Terraform community have already written thousands of providers to manage many different types of resources and services.
- HCL: Hashicorp Configuration Language
  
**1. terraform consist of the three flows:**
- work: You define resources, which may be across multiple cloud providers and services.
- Plan: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration
- Apply: On approval, terraform performs the proposed operations in the correct order

**2. Track your infra: state file.**
It also keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. 
Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.

**3. Configuration File:** 
Terraform uses configuration files (often with a .tf extension) to define the desired infrastructure state. These files specify providers, resources, variables, and other settings. The primary configuration file is usually named main.tf, but you can use multiple configuration files as wel