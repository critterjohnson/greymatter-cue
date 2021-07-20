// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// ResponseData is a collection of annotations that should be applied to
// responses when handling a request.
#ResponseData: {
	// Headers are HTTP headers that will be attached to a response.
	headers?: [...#HeaderDatum] @go(Headers,[]HeaderDatum)

	// Cookies are attached via 'Set-Cookie' header.
	cookies?: [...#CookieDatum] @go(Cookies,[]CookieDatum)
}

// ResponseDatum represents the set of information necessary to determine
// how to name and produce the value that should be attached to a response
// and under what conditions the data should be sent back.
#ResponseDatum: {
	// Name of the data being sent back to the requesting client.
	name: string @go(Name)

	// Value is either a literal value or a reference to metadatum on the server
	// that handles a request.
	value: string @go(Value)

	// ValueIsLiteral, if set, means that Value will be treated as a literal
	// instead of a reference to be resolved as the key of a metadatum set on
	// the server handling a request.
	value_is_literal?: bool @go(ValueIsLiteral)
}

// HeaderDatum represents a header that should be attached to a response to
// some requset served by the object containing a ResponseData config. Some
// points to note are that HeaderDatum are not case sensitive with respect to
// their Name value which impacts equality checks.
#HeaderDatum: {
	ResponseDatum: #ResponseDatum
}

// SameSiteType allows specification for the 'SameSite' annotation on a cookie
// response. This allows some control over when the cookie is sent to a server
// see https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie for
// details.
#SameSiteType: string // #enumSameSiteType

#enumSameSiteType:
	#SameSiteUnset |
	#SameSiteStrict |
	#SameSiteLax

// SameSiteUnset represents the default value and will not impact the cookie
// annotation set.
#SameSiteUnset: #SameSiteType & ""

// SameSiteStrict causes 'SameSite=Strict' to be passed back with a cookie.
#SameSiteStrict: #SameSiteType & "Strict"

// SameSiteLax causes 'SameSite=Lax' to be passed back with a cookie.
#SameSiteLax: #SameSiteType & "Lax"

// CookieDatum represents a cookie that should be attached to the response to
// some requset served by the object containing a ResponseData config. A
// CookieDatum's Name is case sensitive.
#CookieDatum: {
	ResponseDatum: #ResponseDatum

	// ExpiresInSec indicates how long a cookie will be valid (in seconds) or
	// indicates that a cookie should be expired if set to 0. Specifically for
	// values > 0 this becomes a 'Max-Age' cookie annotation and for 0 'Expires'
	// is set to the unix epoch, UTC.
	expires_in_sec?: null | uint @go(ExpiresInSec,*uint)

	// Domain specifies hosts to which the cookie will be sent.
	domain: string @go(Domain)

	// Path indicates a URL path that must be met in a requset for the cookie to
	// be sent to the server.
	path: string @go(Path)

	// Secure will only be sent to a server when a request is made via HTTPS.
	secure: bool @go(Secure)

	// HttpOnly cookies are not available via javascript throught Document.cookie.
	http_only: bool @go(HttpOnly)

	// SameSiteType specifies how a cookie should be treated when a request is being
	// made across site boundaries (e.g. from another domain, used to help protect
	// against CSRF).
	same_site: #SameSiteType @go(SameSite)
}
