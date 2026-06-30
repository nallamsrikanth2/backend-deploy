variable "project_name" {
    type = string
    
}

variable "environment" {
    type = string
  
}

variable "common_tags" {
    type = map
  
}

variable "sg_tags" {
    type = map
    default = {}
  
}

variable "sg_name" {
  type = string
}

variable "description" {
    type = string
  
}

variable "vpc_id" {
    type = string
  
}

variable "ingress_ports" {
    type = list
    default = []
}

variable "egress_ports" {
    type = list
    default = [
        {
            from_port = 0
            to_port = 0
            protocol = "-1"  # -1 protocols
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}