uses crt,graph;
var
	xp,yp,xp2,yp2,h,xc,yc,gd,gm,pxc,pxc2,r,x,y,p,i,xx,yy,b:integer;
	k,k2,k3:char;
	L,C,CO,SC:Longint;
	run:boolean;
	f:text;
	s:string;
Label 1,2;
begin
	clrscr;
	textcolor(white);
	writeln('-- Penalty Game -- By Pascal Home --');
	writeln;
	textcolor(yellow);
	writeln('You must shoot the ball into the goal.');
	writeln;
	writeln('You must enter three keys:');
	textcolor(white);
	write('1: ');
	textcolor(lightgreen);
	writeln('Ball_X_speed(1~9)');
	textcolor(white);
	write('2: ');
	textcolor(lightgreen);
	writeln('Ball_Y_speed(1~9)');
	textcolor(white);
	write('3: ');
	textcolor(lightgreen);
	writeln('Direction of shooting ball(3-9)');
	textcolor(lightred);
	writeln;
	writeln('Escape : Exit');
	textcolor(black);
	readln;
	randomize;
	gd:=detect;
	initgraph(gd,gm,'');
	1:xp:=20;
	yp:=getmaxy div 2;
	yc:=getmaxy div 2;
	setfillstyle(1,0);
	pxc:=0;
	pxc2:=0;
	k:=' ';
	h:=0;
	for yy:=i+1 to 10 do
				begin
					setcolor(lightgray);
						outtextxy(4,12*yy+15,'');
				end;
	bar(15,21,getmaxx,getmaxy);
	{cleardevice;}
	while(p<>1)do
		begin
					setcolor(lightred);
					if(pxc2=lightgreen)then
					begin
						outtextxy(4,(12*(i+1))+15,'');
					end;
					setcolor(lightgreen);
					if(xp>getmaxx)then
					begin
						inc(sc);
						outtextxy(4,(12*(i+1))+15,'');
					end;
			if(run)and((xp>getmaxx)or(pxc2=lightgreen))then
			begin
				C:=0;
				L:=0;
				run:=false;
				i:=i+1;
				Goto 1;
			end;
				xx:=4;
			run:=true;
			C:=C+1;
			setcolor(lightgreen);
			setfillstyle(1,lightgreen);
			bar(getmaxx-15,yc,getmaxx,yc+70);
			delay(8);
			setcolor(3);
			setfillstyle(1,3);
			fillellipse(xp,yp,8,8);
			setcolor(yellow);
			setfillstyle(1,yellow);
			rectangle(0,0,getmaxx+20,getmaxy);
			bar(0,0,getmaxx+20,20);
			bar(0,getmaxy-20,getmaxx+20,getmaxy);
			xp2:=xp;
			yp2:=yp;
				p:=port[$60];
				if(p=1)or(i=10)then
					2:break;
				if(l=0)then
				begin
					Repeat
						k2:=readkey;
						if(k2=#27)then
							goto 2;
					Until(k2 in[#49..#57])or(k2=#27);
					Repeat
						k3:=readkey;
						if(k3=#27)then
							goto 2;
					Until(k3 in[#49..#57])or(k3=#27);
				Repeat
						k:=readkey;
						if(k=#27)then
							goto 2;
				Until(k=#27)or(k='3')or(k='9');
				l:=1;
				end;
			x:=ord(k2)-48;
			y:=ord(k3)-48;
			if(x>y)then
				b:=x
			else
				b:=y;
			if(C>=1)then
				r:=(random((b+1) div 2)+((b+1) div 2))+(random(random(2)+1));
			if(k2=k3)then
				r:=(random((b+1) div 2)+((b+1) div 2))+(random(random(3)+2))+1;
			if(yc+35<yp)and(yc+70+r+5<getmaxy-20)then
						yc:=yc+r;
			if(yc+35>yp)and(yc-5-5>20)then
						yc:=yc-r;
					setcolor(0);
					setfillstyle(1,0);
					bar(getmaxx-15,yc,getmaxx,yc-r);
					bar(getmaxx-15,yc+70+r,getmaxx,getmaxy-21);
					setcolor(lightgreen);
					setfillstyle(1,lightgreen);
					bar(getmaxx-15,yc,getmaxx,yc+70);
			if(k=#27)then
				break;
			if((k='9')and(h=0))or(h=9)then
				begin
					setcolor(0);
					setfillstyle(1,0);
					fillellipse(xp,yp,8,8);
					pxc:=getpixel(xp+10,yp-10);
					pxc2:=getpixel(xp+10,yp);
					xp:=xp+x;
					yp:=yp-y;
					h:=9;
					if(pxc=yellow)then
						h:=3;
					if(pxc2=lightgreen)then
					begin
						co:=co+1;
					end;
				end;
			{if((k='6')and(h=0))or(h=6)then
				begin
					setcolor(0);
					setfillstyle(1,0);
					fillellipse(xp,yp,10,10);
					pxc2:=getpixel(xp+11,yp);
					xp:=xp+x;
					h:=6;
					if(pxc2=lightgreen)then
						break;
				end;}
			if((k='3')and(h=0))or(h=3)then
				begin
					setcolor(0);
					setfillstyle(1,0);
					fillellipse(xp,yp,8,8);
					pxc:=getpixel(xp+10,yp+10);
					pxc2:=getpixel(xp+10,yp);
					xp:=xp+x;
					yp:=yp+y;
					h:=3;
					if(pxc=yellow)then
						h:=9;
					if(pxc2=lightgreen)then
					begin
						co:=co+1;
					end;
				end;
				setcolor(3);
				setfillstyle(1,3);
				fillellipse(xp,yp,8,8);
	end;
	closegraph;
	TextColor (10);
	Write ('You got ');
	TextColor (Yellow);
	Write (sc);
	Textcolor (10);
	Write (' points from ');
	TextColor (Yellow);
	Write (10);
	Textcolor (10);
	Write (' points.');
	readln;
	CLRSCR;
		 textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(F,'Scores\Penalty.txt');
			Append(F);
			writeln(f,S,': ',sc);
			close(F);
end.