uses crt,graph;
var
	gd,gm,ccx,v2,ccy,j,lev,t,pxc1,score,pxc2,pxc3,v,neshanex,neshaney:integer;
	f:text;
	s:string;
	c:char;
	u:array [1..10] of integer;
begin
	clrscr;
	textcolor(white);
	writeln('-- Dart Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You must choose the coordinates of where you want to shoot.');
	writeln('You must shoot for ten times.');
	writeln;
	textcolor(yellow);
	writeln('Space:  Shoot');
	writeln;
	textcolor(lightred);
	writeln('Esc  :  Exit');
	textcolor(black);
	GotoXY(50,50);
	readln;
	gd:=detect;
	initgraph(gd,gm,'');
	setcolor(2);
	setfillstyle(1,2);
	bar((getmaxx div 2)+100,(getmaxy div 2)+100,(getmaxx div 2)-100,(getmaxy div 2)-100);
	setcolor(4);
	setfillstyle(1,4);
	bar((getmaxx div 2)+75,(getmaxy div 2)+75,(getmaxx div 2)-75,(getmaxy div 2)-75);
	setcolor(1);
	setfillstyle(1,1);
	bar((getmaxx div 2)+50,(getmaxy div 2)+50,(getmaxx div 2)-50,(getmaxy div 2)-50);
	setcolor(6);
	setfillstyle(1,6);
	bar((getmaxx div 2)+25,(getmaxy div 2)+25,(getmaxx div 2)-25,(getmaxy div 2)-25);
	setcolor(7);
	setfillstyle(1,7);
	bar((getmaxx div 2)+10,(getmaxy div 2)+10,(getmaxx div 2)-10,(getmaxy div 2)-10);
	ccx:=getmaxx div 2;
	ccy:=getmaxy div 2;
	v:=1;
	v2:=1;
	setcolor(yellow);
	rectangle(0,0,getmaxx,getmaxy);
	while(c<>#27)do
		begin
			if(keypressed)then
				c:=readkey;
			if(c=#32)then
				begin
				if(v=0)and(v2<>0)then
					begin
						v2:=0;
						neshaney:=ccy;
						c:=#0;
					end;
						if(v<>0)and(v2<>0)then
								begin
									v:=0;
									c:=#0;
									neshanex:=ccx;
								end;
					if(v=0)and(v2=0)then
						begin
							lev:=lev+1;
							pxc3:=getpixel(neshanex,neshaney);
							if(pxc3=2)then
							begin
									u[lev]:=2;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+1;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
							if(pxc3=4)then
							begin
									u[lev]:=4;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+2;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
							if(pxc3=1)then
							begin
									u[lev]:=1;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+3;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
							if(pxc3=6)then
							begin
									u[lev]:=6;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+4;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
							if(pxc3=7)then
							begin
									u[lev]:=7;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+5;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
							if(pxc3=0)then
							begin
									u[lev]:=0;
									setcolor(0);
									setfillstyle(1,0);
									fillellipse(neshanex,neshaney,3,3);
									score:=score+5;
									sound(2500);
									delay(500);
									nosound;
									v:=1;
									v2:=1;
										c:=#0;
							end;
					setcolor(2);
					setfillstyle(1,2);
					bar((getmaxx div 2)+100,(getmaxy div 2)+100,(getmaxx div 2)-100,(getmaxy div 2)-100);
					setcolor(4);
					setfillstyle(1,4);
					bar((getmaxx div 2)+75,(getmaxy div 2)+75,(getmaxx div 2)-75,(getmaxy div 2)-75);
					setcolor(1);
					setfillstyle(1,1);
					bar((getmaxx div 2)+50,(getmaxy div 2)+50,(getmaxx div 2)-50,(getmaxy div 2)-50);
					setcolor(6);
					setfillstyle(1,6);
					bar((getmaxx div 2)+25,(getmaxy div 2)+25,(getmaxx div 2)-25,(getmaxy div 2)-25);
					setcolor(7);
					setfillstyle(1,7);
					bar((getmaxx div 2)+10,(getmaxy div 2)+10,(getmaxx div 2)-10,(getmaxy div 2)-10);

					end;
				end;
				for j:=1 to 10 do
					begin
						t:=t+1;
						setcolor(u[t]+8);
						outtextxy(10,(t*10),'');
					end;
		t:=0;
			setcolor(0);
			setfillstyle(1,0);
			fillellipse((Getmaxx div 2)-120,ccy,3,3);
			fillellipse(ccx,(Getmaxy div 2)-120,3,3);
			ccx:=ccx+(1*v);
			ccy:=ccy+(1*v2);
					setcolor(3);
					setfillstyle(1,3);
					fillellipse(ccx,(Getmaxy div 2)-120,3,3);
					setcolor(3);
					setfillstyle(1,3);
					fillellipse((Getmaxx div 2)-120,ccy,3,3);
					setcolor(9);
					setfillstyle(1,9);
					bar((getmaxx div 2)-140,(getmaxy div 2)-105,(getmaxx div 2)-100,(getmaxy div 2)-125);
					bar((getmaxx div 2)+110,(getmaxy div 2)-105,(getmaxx div 2)+100,(getmaxy div 2)-125);
					bar((getmaxx div 2)-130,(getmaxy div 2)+102,(getmaxx div 2)-105,(getmaxy div 2)+112);
					pxc1:=getpixel(ccx+(1*v),(Getmaxy div 2)-120);
					pxc2:=getpixel((Getmaxx div 2)-120,ccy+(1*v2));
					if(pxc1=9)then
						v:=v*(-1);
					if(pxc2=9)then
						v2:=v2*(-1);
					if(lev>=10)then
					break;
						delay(5);
		end;
		closegraph;
		textcolor(lightgreen);
		write('You got ');
		textcolor(yellow);
		write(score);
		textcolor(lightgreen);
		write(' point(s) from ');
		textcolor(yellow);
		write(50);
		textcolor(lightgreen);
		write(' points!');
		GotoXY(50,50);
 readln;
		 CLRSCR;
		 textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(F,'Scores\Dart.txt');
			Append(F);
			writeln(f,S,': ',score);
			close(F);
 end.

