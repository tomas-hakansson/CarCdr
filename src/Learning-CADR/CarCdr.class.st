"
I contain a few constants and utility methods:
A name for the generated method protocol.
A method for clearing all the generated methods.
"
Class {
	#name : #CarCdr,
	#superclass : #Object,
	#category : #'Learning-CADR'
}

{ #category : #cleanup }
CarCdr class >> clearGeneratedMethods [

	| protocolExists selectors |
	protocolExists := SequenceableCollection protocols includes:
		                  self protocolName.
	protocolExists ifFalse: [ ^ self ].

	selectors := SequenceableCollection allSelectorsInProtocol:
		             self protocolName.
	selectors do: [ :selector | 
		SequenceableCollection removeSelector: selector ].
	selectors := SequenceableCollection allSelectorsInProtocol:
		                  self protocolName.
	selectors isEmpty
		ifTrue: [ 
		SequenceableCollection removeProtocol: self protocolName asSymbol ]
		ifFalse: [ self error: 'You did not remove all methods' ]
]

{ #category : #constants }
CarCdr class >> protocolName [
	^ 'generated-methods'
]
