// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

#DomainKey: string

// DomainCharSet is a description of the format which must be used for the
// core (non wildcard portion) of a domain alais.
#DomainOnlyPattern: "[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*"

// AliasPatternFailure is the message returned if a domain alias does not
// meet DomainAliasPattern.
#AliasPatternFailure: "aliases may start with '*.' or end with '.*'. They must be composed of characters matching [a-zA-Z_.-]"

// A Domain represents the TLD or subdomain under which which a set of Routes is served.
#Domain: {
	domain_key:    #DomainKey                @go(DomainKey)
	zone_key:      #ZoneKey                  @go(ZoneKey)
	name:          string                    @go(Name)
	port:          int                       @go(Port)
	ssl_config?:   null | #ListenerSSLConfig @go(SSLConfig,*ListenerSSLConfig)
	redirects?:    #Redirects                @go(Redirects)
	gzip_enabled?: bool                      @go(GzipEnabled)
	cors_config?:  null | #CorsConfig        @go(CorsConfig,*CorsConfig)
	aliases?:      #DomainAliases            @go(Aliases)
	force_https:   bool                      @go(ForceHTTPS)
	custom_headers: [...null | #Header] @go(CustomHeaders,[]*Header)
	Checksum: #Checksum
}

#DomainAliases: [...#DomainAlias]

#DomainAlias: string

#Domains: [...#Domain]

// CorsConfig describes how the domain should respond to OPTIONS requests.
// For a detailed discussion of what each attribute means see
// https://developer.mozilla.org/docs/Web/HTTP/Access_control_CORS.
// For an even simpler flowchart of how things work see
// https://www.html5rocks.com/static/images/cors_server_flowchart.png
#CorsConfig: {
	allowed_origins: [...null | #AllowOriginStringMatchItem] @go(AllowedOrigins,[]*AllowOriginStringMatchItem)
	allow_credentials: bool @go(AllowCredentials)
	exposed_headers: [...string] @go(ExposedHeaders,[]string)
	max_age: int @go(MaxAge)
	allowed_methods: [...string] @go(AllowedMethods,[]string)
	allowed_headers: [...string] @go(AllowedHeaders,[]string)
}

#AllowOriginStringMatchType: string // #enumAllowOriginStringMatchType

#enumAllowOriginStringMatchType:
	#StringMatchTypeExact |
	#StringMatchTypePrefix |
	#StringMatchTypeRegex |
	#StringMatchTypeSuffix

#StringMatchTypeExact:  #AllowOriginStringMatchType & "exact"
#StringMatchTypePrefix: #AllowOriginStringMatchType & "prefix"
#StringMatchTypeRegex:  #AllowOriginStringMatchType & "regex"
#StringMatchTypeSuffix: #AllowOriginStringMatchType & "suffix"

#AllowOriginStringMatchItem: {
	match_type: #AllowOriginStringMatchType @go(MatchType)
	value:      string                      @go(Value)
}

#Header: {
	key:   string @go(Key)
	value: string @go(Value)
}
