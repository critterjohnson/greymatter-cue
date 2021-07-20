package main

import "github.com/critterjohnson/critter-rnd/greymatter_cue/api"

#defaults: {
	zone_key: "zone-default-zone"
	Checksum: api.#Checksum
	...
}

#name:       *"fibonacci" | string @tag(name)
#domain_key: "\( #name )-domain"
#port:       *10808 | >=1 & <=65535 @tag(port,type=int)

#constraints: {
	_cluster_key: string
	light: [
		{
			constraint_key: ""
			cluster_key:    _cluster_key
			response_data: {}
			weight: 1
			properties: []
		},
	]
	...
}
