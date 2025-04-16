variable "oidc_name" {
  description = "Name of the managed identity"
  type        = string
  default     = "gha-terraform-deployer"
}

variable "github_repo" {
  description = "GitHub repo in format org/repo"
  type        = string
  default     = "ivan-sample-org/terraform-cd"
}

variable "branch" {
  description = "Branch name to trust"
  type        = string
  #default = "feature/RA-POD-000_tocket_for_demo"
  default = "feature/RA-POD-000_addind_reuseful_actions"
}


