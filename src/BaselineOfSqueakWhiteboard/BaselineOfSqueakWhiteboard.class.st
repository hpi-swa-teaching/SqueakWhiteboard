Class {
	#name : #BaselineOfSqueakWhiteboard,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'is 6/2/2024 00:54'
}
BaselineOfSqueakWhiteboard >> baseline: spec [
    <baseline>
    spec
        for: #'common'
        do: [
            spec
                package: 'SqueakWhiteboard-Core';
                package: 'SqueakWhiteboard-Tests' with: [spec requires: #('default')];
                yourself.
            spec
                group: 'default' with: #('SqueakWhiteboard-Core');
                group: 'tests' with: #('SqueakWhiteboard-Tests');
                yourself].
]
