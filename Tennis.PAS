Program Tennis;
Uses Crt,Graph;
Var
	X,Y,Y2,Y3,BG,RG,MX:integer;
	PXC,Dir,jX,jY:integer;
	GD,Gm,Cu,R:integer;
	CH:Char;
Begin
	clrscr;
	textcolor(white);
		 writeln('-- Tennis Game -- By Pascal Home --');
		 writeln;
		 textcolor(lightgreen);
		 writeln('You must move the pad to save the ball.');
		 writeln;
		 textcolor(yellow);
		 writeln('Player 1(right):');
		 textcolor(white);
		 writeln('Up  : 3');
		 writeln('Down: .');
		 writeln;
		 textcolor(yellow);
		 writeln('Player 2(left):');
		 textcolor(white);
		 writeln('Up  : A');
		 writeln('Down: Z');
		 writeln;
		 textcolor(lightred);
		 writeln('Exit:  Esc');
		 textcolor(black);
		 readln;
	Randomize;
	GD:=Detect;
	initGraph(GD,GM,' ');
	X:=GetMaxX Div 2;
	Y:=GetMaxY Div 2;
	Y2:=GetMaxY Div 2 - 35;
	Y3:=GetMaxY Div 2 - 35;
	jX:=1;
	jY:=1;
	Repeat
		Dir:=Random(5)*2+1;
	Until(Dir<>5);
	While(True)Do
	Begin
	if(X<0)then
	Begin
		inc(BG);
		SetColor(LightRed);
		OutTextXY(GetMaxX Div 2 - 60,9,'     Goal!');
		Sound(2500);
		Delay(500);
		SetColor(Black);
		OutTextXY(GetMaxX Div 2 - 60,9,'     Goal!');
		setcolor(LightRed);
		OutTextXY(GetMaxX-(BG*12)-2,9,'');
		if(BG=4)then
		Begin
			SetColor(LightRed);
			OutTextXY(GetMaxX Div 2 - 60,9,'Player two won!');
			Delay(1500);
			Break;
		End;
	End;
	if(X>GetMaxX)then
	Begin
		inc(RG);
		SetColor(LightBlue);
		OutTextXY(GetMaxX Div 2 - 60,9,'     Goal!');
		Sound(2500);
		Delay(500);
		SetColor(Black);
		OutTextXY(GetMaxX Div 2 - 60,9,'     Goal!');
		setcolor(LightBlue);
		OutTextXY((RG*12)-2,9,'');
		if(RG=4)then
		Begin
			SetColor(LightBlue);
			OutTextXY(GetMaxX Div 2 - 60,9,'Player one won!');
			Delay(1500);
			Break;
		End;
	End;
	if(X<0)or(X>GetMaxX)then
	Begin
		X:=GetMaxX Div 2;
		Y:=GetMaxY Div 2;
		Repeat
			Dir:=Random(5)*2+1;
		Until(Dir<>5);
		jX:=1;
		jY:=1;
	End;
	SetColor(Yellow);
	Rectangle(-10,0,GetMaxX+10,GetmaxY);
	Rectangle(0,0,GetMaxX,25);
	Line(GetMaxX Div 2-100,0,GetMaxX Div 2-100,25);
	Line(GetMaxX Div 2+100,0,GetMaxX Div 2+100,25);
	SetFillStyle(1,Yellow);
	Bar(0,25,GetMaxX,30);
	SetColor(Black);
	SetFillStyle(SolidFill,Black);
	FillEllipse(X,Y,3,3);
	if(Dir=1)then
	Begin
		PXC:=GetPixel(X-(jx+3),Y+(jy+3));
		if(PXC<>Black)or(Y>=GetMaxY-3)then
		Begin
			if(PXC=LightBlue)And(Y>Y2)then
			if(Y-Y2 in[11..59])then
				Dir:=3;
			if(PXC=Yellow)or((Y>=GetMaxY-3)and(X>8))then
				Dir:=7;
		End;
		X:=X-jx;
		Y:=Y+jy;
	End
	else
		if(Dir=3)then
	Begin
		PXC:=GetPixel(X+(jx+3),Y+(jy+3));
		if(PXC<>Black)or(Y>=GetMaxY-3)then
		Begin
			if(PXC=LightRed)And(Y>Y3)then
			if(Y-Y3 in[11..59])then
				Dir:=1;
			if(PXC=Yellow)or((Y>=GetMaxY-3)and(X>8))then
				Dir:=9;
		End;
		X:=X+jx;
		Y:=Y+jy;
	End
	else
	if(Dir=7)then
	Begin
		PXC:=GetPixel(X-(jx+3),Y-(jy+3));
		if(PXC<>Black)or((Y<=33)and(X>8))then
		Begin
			if(PXC=LightBlue)And(Y>Y2)then
			if(Y-Y2 in[11..59])then
				Dir:=9;
			if(PXC=Yellow)or((Y<=33)and(X>8))then
				Dir:=1;
		End;
		X:=X-jx;
		Y:=Y-jy;
	End
	else
		if(Dir=9)then
	Begin
		PXC:=GetPixel(X+(jx+3),Y-(jy+3));
		if(PXC<>Black)or((Y<=33)and(X>8))then
		Begin
			if(PXC=LightRed)And(Y>Y3)then
			if(Y-Y3 in[11..59])then
				Dir:=7;
			if(PXC=Yellow)or((Y<=33)and(X>8))then
				Dir:=3;
		End;
		X:=X+jx;
		Y:=Y-jy;
	End;
	if(PXC=LightBlue)then
	Begin
		if(Y-Y2 in[25..45])then
		Begin
			jx:=2;
			jy:=1;
		End;
		if(Y-Y2>=-3)and(Y-Y2<=10)and(Dir=1)then
		Begin
			Dir:=9;
		End;
		if(Y-Y2 in[60..73])and(Dir=7)then
		Begin
			Dir:=3;
		End;
		if((Y-Y2>=-3)and(Y-Y2<=10))or(Y-Y2 in[60..73])then
		Begin
			jx:=1;
			jy:=2;
		End;
	End;
	if(PXC=LightRed)then
	Begin
		if(Y-Y3 in[25..45])then
		Begin
			jx:=2;
			jy:=1;
		End;
		if(Y-Y3>=-3)and(Y-Y3<=10)and(Dir=3)then
		Begin
			Dir:=7;
		End;
		if(Y-Y3 in[60..73])and(Dir=9)then
		Begin
			Dir:=1;
		End;
		if((Y-Y3>=-3)and(Y-Y3<=10))or(Y-Y3 in[60..73])then
		Begin
			jx:=1;
			jy:=2;
		End;
	End;
	if(Port[96]=1)then
		Break;
	SetColor(White);
	SetFillStyle(SolidFill,White);
	FillEllipse(X,Y,3,3);
	delay(2);

	R:=Random(2)+1;
	SetColor(Black);
	SetFillStyle(SolidFill,Black);
	Bar(0,31,10,Y2-1);
	Bar(0,GetMaxY-1,10,Y2+71);
	if(Port[96]=30)And(Y2>33)And((Dir=1)or(Dir=7))then
		Dec(Y2,R);
	if(Port[96]=44)And(Y2<GetMaxY-73)And((Dir=1)or(Dir=7))then
		inc(Y2,R);
	SetColor(LightBlue);
	SetFillStyle(SolidFill,LightBlue);
	Bar(0,Y2,5,Y2+70);

	SetColor(Black);
	SetFillStyle(SolidFill,Black);
	Bar(GetMaxX,31,GetMaxX-10,Y3-1);
	Bar(GetMaxX,GetMaxY-1,GetMaxX-10,Y3+71);
	if(Port[96]=81)And(Y3>33)And((Dir=3)or(Dir=9))then
		Dec(Y3,R);
	if(Port[96]=83)And(Y3<GetMaxY-73)And((Dir=3)or(Dir=9))then
		inc(Y3,R);
	SetColor(LightBlue);
	SetFillStyle(SolidFill,LightRed);
	Bar(GetMaxX,Y3,GetmaxX-5,Y3+70);

	if(cu=0)then
	Begin
		SetColor(LightGreen);
		OutTextXY(GetMaxX Div 2 - 55,9,' Press Enter');
		Repeat
			CH:=ReadKey;
		Until(CH=#13);
		SetColor(Black);
		OutTextXY(GetMaxX Div 2 - 55,9,' Press Enter');
	End;
	inc(cu);
	cu:=1;
	End;
End.