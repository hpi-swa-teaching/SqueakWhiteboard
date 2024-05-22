Class {
	#name : #WBElementPopUp,
	#superclass : #WBPopUp,
	#instVars : [
		'popUpButtons'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:08'
}
WBElementPopUp >> initializeDefault [

	self setDefaultValues
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 18:18'
}
WBElementPopUp >> popUpButtons [

	^ popUpButtons
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 18:18'
}
WBElementPopUp >> popUpButtons: aNumber [

	popUpButtons := aNumber.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ACL 5/22/2024 19:09'
}
WBElementPopUp >> setDefaultValues [

	self
		popUpButtons: 2;
		color: Color veryLightGray;
		borderColor: Color gray;
		borderWidth: 1;
		extent: (self popUpButtons*20)@20;
		cornerStyle: #rounded;
		cornerRadius: 7.
]
