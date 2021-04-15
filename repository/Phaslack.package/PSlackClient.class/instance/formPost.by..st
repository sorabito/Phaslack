private
formPost: urlString by: znClient
	znClient url: urlString.
	znClient post.
	^znClient response