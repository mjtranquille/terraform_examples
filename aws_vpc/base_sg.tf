resource "aws_security_group" "base_sg" {
    name = "base_sg"
    vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "allow_outbound" {
    type = "egress"
    security_group_id = aws_security_group.base_sg.id
    
    description = "Allow outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_http_inbound" {
    type = "ingress"
    security_group_id = aws_security_group.base_sg.id
    
    description = "Allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_https_inbound" {
    type = "ingress"
    security_group_id = aws_security_group.base_sg.id

    description = "Allow https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_ssh_inbound" {
    type = "ingress"
    security_group_id = aws_security_group.base_sg.id
    
    description = "Allow sshd"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
resource "aws_security_group_rule" "allow_node_exporter_inbound" {
    type = "ingress"
    security_group_id = aws_security_group.base_sg.id
   
    description = "Allow nodeexporter"
    from_port = 9100
    to_port = 9100
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}



