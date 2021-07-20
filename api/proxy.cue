package api

import "github.com/greymatter-io/gm-control/control-api/api"

#Proxy: api.#Proxy & {
	#object_type: "proxy"
	upgrades:     *"" | string
}
