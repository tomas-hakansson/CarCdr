Extension { #name : #String }

{ #category : #'*Learning-CADR' }
String >> generateCarCdr [

	| onlyADs sl |
	onlyADs := self allButLast allButFirst.
	sl := onlyADs asOrderedCollection collect: [ :c | 
		      $a = c
			      ifTrue: [ 'first ' ]
			      ifFalse: [ 'allButFirst ' ] ].

	^ '' join: { 
			  self.
			  ' ^ self ' } , sl reverse
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
