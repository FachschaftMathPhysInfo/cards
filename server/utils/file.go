package utils

import (
	"github.com/99designs/gqlgen/graphql"
)

func IsValidFileType(file *graphql.Upload) bool {
	// Header of .apkg and .colpkg files
	magic := []byte{0x50, 0x4B, 0x3, 0x4}

	header := make([]byte, len(magic))
	if _, err := file.File.Read(header); err != nil {
		return false
	}

	for i := range magic {
		if header[i] != magic[i] {
			return false
		}
	}

	// Seek back to the beginning of the file
	if _, err := file.File.Seek(0, 0); err != nil {
		return false
	}

	return true
}
