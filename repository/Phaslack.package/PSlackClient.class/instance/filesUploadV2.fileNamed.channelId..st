api-files
filesUploadV2: filePath fileNamed: fileName channelId: channelId
	| options |
	options := Dictionary new
					at: 'channel_id' put: channelId;
					yourself.
	
	^ self 
		filesUploadV2: filePath 
		fileNamed: fileName 
		options: options