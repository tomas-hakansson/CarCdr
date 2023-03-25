Extension { #name : #SequenceableCollection }

{ #category : #'*Learning-CADR' }
SequenceableCollection class >> carCdr: aSelector [

	SequenceableCollection
		compile: aSelector generateCarCdr
		classified: 'generated-methods'.
	[ self hasMethod: aSelector asSymbol ] whileFalse: [ "doesn't work"
		500 milliSeconds asDelay wait ].
	^ aSelector asSymbol value: self
]

{ #category : #'*Learning-CADR' }
SequenceableCollection >> doesNotUnderstand: aMessage [

	| s |
	s := aMessage selector.
	s isCarCdr
		ifTrue: [ ^ SequenceableCollection carCdr: s ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #'*Learning-CADR' }
SequenceableCollection class >> hasMethod: aSelector [

	^ self compiledMethodAt: aSelector ifPresent: [ true ] ifAbsent: [ false ]
]
