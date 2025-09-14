# main.tf
# Variable definitions
variable "compartment_ocid" {
  description = "OCID of the compartment where resources will be created"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID of the subnet where the compute instance will be placed"
  type        = string
}

variable "instance_shape" {
  description = "Shape of the compute instance (e.g., VM.Standard.E4.Flex)"
  type        = string
}

# Define a map of instances to be created
locals {
  instances = {
    "instance-01" = {
      display_name = "web-server-01"
    },
    "instance-02" = {
      display_name = "web-server-02"
    },
    "instance-03" = {
      display_name = "web-server-03"
    }
  }
}

# Data source to get the latest OCI Linux image
data "oci_core_images" "ubuntu_image" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
  state                    = "AVAILABLE"
}

# Resource to create multiple compute instances using a for_each loop
resource "oci_core_instance" "test_instance" {
  for_each = local.instances

  availability_domain = "1"
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape

  display_name = each.value.display_name

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ubuntu_image.images[0].id
  }

  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    user_data           = filebase64("init_script.sh")
  }

  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false
  }
}

output "instance_public_ips" {
  value = { for key, instance in oci_core_instance.test_instance : key => instance.public_ip }
}

