package main

import "github.com/critterjohnson/critter-rnd/greymatter_cue/api"

output: {
	listener: api.#Listener & #defaults & {
		name:         "ingress"
		listener_key: "\( #name )-listener"
		ip:           "0.0.0.0"
		port:         #port
		domain_keys: [#domain_key]
		protocol: "http_auto"
		secret:   #edge_secret
	}

	domain: api.#Domain & #defaults & {
		domain_key:  #domain_key
		name:        "*"
		port:        #port
		force_https: true
	}

	proxy: api.#Proxy & #defaults & {
		name:      #name
		proxy_key: "\( #name )-proxy"
	}

	edge_route: api.#Route & #defaults & {
		domain_key:       "edge"
		route_key:        "edge-to-\( #name )-route"
		path:             "/services/\( #name )"
		prefix_rewrite:   "/"
		shared_rules_key: output.edge_rules.shared_rules_key
	}

	edge_route_slash: api.#Route & #defaults & {
		domain_key:       "edge"
		route_key:        "edge-to-\( #name )-route-slash"
		path:             "/services/\( #name )/"
		prefix_rewrite:   "/"
		shared_rules_key: output.edge_rules.shared_rules_key
	}

	edge_rules: api.#SharedRules & #defaults & {
		shared_rules_key: "edge-to-\( #name )-rules"
		name:             "edge-to-\( #name )"
		default:          #constraints & {_cluster_key: output.edge_cluster.cluster_key}
	}

	local_route: api.#Route & #defaults & {
		domain_key:       #domain_key
		route_key:        "\( #name )-local-route"
		path:             "/"
		prefix_rewrite:   ""
		shared_rules_key: output.local_rules.shared_rules_key
	}

	local_rules: api.#SharedRules & #defaults & {
		shared_rules_key: "\( #name )-local-rules"
		name:             "local"
		default:          #constraints & {_cluster_key: output.local_cluster.cluster_key}
	}

	edge_cluster: api.#Cluster & #defaults & {
		name:        #name
		cluster_key: "edge-to-\( #name )-cluster"
	}

	local_cluster: api.#Cluster & #defaults & {
		name:        "local"
		cluster_key: "\( #name )-cluster"
	}
}
