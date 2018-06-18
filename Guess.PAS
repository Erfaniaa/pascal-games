uses crt,graph;
var
	a:array[1..10] of integer;
		b:array[1..10] of integer;
			c:array[1..10] of integer;
			d:array[1..10] of integer;
		e:array[1..10] of integer;
	f:array[1..10] of integer;
						gd,gm,i,r1,r2,r3,r4,fr,z,v,p,score,n:integer;
						s:string;
						u:text;
	begin
	clrscr;
	textcolor(white);
	writeln('-- Guess Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You must count or guess:');
	writeln('How many small circles did you see?');
	writeln;
	textcolor(lightred);
	writeln('Esc  :  Exit');
	writeln;
	textcolor(white);
	writeln('Enter a number:');
	textcolor(lightgreen);
	writeln('I want to play this game     time(s).');
	GoToXY(27,9);
	textcolor(yellow);
	Read(n);
	textcolor(black);
	readln;
	randomize;
		gd:=detect;
		initgraph(gd,gm,'');
		while(i<10)do
			begin
				 i:=i+1;
				 a[i]:=random(getmaxx-40)+10;
					b[i]:=random(getmaxx-40)+10;
						c[i]:=random(getmaxx-40)+10;
						d[i]:=random(getmaxy-40)+10;
					e[i]:=random(getmaxy-40)+10;
				 f[i]:=random(getmaxy-40)+10;
			end;
			i:=0;
			z:=1;
	 while(v<n)do
	 begin
	 setcolor(27+3);
		Rectangle(getmaxx,getmaxy,1,1);
		v:=v+1;
			while(fr<z)do
			begin
			r4:=random(5)+1;
				while(i<10)do
					begin
						i:=i+1;
						SetFillStyle(1,r4);
						if(v>=1)then
							FillEllipse(a[i],f[i],8,8);
						if(v>=2)then
							FillEllipse(b[i],e[i],8,8);
						if(v=3)then
							FillEllipse(c[i],d[i],8,8);
					end;
						fr:=fr+1;
						end;
					fr:=0;
					i:=0;
					while(i<1)do
					begin
						 r1:=random(10)+8;
						 i:=i+1;
				end;
				i:=0;
						 while(i<r1)do
						 begin
							i:=i+1;
							SetFillStyle(1,17);
							r2:=random(getmaxx-30)+10;
							r3:=random(getmaxy-30)+10;
							FillEllipse(r2,r3,2,2);
						 end;
						 delay(6000);
						 ClearDevice;
						 RestoreCrtMode;
						 textcolor(lightgreen);
						 writeln('How many small circles did you see?');
						 textcolor(yellow);
						 readln(p);
						 initgraph(GD,GM,'');
						 score:=score+((r1*10)-((abs(p-r1))*10));
						 i:=0;
		 end;
		 closegraph;
		 clrscr;
		 textcolor(lightgreen);
		 write('You got ');
		 textcolor(yellow);
		 write(score);
		 textcolor(lightgreen);
		 write(' point(s)!');
		 readln;
		 CLRSCR;
		 textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(u,'Scores\Guess.txt');
		 Append(u);
		writeln(u,S,': ',score);
		close(u);
end.
