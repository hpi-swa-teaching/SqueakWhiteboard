"
This class represents a concrete circle element
"
Class {
	#name : #WBCircle,
	#superclass : #WBCircularElement,
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:17'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/24/2024 09:32'
}
WBCircle >> initialize [

	super initialize.
	self morph borderWidth: 0
]
