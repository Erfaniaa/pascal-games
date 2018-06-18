Program Tron;
Uses
	Crt,Dos,Graph;
Label
	1;
Var
	t,t2,t3,t4,s,s2,s3,s4:word;
	gd,gm,size:integer;
	x,y,pxc,fl,sc,px,xr,yr,i,c2,c,sn,tn,j,l,l2,l3,l4,j2,u:integer;
	a,b:char;
	AA,Run:boolean;
	d,x2,y2,pxc2,fl2,sc2,px2,xr2,yr2,i2,c1,c12,j12,j22:integer;
	a2,b2:char;
Begin
	clrscr;
	textcolor(white);
	writeln('-- Tron Game -- By Pascal Home --');
	writeln;
	textcolor(yellow);
	writeln('You must ride your snake with these keys:');
	writeln;
	writeln('Player 1:');
	textcolor(lightgreen);
	writeln('Up     : up arrow key');
	writeln('Down   : down arrow key');
	writeln('Right  : right arrow key');
	writeln('Left   : left arrow key');
	writeln;
	textcolor(yellow);
	writeln('Player 2:');
	textcolor(lightgreen);
	writeln('Up     : W');
	writeln('Down   : S');
	writeln('Right  : D');
	writeln('Left   : A');
	textcolor(lightred);
	writeln;
	writeln('Escape : Exit');
	textcolor(black);
	readln;
	gd:=detect;
	initgraph(gd,gm,'Z:\');
	randomize;
	Run:=true;
	x2:=20;
	y2:=20;
	sc:=10;
	sc2:=10;
	x:=getmaxx-20;
	y:=getmaxy-20;
	setcolor(lightgreen);
	xr:=random(getmaxx-100)+50;
	yr:=random(getmaxy-100)+50;
	for u:=1 to 3 do
		circle(xr,yr,u);
	d:=5;
	aa:=true;
	While(run)Do
	Begin
		setcolor(yellow);
		rectangle(0,0,getmaxx,getmaxy);
		if(keypressed)then
		Begin
			b:=a;
			a:=readkey;
			if(ord(a)=27)then
			begin
				break;
				run:=false;
			end;
		if(a=chr(0))then begin
				a:=readkey;
		if(ord(a)=77)then
			j2:=1;
		if(ord(a)=75)then
			j2:=2;
		if(ord(a)=72)then
			j2:=3;
		if(ord(a)=80)then
			j2:=4;
										end else BEGIN
			if(a='d')or(a='D')then
			j22:=1;
		if(a='a')or(a='A')then
			j22:=2;
		if(a='w')or(a='W')then
			j22:=3;
		if(a='s')or(a='S')then
			j22:=4;
		END;
		End;
		fl:=0;
		if((abs(x-xr))<=10)and((abs(y-yr))<=10)then
		begin
			sc:=sc+1;
			setcolor(black);
			for u:=1 to 3 do
				circle(xr,yr,u);
			sound(2500);
			fl:=1;
		end;
		if((abs(x2-xr))<=10)and((abs(y2-yr))<=10)then
		begin
			sc2:=sc2+1;
			setcolor(black);
			for u:=1 to 3 do
				circle(xr,yr,u);
			sound(2500);
			fl:=1;
		end;
		c:=0;

		1:if(fl=1)then
		begin
			c:=0;
			xr:=random(getmaxx-50)+50;
			yr:=random(getmaxy-50)+50;
			Repeat
				c:=c+1;
				if(not(((getpixel(xr,yr)=black)and(getpixel(xr+c,yr)=black)
			and(getpixel(xr,yr+c)=black)and(getpixel(xr-c,yr)=black)
			and(getpixel(xr,yr-c)=black))))then
				goto 1;
			Until(c=25);
			setcolor(lightgreen);
			for u:=1 to 3 do
				circle(xr,yr,u);
		end;
		if(((j2=1)and(j=2))or((j2=2)and(j=1))or
		((j2=3)and(j=4))or((j2=4)and(j=3)))then
			j2:=j;
		if(j2=1)then
		Begin
			x:=x+1;
			pxc:=getpixel(x+3,y);
		end;
		if(j2=2)then
		Begin
			x:=x-1;
			pxc:=getpixel(x-3,y);
		end;
		if(j2=3)then
		Begin
			y:=y-1;
			pxc:=getpixel(x,y-3);
		end;
		if(j2=4)then
		Begin
			y:=y+1;
			pxc:=getpixel(x,y+3);
		end;
		j:=j2;
		nosound;
		setcolor(white);
		circle(x,y,2);
		c1:=0;
		if(((j22=1)and(j12=2))or((j22=2)and(j12=1))or
		((j22=3)and(j12=4))or((j22=4)and(j12=3)))then
			j22:=j12;
		if(j22=1)then
		Begin
			x2:=x2+1;
			pxc2:=getpixel(x2+3,y2);
		end;
		if(j22=2)then
		Begin
			x2:=x2-1;
			pxc2:=getpixel(x2-3,y2);
		end;
		if(j22=3)then
		Begin
			y2:=y2-1;
			pxc2:=getpixel(x2,y2-3);
		end;
		if(j22=4)then
		Begin
			y2:=y2+1;
			pxc2:=getpixel(x2,y2+3);
		end;
		j12:=j22;
		setcolor(lightred);
		delay(8);
		circle(x2,y2,2);
		nosound;
		if((abs(x-x2))<=5)and((abs(y-y2))<=5)then
		begin
			sc:=sc-5;
			sc2:=sc2-5;
			setcolor(lightgreen);
			size:=2;
			SetTextStyle(DefaultFont, HorizDir, Size);
			outtextxy(5,5,'Draw!');
			delay(1500);
			aa:=false;
			run:=false;
			break;
		end;
		if(pxc2=white)or(pxc2=yellow)or(pxc2=lightred)and(aa)then
		begin
			setcolor(lightgreen);
			size:=2;
			SetTextStyle(DefaultFont, HorizDir, Size);
			outtextxy(5,5,'Player 2 Loses!');
			sc2:=sc2-5;
			delay(1500);
			run:=false;
		end;
		if((pxc=white)or(pxc=yellow)or(pxc=lightred))and(aa)then
		begin
			setcolor(lightgreen);
			size:=2;
			SetTextStyle(DefaultFont, HorizDir, Size);
			outtextxy(5,5,'Player 1 Loses!');
			sc:=sc-5;
			delay(1500);
			run:=false;
			break;
		end;
	End;
	closegraph;
	textcolor(yellow);
	writeln('Player 1: ',sc,' points');
	textcolor(lightgreen);
	writeln;
	writeln('Player 2: ',sc2,' points');
	textcolor(black);
	delay(2000);
	readln;
End.
