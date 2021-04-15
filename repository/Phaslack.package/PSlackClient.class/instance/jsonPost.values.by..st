private
jsonPost: urlString values: aDictionary by: znClient
	| jsonString |
	jsonString := NeoJSONWriter toString: aDictionary.

	znClient headerAt: 'Authorization' put: 'Bearer ', self token.
	znClient accept: 'application/json'.
	znClient contentWriter: [:o | (ZnEntity with: o) contentType: 'application/json; charset=utf-8'].
	znClient post: urlString contents: jsonString.
	^znClient response