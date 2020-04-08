#include <AutoItConstants.au3>
#include <Misc.au3>
#include <Array.au3>
Global $invSecond[42][2]
Global $stop = False
Global $smallChest[64][2]

; Double click at the current mouse position.
$title = "Minecraft* 1.15.2 - Multiplayer (3rd-party)"
AutoItSetOption("MouseCoordMode", 2) ; client mode

HotKeySet("{END}","Pause")
HotKeySet("{DELETE}","close")
HotKeySet("{HOME}","start")
HotKeySet("{PGUP}","craftSnowBlock")
HotKeySet("{INSERT}","craftSnowBlock")
HotKeySet("{PGDN}","sellSnowBlock")
HotKeySet("{NUMPAD0}","preset1")

start()

While 1
	Sleep(100)
WEnd

Func Pause()
	$stop = true
	Sleep(1000)
	$stop = false
EndFunc

Func start()
	SetUpWindow()
	SetUpSecondInvPos()
	SetUpSmallChestInv()
EndFunc

Func SetUpSmallChestInv()
	$smallChest[1][0] = 508
	$smallChest[1][1] = 270
	$smallChest[2][0] = 543
	$smallChest[2][1] = 269
EndFunc

Func preset1()
	;digSnow()
	Opt("SendKeyDownDelay",4000)
	Send("S")
	Opt("SendKeyDownDelay",0)
	;craftSnowBlock()
	;sellSnowBlock()
		;on small chest
	Sleep(1000)
	MouseClick($MOUSE_CLICK_RIGHT)
	Sleep(2000)
	MouseClick($MOUSE_CLICK_LEFT,$smallChest[1][0],$smallChest[1][1],1,5)
	MouseClick($MOUSE_CLICK_RIGHT,$invSecond[28][0],$invSecond[28][1],6,20) ; stick
	MouseClick($MOUSE_CLICK_LEFT,$smallChest[1][0],$smallChest[1][1],1,5)
	MouseClick($MOUSE_CLICK_LEFT,$smallChest[2][0],$smallChest[2][1],1,5)
	MouseClick($MOUSE_CLICK_RIGHT,$invSecond[29][0],$invSecond[29][1],3,20) ; stone
	MouseClick($MOUSE_CLICK_LEFT,$smallChest[2][0],$smallChest[2][1],1,5)
	Send("E")
	;go to crafting table
	Opt("SendKeyDownDelay",1000)
	Send("A")
	Opt("SendKeyDownDelay",0)
	Sleep(1000)
	MouseClick($MOUSE_CLICK_RIGHT)
	Sleep(2000)
	;craft shovel
	MouseClick($MOUSE_CLICK_LEFT,$invSecond[28][0],$invSecond[28][1])
	MouseClick($MOUSE_CLICK_RIGHT,585, 339, 3)
	MouseClick($MOUSE_CLICK_RIGHT,585, 304, 3)
	MouseClick($MOUSE_CLICK_LEFT,$invSecond[29][0],$invSecond[29][1])
	MouseClick($MOUSE_CLICK_RIGHT,584, 269, 3)
	MouseClick($MOUSE_CLICK_LEFT,736, 305)
	MouseClick($MOUSE_CLICK_RIGHT,$invSecond[34][0],$invSecond[34][1])
	MouseClick($MOUSE_CLICK_LEFT,736, 305)
	MouseClick($MOUSE_CLICK_RIGHT,$invSecond[35][0],$invSecond[35][1])
	MouseClick($MOUSE_CLICK_LEFT,736, 305)
	MouseClick($MOUSE_CLICK_RIGHT,$invSecond[36][0],$invSecond[36][1])
	Send("E")
	; move back to digging
	Opt("SendKeyDownDelay",2000)
	Send("S")
	Send("D")
	Opt("SendKeyDownDelay",5000)
	Send("W")
	Opt("SendKeyDownDelay",0)
EndFunc

Func digSnow()
	; with 3 stone shovel
	setMainInv(7)
	dig()
	Sleep(20500)
	setMainInv(8)
	dig()
	Sleep(20500)
	setMainInv(9)
	dig()
	Sleep(20500)
	MouseUp($MOUSE_CLICK_LEFT)
EndFunc

Func sellSnowBlock()
	Sleep(1000)
	Send("T")
	Sleep(1500)
	Send("/shop")
	Send("{ENTER}")
	MouseClick("LEFT",540, 289)
	MouseClick("LEFT",686, 362)
	MouseClick("RIGHT",508, 250,150)
	Send("ESC")
EndFunc

Func craftSnowBlock()
	Sleep(1000)
	Send("E")
	$pos = 1
	For $i = 0 to 8
		if $stop == True Then
			Break
		EndIf
		MouseClick("LEFT",$invSecond[$pos][0],$invSecond[$pos][1],1,5)
		MouseClick("LEFT",$invSecond[37][0],$invSecond[37][1],1,5)
		MouseClick("LEFT",$invSecond[$pos+1][0],$invSecond[$pos+1][1],1,5)
		MouseClick("LEFT",$invSecond[38][0],$invSecond[38][1],1,5)
		MouseClick("LEFT",$invSecond[$pos+2][0],$invSecond[$pos+2][1],1,5)
		MouseClick("LEFT",$invSecond[39][0],$invSecond[39][1],1,5)
		MouseClick("LEFT",$invSecond[$pos+3][0],$invSecond[$pos+3][1],1,5)
		MouseClick("LEFT",$invSecond[40][0],$invSecond[40][1],1,5)
		MouseClick("LEFT",$invSecond[41][0],$invSecond[41][1],60,5)
		MouseClick("LEFT",$invSecond[$pos+3][0],$invSecond[$pos+3][1],1,5)
		$pos += 4
	Next
	Send("ESC")
EndFunc

Func setMainInv($pos)
	Sleep(1000)
	If $pos == 1 Then
		Send("1")
	ElseIf $pos == 2 Then
		Send("2")
	ElseIf $pos == 3 Then
		Send("3")
	ElseIf $pos == 4 Then
		Send("4")
	ElseIf $pos == 5 Then
		Send("5")
	ElseIf $pos == 6 Then
		Send("6")
	ElseIf $pos == 7 Then
		Send("7")
	ElseIf $pos == 8 Then
		Send("8")
	ElseIf $pos == 9 Then
		Send("9")
	EndIf
EndFunc

Func CheckingInvPos()
	Send("E")
	For $i = 1 to 41
		clickSecoundInv($i)
	Next
EndFunc

Func SetUpSecondInvPos()
	Local $invPos0[2] = [503, 403]
	;craft table
	Local $invSecondT37[2] = [685, 271]
	Local $invSecondT38[2] = [721, 271]
	Local $invSecondT39[2] = [686, 307]
	Local $invSecondT40[2] = [722, 309]
	Local $invSecondT41[2] = [797, 291]
	Local $diff = 38
	Local $row = 0
	Local $col = 0
	For $i = 1 to 36
		$row = Ceiling($i/9) ; 1, 2, ...
		$col = Mod($i,9) ; 1, 2 , ...
		If $col == 0 Then
			$col = 9
		EndIf
		$invSecond[$i][0] = $invPos0[0] + ($diff * ($col-1))
  		$invSecond[$i][1] = $invPos0[1] + ($diff * ($row-1))
	Next
	$invSecond[37][0] = $invSecondT37[0]
	$invSecond[37][1] = $invSecondT37[1]
	$invSecond[38][0] = $invSecondT38[0]
	$invSecond[38][1] = $invSecondT38[1]
	$invSecond[39][0] = $invSecondT39[0]
	$invSecond[39][1] = $invSecondT39[1]
	$invSecond[40][0] = $invSecondT40[0]
	$invSecond[40][1] = $invSecondT40[1]
	$invSecond[41][0] = $invSecondT41[0]
	$invSecond[41][1] = $invSecondT41[1]
EndFunc

Func clickSecoundInv($inv)
	Sleep(100)
	AutoItSetOption("MouseCoordMode", 2) ; client mode
	MouseClick("LEFT", $invSecond[$inv][0], $invSecond[$inv][1])
EndFunc

Func SetUpWindow()
	WinActivate($title)
	WinMove ( $title, "", 290, 170 , 1315, 810 , 3 )
	Send("{ESC}")
EndFunc   ;==>Example

Func dig()
	Sleep(100)
	MouseDown($MOUSE_CLICK_LEFT)
EndFunc

Func close()
	MouseUp($MOUSE_CLICK_LEFT)
	Exit
EndFunc