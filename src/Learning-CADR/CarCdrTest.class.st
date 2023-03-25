Class {
	#name : #CarCdrTest,
	#superclass : #TestCase,
	#category : #'Learning-CADR'
}

{ #category : #tests }
CarCdrTest >> testCADR_getsMiddle [

	| a |
	a := #(1 2 3) cadr.
	self assert: a equals: 2
]

{ #category : #tests }
CarCdrTest >> testCAR_getsFirst [

	| a l |
	l := #( 1 2 3 ).
	a := l car.
	self assert: a equals: 1
]

{ #category : #tests }
CarCdrTest >> testCDR_getsRest [

	| a |
	a := #(1 2 3) cdr.
	self assert: a equals: #(2 3)
]

{ #category : #tests }
CarCdrTest >> testGenerate_CAR [

	self assert: 'car' generateCarCdr equals: 'car ^ self first '
]

{ #category : #tests }
CarCdrTest >> testGenerate_CDADR [

	self assert: 'cdadr' generateCarCdr equals: 'cdadr ^ self allButFirst first allButFirst '
]

{ #category : #tests }
CarCdrTest >> testGenerate_CDR [

	self assert: 'cdr' generateCarCdr equals: 'cdr ^ self allButFirst '
]

{ #category : #tests }
CarCdrTest >> testValidate_CAR_isTrue [

	self assert: 'car' isCarCdr equals: true
]

{ #category : #tests }
CarCdrTest >> testValidate_CDADR_isTrue [

	self assert: 'cdadr' isCarCdr equals: true
]

{ #category : #tests }
CarCdrTest >> testValidate_CDADXR_isFalse [

	self assert: 'cdadxr' isCarCdr equals: false
]

{ #category : #tests }
CarCdrTest >> testValidate_CDR_isTrue [

	self assert: 'cdr' isCarCdr equals: true
]

{ #category : #tests }
CarCdrTest >> testValidate_CXR_isFalse [

	self assert: 'cxr' isCarCdr equals: false
]
