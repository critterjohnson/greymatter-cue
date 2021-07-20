// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

#RedirectType: string // #enumRedirectType

#enumRedirectType:
	#PermanentRedirect |
	#TemporaryRedirect

// PermanentRedirect will be handled by returned a HTTP response code 301
// with the new URL that should be retrieved.
#PermanentRedirect: #RedirectType & "permanent"

// TemporaryRedirect will be handled by returned a HTTP response code 302
// with the new URL that should be retrieved.
#TemporaryRedirect: #RedirectType & "temporary"

// Redirects is a collection of Domain redirect definitions
#Redirects: [...#Redirect]

// Redirect specifies how URLs within this domain may need to be rewritten.
// Each Redirect has a name, a regex that matches the requested URL, a to
// indicating how the url should be rewritten, and a flag to indicate how the
// redirect will be handled by the proxying layer.
//
// From may include capture groups which may be referenced by "$<group number>".
//
//   Example:
//     Redirect{
//       Name:              "force-https",
//       From:              "(.*)",
//       To:                "https://$host$1",
//       RedirectType:      PermanentRedirect,
//       HeaderConstraints: HeaderConstraints{
//         HeaderConstraint{
//           Name:  "X-Forwarded-Proto",
//           Value: "https",
//           Invert: true,
//         },
//       },
//     }
#Redirect: {
	name:               string             @go(Name)
	from:               string             @go(From)
	to:                 string             @go(To)
	redirect_type:      #RedirectType      @go(RedirectType)
	header_constraints: #HeaderConstraints @go(HeaderConstraints)
}

#HeaderConstraints: [...#HeaderConstraint]

// HeaderConstraint specifies requirements of request header for a redirect
// directive. Name must match the HeaderNamePattern regex and Value must be a
// valid regex.
//
// CaseSensitive means that the header's value will be compared to Value without
// taking case into account; header name is always compared to Name without case
// sensitivity.
#HeaderConstraint: {
	name:           string @go(Name)
	value:          string @go(Value)
	case_sensitive: bool   @go(CaseSensitive)
	invert:         bool   @go(Invert)
}