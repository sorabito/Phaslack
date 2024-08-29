api-files-deprecated
filesUpload: filePath fileNamed: fileName
	^ self 
		filesUpload: filePath 
		fileNamed: fileName 
		options: Dictionary new