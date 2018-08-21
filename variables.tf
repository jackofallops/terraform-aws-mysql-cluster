variable "region" {
  description = "AWS region for DB deployment"
  default     = "eu-west-2"
}

variable "cluster_size" {
  description = "Number of cluster nodes (default is 1, max is the number of available AZ's in the target region)"
  default     = 1
}

variable "cluster_instance_type" {
  description = "AWS Instance size for cluster nodes"
  default     = "t2.micro"
}

variable "data_volume_size" {
  description = "Size, in GB, for the EBS Data Disk for the node(s)"
  default     = 10
}

variable "data_volume_iops" {
  description = "IOPS for the Data volume (default 3000)"
  default     = 2000
}

variable "data_volume_delete" {
  description = "Delete the volume on termination of the server instance"
  default     = false
}

variable "data_volume_encrypted" {
  description = "Encrypt the mysql-data volume"
  default     = true
}

variable "ami_owners" {
  description = "List of owners for AMI selection and filtering"
  type        = "list"
  default     = ["self"]
}

variable "ami_most_recent" {
  description = "map of strings to select the AMI to be used"
  default     = true
}

variable "ami_filter_name_prefix" {
  default = "*"
}

variable "root_block_device_size" {
  description = "Size of root volume for instance(s)"
  default     = 40
}

variable "root_block_device_delete" {
  description = "delete root ebs volume on instance termination"
  default     = true
}

variable "root_block_device_type" {
  description = "EBS volume type for root disk"
  default     = "gp2"
}

variable "root_block_device_iops" {
  description = "IOPS for io1 type volumes"
  default     = ""
}

variable "server_role" {
  description = "Tag to specify the server's role in configuration management"
  default     = "base"
}

variable "cluster_name_prefix" {
  description = "Name for the cluster - will be appended with the count index of the AZ"
  default     = "my-mysql-cluster"
}

variable "base_tags" {
  description = "map of tags to apply - will be merged at runtime"
  type        = "map"
  default     = {}
}

variable "extra_tags" {
  description = "map of extra tags to apply - will be merged at runtime"
  type        = "map"
  default     = {}
}

variable "user_data_base64" {
  description = "Base64 Encoded string containing the complete mulitpart cloud-init config"
}
