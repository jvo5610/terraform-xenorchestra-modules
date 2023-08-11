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
variable create_cloud_config {
    description = "Add or not config_init to VM"
    type = bool
    default = false
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
 variable cloud_config_name {
    description = ""
    type = string
 }
 variable vm_template_name {
    description = ""
    type = string
 }
 variable host_name {
    description = ""
    type = string
 }
 variable network_name {
    description = ""
    type = string
 }
 variable sr_name {
    description = ""
    type = string
 }