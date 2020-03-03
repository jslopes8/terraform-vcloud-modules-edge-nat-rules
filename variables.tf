variable "create" {
    type    = bool
    default = true
}
variable "snat_rule" {
    type    = list(map(string))
    default = []
}
variable "dnat_rule" {
    type    = list(map(string))
    default = []
}
