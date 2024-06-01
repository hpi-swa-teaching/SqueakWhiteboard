Class {
	#name : #WBResizeTopRight,
	#superclass : #WBResizeHandle,
	#category : #'SqueakWhiteboard-Core'
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
	#'squeak_changestamp' : 'is 5/28/2024 15:33'
}
WBResizeTopRight >> setLayout [
	self center: element topRight.
	
]
