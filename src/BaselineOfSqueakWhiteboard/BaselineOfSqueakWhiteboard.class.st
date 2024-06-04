Class {
	#name : #BaselineOfSqueakWhiteboard,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'is 6/4/2024 16:54'
}
BaselineOfSqueakWhiteboard >> baseline: spec [
    <baseline>
    spec
        for: #'common'
        do: [
		spec
			baseline: 'Squot' with: [
				spec repository: 'github://hpi-swa/Squot:mapper/src'. ].
            spec
                package: 'SqueakWhiteboard-Core' with: [spec requires: #('Squot'); postLoadDoIt: #postLoad];
                package: 'SqueakWhiteboard-Tests' with: [spec requires: #('default')];
                yourself.
            spec
                group: 'default' with: #('SqueakWhiteboard-Core');
                group: 'tests' with: #('SqueakWhiteboard-Tests');
                yourself].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'is 6/4/2024 16:54'
}
BaselineOfSqueakWhiteboard >> postLoad [

	
]
