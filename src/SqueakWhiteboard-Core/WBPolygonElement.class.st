Class {
	#name : #WBPolygonElement,
	#superclass : #WBElement,
	#instVars : [
		'edges'
	],
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/14/2024 13:24'
}
WBPolygonElement >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'si 6/3/2024 12:22'
}
WBPolygonElement >> edges: aList [

	edges := aList
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'is 6/18/2024 12:18'
}
WBPolygonElement >> initializeElement [

	^ PolygonMorph new
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 21:00'
}
WBPolygonElement >> supportsText [

	^ supportsText ifNil: [supportsText := false]
]
