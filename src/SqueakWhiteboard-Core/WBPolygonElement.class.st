"
This class represents all polygon Elements
"
Class {
	#name : #WBPolygonElement,
	#superclass : #WBElement,
	#instVars : [
		'edges'
	],
	#category : #'SqueakWhiteboard-Core',
	#'squeak_changestamp' : 'is 6/23/2024 02:17'
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
	#category : #'polygonmorph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 19:08'
}
WBPolygonElement >> lineColor: aColor [

	self morph lineColor: aColor
]

{
	#category : #'polygonmorph functionalities',
	#'squeak_changestamp' : 'is 6/18/2024 19:08'
}
WBPolygonElement >> setVertices: someVertices [

	self morph setVertices: someVertices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'is 6/12/2024 21:00'
}
WBPolygonElement >> supportsText [

	^ supportsText ifNil: [supportsText := false]
]
