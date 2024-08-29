api-files
filesUploadV2: filePath fileNamed: fileName options: options
	^ self
		filesUploadStreamV2: filePath asFileReference binaryReadStream
		fileNamed: fileName
		options: options