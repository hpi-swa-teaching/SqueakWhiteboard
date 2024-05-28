Class {
	#name : #WBResizeTopLeft,
	#superclass : #WBResizeHandle,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/28/2024 11:43'
}
WBResizeTopLeft >> resize: movement [
	self element position: (self element position + movement).
	self element extent: (self element extent - movement).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:09'
}
WBResizeTopLeft >> resizeCursor [
	Cursor resizeTopLeft show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:14'
}
WBResizeTopLeft >> setPosition [
	self center: element topLeft.
	
]
