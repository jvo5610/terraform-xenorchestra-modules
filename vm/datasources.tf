data "xenorchestra_cloud_config" "xoa_config" {
  count = length(var.cloud_config_name) > 0 ? 1 : 0
  name = var.cloud_config_name
}
data "xenorchestra_template" "xoa_template" {
  name_label = var.vm_template_name
}
data "xenorchestra_host" "xoa_host" {
  name_label = var.host_name
}
data "xenorchestra_network" "xoa_network" {
  name_label = var.network_name
}
data "xenorchestra_sr" "xoa_sr" {
  name_label = var.sr_name
}