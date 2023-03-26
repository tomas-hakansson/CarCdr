# This implements a simple edsl in Pharo Smalltalk.

It's based on Common Lisps car, cdr family of functions.

# Background

I am a Pharo beginner and I wanted a simple project to get started. This is not a serious library and I would not recommend anyone to use it other than for fun.

Car is a function that can be said to return the head of a list.
(car '(1 2 3)) returns 1.
Cdr is a function that can be said to return the rest of a list.
(cdr '(1 2 3)) returns '(2 3).
In Lisp this is technically not how they work but it's almost exactly how this implementation works.

By composing car and cdr you can access any deeply nested part of a list.
You can get the 2 in '(1 2 3) with (car (cdr list)).
You can get the 'a in '(1 2 '(a b) 4) with (car (car (cdr (cdr list))))

In Lisp there is a set of predefined functions for the most common compositions of car and cdr. Their named in a way that makes their function obvious.
They start with a c which is follow by a combination of a's and d's and ends with a r.
The order of the a's and d's is the same as the order of car's and cdr's in the composition.
In other words:
(car (car list)) becomes caar.
(car (cdr (car list))) becoms cadar.
The two examples above becomes respectively cadr and caaddr.

This means that you could, in principle, automatically generate the functions upon use. In Lisp this could be done via read macros (parse macros), in Pharo we have the option of overloading part of the error handling.

# Implementation

I overloaded 'doesNotUnderstand' to parse the given message. If it doesn't conform to the format of car, cdr functions it simply passes 'doesNotUnderstand' to its super otherwise it generates a string representing the car, cdr function, compiles it then calls it.
The new methods are added to 'SequenceableCollection' under the classification of 'generated-methods'. 

# How it's used

Given the array l := #(1 2 3).
'l car' gives you 1 as the result,
'l cadr' gives you 2.
There is a runtime overhead the first time the message is sent but then the newly generated method is called directly.
