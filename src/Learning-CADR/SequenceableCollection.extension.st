Extension { #name : #SequenceableCollection }

{ #category : #'*Learning-CADR' }
SequenceableCollection >> carCdr: aSelector [

	SequenceableCollection
		compile: aSelector generateCarCdr
		classified: 'generated-methods'.
	^ aSelector asSymbol value: self
]

{ #category : #'*Learning-CADR' }
SequenceableCollection >> doesNotUnderstand: aMessage [

	| s |
	s := aMessage selector.
	s isCarCdr
		ifTrue: [ ^ self carCdr: s ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]
