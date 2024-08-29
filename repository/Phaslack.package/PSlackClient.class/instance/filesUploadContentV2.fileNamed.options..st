api-files
filesUploadContentV2: content fileNamed: fileName options: options
	^ self
		filesUploadStreamV2: content readStream
		fileNamed: fileName
		options: options.