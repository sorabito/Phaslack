api-files
filesUploadStreamV2: stream fileNamed: fileName channelId: channelId
	| options |
	options := Dictionary new
					at: 'channel_id' put: channelId;
					yourself.
	
	^ self 
		filesUploadStreamV2: stream 
		fileNamed: fileName 
		options: options