VWESIG	;;Jim Bell - E-Signature Utility March 1, 2015 @17:43
	;;1.0;;**WVEHR LOCAL**;;Build 26
	;Copyright 2015 Jim Bell.  Licensed under the terms of the GNU
	;This routine utility is for New Person file specific fields
	;
	Q
	;
INR()   Q $O(RESULT(" "),-1)+1
	;
BEGIN(RESULT)	;
	K RESULT
	;S RESULT($$INR)="<Hidden>"
	S RESULT($$INR)=$P(^VA(200,DUZ,20),"^",4)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,0)),"^",2)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,20)),"^",2)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,20)),"^",3)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,.13)),"^",2)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,.13)),"^",7)
	S RESULT($$INR)=$P($G(^VA(200,DUZ,.13)),"^",8)
	Q
	;
ESIG(RESULT,DATA)	;
	;S RESULT(0)="RECEIVED: "_DATA
	S ^XTMP("ESIG",$J)=DATA
	I $L($P(DATA,"^")) D
EP1	. L +^VA(200,DUZ):1 G EP1:'$T
	. S DA=DUZ,(DIC,DIE)="^VA(200,"
	. S DR="20.4///@"
	. D ^DIE
	. L -^VA(200,DUZ)
	K DR S DR="",(DIC,DIE)="^VA(200,",DA=DUZ
	S FLDS="20.4,1,20.2,20.3,.132,.137,.138"
	F I=1:1:$L(FLDS,",") S:$L($P(DATA,"^",I)) DR=DR_$P(FLDS,",",I)_"///"_$P(DATA,"^",I)_";"
	S DR=$E(DR,1,$L(DR)-1)
ESL	L +^VA(200,DUZ):1 G ESL:'$T D ^DIE L -^VA(200,DUZ)
	S RESULT(0)="Filed..."
	Q
	;

