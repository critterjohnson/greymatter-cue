// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// SSLProtocol is a name of a SSL protocol that may be used by a domain.
#SSLProtocol: string // #enumSSLProtocol

#enumSSLProtocol:
	#TLS1 |
	#TLS1_1 |
	#TLS1_2 |
	#TLS1_3

#ListenerSSLConfig: {
	cipher_filter: string @go(CipherFilter)
	protocols: [...#SSLProtocol] @go(Protocols,[]SSLProtocol)
	cert_key_pairs: [...#CertKeyPathPair] @go(CertKeyPairs,[]CertKeyPathPair)
	require_client_certs: bool   @go(RequireClientCerts)
	trust_file:           string @go(TrustFile)
	sni: [...string] @go(SNI,[]string)
	crl: #DataSource @go(CRL)
}

#ClusterSSLConfig: {
	cipher_filter: string @go(CipherFilter)
	protocols: [...#SSLProtocol] @go(Protocols,[]SSLProtocol)
	cert_key_pairs: [...#CertKeyPathPair] @go(CertKeyPairs,[]CertKeyPathPair)
	trust_file: string      @go(TrustFile)
	sni:        string      @go(SNI)
	crl:        #DataSource @go(CRL)
}

// CertKeyPathPair is a container that binds a certificate path to a key path.
// Both of these must be specified.
#CertKeyPathPair: {
	certificate_path: string @go(CertificatePath)
	key_path:         string @go(KeyPath)
}

#TLS1:   #SSLProtocol & "TLSv1"
#TLS1_1: #SSLProtocol & "TLSv1.1"
#TLS1_2: #SSLProtocol & "TLSv1.2"
#TLS1_3: #SSLProtocol & "TLSv1.3"

// DefaultCipherFilter chooses the default set of ciphers that may be used for
// communicating with a domain.
#DefaultCipherFilter: ""

// DataSource is a container that gets converted by gm-control into an envoycore.DataSource
// Only one of its fields will be read; the others will be ignored
#DataSource: {
	filename:      string @go(Filename)
	inline_string: string @go(InlineString)
}
