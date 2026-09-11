# --- General ---
variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region where the infrastructure is deployed."
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "Deployment environment for the infrastructure."
}

variable "name" {
  type        = string
  default     = "zidd2"
  description = "Base name used for project resources."
}

# --- Networking ---
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "single_nat_gateway" {
  type        = bool
  default     = true
  description = "true = 1 NAT (cheaper); false = 1 per AZ (HA)"
}

# --- ECR ---
variable "ecr_repositories" {
  type    = list(string)
  default = ["zidd-auth-service", "zidd-chat-service", "zid-frontend"]
}

# --- SonarQube EC2 ---
variable "sonar_key_name" {
  type    = string
  default = "pp-hrms-sonarqube"
}
variable "sonar_ssh_ip" {
  type    = string
  default = "122.161.53.41"
}
variable "sonar_instance_type" {
  type    = string
  default = "t3.medium"
}

# --- Secrets ---
variable "mysql_root_password" {
  type      = string
  default   = "root"
  sensitive = true
}
variable "jwt_secret_key" {
  type      = string
  default   = "3cfa76ef14937c1c0ea519f8fc057a80fcd04a7420f8e8bcd0a7567c272e007b"
  sensitive = true
}

# --- IAM / GitHub OIDC ---
variable "github_org" {
  type    = string
  default = "your-org"
}
variable "github_repo" {
  type    = string
  default = "zidd2-devops-platform"
}
variable "create_github_oidc_provider" {
  type        = bool
  default     = true
  description = "false if token.actions.githubusercontent.com OIDC already exists"
}

# --- EKS ---
variable "k8s_version" {
  type        = string
  default     = "AL2023_x86_64_STANDARD"
  description = "EKS-optimized AMI family for the node group"
}
variable "node_instance_types" {
  type    = list(string)
  default = ["t3.large"]
}
variable "node_desired_size" {
  type    = number
  default = 3
}
variable "node_min_size" {
  type    = number
  default = 2
}
variable "node_max_size" {
  type    = number
  default = 5
}

# --- DNS / TLS / CDN ---
variable "domain_name" {
  type        = string
  description = "FQDN served by CloudFront, e.g. zidd2.example.com"
}
variable "manage_godaddy_dns" {
  type    = bool
  default = false
}
variable "godaddy_api_key" {
  type      = string
  default   = ""
  sensitive = true
}
variable "godaddy_api_secret" {
  type      = string
  default   = ""
  sensitive = true
}
