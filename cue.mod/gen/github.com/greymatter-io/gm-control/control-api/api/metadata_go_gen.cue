// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/greymatter-io/gm-control/control-api/api

package api

// Metadata is a vector of Metadatums.
#Metadata: [...#Metadatum]

// A Metadatum a key/value pair.
#Metadatum: {
	key:   string @go(Key)
	value: string @go(Value)
}

// MetadataByKey implements sort.Interface to allow sorting of Metadata by
// Metadatum Key. Eg: sort.Sort(MetadataByKey(metadata))
#MetadataByKey: #Metadata
