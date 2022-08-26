resource "yandex_vpc_network" "forapps" {
    name = var.worknet
}

resource "yandex_vpc_subnet" "apps-subnet" {
    name           = var.worksubnet
    v4_cidr_blocks = [var.workip]
    zone           = var.zone
    network_id     = "${yandex_vpc_network.forapps.id}"
#    route_table_id = "${yandex_vpc_route_table.inet-route-stage.id}"
}

/*
resource "yandex_vpc_route_table" "inet-route" {
    name        = var.route-table
    network_id  = "${yandex_vpc_network.forapps.id}"

    static_route {
        destination_prefix = "0.0.0.0/0"
        next_hop_address   = var.next_hop_address
}
*/