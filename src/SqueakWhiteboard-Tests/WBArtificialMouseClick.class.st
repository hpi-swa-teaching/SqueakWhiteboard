Class {
	#name : #WBArtificialMouseClick,
	#superclass : #Object,
	#instVars : [
		'clickedPosition'
	],
	#category : #'SqueakWhiteboard-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 23:56'
}
WBArtificialMouseClick >> clickedPosition [

	^clickedPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 23:56'
}
WBArtificialMouseClick >> clickedPosition: aPoint [

	clickedPosition := aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 23:57'
}
WBArtificialMouseClick >> cursorPoint [

	^self clickedPosition
]
