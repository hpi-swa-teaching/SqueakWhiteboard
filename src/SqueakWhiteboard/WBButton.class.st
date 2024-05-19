"
The WBButton is the parent class of all button versions
"
Class {
	#name : #WBButton,
	#superclass : #Morph,
	#instVars : [
		'margin'
	],
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/18/2024 17:13'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 12:57'
}
WBButton >> initialize [

	^ super initialize
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 11:26'
}
WBButton >> margin [

	^ margin
]

{
	#category : #layout,
	#'squeak_changestamp' : 'is 5/19/2024 11:26'
}
WBButton >> margin: aMargin [

	^ margin := aMargin
]
