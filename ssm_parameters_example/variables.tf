variable "vpc_id" {
  description = "development vpc's id"
  type = string
}

variable "sg_id" {
  description = "development vpc's base sg id"
  type = string
}
variable "public_subnet_id" {
  description = "development environment public subnet"
  type = string
}
variable "ubuntu_lts_ami" {
  description = "ubuntu current LTS ami"
  type = string
}
variable "webserver_ip" {
  description = "Ip of web server"
  type = string
}

