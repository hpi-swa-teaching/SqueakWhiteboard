Class {
	#name : #WBResizeBottomLeft,
	#superclass : #WBResizeHandle,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 17:31'
}
WBResizeBottomLeft >> resize: movement [
	self element position: (self element position x + movement x)@(self element position y).
	self element extent: (self element extent x - movement x)@(self element extent y + movement y).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:25'
}
WBResizeBottomLeft >> resizeCursor [
	Cursor resizeBottomLeft show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:25'
}
WBResizeBottomLeft >> setPosition [
	self center: element bottomLeft.
	
]
