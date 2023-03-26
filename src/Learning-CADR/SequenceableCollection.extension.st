Extension { #name : #SequenceableCollection }

{ #category : #'*Learning-CADR' }
SequenceableCollection >> carCdr: aSelector [

	SequenceableCollection
		compile: aSelector generateCarCdr
		classified: CarCdr protocolName.
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
