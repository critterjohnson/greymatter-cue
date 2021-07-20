package api

import "github.com/greymatter-io/gm-control/control-api/api"

#Listener: api.#Listener & {
	request_timeout: *"" | string
	#object_type:    "listener"
}
