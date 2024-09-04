convenience
retrieveChannelList
	| channels nextCursor |
	channels := OrderedCollection new.
	nextCursor := ''.
	[ | options res responseMetadata |
		options := Dictionary new
			at: 'exclude_archived' put: 'true';
			at: 'types' put: 'public_channel,private_channel,mpim,im';
			at: 'limit' put: '1000';
			yourself.
		(nextCursor = '') ifFalse: [ options at: 'cursor' put: nextCursor ].
		res := (self conversationsListOptions: options) values.
		(res at: 'ok' ifAbsent: [ false ])
			ifTrue: [
				(res at: 'channels' ifAbsent: [ OrderedCollection new ]) do: [ :channel |
					channels add: channel.
				].
			].
		responseMetadata := res at: 'response_metadata' ifAbsent: [ Dictionary new ].
		nextCursor := responseMetadata at: 'next_cursor' ifAbsent: [ '' ].
		nextCursor ~= ''
	] whileTrue.

	^ channels