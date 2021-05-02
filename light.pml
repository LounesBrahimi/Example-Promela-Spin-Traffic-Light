mtype{RED, ORANGE, GREEN, INDETERMINED}

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
		
		if 
		:: true -> goto etatgreen;
		:: true -> goto breakdown;
		:: true -> goto etatred;
		fi	
	
	etatgreen:
		color = GREEN;
		
		if 
		:: true -> goto etatorange;
		:: true -> goto breakdown;
		:: true -> goto etatgreen;
		fi		
		
		
	etatorange:
		color = ORANGE;
		
		if 
		:: true -> goto etatred;
		:: true -> goto breakdown;
		:: true -> goto etatorange;
		fi	
	
	breakdown:	
		clignotant = true;
	breakdown_loop:
		color = ORANGE;
		if
		:: true -> goto breakdown_loop;
		fi
}








