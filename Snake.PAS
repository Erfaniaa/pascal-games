Program Snake;
Uses CRT,DOS,Graph;
Label 1;
Var
	t,t2,t3,t4,s,s2,s3,s4:word;
	gd,gm,size:integer;
	x,y,pxc,fl,sc,px,xr,yr,i,c2,c,sn,tn,j,l,l2,l3,l4,j2:integer;
	a,b,new:char;
	Run:boolean;
	arr:array[1..10000]of integer;
	arr2:array[1..10000]of integer;
	nu,nu2,u:longint;
	tex:text;
	str:string;
Begin
	clrscr;
	textcolor(white);
	writeln('-- Snake Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('Your snake must get green foods in a little time.');
	textcolor(yellow);
	writeln('You must ride your snake with these arrow keys:');
	writeln('Up');
	writeln('Down');
	writeln('Right');
	writeln('Left');
	writeln;
	textcolor(lightred);
	writeln('Esc:  Exit');
	readln;
	gd:=detect;
	initgraph(gd,gm,'Z:\');
	randomize;
	Run:=true;
	x:=getmaxx div 2;
	y:=getmaxy div 2;
	setcolor(lightgreen);
	xr:=random(getmaxx-100)+50;
	yr:=random(getmaxy-100)+50;
	for u:=1 to 3 do
		circle(xr,yr,u);
	gettime(t,t2,t3,t4);
	l:=random(201)+10;
	l2:=random(151)+100;
	l3:=random(101)+10;
	l4:=random(101)+10;
	delay(1000);
	While(Run)Do
	Begin
		setcolor(yellow);
		rectangle(0,0,getmaxx,getmaxy);
		line(0,l2,l,l2);
		line(l+120,getmaxy,l+120,getmaxy-80);
		line(l4,0,l4,l3);
		line(getmaxx,l4,getmaxx-l3,l4);
		if(nu>=9999)then
			break;
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
										end;
		End;
		if(pxc=white)or(pxc=yellow)then
		begin
			setcolor(lightred);
			size:=3;
			SetTextStyle(DefaultFont, HorizDir, Size);
			outtextxy(5,5,'You Lose!');
			delay(1500);
			run:=false;
			break;
		end;
		fl:=0;
		if((abs(x-xr))<=10)and((abs(y-yr))<=10)then
		begin
			setcolor(black);
			for u:=1 to 3 do
				circle(xr,yr,u);
			sound(2500);
			sc:=sc+1;
			fl:=1;
			nu2:=nu2+10;
		end;
		c:=0;
		1:if(fl=1)then
		begin
			c:=0;
			xr:=random(getmaxx-100)+50;
			yr:=random(getmaxy-100)+50;
			Repeat
				c:=c+1;
				if(not(((getpixel(xr,yr)<>white)and(getpixel(xr+c,yr)<>white)
			and(getpixel(xr,yr+c)<>white)and(getpixel(xr-c,yr)<>white)
			and(getpixel(xr,yr-c)<>white))and
			(((getpixel(xr,yr)<>yellow)and(getpixel(xr+c,yr)<>yellow)
			and(getpixel(xr,yr+c)<>yellow)and(getpixel(xr-c,yr)<>yellow)
			and(getpixel(xr,yr-c)<>yellow)))))and(c=25)then
				goto 1;
			Until(((getpixel(xr,yr)<>white)and(getpixel(xr+c,yr)<>white)
			and(getpixel(xr,yr+c)<>white)and(getpixel(xr-c,yr)<>white)
			and(getpixel(xr,yr-c)<>white))and
			(((getpixel(xr,yr)<>yellow)and(getpixel(xr+c,yr)<>yellow)
			and(getpixel(xr,yr+c)<>yellow)and(getpixel(xr-c,yr)<>yellow)
			and(getpixel(xr,yr-c)<>yellow))))and(c=25);
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
			pxc:=getpixel(x+4,y);
			putpixel(x,y+1,black);
			putpixel(x,y-1,black);
			putpixel(x,y+4,black);
			putpixel(x,y-4,black);
		end;
		if(j2=2)then
		Begin
			x:=x-1;
			pxc:=getpixel(x-4,y);
			putpixel(x,y+1,black);
			putpixel(x,y-1,black);
			putpixel(x,y+4,black);
			putpixel(x,y-4,black);
		end;
		if(j2=3)then
		Begin
			y:=y-1;
			pxc:=getpixel(x,y-4);
			putpixel(x+1,y,black);
			putpixel(x-1,y,black);
			putpixel(x+4,y,black);
			putpixel(x-4,y,black);
		end;
		if(j2=4)then
		Begin
			y:=y+1;
			pxc:=getpixel(x,y+4);
			putpixel(x+1,y,black);
			putpixel(x-1,y,black);
			putpixel(x+4,y,black);
			putpixel(x-4,y,black);
		end;
		j:=j2;
		delay(8);
		nosound;
		nu:=nu+1;
		arr[nu]:=x;
		arr2[nu]:=y;
		setcolor(black);
		if(nu>=50)then
			circle(arr[nu-(nu2+40)],arr2[nu-(nu2+40)],3);
		setcolor(white);
		circle(x,y,3);
		if(nu>=9999)then
		begin
			setcolor(lightgreen);
			size:=3;
			SetTextStyle(DefaultFont, HorizDir, Size);
			outtextxy(5,5,'You Win!');
			delay(2000);
			run:=false;
			break;
		end;
	End;
	closegraph;
	gettime(s,s2,s3,s4);
	sn:=(s2*60)+s3;
	tn:=(t2*60)+t3;
	textcolor(lightgreen);
	textcolor(yellow);
	write('Your snake ate ',sc,' food(s) from ',sc+1,' food(s)');
	textcolor(lightgreen);
	writeln(' in ',sn-tn,' second(s).');
	delay(2000);
	readln;
	CLRSCR;
		 textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(str);
		 Assign(tex,'Scores\Snake.txt');
			Append(tex);
			writeln(tex,str,': ',sc);
			close(tex);
End.