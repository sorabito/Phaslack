accessing
channelList
	channelList ifNil: [ channelList := self retrieveChannelList ].
	^ channelList