http client
post: entryPoint withValues: aDictionary
	| urlStr client res |
	urlStr := self entryPointUrlFrom: entryPoint.
	
	client := self httpClient.

	(self shouldUseFormData: entryPoint)
		ifTrue: [
			res := self formPost: urlStr values: aDictionary by: client.
		]
		ifFalse: [
			res := self jsonPost: urlStr values: aDictionary by: client.
		].

"	res isError ifTrue: [ self handleApiException: res ]."
	^ PSlackResponse from: res.
