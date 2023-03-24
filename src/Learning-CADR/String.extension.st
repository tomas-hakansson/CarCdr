Extension { #name : #String }

{ #category : #'*Learning-CADR' }
String >> generateCarCdr [

	| rs ns |
	rs := self reverse.
	ns := self , ' ^ self '.
	2 to: rs size - 1 do: [ :index | 
		| c |
		c := rs at: index.
		ns := ns , (c = $a
			       ifTrue: [ 'first ' ]
			       ifFalse: [ 'allButFirst ' ]) ].
	^ ns
	
]

{ #category : #'*Learning-CADR' }
String >> isCarCdr [

	| f m l isFalse |
	
	"fail fast if the given string is too small."
	self size < 3 ifTrue: [ ^ false ].

	f := self first = $c.

	m := true.
	2 to: self size - 1 do: [ :index | 
		| c t |
		c := self at: index.
		t := 'ad' includes: c.
		t ifFalse: [ m := false ] ].

	l := self last = $r.

	isFalse := { f . m . l } includes: false.
	^ isFalse not
]
