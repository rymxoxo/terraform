````markdown
**HELLO!**

Welcome to my Terraform project! In this space, I'll guide you through some essential commands and insights based on my experiences with the main.tf file. Feel free to explore and enjoy!

## Commands Overview:

1. **Initialize the Working Directory:**
   - Why? Terraform supports various providers like AWS, Azure, and Google Cloud. To efficiently manage these, run the following command to install the necessary providers defined in the Terraform configuration:
   ```bash
   terraform init
   ```
````

2. **Create an Execution Plan:**

   - Before making any actual changes to resources, it's wise to generate a preview of the actions. This can be achieved with the following command:

   ```bash
   terraform plan
   ```

3. **Apply Changes:**

   - Execute the plan and confirm the action by typing 'yes.' This applies the changes without unexpected surprises. Use the following command:

   ```bash
   terraform apply
   ```

   - If you want to force apply without confirmation, use:

   ```bash
   terraform apply -auto-approve
   ```

4. **Destroy Infrastructure:**

   - Safely destroy the entire infrastructure using:

   ```bash
   terraform destroy
   ```

   - Alternatively, destroy a specific resource (e.g., AWS VPC named 'app-vpc') with:

   ```bash
   terraform destroy -target aws_vpc.app-vpc
   ```

5. **After Executing Terraform Commands:**

   - Two files are generated:
     - terraform.tfstate: A JSON file representing real-world resources.
     - terraform.tfstate.backup: A backup for the previous state.

6. **Using Variables:**

   - Avoid hardcoding secret keys and access keys. Manage different environments like DEV, STAGING, and PROD using different .tfvars files.

   - If you change the variable file name (e.g., from terraform.tfvars to terraform-dev.tfvars), apply the changes with:
     ```bash
     terraform apply -var-file terraform-dev.tfvars
     ```

7. **Exporting Variables:**

   - Export AWS credentials as environment variables:

     ```bash
     export AWS_SECRET_ACCESS_KEY=<your_secret_key>
     export AWS_ACCESS_KEY_ID=<your_access_key>
     ```

     Verify by typing:

     ```bash
     env | grep AWS
     ```

     Or use:

     ```bash
     aws configure
     ```

8. **Setting Custom Terraform Environment Variable:**
   - Set 'avail_zone' as a custom Terraform environment variable before applying:
     `bash
export TF_VAR_avail_zone="eu-west-1a"
`
