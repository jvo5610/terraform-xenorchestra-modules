variable max_vram {
    description = "Max vram assigned to VM. Expressed in GB"
    type = number
    default = 2
}
variable storage_size {
    description = "Storage size assigned to VM. Expressed in GB"
    type = number
    default = 5
}
variable instances_count {
    description = "Number of instance to be created"
    type = number
    default = 1
}
variable vcpus {
    description = "Number of vcpus assigned to VM"
    type = number
    default = 2
}
variable vm_name {
    description = "VM name"
    type = string
}
variable vm_description {
    description = "VM description"
    type = string
}
variable storage_label {
    description = "Storage label or description"
    type = string
}
variable tags {
    description = "Resources tags"
    type = list(string)
    default = []
}
variable resource_timeout {
    description = "Creation timeout"
    type = number
    default = 10
}
 variable vm_template_name {
    description = "Name of VM template config to be used by this VM"
    type = string
 }
 variable host_name {
    description = "Name of host were this VM will be deploy"
    type = string
 }
 variable network_name {
    description = "Name of network that this VM will use"
    type = string
 }
 variable sr_name {
    description = "Name of sr(storage) to be used in this VM storage creation"
    type = string
 }
  variable cloud_config_name {
    description = "Name of cloud_init config to be used by this VM"
    type = string
    default = ""
 }
 variable cloud_config_vars {
    description = "Name of sr(storage) to be used in this VM storage creation"
    type = map(any)
    default = {}
 }
 variable cloud_config_template_path {
    description = "Path to cloud_init template file"
    type = string
    default = ""
}