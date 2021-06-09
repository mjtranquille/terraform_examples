resource "aws_security_group" "base_sg" {
    name = "sg"
    vpc_id = module.vpc.vpc_id
}

resource "aws_security_group" "db_sg" {
    name = "db_sg"
    vpc_id = module.vpc.vpc_id
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

resource "aws_security_group_rule" "allow_outbound" {
    type = "egress"
    security_group_id = aws_security_group.base_sg.id
    
    description = "Allow outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_mysql_inbound" {
    type = "ingress"
    security_group_id = aws_security_group.db_sg.id

    description = "Allow db access"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = aws_security_group.base_sg.id
}

