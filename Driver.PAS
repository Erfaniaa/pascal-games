Program Driver;
Uses CRT,Graph;
Var
	 XM,YM:Array[-1..15000]Of Integer;
	 GD,GM,X,Y,M,I,SH,SP,R:Integer;
	 Point:Longint;
	 Speed:Boolean;
	 J:Integer;
	 F:Text;
	 S:String;
 Begin
		 CLRSCR;
		 Speed:=True;
		 SP:=40;
		 textcolor(white);
		 writeln('-- Driver Game -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('You must drive your white car without touching the red cars.');
		 writeln;
		 textcolor(yellow);
		 writeln('You must move your car with these arrow keys:');
		 textcolor(white);
		 writeln('Up');
		 writeln('Down');
		 writeln('Right');
		 writeln('Left');
		 writeln;
		 textcolor(lightred);
		 writeln('Space:  Toggle high speed');
		 writeln('Esc  :  Exit');
		 textcolor(black);
		 readln;
		 Randomize;
		 Point:=0;
		 I:=0;
		 M:=29;
		 Y:=2;
		 X:=2;
		 GD:=Detect;
		 InitGraph (GD,GM,'');
		 Delay (1000);
		 While (True) Do
					 Begin
												If (Getpixel(X,Y-1)=Red)Or(Getpixel(X-1,Y)=Red)
												Or(Getpixel(X-1,Y+25)=Red)Or(Getpixel(X,Y+26)=Red)Then
												Break;
												If (Getpixel(X+58,Y-1)=Red)Or(Getpixel(X+59,Y)=Red)
												Or(Getpixel(X+58,Y+26)=Red)Or(Getpixel(X+59,Y+25)=Red)Then
													 Break;

												If (Getpixel(X+29,Y-1)=Red)Or(Getpixel(X-1,Y+12)=Red)
												Or(Getpixel(X+29,Y+26)=Red)Or(Getpixel(X+59,Y+12)=Red)Then
													 Break;
												If (Getpixel(X-1,Y-1)=Red)Or(Getpixel(X-1,Y+26)=Red)
												Or(Getpixel(X+59,Y-1)=Red)Or(Getpixel(X+59,Y+26)=Red)Then
													 Break;
								Point:=Point+1;
								setcolor(white);
								Rectangle (-10,0,GetmaxX+10,GetmaxY);
								M:=M+1;
								If (M=30)Then
									begin
												M:=0;
												XM[I]:=GetmaxX+70;
												Repeat
													YM[I]:=Random(GetmaxY-29);
													if(YM[I]=0)then
														YM[I]:=1;
												Until(YM[I]<>YM[I-1])
												And(GetPixel(XM[I]-5,YM[I])<>Red)
												And(GetPixel(XM[I]+63,YM[I])<>Red)
												And(GetPixel(XM[I],YM[I]-1)<>Red)
												And(GetPixel(XM[I],YM[I]+29)<>Red)
												And(GetPixel(XM[I]-5,YM[I]+28)<>Red)
												And(GetPixel(XM[I]+63,YM[I]+29)<>Red)
												And(GetPixel(XM[I]+63,YM[I]-1)<>Red)
												And(GetPixel(XM[I]+63,YM[I]+28)<>Red)
												And(GetPixel(XM[I]+63,YM[I])<>Red);
												I:=I+1;
									 End;
								For SH:=0 To I Do
										Begin
												 SetFillStyle (1,4);
												 Bar (XM[SH]-58-2,YM[SH],XM[SH]-2,YM[SH]+28);
												 SetFillStyle (1,0);
												 Bar (XM[SH],YM[SH],XM[SH]+2,YM[SH]+28);
												 XM[SH]:=XM[SH]-2;
												 SetFillStyle (1,4);
												 Bar (XM[SH]-58,YM[SH],XM[SH],YM[SH]+28);
										End;
								if(sp>2)and(point mod 250=0)then
									sp:=sp-3;
								Delay(SP);
								SetFillStyle (1,15);
								Bar (X,Y,X+58,Y+25);
												J:=Port[$60];
												r:=0;
												if(J=57)and(speed)then
												begin
													sp:=sp-3;
													speed:=false;
													r:=1;
												end
												else
												if(J=57)and(speed=false)and(r<>1)then
												begin
													sp:=sp+3;
													speed:=true;
												end;
																SetFillStyle (1,0);
																If (J=17)And(Y>=3)Then
																	 Begin
																				Y:=Y-5;
																				Bar (X,Y+1+25,X+60,Y+2+28+28);
																	 End;
																If (J=31)And(Y+29<=GetmaxY-4)Then
																	 Begin
																				Bar (X,Y,X+68,Y+25);
																				Y:=Y+5;
																	 End;
																If (J=30)And(X>=3) Then
																	 Begin
																				X:=X-5;
																				Bar (X+5,Y,X+5+58,Y+25);
																	 End;
																If (J=32)And(X+59<=GetmaxX-4) Then
																	 Begin
																				Bar (X,Y,X+58,Y+25);
																				X:=X+5;
																	 End;
												SetFillStyle (1,15);
												Bar (X,Y,X+58,Y+25);
												If (J=1)Or(sp=0) Then
													 Break;
					 End;
		 CloseGraph;
		 CLRSCR;
		 TextColor (10);
		 Write ('You got ');
		 TextColor (Yellow);
		 Write (Point);
		 Textcolor (10);
		 Writeln (' points.');
		 TextColor (Yellow);
		 if(SP=0)then
			writeln('You won!');
		 TextColor (Black);
		 readln;
		 CLRSCR;
		 textcolor(yellow);
		 writeln('Please Enter your last name:');
		 textcolor(lightgreen);
		 Readln(S);
		 Assign(F,'Scores\Driver.txt');
			Append(F);
			writeln(f,S,': ',Point);
			close(F);
End.