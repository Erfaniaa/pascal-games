uses crt,graph,dos;
var
	gd,gm,op,op2,x1,y1,n,fkhat,pxccircle,pxccircle2,h,colormar2,n1,n2,m1,m2,colormar1,pxc1,pxc2,v1,score:integer;
	colormar:array[3..22] of integer;
	b:array[1..20] of integer;
	c:array[1..20] of integer;
	pxcq:array[1..20] of integer;
	f:array[1..10] of integer;
	u:text;
	s:string;
	clidj:char;
	zarbeh,khat:boolean;
	hours1,min1,sanie1,nbf,hours2,min2,sanie2,nbf2:word;
begin
	clrscr;
	textcolor(white);
	writeln('-- Floors Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You arrive top the building with these arrow keys.');
	textcolor(yellow);
	writeln('Up');
	writeln('Right');
	writeln('Left');
	writeln;
	textcolor(lightred);
	writeln('Escape:  Exit');
	textcolor(black);
	readln;
	randomize;
	gettime(hours1,min1,sanie1,nbf);
	textcolor(lightblue+blink);
	gotoxy(getmaxx,getmaxy);
	clrscr;
	op:=3;
	while(op<22)do
	begin
		colormar[op]:=6;
		op:=op+1;
		colormar[op]:=0;
		op:=op+1;
	end;
	op:=0;
	b[1]:=124;
	b[2]:=b[1]+10;
	c[1]:=10;
	c[2]:=20;
	b[3]:=170;
	b[4]:=b[3]+10;
	c[3]:=10;
	c[4]:=20;
	b[5]:=310;
	b[6]:=b[5]+10;
	c[5]:=10;
	c[6]:=20;
	b[7]:=100;
	b[8]:=b[7]+10;
	c[7]:=10;
	c[8]:=20;
	b[9]:=50;
	b[10]:=b[9]+10;
	c[9]:=10;
	c[10]:=20;
	b[11]:=150;
	b[12]:=200;
	b[13]:=240;
	b[14]:=b[13]+10;
	c[11]:=10;
	c[12]:=20;
	c[13]:=10;
	c[14]:=20;
	c[15]:=10;
	c[16]:=20;
	b[15]:=130;
	b[16]:=b[15]+10;
	c[17]:=10;
	c[18]:=20;
	b[17]:=150;
	b[18]:=b[17]+10;
	c[19]:=10;
	c[20]:=20;
	b[19]:=290;
	b[20]:=b[19]+10;
	f[10]:=1;
	f[9]:=1;
	f[7]:=1;
	f[6]:=1;
	f[4]:=1;
	f[5]:=1;
	f[3]:=1;
	f[2]:=1;
	f[8]:=1;
	n1:=10;
	n2:=20;
	colormar2:=0;
	m1:=220;
	m2:=230;
	v1:=1;
	f[1]:=1;
	colormar1:=6;
	gd:=detect;
	initgraph(gd,gm,'');
	zarbeh:=true;
	khat:=true;
	x1:=getmaxx div 2;
	y1:=getmaxy+5;
		while(khat)do
			begin
				 Setcolor(12);
				 fkhat:=fkhat+39;
				 line(3,fkhat,getmaxx-3,fkhat);
				 rectangle(getmaxx,getmaxy,0,0);
				 if(fkhat>=(getmaxy+(getmaxy div 4)))then
						khat:=false;
			end;
	setcolor(3);
	SetFillStyle(1,3);
	fillellipse(x1,y1,13,13);
	op2:=1;
	while(zarbeh)do
	Begin
		if(op=1)and(op2<>0)then
		begin
			sound(1230);
			op2:=0;
		end;
		while(keypressed)do
		begin
				setcolor(0);
				setfillstyle(1,0);
				fillellipse(x1,y1,13,13);
				setcolor(3);
				SetFillStyle(1,3);
				fkhat:=0;
				khat:=true;
				 clidj:=readkey;
				 if(clidj=#27)then
				 begin
						zarbeh:=false;
						break;
				 end;
					 if(clidj=#0)and(op>0)then
						 begin
								nosound;
								clidj:=readkey;
									if(clidj=#72)then
										begin
										nosound;
											sound(1321);
											y1:=y1-39;
											pxccircle:=getpixel(x1+13,y1);
											pxccircle2:=getpixel(x1-13,y1);
											h:=h+1;
											delay(20);
											nosound;
										end;
									if(clidj=#75)and(x1>7)then
										x1:=x1-8;
									if(clidj=#77)and(x1<getmaxx-7)then
										x1:=x1+8;
										if(pxccircle=6)or(pxccircle2=6)then
											h:=12;
									if(h>=12)then
										begin
										 zarbeh:=false;
										 break;
										end;
										nosound;
							end;
					fillellipse(x1,y1,13,13);
				end;
				pxccircle:=getpixel(x1+13,y1);
				pxccircle2:=getpixel(x1-13,y1);
				if(pxccircle=6)or(pxccircle2=6)then
					break;
				nosound;
				Setcolor(12);
				{delay(20);}
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar1);
				setfillstyle(1,colormar1);
				bar(getmaxx-(getmaxx-m1),getmaxy-39,getmaxx-(getmaxx-m2),getmaxy-20);
				pxc1:=getpixel(getmaxx-(m1+1),getmaxy-39);
					if(pxc2=12)then
						colormar1:=6;
					if(pxc1=12)then
						colormar2:=6;
					setcolor(colormar2);
					setfillstyle(1,colormar2);
					bar(getmaxx-(getmaxx-n1),getmaxy-39,getmaxx-(getmaxx-n2),getmaxy-20);
					pxc2:=getpixel(getmaxx-(n1+1),getmaxy-39);
				 {	if(pxc1=3) or (pxc2=3)then
					break;}
					if((pxc1=12)and(pxc2=0))or((pxc2=12)and(pxc1=0))then
					begin
						if(pxc2=12)then
							colormar2:=0
						else
							colormar2:=6;
						if(pxc1=12)then
							colormar1:=0
						else
							colormar1:=6;
						v1:=v1*-1;
					end;
					m1:=m1+(1*v1);
					m2:=m2+(1*v1);
					n1:=n1+(1*v1);
					n2:=n2+(1*v1);
				setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[3]);
				setfillstyle(1,colormar[3]);
				bar(getmaxx-(getmaxx-b[1]),getmaxy-78,getmaxx-(getmaxx-b[2]),getmaxy-60);
				pxcq[1]:=getpixel(getmaxx-(b[1]+1),getmaxy-78);
					if(pxcq[2]=12)then
						colormar[3]:=6;
					if(pxcq[1]=12)then
						colormar[4]:=6;
					setcolor(colormar[4]);
					setfillstyle(1,colormar[4]);
					bar(getmaxx-(getmaxx-c[1]),getmaxy-78,getmaxx-(getmaxx-c[2]),getmaxy-60);
					pxcq[2]:=getpixel(getmaxx-(c[1]+1),getmaxy-78);
					{if(pxcq[1]=3) or (pxcq[2]=3)then
					break;}
					if((pxcq[1]=12)and(pxcq[2]=0))or((pxcq[2]=12)and(pxcq[1]=0))then
					begin
						if(pxcq[2]=12)then
						colormar[4]:=0
						else
						colormar[4]:=6;
						if(pxcq[1]=12)then
						colormar[3]:=0
						else
						colormar[3]:=6;
						f[1]:=f[1]*-1;
					end;
					b[1]:=b[1]+(1*f[1]);
					b[2]:=b[2]+(1*f[1]);
					c[1]:=c[1]+(1*f[1]);
					c[2]:=c[2]+(1*f[1]);
					setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[5]);
				setfillstyle(1,colormar[5]);
				bar(getmaxx-(getmaxx-b[3]),getmaxy-117,getmaxx-(getmaxx-b[4]),getmaxy-97);
				pxcq[3]:=getpixel(getmaxx-(b[3]+1),getmaxy-117);
					if(pxcq[4]=12)then
						colormar[5]:=6;
					if(pxcq[3]=12)then
						colormar[6]:=6;
					setcolor(colormar[6]);
					setfillstyle(1,colormar[6]);
					bar(getmaxx-(getmaxx-c[3]),getmaxy-117,getmaxx-(getmaxx-c[4]),getmaxy-97);
					pxcq[4]:=getpixel(getmaxx-(c[3]+10),getmaxy-117);
					{if(pxcq[3]=3) or (pxcq[4]=3)then
					break;}
					if((pxcq[3]=12)and(pxcq[4]=0))or((pxcq[4]=12)and(pxcq[3]=0))then
					begin
						if(pxcq[4]=12)then
						colormar[6]:=0
						else
						colormar[6]:=6;
						if(pxcq[3]=12)then
						colormar[5]:=0
						else
						colormar[5]:=6;
						f[2]:=f[2]*-1;
					end;
					b[3]:=b[3]+(1*f[2]);
					b[4]:=b[4]+(1*f[2]);
					c[3]:=c[3]+(1*f[2]);
					c[4]:=c[4]+(1*f[2]);
							setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[7]);
				setfillstyle(1,colormar[7]);
				bar(getmaxx-(getmaxx-b[5]),getmaxy-156,getmaxx-(getmaxx-b[6]),getmaxy-140);
				pxcq[5]:=getpixel(getmaxx-(b[5]+1),getmaxy-156);
					if(pxcq[6]=12)then
						colormar[7]:=6;
					if(pxcq[5]=12)then
					begin
						colormar[8]:=6;
						op:=op+1;
					end;
					setcolor(colormar[8]);
					setfillstyle(1,colormar[8]);
					bar(getmaxx-(getmaxx-c[5]),getmaxy-156,getmaxx-(getmaxx-c[6]),getmaxy-140);
					pxcq[6]:=getpixel(getmaxx-(c[5]+1),getmaxy-156);
				 {	if(pxcq[5]=3) or (pxcq[6]=3)then
					break;}
					if((pxcq[5]=12)and(pxcq[6]=0))or((pxcq[6]=12)and(pxcq[5]=0))then
					begin
						if(pxcq[6]=12)then
						begin
						colormar[8]:=0
						end
						else
						colormar[8]:=6;
						if(pxcq[5]=12)then
						colormar[7]:=0
						else
						colormar[7]:=6;
						f[3]:=f[3]*-1;
					end;
					b[5]:=b[5]+(1*f[3]);
					b[6]:=b[6]+(1*f[3]);
					c[5]:=c[5]+(1*f[3]);
					c[6]:=c[6]+(1*f[3]);
				setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[9]);
				setfillstyle(1,colormar[9]);
				bar(getmaxx-(getmaxx-b[7]),getmaxy-195,getmaxx-(getmaxx-b[8]),getmaxy-180);
				pxcq[7]:=getpixel(getmaxx-(b[7]+1),getmaxy-195);
					if(pxcq[8]=12)then
						colormar[9]:=6;
					if(pxcq[7]=12)then
						colormar[10]:=6;
					setcolor(colormar[10]);
					setfillstyle(1,colormar[10]);
					bar(getmaxx-(getmaxx-c[7]),getmaxy-195,getmaxx-(getmaxx-c[8]),getmaxy-180);
					pxcq[8]:=getpixel(getmaxx-(c[7]+1),getmaxy-195);
				{	if(pxcq[7]=3) or (pxcq[8]=3)then
					break;}
					if((pxcq[7]=12)and(pxcq[8]=0))or((pxcq[8]=12)and(pxcq[7]=0))then
					begin
						if(pxcq[8]=12)then
						colormar[10]:=0
						else
						colormar[10]:=6;
						if(pxcq[7]=12)then
						colormar[9]:=0
						else
						colormar[9]:=6;
						f[4]:=f[4]*-1;
					end;
					b[7]:=b[7]+(1*f[4]);
					b[8]:=b[8]+(1*f[4]);
					c[7]:=c[7]+(1*f[4]);
					c[8]:=c[8]+(1*f[4]);
				setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[11]);
				setfillstyle(1,colormar[11]);
				bar(getmaxx-(getmaxx-b[9]),getmaxy-234,getmaxx-(getmaxx-b[10]),getmaxy-220);
				pxcq[9]:=getpixel(getmaxx-(b[9]+1),getmaxy-234);
					if(pxcq[10]=12)then
						colormar[11]:=6;
					if(pxcq[9]=12)then
						colormar[12]:=6;
					setcolor(colormar[12]);
					setfillstyle(1,colormar[12]);
					bar(getmaxx-(getmaxx-c[9]),getmaxy-234,getmaxx-(getmaxx-c[10]),getmaxy-220);
					pxcq[10]:=getpixel(getmaxx-(c[9]+2),getmaxy-234);
					{if(pxcq[9]=3) or (pxcq[10]=3)then
					break;}
					if((pxcq[9]=12)and(pxcq[10]=0))or((pxcq[10]=12)and(pxcq[9]=0))then
					begin
						if(pxcq[10]=12)then
						colormar[12]:=0
						else
						colormar[12]:=6;
						if(pxcq[9]=12)then
						colormar[11]:=0
						else
						colormar[11]:=6;
						f[5]:=f[5]*-1;
					end;
					b[9]:=b[9]+(3*f[5]);
					b[10]:=b[10]+(3*f[5]);
					c[9]:=c[9]+(3*f[5]);
					c[10]:=c[10]+(3*f[5]);
					setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[13]);
				setfillstyle(1,colormar[13]);
				bar(getmaxx-(getmaxx-b[11]),getmaxy-273,getmaxx-(getmaxx-b[12]),getmaxy-260);
				pxcq[11]:=getpixel(getmaxx-(b[11]+1),getmaxy-273);
					if(pxcq[12]=12)then
						colormar[13]:=6;
					if(pxcq[11]=12)then
						colormar[14]:=6;
					setcolor(colormar[14]);
					setfillstyle(1,colormar[14]);
					bar(getmaxx-(getmaxx-c[11]),getmaxy-273,getmaxx-(getmaxx-c[12]),getmaxy-260);
					pxcq[12]:=getpixel(getmaxx-(c[11]+1),getmaxy-273);
					{if(pxcq[11]=3) or (pxcq[12]=3)then
					break;}
					if((pxcq[11]=12)and(pxcq[12]=0))or((pxcq[12]=12)and(pxcq[11]=0))then
					begin
						if(pxcq[12]=12)then
						colormar[14]:=0
						else
						colormar[14]:=6;
						if(pxcq[11]=12)then
						colormar[13]:=0
						else
						colormar[13]:=6;
						f[6]:=f[6]*-1;
					end;
					b[11]:=b[11]+(1*f[6]);
					b[12]:=b[12]+(1*f[6]);
					c[11]:=c[11]+(1*f[6]);
					c[12]:=c[12]+(1*f[6]);
					setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[15]);
				setfillstyle(1,colormar[15]);
				bar(getmaxx-(getmaxx-b[13]),getmaxy-312,getmaxx-(getmaxx-b[14]),getmaxy-300);
				pxcq[13]:=getpixel(getmaxx-(b[13]+1),getmaxy-312);
					if(pxcq[14]=12)then
						colormar[15]:=6;
					if(pxcq[13]=12)then
						colormar[16]:=6;
					setcolor(colormar[16]);
					setfillstyle(1,colormar[16]);
					bar(getmaxx-(getmaxx-c[13]),getmaxy-312,getmaxx-(getmaxx-c[14]),getmaxy-300);
					pxcq[14]:=getpixel(getmaxx-(c[13]+1),getmaxy-312);
					{if(pxcq[13]=3) or (pxcq[14]=3)then
					break;}
					if((pxcq[13]=12)and(pxcq[14]=0))or((pxcq[14]=12)and(pxcq[13]=0))then
					begin
						if(pxcq[14]=12)then
						colormar[16]:=0
						else
						colormar[16]:=6;
						if(pxcq[13]=12)then
						colormar[15]:=0
						else
						colormar[15]:=6;
						f[7]:=f[7]*-1;
					end;
					b[13]:=b[13]+(1*f[7]);
					b[14]:=b[14]+(1*f[7]);
					c[13]:=c[13]+(1*f[7]);
					c[14]:=c[14]+(1*f[7]);
							setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[17]);
				setfillstyle(1,colormar[17]);
				bar(getmaxx-(getmaxx-b[15]),getmaxy-351,getmaxx-(getmaxx-b[16]),getmaxy-340);
				pxcq[15]:=getpixel(getmaxx-(b[15]+1),getmaxy-351);
					if(pxcq[16]=12)then
						colormar[17]:=6;
					if(pxcq[15]=12)then
						colormar[18]:=6;
					setcolor(colormar[18]);
					setfillstyle(1,colormar[18]);
					bar(getmaxx-(getmaxx-c[15]),getmaxy-351,getmaxx-(getmaxx-c[16]),getmaxy-340);
					pxcq[16]:=getpixel(getmaxx-(c[15]+1),getmaxy-351);
					{if(pxcq[15]=3) or (pxcq[16]=3)then
					break;}
					if((pxcq[15]=12)and(pxcq[16]=0))or((pxcq[16]=12)and(pxcq[15]=0))then
					begin
						if(pxcq[16]=12)then
						colormar[18]:=0
						else
						colormar[18]:=6;
						if(pxcq[15]=12)then
						colormar[17]:=0
						else
						colormar[17]:=6;
						f[8]:=f[8]*-1;
					end;
					b[15]:=b[15]+(1*f[8]);
					b[16]:=b[16]+(1*f[8]);
					c[15]:=c[15]+(1*f[8]);
					c[16]:=c[16]+(1*f[8]);
					setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[19]);
				setfillstyle(1,colormar[19]);
				bar(getmaxx-(getmaxx-b[17]),getmaxy-390,getmaxx-(getmaxx-b[18]),getmaxy-375);
				pxcq[17]:=getpixel(getmaxx-(b[17]+1),getmaxy-390);
					if(pxcq[18]=12)then
						colormar[19]:=6;
					if(pxcq[17]=12)then
						colormar[20]:=6;
					setcolor(colormar[20]);
					setfillstyle(1,colormar[20]);
					bar(getmaxx-(getmaxx-c[17]),getmaxy-390,getmaxx-(getmaxx-c[18]),getmaxy-375);
					pxcq[18]:=getpixel(getmaxx-(c[17]+2),getmaxy-390);
					{if(pxcq[17]=3) or (pxcq[18]=3)then
					break;}
					if((pxcq[17]=12)and(pxcq[18]=0))or((pxcq[18]=12)and(pxcq[17]=0))then
					begin
						if(pxcq[18]=12)then
						colormar[20]:=0
						else
						colormar[20]:=6;
						if(pxcq[17]=12)then
						colormar[19]:=0
						else
						colormar[19]:=6;
						f[9]:=f[9]*-1;
					end;
					b[17]:=b[17]+(4*f[9]);
					b[18]:=b[18]+(4*f[9]);
					c[17]:=c[17]+(4*f[9]);
					c[18]:=c[18]+(4*f[9]);
					setcolor(12);
				rectangle(getmaxx,getmaxy,0,0);
				setcolor(colormar[21]);
				setfillstyle(1,colormar[21]);
				bar(getmaxx-(getmaxx-b[19]),getmaxy-429,getmaxx-(getmaxx-b[20]),getmaxy-410);
				pxcq[19]:=getpixel(getmaxx-(b[19]+1),getmaxy-429);
					if(pxcq[20]=12)then
						colormar[21]:=6;
					if(pxcq[19]=12)then
						colormar[22]:=6;
					setcolor(colormar[22]);
					setfillstyle(1,colormar[22]);
					bar(getmaxx-(getmaxx-c[19]),getmaxy-429,getmaxx-(getmaxx-c[20]),getmaxy-410);
					pxcq[20]:=getpixel(getmaxx-(c[19]+2),getmaxy-429);
					{if(pxcq[19]=3) or (pxcq[20]=3)then
					break;}
					if((pxcq[19]=12)and(pxcq[20]=0))or((pxcq[20]=12)and(pxcq[19]=0))then
					begin
						if(pxcq[20]=12)then
						colormar[22]:=0
						else
						colormar[22]:=6;
						if(pxcq[19]=12)then
						colormar[21]:=0
						else
						colormar[21]:=6;
						f[10]:=f[10]*-1;
					end;
					b[19]:=b[19]+(4*f[10]);
					b[20]:=b[20]+(4*f[10]);
					c[19]:=c[19]+(4*f[10]);
					c[20]:=c[20]+(4*f[10]);
	end;
	nosound;
	nosound;
	gettime(hours2,min2,sanie2,nbf2);
	if(min2<min1)then
		begin
			min2:=min2+60;
			hours2:=hours2-1;
		end;
	if(sanie2<sanie1)then
		begin
			sanie2:=sanie2+60;
			min2:=min2-1;
		end;
	if(nbf2<nbf)then
		begin
			nbf2:=nbf2+100;
			sanie2:=sanie2-1;
		end;
	score:=score+(nbf2-nbf);
	score:=score+(sanie2-sanie1);
	score:=score+(min2-min1);
	score:=score+(hours2-hours1);
	setcolor(green+blink);
	if(h>=12) and ((pxccircle<>6)and(pxccircle2<>6))then
	begin
	h:=h*80;
	score:=1000+(score-h);
	closegraph;
	textcolor(lightgreen);
	Writeln('You Win!');
	end
	else
	begin
		closegraph;
		textcolor(lightred);
		Writeln('You Lose!');
	end;
	if(h>=12)then
	begin
			TextColor (10);
			Write ('You got ');
			TextColor (Yellow);
			Write (score);
			Textcolor (10);
			Write (' points!');
			end; readln;
			clrscr;
			textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(u,'Scores\Floors.txt');
			Append(u);
			writeln(u,S,': ',score);
			close(u);
end.