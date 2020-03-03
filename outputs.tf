output "snat_id" {
  value = vcd_nsxv_snat.nat_rules.*.id
}
