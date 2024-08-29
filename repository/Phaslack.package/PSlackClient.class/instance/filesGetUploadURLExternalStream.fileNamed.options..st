api-files
filesGetUploadURLExternalStream: stream fileNamed: fileName options: options
	| values res |
	values := options copy
						at: 'token' put: self token;
						at: 'filename' put: fileName;
						at: 'length' put: stream size asString;
						yourself.
	res := self postMultipart: 'files.getUploadURLExternal' withValues: values.
	^ res