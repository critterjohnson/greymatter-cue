package main

import (
	//"encoding/json"
	"tool/exec"
	//"tool/file"
)

var: {
	folder:    *"out" | string @tag(out)
	overwrite: *true | bool    @tag(overwrite,type=bool)
}

command: build: {
	rm_out: {
		if var.overwrite {
			rm_out: exec.Run & {
				cmd: ["rm", "-rfv", var.folder]
			}
		}
	}

	mkdir_sub_dirs: {
		for i, object_type in ["domains", "clusters", "listeners", "proxies", "routes", "shared_rules"] {
			"mkdir_out_\( object_type )": exec.Run & {
				cmd: ["mkdir", "-p", "\( var.folder )/\( object_type )"]
				stdout: string
				$after: rm_out
			}
		}
		$after: rm_out
	}

	//for k, v in output {
	//"write_\( k )": file.Create & {
	//filename: string | *"\( var.folder )/\( v.#object_type )s/\( k ).json"
	//if v.#object_type == "proxy" {
	//filename: "\( var.folder )/proxies/\( k ).json"
	//}
	//contents: json.Marshal(v)
	//}
	//}
}
