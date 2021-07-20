package api

import "github.com/greymatter-io/gm-control/control-api/api"

#Route: api.#Route & {
	route_match: api.#RouteMatch & {
		match_type: *"" | "prefix" | "exact" | "regex"
		path:       *"" | string
	}
	timeout:      *"" | string
	#object_type: "route"
}
