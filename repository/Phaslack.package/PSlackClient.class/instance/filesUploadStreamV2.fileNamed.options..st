api-files
filesUploadStreamV2: stream fileNamed: fileName options: options
	| urlRes |
	urlRes := self
		filesGetUploadURLExternalStream: stream
		fileNamed: fileName
		options: options.
	(urlRes values at: 'ok' ifAbsent: [ false ])
		ifTrue: [ | client anEntity streamingEntity |
			client := self httpClient.
			anEntity := client multiPartFormDataEntity. 
			streamingEntity := (ZnStreamingEntity type: (ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: fileName)) length: stream size) 
								stream: stream.
	
			anEntity addPart: (ZnMimePart fieldName: 'file' fileName: fileName entity: streamingEntity).
			client addPart: (ZnMimePart fieldName: 'filename' value: fileName).
			client addPart: (ZnMimePart fieldName: 'content_type' value: (ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: fileName)) asString).
			client url: (urlRes values at: 'upload_url').
			client post.
			(client response statusLine code == 200)
				ifTrue: [
					^ self
						filesCompleteUploadExternal: (urlRes values at: 'file_id')
						fileNamed: fileName
						options: options
				]
				ifFalse: [
					^ false.
				]
		]
		ifFalse: [
			^ false.
		].
