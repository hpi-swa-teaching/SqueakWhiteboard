Class {
	#name : #WBElementPopUp,
	#superclass : #WBPopUp,
	#instVars : [
		'popUpButtons'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:18'
}
WBElementPopUp >> initializeDefault [

	self setDefaultValues.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/23/2024 17:18'
}
WBElementPopUp >> popUpButtons [

	^ popUpButtons.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/22/2024 18:18'
}
WBElementPopUp >> popUpButtons: aNumber [

	popUpButtons := aNumber.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/23/2024 16:26'
}
WBElementPopUp >> setDefaultValues [

	self
		popUpButtons: 2;
		color: Color veryVeryLightGray;
		borderColor: Color gray;
		borderWidth: 1;
		extent: (self popUpButtons*20)@20;
		cornerStyle: #rounded;
		cornerRadius: 7.
]
