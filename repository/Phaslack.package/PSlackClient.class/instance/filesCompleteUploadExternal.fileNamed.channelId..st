api-files
filesCompleteUploadExternal: fileId fileNamed: fileName channelId: channelId
	| options |
	options := Dictionary new
					at: 'channel_id' put: channelId;
					yourself.
	
	^ self 
		filesCompleteUploadExternal: fileId 
		fileNamed: fileName 
		options: options