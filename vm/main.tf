locals{
    bytes_conversion_factor = 1024 * 1024 * 1024
    max_vram_bytes = var.max_vram * local.bytes_conversion_factor
    storage_size_bytes = var.storage_size * local.bytes_conversion_factor
}

resource "xenorchestra_vm" "bar" {
    count=var.instances_count
    memory_max = local.max_vram_bytes
    cpus  = var.vcpus
    cloud_config = if var.create_cloud_config ? templatefile("cloud_config.tftpl", {
        name = if var.instances_count > 1 ? "${var.vm_name}-${count.index}" : var.vm_name
    }) : ""
    name_label = if var.instances_count > 1 ? "${var.vm_name}-${count.index}" : var.vm_name
    name_description = var.vm_description
    template = data.xenorchestra_template.xoa_template.id

    # Prefer to run the VM on the primary pool instance
    affinity_host = data.xenorchestra_host.xoa_host.id
    network {
      network_id = data.xenorchestra_network.xoa_network.id
    }

    disk {
      sr_id = data.xenorchestra_sr.xoa_sr.id
      name_label = if var.instances_count > 1 ? "${var.storage_label}-${count.index}" : var.storage_label
      
      size = local.storage_size_bytes
    }

    tags = var.tags

    timeouts {
      create = "${var.resource_timeout}m"
    }
}