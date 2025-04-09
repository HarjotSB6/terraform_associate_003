# Terraform Associate (003)

## **Infrastructure as Code (IaC) concepts**

**Problems with Manual Configuration**

- Prone to human errors, leading to misconfigurations.
- Difficult to manage and maintain compliance.
- Hard to transfer knowledge of configurations among team members.

**Infrastructure as Code (IaC) Benefits**

- Automates the process of creating, updating, and destroying infrastructure.
- Acts as a **blueprint** for infrastructure setup.
- Enables easy **sharing, versioning, and inventory** of infrastructure.

### **Declarative vs. Imperative Approaches in IaC**

### **Declarative Approach** (Explicit)

- Defines the desired end state of infrastructure.
- More verbose but avoids misconfiguration.
- Uses JSON, YAML, XML.
- **Examples:**
    
    
    - **ARM Templates** (Azure)
    - **Azure Blueprints** (Azure, manages relationships)
    - **CloudFormation** (AWS)
    - **Cloud Deployment Manager** (Google Cloud)
    - **Terraform** (Supports multiple cloud providers)
    
    
    
### **Imperative Approach** (Implicit)

- Specifies steps to achieve the desired state.
- Less verbose but prone to misconfiguration.
- More flexible than declarative.
- Uses Python, Ruby, JavaScript.
- **Examples:**
    
    
    - **AWS CDK** (AWS, includes built-in best practices)
    - **Pulumi** (Supports AWS, Azure, GCP, Kubernetes)
    
      

### **Infrastructure Lifecycle**

- Consists of **clearly defined work phases** used by DevOps engineers.
- Phases: **Plan, Design, Build, Test, Deliver, Maintain, and Retire** cloud infrastructure.

### **Day 0, Day 1, and Day 2** (Lifecycle Phases)

- **Day 0** → Planning and Design.
- **Day 1** → Development and Iteration.
- **Day 2** → Go Live and Maintenance.

**IaC enhances the infrastructure lifecycle by improving reliability, manageability, and sensibility.**

- **Reliability**
IaC ensures changes are idempotent, consistent, repeatable, and predictable.
- **Idempotent**
Running IaC multiple times results in the same expected state.
- **Manageability**
IaC enables code-based mutation and revisions with minimal changes.
- **Sensibility**
IaC helps avoid financial, reputational, and even life-threatening losses, especially in government and military infrastructure.

![image.png](image%2032.png)

**Summary of Provisioning, Deployment, and Orchestration**

- Provisioning
    
    Definition: Preparing a server with systems, data, and software to make it ready for network operation.
    Tools: Achieved using Configuration Management tools like Puppet, Ansible, Chef, Bash scripts, PowerShell, or Cloud-Init.
    Cloud Context: Launching and configuring a cloud service is considered provisioning.
    
- Deployment
    
    Definition: Delivering a version of an application to a provisioned server.
    Tools: Deployment can be performed via tools like AWS CodePipeline, Harness, Jenkins, Github Actions, CircleCI.
    
- Orchestration
    
    Definition: Coordinating multiple systems or services.
    Context: A common term used when working with microservices, containers, and Kubernetes.
    Tools: Orchestration can be done using tools like Kubernetes, Salt, Fabric.
    

**How to Detect Configuration Drift**

Compliance Tools: Use tools like AWS Config, Azure Policies, or GCP Security Health Analytics to detect misconfigurations.
Built-in Drift Detection: Utilize built-in features like AWS CloudFormation Drift Detection.
State Storage: Store the expected state using tools like Terraform state files.

**How to Correct Configuration Drift**

Compliance Tools for Remediation: Use compliance tools like AWS Config to correct misconfigurations.
Terraform Refresh and Plan: Employ Terraform commands to refresh the state and plan corrections.
Manual Correction (Not Recommended): Avoid manually correcting configurations if possible.
Infrastructure Rebuild: As a last resort, tear down and set up the infrastructure again.

**How to Prevent Configuration Drift**

Immutable Infrastructure: Implement immutable infrastructure, using create-and-destroy strategies like Blue/Green deployments.

No Server Modification: Servers are never modified after deployment.

Image Baking: Utilize tools like AWS Image Builder, HashiCorp Packer, or GCP Cloud Run to bake AMIs or containers.

**GitOps** 

- **IaC and Git:** GitOps combines Infrastructure as Code (IaC) with a Git repository.
- **Formal Review Process:** It introduces a formal process for reviewing and approving changes to infrastructure code.
- **Automated Deployment:** Once the code is accepted (merged), it automatically triggers a deployment.

**GitOps Workflow** 

![image.png](image%2033.png)

![image.png](image%2034.png)

![image.png](image%2035.png)