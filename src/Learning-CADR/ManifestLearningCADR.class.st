"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLearningCADR,
	#superclass : #PackageManifest,
	#category : #'Learning-CADR-Manifest'
}

{ #category : #'code-critics' }
ManifestLearningCADR class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SequenceableCollection #carCdr: #false)) #'2023-04-13T19:07:15.248+02:00') )
]

{ #category : #'code-critics' }
ManifestLearningCADR class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SequenceableCollection #carCdr: #false)) #'2022-12-17T17:47:29+01:00') #(#(#RGMethodDefinition #(#SequenceableCollection #doesNotUnderstand: #false)) #'2022-12-17T17:50:11.365+01:00') #(#(#RGMethodDefinition #(#'SequenceableCollection class' #carCdr: #true)) #'2022-12-17T17:50:35.722+01:00') )
]

{ #category : #'code-critics' }
ManifestLearningCADR class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CarCdrTest)) #'2022-12-17T15:02:02.052+01:00') )
]
