http client
post: entryPoint withValues: aDictionary
	| urlStr client res |
	urlStr := self entryPointUrlFrom: entryPoint.
	
	client := self httpClient.

	(self isFilesUpload: entryPoint)
		ifTrue: [
			aDictionary keysAndValuesDo: [ :key :value |
				client formAt: key put: value.
			].
			res := self formPost: urlStr by: client.
		]
		ifFalse: [
			| jsonString |
			jsonString := NeoJSONWriter toString: aDictionary.
			res := self jsonPost: urlStr content: jsonString by: client.
		].

"	res isError ifTrue: [ self handleApiException: res ]."
	^ PSlackResponse from: res.
