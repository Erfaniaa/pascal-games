Program Snake;          {kayvannia.ali75@yahoo.com}
Uses CRT,Graph;
Var
   XB,YB:Array [0..15000] Of Integer;
	 X,Y,I,PXC,B,XP,YP,SP,T:Integer;
	 GD,GM:integer;
	 J,JJ:Char;
	 f:text;
	 s:string;
Begin
		 clrscr;
		 textcolor(white);
		 writeln('-- Snake Game v.2 -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('Your snake must get blue foods.');
		 textcolor(yellow);
		 writeln('You must ride your snake with these arrow keys:');
		 writeln('Up');
		 writeln('Down');
		 writeln('Right');
		 writeln('Left');
		 writeln;
		 textcolor(lightred);
		 writeln('Escape:  Exit');
		 textcolor(black);
		 readln;
		 clrscr;
     GD:=Detect;
     InitGraph (GD,GM,'../BGI,EGAVGA.BGI');
     SetFillStyle (1,15);
     Bar (41,41,80,120);
		 Bar (81,41,160,80);
		 Bar (41,161,80,320);
		 Bar (41,361,80,440);
		 Bar (81,401,160,440);
		 Bar (121,121,160,160);
		 Bar (121,201,160,280);
		 Bar (121,321,160,360);
		 Bar (201,1,240,120);
		 Bar (201,161,440,200);
		 Bar (201,281,440,320);
		 Bar (201,361,240,480);
		 Bar (281,41,360,120);
		 Bar (281,201,360,280);
		 Bar (281,361,360,440);
		 Bar (401,1,440,120);
		 Bar (401,361,440,480);
		 Bar (481,41,560,80);
		 Bar (481,121,520,160);
		 Bar (481,201,520,280);
		 Bar (481,321,520,360);
		 Bar (481,401,560,440);
		 Bar (561,41,600,120);
		 Bar (561,161,600,320);
		 Bar (561,361,600,440);
		 SetFillStyle (1,1);
		 Bar (1,441,40,480);
		 Bar (41,1,120,40);
		 Bar (41,121,80,160);
		 Bar (121,281,160,320);
		 Bar (121,361,160,400);
		 Bar (161,201,200,240);
		 Bar (241,81,280,120);
		 Bar (241,241,280,280);
		 Bar (241,441,280,480);
		 Bar (361,1,400,40);
		 Bar (401,121,440,160);
		 Bar (401,201,440,240);
		 Bar (401,321,440,360);
		 Bar (481,281,520,320);
		 Bar (521,81,560,120);
		 Bar (521,201,560,240);
		 Bar (601,1,640,40);
		 Bar (601,361,640,400);
		 B:=10;
		 X:=1;
		 Y:=1;
		 I:=20;
		 T:=0;
		 While (True)Do
					 Begin
					 IF (T=19) Then
							Break;
					 If (PXC=Blue)Then
								Begin
									 B:=B+2;
									 T:=T+1;
								End;
								If (Keypressed)Then
									 Begin
												J:=Readkey;
												If (J=#0)Then
													 Begin
																J:=Readkey;
																If (J=#72)And(Getpixel(X,Y-1)<>15)And(JJ<>#80)Then
																	 JJ:=#72;
																If (J=#75)And(Getpixel(X-1,Y)<>15)And(JJ<>#77)Then
																	 JJ:=#75;
																If (J=#77)And(Getpixel(X+40,Y)<>15)And(JJ<>#75)Then
																	 JJ:=#77;
																If (J=#80)And(Getpixel(X,Y+40)<>15)And(JJ<>#72)Then
																	 JJ:=#80;
													 End;
												If (J=#27)Then
													 Break;
									 End;
								If (JJ=#72)And(Getpixel(X,Y-1)<>15)And(Y-1<>0)Then
									 Begin
												Y:=Y-40;
												I:=I+1;
												PXC:=Getpixel(X,Y-1);
									 End;
								If (JJ=#75)And(Getpixel(X-1,Y)<>15)And(X-1<>0)Then
									 Begin
												X:=X-40;
												I:=I+1;
												PXC:=Getpixel(X-1,Y);
									 End;
								If (JJ=#77)And(Getpixel(X+40,Y)<>15)And(X+1<GetmaxX-40)Then
									 Begin
												X:=X+40;
												I:=I+1;
												PXC:=Getpixel(X+41,Y);
									 End;
								If (JJ=#80)And(Getpixel(X,Y+40)<>15)And(Y+1<GetmaxY-40)Then
									 Begin
												Y:=Y+40;
												I:=I+1;
												PXC:=Getpixel(X,Y+41);
									 End;
								SetFillStyle (1,4);
								Bar (X,Y,X+39,Y+39);
								XB[I]:=X;
								YB[I]:=Y;
								SetFillStyle (1,0);
								if(XB[I-B]<>0)And(YB[I-B]<>0)Then
									Bar (XB[I-B],YB[I-B],XB[I-B]+39,YB[I-B]+39);
								SP:=200;
								Delay (SP);
								If (PXC=Red)Then
								Begin
									 Delay(SP);
									 Break;
								End;
					 End;
		 CloseGraph;
		 If (T>=12) Then
				Begin
						 TextColor (LightGreen+Blink);
						 Writeln ('You win!');
				End;
		 If (PXC=Red)and(T<12)Then
				Begin
						 TextColor (Red);
						 Writeln ('You lose!');
				End;
		 Readln;
							CLRSCR;
							 textcolor(yellow);
							 writeln('Please Enter your last name:');
							 textcolor(lightgreen);
							 Readln(S);
							 Assign(F,'Scores\Snake2.txt');
								Append(F);
								writeln(f,S,': ',t);
									close(F);

End.
