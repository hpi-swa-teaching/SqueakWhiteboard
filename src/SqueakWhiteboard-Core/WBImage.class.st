Class {
	#name : #WBImage,
	#superclass : #ImageMorph,
	#category : #'SqueakWhiteboard-Core'
}

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/9/2024 12:54'
}
WBImage class >> loadCircleButtonImage [
	| form |

	[form := (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/circle.png'] on: Error do: 
		[:ex | Transcript show: 'Caught an exception: ', ex printString; cr.
		^ nil].
	^ form
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/9/2024 12:54'
}
WBImage class >> loadColorsButtonImage [
	| form |

	[form := (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/colorsToolbar.png'] on: Error do: 
		[:ex | Transcript show: 'Caught an exception: ', ex printString; cr.
		^ nil].
	^ form
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/9/2024 12:54'
}
WBImage class >> loadLineButtonImage [
	| form |

	[form := (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/line.png'] on: Error do: 
		[:ex | Transcript show: 'Caught an exception: ', ex printString; cr.
		^ nil].
	^ form
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'si 6/11/2024 18:37'
}
WBImage class >> loadRectangleButtonImage [
	| form |

	[form := (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/square2.png'] on: Error do: 
		[:ex | Transcript show: 'Caught an exception: ', ex printString; cr.
		^ ImageMorph new].
	^ form
]

{
	#category : #loadImages,
	#'squeak_changestamp' : 'is 6/9/2024 12:54'
}
WBImage class >> loadTextboxButtonImage [
	| form |

	[form := (GitAssetLoader for: 'SqueakWhiteboard') loadForm: '/textbox.png'] on: Error do: 
		[:ex | Transcript show: 'Caught an exception: ', ex printString; cr.
		^ nil].
	^ form
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 13:34'
}
WBImage >> initialize [

	super initialize
]

{
	#category : #edit,
	#'squeak_changestamp' : 'nicloeser 5/27/2024 14:13'
}
WBImage >> resize: anImage to: anExtent [
	|resizedImage|
	
	resizedImage := Form extent: anExtent depth: anImage depth.
	resizedImage := anImage scaledToSize: anExtent.
	^resizedImage
]
