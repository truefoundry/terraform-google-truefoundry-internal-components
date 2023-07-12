locals {
  tags = merge(
    {
      "terraform-module" = "truefoundry-internal-components"
      "terraform"        = "true"
      "cluster-name"     = var.cluster_name
    },
    var.tags
  )
}