Class {
	#name : #WBLine,
	#superclass : #WBElement,
	#classVars : [
		'ClickCount',
		'FirstPoint',
		'SecondPoint'
	],
	#category : #SqueakWhiteboard
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'nicloeser 5/19/2024 14:00'
}
WBLine >> initialize [
	|count verts line|
	
	super initialize.
	
	(ClickCount = nil) ifTrue: [ClickCount := 1].
	count := ClickCount.
	(count = 1) 
	ifTrue: [
		self color: Color black.
		FirstPoint := self.
		ClickCount := 2
		].
	(count = 2)
	ifTrue: [
		self color: Color gray.
		SecondPoint := self.
		ClickCount := 3.
		].
	(count = 3)
	ifTrue: [
		ClickCount := 1.
		verts := {FirstPoint center. SecondPoint center}.
		line := LineMorph new.
		line vertices: verts color: Color black borderWidth: 5 borderColor: Color black.
		self canvas addMorph: line.
		]
	
	
]
