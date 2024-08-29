api-files
filesCompleteUploadExternal: fileId fileNamed: fileName options: options
	| values res |
	values := options copy
						at: 'token' put: self token;
						at: 'files' put: {
							{
								'id' -> fileId.
								'title' -> fileName.
							} asDictionary 
						} asOrderedCollection ;
						at: 'initial_comment' put: fileName;
						yourself.
						
	res := self post: 'files.completeUploadExternal' withValues: values.
	^ res