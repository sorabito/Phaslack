api-files
filesUploadContentV2: content fileNamed: fileName channelId: channelId
	| options |
	options := Dictionary new
					at: 'channel_id' put: channelId;
					yourself.
	
	^ self 
		filesUploadContentV2: content 
		fileNamed: fileName 
		options: options