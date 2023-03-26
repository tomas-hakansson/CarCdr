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

	self size < 3 ifTrue: [ ^ false ]. "fail fast if the given string is too small."

	self first = $c ifFalse: [ ^ false ].

	2 to: self size - 1 do: [ :index | 
		| c t |
		c := self at: index.
		t := 'ad' includes: c.
		t ifFalse: [ ^ false ] ].

	self last = $r ifFalse: [ ^ false ]. 

	^ true
]
