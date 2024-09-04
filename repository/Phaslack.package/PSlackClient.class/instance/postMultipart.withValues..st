http client
postMultipart: entryPoint withValues: aDictionary
	| urlStr client res anEntity |
	urlStr := self entryPointUrlFrom: entryPoint.
	
	client := self httpClient.

	anEntity := client multiPartFormDataEntity. 
	client headerAt: 'Authorization' put: 'Bearer ', self token.
	
	aDictionary keysAndValuesDo: [ :key :value |
		client addPart: (ZnMimePart fieldName: key value: value)
	].
		
	res := client
				url: urlStr asUrl;
				post;
				response.
"	res isError ifTrue: [ self handleApiException: res ]."
	^ PSlackResponse from: res.
