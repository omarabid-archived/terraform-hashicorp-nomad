# Nomad Configuration File
variable "server_domain" {}
variable "server_hostnames" {
	type = "map"
}

# Server Config File
data "template_file" "server_config" {
	count = "${length(var.server_hostnames)}"
	template = "${file("${path.module}/server/server.hcl")}"

	vars {
		node_name = "consul-${var.server_domain}-${count.index + 1}"
		server_domain = "${var.server_domain}"
	}
}

# Client Config File
data "template_file" "client_config" {
	count = "${length(var.server_hostnames)}"
	template = "${file("${path.module}/client/client.hcl")}"

	vars {
		node_name = "consul-${var.server_domain}-${count.index + 1}"
		server_domain = "${var.server_domain}"
	}
}
