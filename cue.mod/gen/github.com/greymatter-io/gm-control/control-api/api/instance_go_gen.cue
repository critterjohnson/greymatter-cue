// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// HostPatternString represents the pattern that an Instance hostanme must
// match.
#HostPatternString: "^[a-zA-Z0-9_.-]+$"

// HostPatternMatchFailure is the error message returned when in invalid name
// is provided.
#HostPatternMatchFailure: "host must match ^[a-zA-Z0-9_.-]+$"

// Instances is a slice of Instance
#Instances: [...#Instance]

// An Instance is a hostname/port pair with Metadata
#Instance: {
	host:     string    @go(Host)
	port:     int       @go(Port)
	metadata: #Metadata @go(Metadata)
}

// InstancesByHostPort sorts Instances by Host and Port.
// Eg: sort.Sort(InstancesByHostPort(instances))
#InstancesByHostPort: #Instances
