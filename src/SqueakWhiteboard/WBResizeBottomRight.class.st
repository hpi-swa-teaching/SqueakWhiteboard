Class {
	#name : #WBResizeBottomRight,
	#superclass : #WBResizeHandle,
	#category : #SqueakWhiteboard
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 17:32'
}
WBResizeBottomRight >> resize: movement [
	self element extent: (self element extent + movement).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:26'
}
WBResizeBottomRight >> resizeCursor [
	Cursor resizeBottomRight show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JK 5/27/2024 16:25'
}
WBResizeBottomRight >> setPosition [
	self center: element bottomRight.
	
]
