private
formPost: urlString values: aDictionary by: znClient
	aDictionary keysAndValuesDo: [ :key :value |
		znClient formAt: key put: value.
	].

	znClient url: urlString.
	znClient post.
	^znClient response