http client
post: entryPoint withValues: aDictionary
	| urlStr client res |
	urlStr := self entryPointUrlFrom: entryPoint.
	
	client := self httpClient.

	res := (self shouldUseFormData: entryPoint)
				ifTrue: [ self formPost: urlStr values: aDictionary by: client ]
				ifFalse: [ self jsonPost: urlStr values: aDictionary by: client ].

"	res isError ifTrue: [ self handleApiException: res ]."
	^ PSlackResponse from: res.
