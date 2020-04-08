#include <AutoItConstants.au3>
#include <Misc.au3>
#include <Array.au3>
Global $invSecond[42][2]
; Double click at the current mouse position.
$title = "Minecraft* 1.15.2 - Multiplayer (3rd-party)"
AutoItSetOption("MouseCoordMode", 2) ; client mode

HotKeySet("{END}","close")
HotKeySet("{HOME}","start")

While 1
	Sleep(100)
WEnd

Func start()
	SetUpWindow()
	SetUpSecondInvPos()
	;digSnow()
	craftSnowBlock()
EndFunc

Func digSnow()
	setMainInv(8)
	dig()
	Sleep(8000)
	MouseUp($MOUSE_CLICK_LEFT)
EndFunc

Func craftSnowBlock()
	Send("E")
	$pos = 1
	For $i = 0 to 7
		MouseClick("LEFT",$invSecond[$pos][0],$invSecond[$pos][1])
		MouseClick("LEFT",$invSecond[37][0],$invSecond[37][1])
		MouseClick("LEFT",$invSecond[$pos+1][0],$invSecond[$pos+1][1])
		MouseClick("LEFT",$invSecond[38][0],$invSecond[38][1])
		MouseClick("LEFT",$invSecond[$pos+2][0],$invSecond[$pos+2][1])
		MouseClick("LEFT",$invSecond[39][0],$invSecond[39][1])
		MouseClick("LEFT",$invSecond[$pos+3][0],$invSecond[$pos+3][1])
		MouseClick("LEFT",$invSecond[40][0],$invSecond[40][1])
		MouseClick("LEFT",$invSecond[41][0],$invSecond[41][1],60,5)
		MouseClick("LEFT",$invSecond[$pos+3][0],$invSecond[$pos+3][1])
		$pos += 4
	Next
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