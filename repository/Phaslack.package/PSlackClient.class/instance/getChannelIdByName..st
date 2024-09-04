convenience
getChannelIdByName: channelName
	| channel | 
	channel := self channelList detect:[:v | (v at: 'name' ifAbsent:[ ]) = channelName ] ifNone:[ ^ nil ].
	
	^ channel at: 'id' ifAbsent:[ ].