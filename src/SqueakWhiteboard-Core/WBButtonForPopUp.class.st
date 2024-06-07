Class {
	#name : #WBButtonForPopUp,
	#superclass : #WBButton,
	#instVars : [
		'popUp'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #deactivate,
	#'squeak_changestamp' : 'si 6/7/2024 22:23'
}
WBButtonForPopUp >> deactivateElement [

	self popUp: nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 22:14'
}
WBButtonForPopUp >> popUp [

	^popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/7/2024 22:24'
}
WBButtonForPopUp >> popUp: aPopUp [

	popUp := aPopUp
]
