module "aks_flux_ext" {
  count  = var.flux_manage ? 1 : 0
  source = "../../modules/k8s_flux"

  aks_id                  = module.k8s.aks_id
  aks_flux_extension_name = "${module.k8s.aks_name}-flux"
  aks_flux_config_name    = "flux-system"

  flux_git_url             = var.flux_git_url
  flux_git_https_key       = var.flux_git_https_key
  flux_git_reference_value = var.flux_git_reference_value
  flux_kustomizations = [
    {
      name = "cluster",
      path = format("clusters/%s-%03d", var.env_name, var.cluster_index)
    },
  ]
  depends_on = [module.k8s]
}