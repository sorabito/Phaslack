baseline
baseline: spec

	<baseline>
	spec for: #( #'pharo12.x' ) do: [
		spec
			baseline: 'NeoJSON'
			with: [ spec repository: 'github://svenvc/NeoJSON:v18/repository' ].

		spec baseline: 'ZincHTTPComponents' with: [
			spec
				repository:
					'github://svenvc/zinc:a340624b238ca7aee0722033bbf64ea42c7e6fd2/repository';
				loads: #( 'WebSocket' ) ].
		spec package: 'Phaslack' ].
	spec for: #( #'pharo11.x' #'pharo10.x' #'pharo9.x' #'pharo8.x' #'pharo7.x') do: [
		spec
			package: 'Neo-JSON-Core'
			with: [ spec repository: 'http://mc.stfx.eu/Neo' ].

		spec
			package: 'Zinc-WebSocket-Core'
			with: [ spec repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].

		spec package: 'Phaslack' ]