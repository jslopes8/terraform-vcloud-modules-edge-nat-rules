resource "vcd_nsxv_snat" "nat_rules" {
    count   = var.create ? length(var.snat_rule) : 0

    edge_gateway = var.snat_rule[count.index]["edge_gateway"]
    network_type = var.snat_rule[count.index]["network_type"]
    network_name = var.snat_rule[count.index]["network_name"]

    original_address   = var.snat_rule[count.index]["original_address"]
    translated_address = var.snat_rule[count.index]["translated_address"]

}

resource "vcd_nsxv_dnat" "dnat_rules" {
    count   = var.create ? length(var.dnat_rule) : 0

    edge_gateway = var.dnat_rule[count.index]["edge_gateway"]
    network_name = var.dnat_rule[count.index]["network_name"]
    network_type = var.dnat_rule[count.index]["network_type"]

    enabled         = var.dnat_rule[count.index]["enabled"]
    logging_enabled = var.dnat_rule[count.index]["logging_enabled"]
    description     = lookup(var.dnat_rule[count.index], "description", null)

    original_address   = var.dnat_rule[count.index]["original_address"]
    original_port      = var.dnat_rule[count.index]["original_port"]

    translated_address = var.dnat_rule[count.index]["translated_address"]
    translated_port    = var.dnat_rule[count.index]["translated_port"]
    protocol           = var.dnat_rule[count.index]["translated_protocol"]
}