resource "aws_security_group_rule" "sg_rule" {
  for_each = { for rule in var.rules : rule.description => rule }

  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = var.sg_id
}
