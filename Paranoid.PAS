Program
	Paranoid;

Uses
	Crt,Graph;
Var
	a,x,x2,y,y2,gd,gm,co,co2,b,i,t,o,j,pxc,pxc2,pxc3,pxc4,pxc5:integer;
	arx,ary,crx,cry:array[0..1]of integer;
	brx,bry:array[0..101]of integer;
	col:array[-11..101]of shortint;
	br:array[0..101]of boolean;
	cc,cc2,fl,n,d,j2,con:integer;
	Run:boolean;
	ch:byte;
	u:text;
	s:string;
Begin
	clrscr;
	textcolor(white);
	writeln('-- Paranoid Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You must get rectangles with your ball.');
	writeln('There are 10 levels in the game.');
	writeln('In each level you have 5 balls.');
	writeln;
	textcolor(yellow);
	writeln('You must move the red pad with these keys:');
	textcolor(white);
	writeln('Right Shift');
	writeln('Left  Shift');
	writeln;
	textcolor(lightred);
	writeln('Space:  Toggle speed-up');
	writeln('Esc  :  Exit');
	textcolor(black);
	readln;
	randomize;
	gd:=detect;
	t:=1;
	Run:=true;
	While(Run)Do
	Begin
	initgraph(gd,gm,' ');
	x:=0;
	y:=0;
	i:=0;
	for b:=1 to t do
	begin
	co2:=co;
	if((i+1)mod t=0)then
		br[i+1]:=true;
	brx[i+1]:=x;
	bry[i+1]:=y;
	Repeat
		co:=random(16);
		col[i+1]:=co;
	Until(co in[8..15])and(col[i+1]<>col[i-(t-1)])and(col[i+1]<>col[i-9]);
	setfillstyle(solidfill,co);
	if((i+1)mod t=0)then
		bar(x+1,y+1,x+(getmaxx div 10)+1,y+(getmaxy div 15)+1);
	for a:=1 to 10 do
	begin
		i:=i+1;
		if(i mod t=0)then
			br[i]:=true;
		brx[i]:=x;
		bry[i]:=y;
		Repeat
			co:=random(16);
			col[i]:=co;
		Until(co in[8..15])and(col[i]<>col[i-t])and(col[i]<>col[i-10]);
		setfillstyle(solidfill,co);
		if(i mod t=0)then
			bar(x+1,y+1,x+(getmaxx div 10)+1,y+(getmaxy div 15)+1);
		x:=x+(getmaxx div 10);
	end;
		x:=0;
		y:=y+(getmaxy div 15);
	end;
	i:=1;
	Run:=true;
	x2:=getmaxx div 2;
	y2:=t*(getmaxy div 15)+15;
	j:=((random(2)+1)*2)-1;
	crx[i]:=(getmaxx div 2)-30;
	cry[i]:=getmaxy-15;
	cc:=0;
	cc2:=0;
	fl:=0;
	j2:=0;
	con:=-1;
	While(Run)Do
	Begin
		con:=con+1;
		if(con=3000)then
			con:=1;
		setcolor(red);
		setfillstyle(1,4);
		bar(0,-10,getmaxx-6,1);
		setcolor(green);
		setfillstyle(1,green);
		bar(-10,0,1,getmaxy);
		bar(getmaxx-6,0,getmaxx-5,getmaxy);
		if(x2=getmaxx div 2)and(y2=t*(getmaxy div 15)+15)and(fl=0)and(con=0)then
		begin
			setcolor(yellow);
			outtextxy(getmaxx div 2-90,t*(getmaxy div 15)+20,'Press Enter to begin');
			While(True)Do
				if(ReadKey=#13)Then
					Break;
			setcolor(black);
			outtextxy(getmaxx div 2-90,t*(getmaxy div 15)+20,'Press Enter to begin');
		end;
		arx[i-1]:=arx[i];
		ary[i-1]:=ary[i];
		setcolor(white);
		setfillstyle(solidfill,white);
		if(arx[i]<>0)then
			fillellipse(arx[i],ary[i],3,3);

		crx[i-1]:=crx[i];
		cry[i-1]:=cry[i];
		setcolor(red);
		setfillstyle(solidfill,red);
		if(crx[i]<>0)then
			bar(crx[i],cry[i],crx[i]+80,cry[i]+10);

		if(j=1)or(j=2)then
		begin
			j:=1;
			y2:=y2+1;
			x2:=x2-1;
			pxc:=getpixel(x2-3,y2+3);
		end;
		if(j=3)or(j=4)then
		begin
			j:=3;
			y2:=y2+1;
			x2:=x2+1;
			pxc:=getpixel(x2+3,y2+3);
		end;
		if(j=7)or(j=8)then
		begin
			j:=7;
			y2:=y2-1;
			x2:=x2-1;
			pxc:=getpixel(x2-3,y2-3);
		end;
		if(j=9)or(j=10)then
		begin
			j:=9;
			y2:=y2-1;
			x2:=x2+1;
			pxc:=getpixel(x2+3,y2-3);
		end;
		i:=1;
		if(ary[i]>=getmaxy-10)then
		begin
			cc2:=cc2+1;
			x2:=getmaxx div 2;
			y2:=t*(getmaxy div 15)+15;
			crx[i]:=(getmaxx div 2)-30;
			cry[i]:=getmaxy-15;
			j:=((random(2)+1)*2)-1;
			fl:=1;
		end;
		if(pxc<>black)then
		begin
			sound(2500);
			if(pxc=red)then
			begin
				if((abs(crx[i]-arx[i])<=5)or(crx[i]+80-arx[i]<=5))and
				(ary[i]>getmaxy div 2)then
				begin
					if(j=1)and(crx[i]+80-arx[i]<=5)and
					(ary[i]>getmaxy div 2)then
						j:=10;
					if(j=3)and(abs(crx[i]-arx[i])<=5)and
					(ary[i]>getmaxy div 2)then
						j:=8;
				end;
				if(ary[i]>getmaxy div 2)then
				begin
					if(j=1)then
						j:=8;
					if(j=3)then
						j:=10;
				end;
				if(ary[i]<getmaxy div 2)then
				begin
					if(j=7)then
						j:=1;
					if(j=9)then
						j:=3;
				end;
			end;
			if(pxc=green)then
			begin
				if(j=1)then
					j:=4;
				if(j=3)then
					j:=1;
				if(j=7)then
					j:=10;
				if(j=9)then
					j:=7;
			end;
			if(pxc<>green)and(pxc<>red)then
			begin
				for i:= 0 to a*b+1 do
				begin
					if(((x2-brx[i]<=(getmaxx div 10)+4)and
					(x2>=brx[i]))or((brx[i]-x2<=4)and
					(brx[i]>=x2)))and
					(((y2-bry[i]<=(getmaxy div 15)+4)and
					(y2>=bry[i]))or((bry[i]-y2<=4)and
					(bry[i]>=y2)))and(i mod t=0)and(br[i])then
					begin
						pxc2:=getpixel(x2-3,y2-3);
						pxc3:=getpixel(x2+3,y2-3);
						pxc4:=getpixel(x2+3,y2+3);
						pxc5:=getpixel(x2-3,y2+3);

						{if(pxc4=black)and(j=1)and(pxc2<>red)and(pxc2<>green)and(pxc2<>black)
						and(x2-brx[i]<=(getmaxx div 10)+5)and(bry[i]-y2<=5)then
							j:=10;
						if(pxc2=black)and(j=3)and(pxc4<>red)and(pxc4<>green)and(pxc4<>black)
						and(x2-brx[i]<=5)and(bry[i]-y2<=5)then
							j:=8;
						if(pxc3=black)and(j=7)and(pxc5<>red)and(pxc5<>green)and(pxc5<>black)
						and(x2-brx[i]<=(getmaxx div 10)+5)and(bry[i]-y2<=(getmaxy div 15)+5)then
							j:=4;
						if(pxc5=black)and(j=9)and(pxc3<>red)and(pxc3<>green)and(pxc3<>black)
						and(x2-brx[i]<=5)and(bry[i]-y2<=(getmaxy div 15)+5)then
							j:=2;}

						if(pxc2=black)and((j=9)or(j=1))then
							j:=8;
						if(pxc3=black)and((j=7)or(j=3))then
							j:=10;
						if(pxc5=black)and((j=7)or(j=3))then
							j:=2;
						if(pxc4=black)and((j=9)or(j=1))then
							j:=4;
						if(pxc2=black)and((j=9)or(j=1))then
							j:=8;
						if(pxc3=black)and((j=7)or(j=3))then
							j:=10;
						setfillstyle(solidfill,black);
						bar(brx[i]+1,bry[i]+1,brx[i]+(getmaxx div 10)+1,bry[i]+(getmaxy div 15)+1);
						br[i]:=false;
						cc:=cc+1;
					end;
				end;
			end;
		end;
		i:=1;
		arx[i]:=x2;
		ary[i]:=y2;
		setcolor(black);
		setfillstyle(solidfill,black);
		if(j2=1)then
			d:=2
		else
			d:=5;
		delay(d);
		nosound;
		if(arx[i-1]<>0)then
			fillellipse(arx[i-1],ary[i-1],3,3);
		setcolor(white);
		setfillstyle(solidfill,white);
		if(arx[i]<>0)then
			fillellipse(arx[i],ary[i],3,3);
		{if(keypressed)then
		Begin
			ch:=readkey;
			if(ord(ch)=27)then
			begin
				run:=false;
				break;
			end;
		if(ch=' ')and(j2=1)then
			j2:=0
		else
			if(ch=' ')then
				j2:=1;
		if(ch=chr(0))then begin
				ch:=readkey;
		if(ord(ch)=77)and(crx[i]+70<getmaxx-20)then
			crx[i]:=crx[i]+10;
		if(ord(ch)=77)and(getmaxx-(crx[i]+60)<=10)then
			crx[i]:=crx[i]+(getmaxx-crx[i])-8;
		if(ord(ch)=75)and(crx[i]-10>0)then
			crx[i]:=crx[i]-10;
		if(ord(ch)=75)and(crx[i]<=10)then
			crx[i]:=crx[i]-(crx[i]-2);
										 end;
		End;}

		ch:=port[$60];
			if(ch=1)then
			begin
				run:=false;
				break;
			end;
		if(ch=57)and(j2=1)and(ch<>42)and(ch<>72)then
			j2:=0
		else
			if(ch=57)and(ch<>42)and(ch<>72)then
				j2:=1;
		if(ch=54)and(crx[i]+70<getmaxx-20)and(ch<>42)and(ch<>72)then
			crx[i]:=crx[i]+2;
		if(ch=54)and(getmaxx-(crx[i]+60)<=10)and(ch<>42)and(ch<>72)then
			crx[i]:=crx[i]+(getmaxx-crx[i])-8;
		if(ch=42)and(crx[i]-2>3)and(ch<>72)then
			crx[i]:=crx[i]-2;
		{if(ch=42)and(crx[i]<=)and(ch<>72)then
			crx[i]:=crx[i]-(crx[i]-2);}

		setcolor(black);
		setfillstyle(solidfill,black);
		bar(2,cry[i-1],crx[i]-1,cry[i-1]+10);
		bar(crx[i]+81,cry[i-1],getmaxx-9,cry[i-1]+10);
		setcolor(red);
		setfillstyle(solidfill,red);
		bar(crx[i],cry[i],crx[i]+80,cry[i]+10);
		if(cc>=10)then
		begin
			setcolor(lightgreen);
			SetTextStyle(DefaultFont, HorizDir, 2);
			outtextxy(getmaxx div 2-70,t*(getmaxy div 15)+25,'You Win!');
			x2:=getmaxx div 2;
			y2:=t*(getmaxy div 15)+15;
			j:=((random(2)+1)*2)-1;
			crx[i]:=(getmaxx div 2)-30;
			cry[i]:=getmaxy-15;
			if(t>10)then
			begin
				setcolor(yellow);
				outtextxy(getmaxx div 2-65,t*(getmaxy div 15)+75,'The End!');
				delay(1000);
				run:=false;
			end;
			delay(1000);
			break;
		end;
		if(cc2>=5)then
		begin
			setcolor(lightred);
			SetTextStyle(DefaultFont, HorizDir, 2);
			outtextxy(getmaxx div 2-70,t*(getmaxy div 15)+25,'You Lose!');
			x2:=getmaxx div 2;
			y2:=t*(getmaxy div 15)+15;
			j:=((random(2)+1)*2)-1;
			crx[i]:=(getmaxx div 2)-30;
			cry[i]:=getmaxy-15;
			if(t>10)then
			begin
				setcolor(yellow);
				outtextxy(getmaxx div 2-65,t*(getmaxy div 15)+75,'The End!');
				delay(1000);
			end;
			delay(1000);
			run:=false;
		end;
	End;
	restorecrtmode;
	clrscr;
	textcolor(lightgreen);
	write('You got ');
	textcolor(yellow);
	write(cc);
	textcolor(lightgreen);
	write(' point(s) from ');
	textcolor(yellow);
	write(10);
	textcolor(lightgreen);
	write(' points in level ');
	textcolor(yellow);
	write(t);
	textcolor(lightgreen);
	write(' with ');
	textcolor(yellow);
	write(cc2+1);
	textcolor(lightgreen);
	writeln(' ball(s)!');
	if(cc>=10)then
		t:=t+1;
	ary[1]:=t*(getmaxy div 15)+15;
	ary[0]:=t*(getmaxy div 15)+15;
			 readln;
		 CLRSCR;
		 {textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(u,'Scores\Paranoid.txt');
		 Append(u);
		writeln(u,S,':  level: ',t,' point: ',cc,' balls: ',cc2+1);
		close(u); }

	End;
End.