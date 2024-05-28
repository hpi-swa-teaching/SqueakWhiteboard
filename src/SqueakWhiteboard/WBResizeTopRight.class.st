Class {
	#name : #WBResizeTopRight,
	#superclass : #WBResizeHandle,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 17:27'
}
WBResizeTopRight >> resize: movement [
	self element position: (self element position x)@(self element position y + movement y).
	self element extent: (self element extent x + movement x)@(self element extent y - movement y).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:26'
}
WBResizeTopRight >> resizeCursor [
	Cursor resizeTopRight show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:26'
}
WBResizeTopRight >> setPosition [
	self center: element topRight.
	
]
