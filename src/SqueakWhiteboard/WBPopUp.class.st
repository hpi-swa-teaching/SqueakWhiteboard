"
The WBPopUp is a menu that opens up when clicking on an element that is in the canvas
"
Class {
	#name : #WBPopUp,
	#superclass : #Morph,
	#category : #SqueakWhiteboard,
	#'squeak_changestamp' : 'is 5/17/2024 20:40'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 5/19/2024 16:56'
}
WBPopUp >> handlesMouseDown: anEvent [
    ^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ACL 5/21/2024 14:03'
}
WBPopUp >> initialize [

super initialize.
self popUpButtons: 2;
	color: Color veryLightGray;
	borderColor: Color gray;
	borderWidth: 1;
	extent: (self popUpButtons*20)@20;
	cornerStyle: #rounded;
	cornerRadius: 7.
]
