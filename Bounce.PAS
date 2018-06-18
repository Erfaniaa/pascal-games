Program Bounce;
Uses CRT,
		 Graph;
Var
	 XR, YR : Array [0..5] of integer;       {XR=XRed YR=YRed}
	 XB, YB : Array [0..5] of integer;       {XB=XBlue YB=YBlue}
	 TR, TB : Array [0..5] of integer;
	 PR, PB : Array [0..5] of integer;
	 GD, GM, X, Y, SH, J, D ,I ,CR ,CB ,CR2 ,CB2: Integer;
	 Label 1;
Begin                                      {Menu}															 {Begin menu}
		 clrscr;
		 textcolor(white);
		 writeln('-- Bounce Game -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('You must put all of balls in a place.');
		 textcolor(yellow);
		 writeln('You must move the hole with these keys:');
		 writeln('Up  :A');
		 writeln('Down:Z');
		 writeln;
		 textcolor(lightred);
		 writeln('Escape:  Exit');
		 textcolor(black);
		 readln;
		 clrscr;


																					 {End menu}
		 Randomize;                            {Begin game}
		 GD := Detect;                         {Var}
		 X := 320;
		 For SH := 0 To 5 Do
				 Begin
							TR[SH] := 1;
							TB[SH] := 1;
				 End;
		 For SH := 0 To 5 Do
				 Begin
							If (Random (2) = 1)Then
								 Begin
											XR[SH] := Random (290) + 15;
											YR[SH] := Random (450) + 15;
								 End
							Else
									Begin
											 XR[SH] := Random (290) + 15;
											 YR[SH] := Random (450) + 15;
									End;
				 End;
		 For SH := 0 To 5 Do
				 Begin
							If (Random (2) = 1)Then
								 Begin
											XB[SH] := Random (290) + 15;
											YB[SH] := Random (450) + 15;
								 End
							Else
									Begin
											 XB[SH] := Random (290) + 335;
											 YB[SH] := Random (450) + 15;
									End;
				 End;
		 Initgraph (GD, GM, '../BGI');
		 Y := 210;
		 While (True) Do
					 Begin
								Setfillstyle (1, 1);
								Bar (0, 0, GetmaxX, 9);
								Bar (0, GetmaxY-9, GetmaxX, GetmaxY);
								Setfillstyle (1, 4);
								Bar (0, 9, 9, GetmaxY-9);
								Bar (GetmaxX-9, 9, GetmaxX, GetmaxY-9);
								Bar (X, 10, X, Y);
								Bar (X-1, GetmaxY-10, X+1, Y+80);
								Setfillstyle (1,4);
								Bar (X-1, 10, X+1, Y);
								Bar (X-1, GetmaxY-10, X+1, Y+80);
								Setfillstyle (1, 0);
								Bar (X-1, Y, X+1, Y+80);
								For SH := 0 To 5 Do
										Begin
												 Setcolor (Black);
												 SetFillStyle(1,0);
												 FillEllipse (XR[SH], YR[SH], 2, 2);
												 FillEllipse (XB[SH], YB[SH], 2, 2);
										End;
								For SH := 0 To 5 Do
										Begin
												 If (TR[SH] = 1)Then
														Begin
																 XR[SH] := XR[SH]+2;             {T1:Shomal shargh}
																 YR[SH] := YR[SH]-2;
																 PR[SH] := Getpixel (XR[SH]+1, YR[SH]-1);
														End;
												 If (TR[SH] = 2)Then
														Begin
																 XR[SH] := XR[SH]-2;             {T2:Shomal gharb}
																 YR[SH] := YR[SH]-2;
																 PR[SH] := Getpixel (XR[SH]-1, YR[SH]-1);
														End;
												 If (TR[SH] = 3)Then
														Begin
																 XR[SH] := XR[SH]+2;             {T3:Jonoob shargh}
																 YR[SH] := YR[SH]+2;
																 PR[SH] := Getpixel (XR[SH]+1, YR[SH]+1);
														End;
												 If (TR[SH] = 4)Then
														Begin
																 XR[SH] := XR[SH]-2;             {T4:Jonoob gharb}
																 YR[SH] := YR[SH]+2;
																 PR[SH] := Getpixel (XR[SH]-1, YR[SH]+1);
														End;
												 If (TB[SH] = 1)Then
														Begin
																 XB[SH] := XB[SH]+2;             {T1:Shomal shargh}
																 YB[SH] := YB[SH]-2;
																 PB[SH] := Getpixel (XB[SH]+1, YB[SH]-1);
														End;
												 If (TB[SH] = 2)Then
														Begin
																 XB[SH] := XB[SH]-2;             {T2:Shomal gharb}
																 YB[SH] := YB[SH]-2;
																 PB[SH] := Getpixel (XB[SH]-1, YB[SH]-1);
														End;
												 If (TB[SH] = 3)Then
														Begin
																 XB[SH] := XB[SH]+2;             {T3:Jonoob shargh}
																 YB[SH] := YB[SH]+2;
																 PB[SH] := Getpixel (XB[SH]+1, YB[SH]+1);
														End;
												 If (TB[SH] = 4)Then
														Begin
																 XB[SH] := XB[SH]-2;             {T4:Jonoob gharb}
																 YB[SH] := YB[SH]+2;
																 PB[SH] := Getpixel (XB[SH]-1, YB[SH]+1);
														End;
										End;
								For SH := 0 To 5 Do
										Begin
												 Setcolor (Red);
												 SetFillStyle(1,4);
												 FillEllipse (XR[SH], YR[SH], 2, 2);
												 Setcolor (Blue);
												 SetFillStyle(1,1);
												 FillEllipse (XB[SH], YB[SH], 2, 2);
										End;
								For SH := 0 To 5 Do
										Begin
												 D := 0;
												 If (PR[SH] = Red)Then
														Begin
																 If (TR[SH] = 1)Then
																		Begin
																				 TR[SH] := 2;
																				 D := 1;
																		End;
																 If (TR[SH] = 3)Then
																		Begin
																				 TR[SH] := 4;
																				 D := 1;
																		End;
																 If (D <> 1)Then
																		Begin
																				 If (TR[SH] = 2)Then
																						TR[SH] := 1;
																				 If (TR[SH] = 4)Then
																						TR[SH] := 3;
																		End;
														End;
												 D := 0;
												 If (PR[SH] = Blue)Then
														Begin
																 If (TR[SH] = 1)Then
																		Begin
																				 TR[SH] := 3;
																				 D := 1;
																		End;
																 If (TR[SH] = 2)Then
																		Begin
																				 TR[SH] := 4;
																				 D := 1;
																		End;
																 If (D <> 1)Then
																		Begin
																				 If (TR[SH] = 3)And(D <> 1)Then
																						TR[SH] := 1;
																				 If (TR[SH] = 4)And(D <> 1)Then
																						TR[SH] := 2;
																		End;
														End;
												 D := 0;
												 If (PB[SH] = Red)Then
														Begin
																 If (TB[SH] = 1)Then
																		Begin
																				 TB[SH] := 2;
																				 D := 1;
																		End;
																 If (TB[SH] = 3)Then
																		Begin
																				 TB[SH] := 4;
																				 D := 1;
																		End;
																 If (D <> 1)Then
																		Begin
																				 If (TB[SH] = 2)And(D <> 1)Then
																						TB[SH] := 1;
																				 If (TB[SH] = 4)And(D <> 1)Then
																						TB[SH] := 3;
																		End;
														End;
												 D := 0;
												 CR:=0;
												 CB:=0;
												 CR2:=0;
												 CB2:=0;
												 For I:=0 To 5 Do
												 Begin
													If (XR[I]>GetMaxX Div 2-20) Then
														CR:=CR+1;
													If (XB[I]>GetMaxX Div 2-20) Then
														CB:=CB+1;
												 End;
												 For I:=0 To 5 Do
												 Begin
													If (XR[I]<GetMaxX Div 2+20) Then
														CR2:=CR2+1;
													If (XB[I]<GetMaxX Div 2+20) Then
														CB2:=CB2+1;
												 End;
												 If ((CR=0)And(CB=0))Or((CR2=0)And(CB2=0)) Then
												 Begin
													SetColor(LightGreen);
													SetTextStyle(DefaultFont,horizdir,2);
													OuttextXY(25,25,'You win!');
													Delay(1500);
													Goto 1;
												 End;
												 If (PB[SH] = Blue)Then
														Begin
																 If (TB[SH] = 1)Then
																		Begin
																				 TB[SH] := 3;
																				 D := 1;
																		End;
																 If (TB[SH] = 2)Then
																		Begin
																				 TB[SH] := 4;
																				 D := 1;
																		End;
																 If (D <> 1)Then
																		Begin
																				 If (TB[SH] = 3)Then
																						TB[SH] := 1;
																				 If (TB[SH] = 4)Then
																						TB[SH] := 2;
																		End;
														End;
										End;
								Delay (10);
								J := Port[96];
								Setfillstyle (1,4);
								Bar (X-1, 10, X+1, Y);
								Bar (X-1, GetmaxY-10, X+1, Y+80);
								If (J = 30)And(Y<>10)Then
									Y := Y-5;
								If (J = 44)And(Y<>390)Then
									Y := Y+5;
								If (J = 1)Then
									Break;
								end;
1:End.