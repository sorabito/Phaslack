api-files
filesGetUploadURLExternalStream: stream fileNamed: fileName
	^ self
		filesGetUploadURLExternalStream: stream
		fileNamed: fileName 
		options: Dictionary new