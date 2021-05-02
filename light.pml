mtype{RED, ORANGE, GREEN, INDETERMINED}

chan obs = [0] of {mtype, bool}

active proctype observator(){
	mtype color, last;
	bool cli;
	last = INDETERMINED;
	do
	:: obs?color, cli ->
		if
		:: atomic{
				color == RED -> assert(last != GREEN);
				last = RED;
		   }
		fi
		if
		:: atomic{
				color == ORANGE -> assert(last != RED);
				last = ORANGE;
		   }
		fi
		if
		:: atomic{
				color == GREEN -> assert(last != ORANGE);
				last = GREEN;
		   }
		fi
	od
}

active proctype light(){
	bool clignotant = false;
	mtype color = INDETERMINED;
	
	inital:
		color = ORANGE;
		clignotant = true;
		
		if 
		:: true -> clignotant = false; goto etatred;
		:: goto inital;
		fi
		
	etatred:
		color = RED;
		obs!color, clignotant
		if 
		:: true -> goto etatgreen;
		:: true -> goto breakdown;
		:: true -> goto etatred;
		fi	
	
	etatgreen:
		color = GREEN;
		obs!color, clignotant
		if 
		:: true -> goto etatorange;
		:: true -> goto breakdown;
		:: true -> goto etatgreen;
		fi		
		
	etatorange:
		color = ORANGE;
		obs!color, clignotant
		if 
		:: true -> goto etatred;
		:: true -> goto breakdown;
		:: true -> goto etatorange;
		fi	
	
	breakdown:	
		clignotant = true;
	breakdown_loop:
		color = ORANGE;
		obs!color, clignotant
		if
		:: true -> goto breakdown_loop;
		fi
}








