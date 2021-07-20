package main

import "github.com/critterjohnson/critter-rnd/greymatter_cue/api"

#edge_secret: api.#Secret & {
	"secret_key":             "\( #name ).identity"
	"secret_name":            "spiffe://quickstart.greymatter.io/\( #name)"
	"secret_validation_name": "spiffe://quickstart.greymatter.io"
	"subject_names": [
		"spiffe://quickstart.greymatter.io/edge",
	]
	"ecdh_curves": [
		"X25519:P-256:P-521:P-384",
	]
	...
}
