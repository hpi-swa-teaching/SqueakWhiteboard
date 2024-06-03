Class {
	#name : #WBPopUpButton,
	#superclass : #WBButton,
	#instVars : [
		'element'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:01'
}
WBPopUpButton >> frame [

	^element
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JK 6/3/2024 19:02'
}
WBPopUpButton >> frame: anElement [

	element := anElement
]
