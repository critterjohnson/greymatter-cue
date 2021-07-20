// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

#ListenerProtocol: string // #enumListenerProtocol

#enumListenerProtocol:
	#HttpListenerProtocol |
	#Http2ListenerProtocol |
	#HttpAutoListenerProtocol |
	#TCPListenerProtocol

#HttpListenerProtocol:     #ListenerProtocol & "http"
#Http2ListenerProtocol:    #ListenerProtocol & "http2"
#HttpAutoListenerProtocol: #ListenerProtocol & "http_auto"
#TCPListenerProtocol:      #ListenerProtocol & "tcp"

// FileAccessLog represents configuration for an Envoy File Access Logger.
// Only one of Format, JSONFormat, or TypedJSONFormat should be set.
// If multiple formats are set, preference goes: Format, JSONFormat, TypedJSONFormat.
#FileAccessLog: {
	path:              string               @go(Path)
	format:            string               @go(Format)
	json_format:       #AccessLogFormatDict @go(JSONFormat)
	typed_json_format: #AccessLogFormatDict @go(TypedJSONFormat)
}

#AccessLogFormatDict: [string]: string

// HTTPGRPCAccessLog represents configuration for an Envoy HTTP GPRC Access Logger.
#HTTPGRPCAccessLog: {
	common_config: #GRPCCommonConfig @go(CommonConfig)
	additional_request_headers_to_log: [...string] @go(AdditionalRequestHeaders,[]string)
	additional_response_headers_to_log: [...string] @go(AdditionalResponseHeaders,[]string)
	additional_response_trailers_to_log: [...string] @go(AdditionalResponseTrailers,[]string)
}

#GRPCCommonConfig: {
	log_name:     string       @go(LogName)
	grpc_service: #GRPCService @go(GRPCService)
}

#GRPCService: {
	cluster_name: string @go(ClusterName)
}

#ListenerKey: string

#Loggers: {
	disabled: bool @go(Disabled)
	file_loggers: [...#FileAccessLog] @go(FileLoggers,[]FileAccessLog)
	http_grpc_access_loggers: [...#HTTPGRPCAccessLog] @go(HTTPGRPCAccessLoggers,[]HTTPGRPCAccessLog)
}

#AccessLoggers: {
	http_connection_loggers: #Loggers @go(HTTPConnectionLoggers)
	http_upstream_loggers:   #Loggers @go(HTTPUpstreamLoggers)
}

#HeaderKeyFormat: {
	proper_case_words: bool @go(ProperCaseWords)
}

//Additional options when handling HTTP1 requests.
#HTTPProtocolOptions: {
	allow_absolute_url:       bool             @go(AllowAbsoluteURL)
	accept_http_10:           bool             @go(AcceptHTTP10)
	default_host_for_http_10: string           @go(DefaultHostForHTTP10)
	header_key_format:        #HeaderKeyFormat @go(HeaderKeyFormat)
	enable_trailers:          bool             @go(EnableTrailers)
}

// Even if default HTTP2 protocol options are desired,
// this field must be set so that Envoy will assume that the upstream supports HTTP/2 when making new HTTP connection pool connections.
// Currently, Envoy only supports prior knowledge for upstream connections.
// Even if TLS is used with ALPN, http2_protocol_options must be specified.
// As an aside this allows HTTP/2 connections to happen over plain text.
#HTTP2ProtocolOptions: {
	hpack_table_size?:                                     null | uint32 @go(HpackTableSize,*uint32)
	max_concurrent_streams?:                               null | uint32 @go(MaxConcurrentStreams,*uint32)
	initial_stream_window_size?:                           null | uint32 @go(InitialStreamWindowSize,*uint32)
	initial_connection_window_size?:                       null | uint32 @go(InitialConnectionWindowSize,*uint32)
	allow_connect:                                         bool          @go(AllowConnect)
	max_outbound_frames?:                                  null | uint32 @go(MaxOutboundFrames,*uint32)
	max_outbound_control_frames?:                          null | uint32 @go(MaxOutboundControlFrames,*uint32)
	max_consecutive_inbound_frames_with_empty_payload?:    null | uint32 @go(MaxConsecutiveInboundFramesWithEmptyPayload,*uint32)
	max_inbound_priority_frames_per_stream?:               null | uint32 @go(MaxInboundPriorityFramesPerStream,*uint32)
	max_inbound_window_update_frames_per_data_frame_sent?: null | uint32 @go(MaxInboundWindowUpdateFramesPerDataFrameSent,*uint32)
	stream_error_on_invalid_http_messaging:                bool          @go(StreamErrorOnInvalidHTTPMessaging)
}

// A Listener represents a port Envoy will listen on
#Listener: {
	listener_key: #ListenerKey @go(ListenerKey)
	zone_key:     #ZoneKey     @go(ZoneKey)
	name:         string       @go(Name)
	active_network_filters: [...#Filter] @go(ActiveNetworkFilters,[]Filter)
	network_filters: {...} @go(NetworkFilters,map[Filter]json.RawMessage)
	active_http_filters: [...#Filter] @go(ActiveHttpFilters,[]Filter)
	http_filters: {...} @go(HttpFilters,map[Filter]json.RawMessage)
	ip:        string            @go(IP)
	port:      int               @go(Port)
	protocol?: #ListenerProtocol @go(Protocol)
	domain_keys: [...#DomainKey] @go(DomainKeys,[]DomainKey)
	tracing_config?:         null | #TracingConfig        @go(TracingConfig,*TracingConfig)
	secret?:                 #Secret                      @go(Secret)
	access_loggers?:         #AccessLoggers               @go(AccessLoggers)
	use_remote_address?:     bool                         @go(UseRemoteAddress)
	http_protocol_options?:  null | #HTTPProtocolOptions  @go(HttpProtocolOptions,*HTTPProtocolOptions)
	http2_protocol_options?: null | #HTTP2ProtocolOptions @go(Http2ProtocolOptions,*HTTP2ProtocolOptions)
	stream_idle_timeout?:    string                       @go(StreamIdleTimeout)
	request_timeout:         string                       @go(RequestTimeout)
	drain_timeout?:          string                       @go(DrainTimeout)
	delayed_close_timeout?:  string                       @go(DelayedCloseTimeout)
	Checksum:                #Checksum
}

#Listeners: [...#Listener]
