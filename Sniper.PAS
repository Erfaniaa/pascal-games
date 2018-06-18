program Sniper;
uses graph,crt;
var
	gd,gm,x,y,x1,y1,x2,y2,xx,jahat,jahat2,ball,score,d:integer;
	f:text;
	s:string;
begin
		 clrscr;
		 textcolor(white);
		 writeln('-- Sniper Game -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('You should shoot ten bullets to the green pad.');
		 writeln('Get more than four points to win.');
		 writeln;
		 textcolor(yellow);
		 writeln('Controls:');
		 textcolor(white);
		 writeln('Space:  Shoot');
		 writeln('Esc  :  Exit');
		 textcolor(black);
		 readln;
		 randomize;
		 gd:=detect;
		 x1:=630;
		 y1:=210;
		 x2:=640;
		 y2:=270;
		 x:=147;
		 y:=223;
		 ball:=10;
		 d:=6;
		 jahat:=(random(2))+1;
		 initgraph(gd,gm,'');
		 setcolor(lightgray);
		 outtextxy(4,4,'         ');
		 while (true) do
					 begin
								setcolor(yellow);
								rectangle(0,0,getmaxx+20,getmaxy);
								delay(d);
								setfillstyle(1,lightgreen);
								bar(x1,y1,x2,y2+50-(score*5));
								setfillstyle(1,white);
								bar(100,221,150,226);
								bar(120,221,125,233);
								bar(100,226,105,236);
								bar(151,223,152,224);
								setfillstyle(1,white);
								bar(100,221,100,222);
								setcolor(white);
								rectangle(x,y,x+3,y+1);
								case port[$60] of
									1:break;
									57:jahat2:=1;
								end;
								if (x=641) then
									 begin
												jahat2:=2;
												x:=147;
												ball:=ball-1;
												setcolor(lightred);
												outtextxy(xx+4,4,'');
												xx:=xx+16;
									 end;
								if (getpixel(x+4,y)=lightgreen) then
									 begin
												sound(2000);
												nosound;
												setcolor(lightgreen);
												outtextxy(xx+4,4,'');
												xx:=xx+16;
												score:=score+1;
												if(score mod (random(1)+2)=0)and(d>2)then
													d:=d-1;
												jahat2:=2;
												setcolor(black);
												rectangle(x,y,x+3,y+1);
												x:=147;
												ball:=ball-1;
									 end;
								if (jahat=1) then
									 begin
												setfillstyle(1,black);
												bar(x1,y2+51-(score*5),x2,getmaxy-1);
												y1:=y1-1;
												y2:=y2-1;
									 end;
								if (jahat=2) then
									 begin
												setfillstyle(1,black);
												bar(getmaxx-10,1,x2,y1-1);
												y1:=y1+1;
												y2:=y2+1;
									 end;
								if (y1=0) then
									 jahat:=2;
								if (y2+50-(score*5)=getmaxy) then
									 jahat:=1;
								if (jahat2=1) then
									 begin
												setcolor(black);
												rectangle(x,y,x,y+1);
												x:=x+1;
									 end;
								if (ball=0) then
									 break;
					 end;
		 closegraph;
		 textcolor(lightgreen);
		 write('You got ');
		 textcolor(yellow);
		 write(score);
		 textcolor(lightgreen);
		 write(' point(s) from ');
		 textcolor(yellow);
		 write(10);
		 textcolor(lightgreen);
		 writeln(' points!');
		 if (score>=6)and(ball=0) then
				begin
						 textcolor(blink+lightgreen);
						 writeln('You Won!');
				end;
		 if (score<6)and(ball=0) then
				begin
						 textcolor(red);
						 writeln('You Lose!');
				end;
					 Readln;
					CLRSCR;
						 textcolor(yellow);
						 writeln('Please Enter your last name:');
						 textcolor(lightgreen);
						 Readln(S);
							 Assign(F,'Scores\Sniper.txt');
							Append(F);
							writeln(f,S,': ',score);
									close(F);

end.