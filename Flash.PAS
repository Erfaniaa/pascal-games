uses crt,graph,usemouse;
var
	ymo,xmo,gd,gm,t,score,pxcm1,pxcm2,co:integer;
	f:text;
	s:string;
	xg:array [1..20]of integer;
	yg:array [1..20]of integer;
begin
	clrscr;
	textcolor(white);
	writeln('-- Flash Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You must click on blue squares.');
	writeln;
	textcolor(lightred);
	writeln('Exit:  Righclick');
	textcolor(black);
	readln;
	randomize;
	t:=1;
	gd:=detect;
	initgraph(gd,gm,'');
	initmouse;
	setcolor(4);
	setfillstyle(1,4);
	bar(getmaxx,0,0,getmaxy-450);
	bar(0,getmaxy-20,getmaxx,getmaxy);
	rectangle(getmaxx,getmaxy,0,0);
	setmousespeed(3,3);
	setcolor(3);
	setfillstyle(1,3);
	score:=0;
	while(getmb<>2)do
			begin
				showmouse;
				xmo:=getmx;
				ymo:=getmy;
				pxcm1:=getpixel(getmx-1,getmy-1);
				if((pxcm1=3)and(getmb=1))then
						score:=score+10;
				while(t<21)and(getmb<>2)do
					begin
					pxcm1:=getpixel(getmx-1,getmy-1);
					setcolor(3);
					setfillstyle(1,3);
					xg[t]:=random(600)+5;
					xg[t+1]:=xg[t]+20;
					yg[t]:=random(370)+50;
					yg[t+1]:=yg[t]+20;
					bar(xg[t],yg[t],xg[t+1],yg[t+1]);
					co:=co+1;
					t:=t+2;
					if((pxcm1=3)and(getmb=1))then
						score:=score+10;
					setcolor(0);
					setfillstyle(1,0);
					end;
				pxcm1:=getpixel(getmx-1,getmy-1);
				t:=1;
					while(t<21)and(getmb<>2)do
						begin
								pxcm1:=getpixel(getmx-1,getmy-1);
							if((pxcm1=3)and(getmb=1))then
									score:=score+10;
							if(getmb<>2)then
							begin
								setcolor(0);
								setfillstyle(1,0);
								bar(xg[t],yg[t],xg[t+1],yg[t+1]);
								t:=t+2;
								pxcm1:=getpixel(getmx-1,getmy-2);
								if((pxcm1=3)and(getmb=1))then
									score:=score+10;
								delay(130);
							end;
					end;
						setfillstyle(1,0);
						bar(0,0,getmaxx,getmaxy);
						cleardevice;
						setcolor(4);
						setfillstyle(1,4);
						bar(getmaxx,0,0,getmaxy-450);
						bar(0,getmaxy-20,getmaxx,getmaxy);
						rectangle(getmaxx,getmaxy,0,0);
						t:=1;
						pxcm1:=getpixel(getmx-1,getmy-1);
						if((pxcm1=3)and(getmb=1))then
							score:=score+10;
					if(co>=150)then
						break;
			end;
			CloseGraph;
			TextColor (10);
			Write ('You got ');
			TextColor (Yellow);
			Write (score);
			Textcolor (10);
			Write (' points from ');
			TextColor (Yellow);
			Write (1000);
			Textcolor (10);
			Write (' points.');
			TextColor (Black);
			readln;
			clrscr;
			textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(F,'Scores\Flash.txt');
			Append(F);
			writeln(f,S,': ',score);
			close(F);

end.
