locals {

    bytes_conversion_factor = 1024 * 1024 * 1024
    max_vram_bytes = var.max_vram * local.bytes_conversion_factor
    storage_size_bytes = var.storage_size * local.bytes_conversion_factor
    cloud_config_file = length(var.cloud_config_template_path) > 0 ? var.cloud_config_template_path : "${path.module}/default_cloud_config.tpl"
    default_cloud_config_vars = {
        name = var.vm_name
    }
    cloud_config_vars =  length(keys(var.cloud_config_vars)) > 0 ? var.cloud_config_vars : local.default_cloud_config_vars
    cloud_config_content =  templatefile( local.cloud_config_file , local.cloud_config_vars)

}

resource "xenorchestra_vm" "vm_instance" {
    count=var.instances_count
    memory_max = local.max_vram_bytes
    cpus  = var.vcpus
    cloud_config = length(var.cloud_config_name) > 0 ? data.xenorchestra_cloud_config.xoa_config[0].template : local.cloud_config_content
    name_label = var.instances_count > 1 ? "${var.vm_name}-${count.index}" : var.vm_name
    name_description = var.vm_description
    template = data.xenorchestra_template.xoa_template.id

    # Prefer to run the VM on the primary pool instance
    affinity_host = data.xenorchestra_host.xoa_host.id
    network {
      network_id = data.xenorchestra_network.xoa_network.id
    }

    disk {
      sr_id = data.xenorchestra_sr.xoa_sr.id
      name_label = var.instances_count > 1 ? "${var.storage_label}-${count.index}" : var.storage_label
      
      size = local.storage_size_bytes
    }

    tags = var.tags

    timeouts {
      create = "${var.resource_timeout}m"
    }
}