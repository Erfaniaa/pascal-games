Uses Crt,Graph,UseMouse;
Var
	 GD,GM,X,X2,Y2,Y,I,PXC,C,Co:integer;
	 a,b:longint;
	 Ch:Char;
Begin
		 clrscr;
		 textcolor(white);
		 writeln('-- Paint Program -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('You can draw! You are free to darw!');
		 textcolor(white);
		 writeln;
		 writeln('Graphic controls:');
		 textcolor(yellow);
		 writeln('Increase brush size:X');
		 writeln('Decrease brush size:Z');
		 writeln('Getpixelcolor      :Rightclick');
		 writeln('Clear screen       :C');
		 writeln('Painting           :Leftclick');
		 writeln('Eraser             :Click on Eraser');
		 writeln;
		 textcolor(white);
		 writeln('Text controls:');
		 textcolor(yellow);
		 writeln('Into the graphic mode:Enter');
		 writeln('Into the text mode   :T');
		 writeln('Next line            :Tab');
		 writeln;
		 writeln;
		 textcolor(lightred);
		 writeln('Exit :Click on X (on the corner of screen)');
		 textcolor(black);
		 readln;
		 initGraph(GD,GM,'');
		 y:=20;
		 Repeat
			setfillstyle(1,i);
			bar(20,y,20+8,y+8);
			inc(i);
			inc(y,12);
		 Until(i=16);
		 initMouse;
		 showmouse;
		 SetMouseSpeed(1,1);
		 a:=2;
		 b:=1;
		 setcolor(white);
		 setfillstyle(1,white);
		 {bar(0,0,getmaxx,getmaxy);}
		 While(True)Do
		 Begin
					C:=GetColor;
					SetColor(LightRed);
					line(633,3,637,7);
					line(633,7,637,3);

					if(B=1)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					FillEllipse(25,5,5,5);
					if(B=2)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					Circle(40,5,5);
					if(B=3)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					Bar(55,0,65,10);
					if(B=4)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					Rectangle(70,0,80,10);
					if((CH='t')or(CH='T'))and(getmX+10>40)and(getmY-10>30)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					Rectangle(100,0,135,12);
					OutTextXY(103,3,'Text');
					SetColor(Yellow);
					Rectangle(40,20,GetmaxX,GetmaxY);
					if(C=Black)then
						SetColor(Yellow)
					else
						SetColor(White);
					Rectangle(150,0,201,12);
					OutTextXY(153,3,'Eraser');
					SetFillStyle(1,C);
					SetColor(Yellow);
					Rectangle(215,0,265,12);
					Bar(216,1,264,11);

					SetColor(C);
					SetFillStyle(1,C);
					X:=GetMX+15;
					Y:=GetMY-10;
					X2:=X;
					Y2:=Y;
					PXC:=GetPixel(GetMX-1,GetMY-1);
					if(getmb=2)then
					begin
						SetFillStyle(1,PXC);
						SetColor(PXC);
						Co:=PXC;
						SetFillStyle(1,Black);
					end;
					if(getmy-1<=10)and(getmb=1)then
					begin
						if(getmx-1>=20)and(getmx-1<=30)then
							b:=1;
						if(getmx-1>=35)and(getmx-1<=45)then
							b:=2;
						if(getmx-1>=55)and(getmx-1<=65)then
							b:=3;
						if(getmx-1>=70)and(getmx-1<=80)then
							b:=4;
					end;
					ShowMouse;
					SetMouseSpeed(1,1);
					if(getmx>=630)and(getmy<=10)and(getmb=1)then
						Exit;
					if(getmb=1)and(getmy-(2*a)>20)and(getmx-(2*a)>40)then
					begin
					if(b=2)then
						circle(getmx-(a+1),getmy-(a+1),a);
					if(b=1)then
						fillellipse(getmx-(a+1),getmy-(a+1),a,a);
					if(b=4)then
						rectangle(getmx-2*a,getmy-2*a,getmx-1,getmy-1);
					if(b=3)then
						bar(getmx-2*a,getmy-2*a,getmx-1,getmy-1);
					end;
					if (getmb=1)and(getmy<12)and(getmx<200)and(getmx>150) then
								begin
									setcolor(black);
									setfillstyle(1,black);
									a:=5;
								end;
					if (keypressed) then
						begin
								Ch:=readkey;
								if ((Ch='z')or(Ch='Z'))and(a>1) then
									a:=a-1;
								if ((Ch='x')or(Ch='X'))and(a<15) then
									a:=a+1;
								if (CH='C')or(CH='c') then
								begin
									HideMouse;
									setfillstyle(1,black);
									setcolor(black);
									bar(41,21,GetMaxX-1,GetMaxY-1);
									setfillstyle(1,C);
									setcolor(C);
									ShowMouse;
								end;
								{if (CH='A')or(CH='a') then
								begin
								if(getmb=1)and(getmy-(2*a)>20)and(getmx-(2*a)>40)then
					begin
					if(b=2)then
						circle(getmx-(a+1),getmy-(a+1),a);
					if(b=1)then
						fillellipse(getmx-(a+1),getmy-(a+1),a,a);
					if(b=4)then
						rectangle(getmx-2*a,getmy-2*a,getmx-1,getmy-1);
					if(b=3)then
						bar(getmx-2*a,getmy-2*a,getmx-1,getmy-1);
					end;
								end;}
						if((CH='t')or(CH='T'))and(getmX+10>40)and(getmY-10>30)then
						Begin

					if((CH='t')or(CH='T'))and(getmX+10>40)and(getmY-10>30)then
					begin
						SetColor(Yellow);
						SetFillStyle(1,Yellow)
					end
					else
					begin
						SetColor(White);
						SetFillStyle(1,White);
					end;
					Rectangle(100,0,135,12);
					OutTextXY(103,3,'Text');
						SetColor(C);
						While(CH<>#13)Do
						Begin
							CH:=ReadKey;
							if(CH=#9)then
							begin
								inc(Y,10);
								X:=X2;
							end;
							{if(CH=#27)then
							begin
								TextColor(Black);
								SetFillStyle(1,Black);
								Bar(X2,Y2+8,X,Y+8);
								TextColor(C);
								SetFillStyle(1,C);
								Break;
							end;}
							if(CH=#8)then
							begin
								{Dec(X,8);}
								SetFillStyle(1,0);
								Bar(X,Y,X+8,Y+8);
								SetFillStyle(1,CO);
							end;
							if(X<=GetMaxX-9)then
							begin
								if(CH in[' '..'~'])then
									inc(X,8);
								if(CH=#8)and(X>X2)then
									Dec(X,8);
							end
							else
							begin
								inc(Y,10);
								X:=X2+8;
							end;
							if(CH in[' '..'~'])then
								OutTextXY(X,Y,CH);
						End;
						End;
								{if (ord(Ch)in[49..53]) then
									b:=ord(ch)-48;}
						end;
		 End;
End.