locals {
  a_records = {
    for a in var.a_record_list : a.name => a
  }
  cname_records = {
    for cname in var.cname_record_list : cname.name => cname
  }
  ns_records = {
    for ns in var.ns_record_list : ns.name => ns
  }
}
