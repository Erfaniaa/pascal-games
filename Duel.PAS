Program Duel;
Uses CRT,
		 Graph;
Var
	 Tir1, Tir2 : Array[1..100] of integer;
	 YT1, YT2, PXC, PXC2 : Array[1..100] of integer;
	 GD, GM, Y1, Y2, J1, J2, T1, T2, I1, I2, SH, R, Live, Live2 : Integer;
	 Label 1,2;
Begin
		 clrscr;
	textcolor(white);
	writeln('-- Duel Game -- By Pascal Home --');
	writeln;
	textcolor(lightgreen);
	writeln('You must shoot some bullets to your oppenent''s gun.');
	writeln;
	textcolor(lightred);
	writeln('Player 1:');
	textcolor(yellow);
	writeln('Up     : Q');
	writeln('Down   : A');
	writeln('Shoot  : Z');
	writeln;
	textcolor(lightblue);
	writeln('Player 2:');
	textcolor(yellow);
	writeln('Up     : -');
	writeln('Down   : +');
	writeln('Shoot  : Enter');
	textcolor(lightred);
	writeln;
	writeln('Escape : Exit');
	textcolor(black);
	readln;
		 CLRSCR;
		 Randomize;
		 GD := Detect;
     InitGraph (GD, GM, '../BGI');
     SetColor (14);
     Rectangle (0, GetmaxY-5,100,GetmaxY);
     Rectangle (GetmaxX, GetmaxY-5,GetmaxX-100,GetmaxY);
     T1 := 1;
     T2 := 1;
     I1 := 1;
		 I2 := 1;
		 Y1 := 240;
		 Y2 := 240;
		 Setfillstyle (1, 4);
		 Bar (3, Y1, 9, Y1+18);
		 Bar (3, Y1, 54, Y1+9);
		 Bar (27, Y1+9, 36, Y1+18);
		 Bar (55, Y1+3, 58, Y1+6);
		 Setfillstyle (1, 1);
		 Bar (GetmaxX-3, GetmaxY-Y2, GetmaxX-9, GetmaxY-Y2+18);
		 Bar (GetmaxX-3, GetmaxY-Y2, GetmaxX-54, GetmaxY-Y2+9);
		 Bar (GetmaxX-27, GetmaxY-Y2+9, GetmaxX-36, GetmaxY-Y2+18);
		 Bar (GetmaxX-55, GetmaxY-Y2+3, GetmaxX-58, GetmaxY-Y2+6);
		 While (True) Do
					 Begin
								Rectangle (-10, 0, GetmaxX+10, GetmaxY);
								If (I1 = 100)Then
									 I1 := 1;
								If (I2 = 100)Then
									 I2 := 1;
								For SH := 1 To I1 Do
										Begin
										If (Tir1[SH] < GetMaxX+1)and(YT1[SH]>1) Then
														Begin
												 Setfillstyle (1,0);
												 Bar (Tir1[SH]-1,YT1[SH]-1,Tir1[SH]+1,YT1[SH]+1);
												 if(Pxc[SH]<>Blue)then
													begin
												 Tir1[SH] := Tir1[SH] + 10;
												 Setfillstyle (1,15);
												 Bar (Tir1[SH]-1,YT1[SH]-1,Tir1[SH]+1,YT1[SH]+1);
												 Pxc[SH]:=GetPixel(Tir1[SH]+6,YT1[SH]);
													if(Pxc[SH]=Blue)then
														inc(live);
														End;
														end;
										End;
								For SH := 1 To I2 Do
										Begin
												 If (Tir2[SH] > -1)and(YT2[SH]>1)Then
														Begin
																 Setfillstyle (1,0);
																 Bar (GetmaxX-Tir2[SH]-1,YT2[SH]-1,GetmaxX-Tir2[SH]+1,YT2[SH]+1);
																 if(Pxc2[SH]<>Red)then
																 begin
																 Tir2[SH] := Tir2[SH] + 10;
																 Setfillstyle (1,15);
																 Bar (GetmaxX-Tir2[SH]-1,YT2[SH]-1,GetmaxX-Tir2[SH]+1,YT2[SH]+1);
																 Pxc2[SH]:=GetPixel(GetMaxX-Tir2[SH]-6,YT2[SH]);
																 {if(GetMaxX-58>=Tir2[SH])then
																	if(GetMaxX-58-Tir2[SH] in [0..2])then
																		inc(live2);}
																	if(Pxc2[SH]=Red)then
																	begin
																		inc(live2);
																		end;		end;
														End;
										End;
								if(live>=5)then
								begin
									goto 1;
								end;
								if(live2>=5)then
								begin
									goto 2;
								end;
								{For SH := 1 To I1 Do
										Begin
												 If (Tir1[SH] >= 641)Then
														Tir1[SH] := 0;
										End;
								For SH := 1 To I2 Do
										Begin
												 If (Tir2[SH] <= -1)Then
														Tir2[SH] := 0;
										End;}
								Setfillstyle (1, 0);
								Bar (1, GetmaxY-4,99,GetmaxY-1);
								Setfillstyle (1, 4);
								Bar (1, GetmaxY-4,T1,GetmaxY-1);
								Setfillstyle (1, 0);
								Bar (GetmaxX-1, GetmaxY-4,GetmaxX-99,GetmaxY-1);
								Setfillstyle (1, 1);
								Bar (GetmaxX-1, GetmaxY-4,GetmaxX-T2,GetmaxY-1);
								r:=random(2)+1;
								If (T1+r < 100)Then
									 T1 := T1 +r;
								If (T2+r < 100)Then
									 T2 := T2 +r;
								J1 := Port[$60];
								J2 := Port[$60];
								If (port[$60] = 44)And(T1>30)Then
									 Begin
												Tir1[I1] := 59;
												YT1[I1] := Y1;
												I1 := I1 + 1;
												T1 := T1-30;
									 End;
								If (port[$60] = 28)And(T2>30)Then
									 Begin
												Tir2[I2] := 59;
												YT2[I2] := Y2;
												I2 := I2 + 1;
												T2 := T2-30;
									 End;
								If (port[$60] = 16)And(T1>5)And(Y1>5)Then
									 Begin
												Setfillstyle (1, 0);
												Bar (3, Y1, 9, Y1+18);        {p1:44 p2:28}
												Bar (3, Y1, 54, Y1+9);
												Bar (27, Y1+9, 36, Y1+18);
												Bar (55, Y1+3, 58, Y1+6);
												Y1 := Y1-5;
												Setfillstyle (1,4);
												Bar (3, Y1, 9, Y1+18);
												Bar (3, Y1, 54, Y1+9);
												Bar (27, Y1+9, 36, Y1+18);
												Bar (55, Y1+3, 58, Y1+6);
												T1 := T1 - 5;
									 End;
								If (port[$60] = 30)And(T1>5)And(Y1+30<GetMaxY)Then
									 Begin
												Setfillstyle (1, 0);
												Bar (3, Y1, 9, Y1+18);
												Bar (3, Y1, 54, Y1+9);
												Bar (27, Y1+9, 36, Y1+18);
												Bar (55, Y1+3, 58, Y1+6);
												Y1 := Y1+5;
												Setfillstyle (1, 4);
												Bar (3, Y1, 9, Y1+18);
												Bar (3, Y1, 54, Y1+9);
												Bar (27, Y1+9, 36, Y1+18);
												Bar (55, Y1+3, 58, Y1+6);
												T1 := T1 - 5;
									 End;
												Setfillstyle (1, 4);
												Bar (3, Y1, 9, Y1+18);
												Bar (3, Y1, 54, Y1+9);
												Bar (27, Y1+9, 36, Y1+18);
												Bar (55, Y1+3, 58, Y1+6);
								If (port[$60] = 74)And(T2>5)And(Y2>5)Then
									 Begin
												Setfillstyle (1, 0);
												Bar (GetmaxX-3, Y2, GetmaxX-9, Y2+18);
												Bar (GetmaxX-3, Y2, GetmaxX-54, Y2+9);
												Bar (GetmaxX-27, Y2+9, GetmaxX-36, Y2+18);
												Bar (GetmaxX-55, Y2+3, GetmaxX-58, Y2+6);
												Y2 := Y2-5;
												Setfillstyle (1, 1);
												Bar (GetmaxX-3, Y2, GetmaxX-9, Y2+18);
												Bar (GetmaxX-3, Y2, GetmaxX-54, Y2+9);
												Bar (GetmaxX-27, Y2+9, GetmaxX-36, Y2+18);
												Bar (GetmaxX-55, Y2+3, GetmaxX-58, Y2+6);
												T2 := T2 - 5;
									 End;
								If (port[$60] = 78)And(T2>5)And(Y2+30<GetMaxY)Then
									 Begin
												Setfillstyle (1, 0);
												Bar (GetmaxX-3, Y2, GetmaxX-9, Y2+18);
												Bar (GetmaxX-3, Y2, GetmaxX-54, Y2+9);
												Bar (GetmaxX-27, Y2+9, GetmaxX-36, Y2+18);
												Bar (GetmaxX-55, Y2+3, GetmaxX-58, Y2+6);
												Y2 := Y2+5;
												Setfillstyle (1, 1);
												Bar (GetmaxX-3, Y2, GetmaxX-9, Y2+18);
												Bar (GetmaxX-3, Y2, GetmaxX-54, Y2+9);
												Bar (GetmaxX-27, Y2+9, GetmaxX-36, Y2+18);
												Bar (GetmaxX-55, Y2+3, GetmaxX-58, Y2+6);
												T2 := T2 - 5;
									 End;
								If (port[$60] = 1)Then
									 Break;
								Delay (30);
					 End;
					 1:if(live2>=4)then
					 begin
						closegraph;
						TextColor(LightBlue);
						Write('Player two');
						TextColor(LightGreen);
						Writeln(' won!');
						GotoXY(50,50);
						Readln;
					 end;
					 2:if(live>=4)then
					 begin
						closegraph;
						TextColor(LightRed);
						Write('Player one');
						TextColor(LightGreen);
						Writeln(' won!');
						GotoXY(50,50);
						Readln;
					 end;
					 closegraph;
					 GotoXY(1,1);
					 TextColor(LightRed);
					 write(live);
					 TextColor(Yellow);
					 write(' - ');
					 TextColor(LightBlue);
					 writeln(live2);
					 GotoXY(50,50);
					 readln;
End.
