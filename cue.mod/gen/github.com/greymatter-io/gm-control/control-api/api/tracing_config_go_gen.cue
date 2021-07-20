// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// TracingConfig describes how tracing operations should be applied
// to the given Listener.
#TracingConfig: {
	// Ingress, when true, specifies that this listener is handling requests from a downstream.
	// When false it indicates that it is handling requests bound to an upstream.
	ingress: bool @go(Ingress)

	// Each listed header will be added to generated spans as an annotation
	request_headers_for_tags: [...string] @go(RequestHeadersForTags,[]string)
}