// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

#Routes: [...#Route]

#RouteKey: string

#MatchType: string // #enumMatchType

#enumMatchType:
	#Prefix |
	#Exact |
	#Regex

// Prefix - The prefix must match the beginning of the :path header.
#Prefix: #MatchType & "prefix"

// Exact - The path must exactly match the :path header once the query string is removed.
#Exact: #MatchType & "exact"

// Regex -  The regex must match the :path header once the query string is removed. The entire path (without the query string) must match the regex. The rule will not match if only a subsequence of the :path header matches the regex.
#Regex: #MatchType & "regex"

#RouteMatch: {
	path:       string     @go(Path)
	match_type: #MatchType @go(MatchType)
}

// A Route defines a mapping from a request to a pool of Instances.
// The left side of the mapping is defined by a Zone, a Domain, a Path,
// and a vector of Rules.
//
// If none of the Rules applies to a given request, the Default
// AllConstraints are used; these define a default weighted set of
// Constraints. The weights determine the likelihood that one Constraint
// will be used over another.
//
// If one or more Rules applies, the order of the rules informs which is
// tried first. If a Rule fails to produce an Instance, the next applicable
// Rule is tried.
//
// It is possible to set a cohort seed on a SharedRules, Route, or Rule object.
// Only one of these will apply to any given request. Route is a subset of
// SharedRules and not as specific as a Rule so a seed specified by the Route
// will override one inherited from a SharedRules but not one specified in a
// Rule (regardless of the Rule source).
//
// See CohortSeed docs for additional details of what a cohort seed does.
#Route: {
	route_key:  #RouteKey  @go(RouteKey)
	domain_key: #DomainKey @go(DomainKey)
	zone_key:   #ZoneKey   @go(ZoneKey)

	// Deprecated: Path exists for historical compatibility
	// and should not be used. Use RouteMatch instead.
	path:             string              @go(Path)
	route_match:      #RouteMatch         @go(RouteMatch)
	prefix_rewrite:   string              @go(PrefixRewrite)
	redirects:        #Redirects          @go(Redirects)
	shared_rules_key: #SharedRulesKey     @go(SharedRulesKey)
	rules:            #Rules              @go(Rules)
	response_data?:   #ResponseData       @go(ResponseData)
	cohort_seed?:     null | #CohortSeed  @go(CohortSeed,*CohortSeed)
	retry_policy?:    null | #RetryPolicy @go(RetryPolicy,*RetryPolicy)
	high_priority?:   bool                @go(HighPriority)
	filter_metadata?: {[string]: #Metadata} @go(FilterMetadata,map[string]Metadata)
	filter_configs?: {...} @go(FilterConfigs,map[string]json.RawMessage)
	timeout:       string @go(Timeout)
	idle_timeout?: string @go(IdleTimeout)
	request_headers_to_add?: [...null | #Header] @go(RequestHeadersToAdd,[]*Header)
	request_headers_to_remove?: [...string] @go(RequestHeadersToRemove,[]string)
	response_headers_to_add?: [...null | #Header] @go(ResponseHeadersToAdd,[]*Header)
	response_headers_to_remove?: [...string] @go(ResponseHeadersToRemove,[]string)
	Checksum: #Checksum
}
