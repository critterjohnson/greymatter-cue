package api

import "github.com/greymatter-io/gm-control/control-api/api"

#Secret: api.#Secret & {
	Checksum:     #Checksum
	#object_type: "secret"
}
