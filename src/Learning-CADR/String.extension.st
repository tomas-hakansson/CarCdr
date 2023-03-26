Extension { #name : #String }

{ #category : #'*Learning-CADR' }
String >> generateCarCdr [

	| onlyAsAndDs sl |
	onlyAsAndDs := self allButLast allButFirst. "Removes first and last letters."
	sl := onlyAsAndDs collect: [ :c | 
		      $a = c
			      ifTrue: [ 'first ' ]
			      ifFalse: [ 'allButFirst ' ] ] as: OrderedCollection .

	^ '' join: { 
			  self.
			  ' ^ self ' } , sl reverse
]

{ #category : #'*Learning-CADR' }
String >> isCarCdr [

	self size < 3 ifTrue: [ ^ false ]. "fail fast if the given string is too small."

	self first = $c ifFalse: [ ^ false ].
	self last = $r ifFalse: [ ^ false ].

	2 to: self size - 1 do: [ :index | 
		| c t |
		c := self at: index.
		t := 'ad' includes: c.
		t ifFalse: [ ^ false ] ].

	^ true
]
