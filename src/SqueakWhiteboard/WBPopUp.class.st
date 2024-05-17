Class {
	#name : #WBPopUp,
	#superclass : #Morph,
	#instVars : [
		'popUpButtons'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/17/2024 15:07'
}
WBPopUp >> handlesMouseDown: evt [
    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/17/2024 15:10'
}
WBPopUp >> initialize [

super initialize.
self popUpButtons: 2;
	color: Color veryLightGray;
	borderColor: Color gray;
	borderWidth: 1;
	extent: (self popUpButtons*20)@20;
	cornerStyle: #rounded.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/15/2024 16:04'
}
WBPopUp >> popUpButtons [

	^popUpButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ACL 5/15/2024 16:04'
}
WBPopUp >> popUpButtons: aNumber [

	popUpButtons := aNumber.
]
