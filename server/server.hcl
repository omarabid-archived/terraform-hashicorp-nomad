# /etc/nomad.d/server.hcl

data_dir = "/etc/nomad.d"

server {
	enabled          = true
	bootstrap_expect = 1
}
