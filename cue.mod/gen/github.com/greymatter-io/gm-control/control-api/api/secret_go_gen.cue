// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// Secrets is a slice of Secret objects
#Secrets: [...#Secret]

// SecretKey is a unique identifier per a secret
#SecretKey: string

// A Secret is a named list of secrets that can map to clusters
#Secret: {
	secret_key:             #SecretKey @go(SecretKey)
	secret_name:            string     @go(Name)
	secret_validation_name: string     @go(ValidationName)
	subject_names: [...string] @go(Subjects,[]string)
	ecdh_curves: [...string] @go(ECDHCurves,[]string)
	forward_client_cert_details?:     string              @go(ForwardClientCertDetails)
	set_current_client_cert_details?: _#clientCertDetails @go(SetCurrentClientCertDetails)
	Checksum:                         #Checksum
}

_#clientCertDetails: {
	uri: bool @go(URI)
}
