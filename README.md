![AHK - Rare Logo](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/AHK%20-%20rare.jpg)

------

**AHK-Rare** - *collection of rare or very useful single functions* 

Last modification date: ***15.07.2018***, *Changes are below!* At the end of this document you will find a complete list of all functions. The functions are sorted by topic as shown in the picture. Remark: I didn’t tested all functions.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)

<br>

### <u>[15-July-2018] count: 79+323 = 402 functions</u>

I’ve found a lot function this time. I checked the found functions that these can not actually be found in any library, so that these can really be called "Rare". I added some more descriptions, examples, links and moved some functions to the right category. 

---------

***** changing the signs to default code folding signs. I changed **;{** to **{ ;** and **;}** to **}**. I hope it will work in most cases and most code editors.  

-------------

####*+added new section:* RegEx - Strings - useful strings for RegExMatch or Replace

- **2 RegEx strings to find AHK-functions** - not tested yet

  ###Strings/Arrays/Objects/Text/Variables

- **StrCount()** - a very handy function to count a needle in a Haystack

- **SuperInstr()** - Returns min/max position for a | separated values of Needle(s)

- **GetText()** - copies the selected text to a variable while preserving the clipboard.(Ctrl+C method)

- **PutText()** - Pastes text from a variable while preserving the clipboard. (Ctrl+v method)

- **GetFuncDefs()** - get function definitions from a script

- **ExploreObj()** - returns a string containing the formatted object keys and values (very nice for debugging!)

- **LineDelete()** - deletes lines of text from variables / no loop

- **ExtractFuncTOuserAHK()** - extract user function and helps to write it to userAhk.api

- **PdfToText()** - copies a selected PDF file to memory - it needs xpdf - pdftotext.exe

- **PdfPageCounter()** - counts pages of a pdffile (works with 95% of pdf files)

- **PasteWithIndent()** - paste string to an editor with your prefered indent key

- **SplitLine()** - split string to key and value

- **Ask_and_SetbackFocus()** - by opening a msgbox you lost focus and caret pos in any editor - this func will restore the previous positions of the caret

- **Valueof()** - Super Variables processor by Avi Aryan, overcomes the limitation of a single level ( return %var% ) in nesting variables

###Windows/Gui

- **WinSetPlacement()** - Sets window position using workspace coordinates (-> no taskbar)

- **AttachToolWindow()** - Attaches a window as a tool window to another window from a different process. 

- **DeAttachToolWindow()** - removes the attached ToolWindow

- **GetFreeGuiNum()** - gets a free gui number

- **DisableFadeEffect()** - disabling fade effect on gui animations

- **RMApp_NCHITTEST()** - Determines what part of a window the mouse is currently over

- **SetWindowTransistionDisable()** - disabling fade effect only for the window of choice 

- **IsWindowUnderCursor()** - Checks if a specific window is under the cursor.

- **GetCenterCoords()** - ?center a gui between 2 monitors?

- **Menu_AssignBitmap()** - assign bitmap to any item in any AHk menu

- **guiMsgBox()** - GUI Message Box to allow selection

- **DisableMinimizeAnim()** - disables or restores original minimize anim setting

- **GetTextSize()** - a corrected version of this function from majkinetor *(tested)*

- **MeasureText()** - alternative to other functions which calculate the text size before display on the screen

- **WinGetClientPos()** - gives back the coordinates of client area inside a gui/window - with DpiFactor correction

- **winfade()** - another winfade function

- **TT_Console()** - Use Tooltip as a User Interface it returns the key which has been pressed

- **ToolTipEx()** - Display ToolTips with custom fonts and colors

- **SafeInput()** - makes sure sure the same window stays active after showing the InputBox. Otherwise you might get the text pasted into another window unexpectedly.

- **CreateFont()** - creates font in memory which can be used with any API function accepting font handles

- **GetHFONT()** - gets a handle to a font used in a AHK gui for example

- **MsgBoxFont()** - style your MsgBox with with your prefered font

- **DisableCloseButton()** - to disable/grey out the close button

###Listview

- **LV_HeaderFontSet()** - sets a different font to a Listview header (it's need CreateFont() function) - formerly this function needs a function as a rewrite of SendMessage, I changed it to a DLLCall without an extra function, the depending function *CreateFont()* can be also found in this file

- **LV_Find()** - I think it‘s usefull to find an item position a listview

- **LV_GetSelectedText()** - returns text from selected rows in ListView (in a user friendly way IMO.)

- **LV_Notification()** - easy function for showing notifications by hovering over a listview

- **LV_IsChecked()** - alternate method to find out if a particular row number is checked

- **LV_SetCheckState()** - check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control

- **LV_SetItemState()** - with this function you can set all avaible states to a listview item

###Controls

- **ControlDoubleClick()** - simulates a double click on a control with left/middle or right mousebutton

- **GetFocusedControl()** - get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available 

- **ControlGetTextExt()** - 3 different variants are tried to determine the text of a control

- **getControlInfo()** - get width and heights of controls

- **ControlSetTextAndResize()** - set a new text to a control and resize depending on textwidth and -height

- **GetCPA_file_name()** - retrieves Control Panel applet icon

- **IsControlUnderCursor()** - Checks if a specific control is under the cursor and returns its ClassNN if it is

###Other

- **TaskList()** - list all running tasks (no use of COM)
- **ResConImg()** - Resize and convert images. png, bmp, jpg, tiff, or gif 
- **ReleaseModifiers()** - helps to solve the Hotkey stuck problem
- **isaKeyPhysicallyDown()** - belongs to ReleaseModifiers() function
- **CreateCircleProgress(s)** - very nice to see function for a circle progress
- **IndexOfIconResource()** - function is used to convert an icon resource id (as those used in the registry) to icon index(as used by ahk)
- **GetIconforext()** - Gets default registered icon for an extension
- **IsConnected()** - Returns true if there is an available internet connection
- **RGBrightnessToHex()** - transform rbg (with brightness) values to hex 
- **GetHueColorFromFraction()** - get hue color from fraction. example: h(0) is red, h(1/3) is green and h(2/3) is blue (345)
- **MouseDpi()** - Change the current dpi setting of the mouse
- **GetProcessName()** - Gets the process name from a window handle.
- **GetDisplayOrientation()** - working function to get the orientation of screen
- **FileCRC32()** - Computes and returns CRC32 hash for a File passed as parameter
- **FindFreeFileName()** - Finds a non-existing filename for Filepath by appending a number in brackets to the name
- **ToggleSystemCursor()** - choose a cursor from system cursor list
- **GetSysErrorText()** - method to get meaningful data out of the error codes
- **getSysLocale()** - gets the system language 
- **URLPrefGui()** - shimanov‘s workaround for displaying URLs in a gui
- **ReadProxy()** - reads the proxy settings from the windows registry
- **CountFilesR()** - count files recursive in specific folder (uses COM method)
- **CountFiles()** - count files in specific folder (uses COM method)
- **GetThreadStartAddr()** - returns start adresses from all threads of a process
- **FormatFileSize()** - Formats a file size in bytes to a human-readable size string
- **SendToAHK()** - Sends strings by using a hidden gui between AHK scripts
- **ReceiveFromAHK()** - Receiving strings from SendToAHK
- **PathInfo()** - splits a given path to return as object

-----
###<u>[13-June-2018] count: 323 functions</u>

- **TimedFunction() ** - SetTimer functionality for functions
- **ListGlobalVars() ** - ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string
- **HelpToolTips() ** -  To show defined GUI control help tooltips on hover.
- **StringM() ** -  String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)
- **FileWriteLine() ** -  To write data at specified line in a file.
- **FileMD5() ** - File MD5 Hashing
- **StringMD5() ** - String MD5 Hashing
- **Dec2Base() ** - Base to Decimal and 
- **Base2Dec() ** - Decimal to Base conversion
- **InjectDll() ** - injects a dll to a running process (ahkdll??)
- **HexToFloat() ** - Hexadecimal to Float conversion
- **FloatToHex() ** - Float to Hexadecimal conversion
- **CalculateDistance() ** - calculates the distance between two points in a 2D-Space 
- **IsInRange() ** - shows if a second variable is in range
- **GetRange() ** - another good screen area selection function
- **GetComboBoxChoice()** - Combobox function
- **LB_AdjustItemHeight()** - Listbox function
- **LB_GetItemHeight()** - Listbox function
- **LB_SetItemHeight()**- Listbox function
- **GetClientSize()** - get size of window without border

----
### <u>[10-June-2018] count: 303 functions</u>

*minor layout improvement (so I hope, anyway). In the [AHK forum](https://autohotkey.com/boards/) I read that codefolding does not work. After trying with the [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with  [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey).*

- **ChangeMacAdress()** - change MacAdress, it makes changes to the registry!
- **ListAHKStats()** - Listvars with select desired section: ListLines, ListVars, ListHotkeys, KeyHistory
- **LV_MoveRow()** - the same like above, but slightly different. With integrated script example
- **AddToolTip()** - Add/Update tooltips to GUI controls
- **ExtractTableData()** - extracts tables from HTML files
- **MouseExtras()** - Allows to use subroutines for Holding and Double Clicking a Mouse Button.
- **CaptureScreen()** - screenshot function 4 - orginally from CaptureScreen.ahk
- **CaptureCursor()** - this captures the cursor, depending function of CaptureScreen()
- **Zoomer()** - zooms a HBitmap, depending function of CaptureScreen()
- **SaveHBITMAPToFile()** - saves a HBitmap to a file, depending function of CaptureScreen()

-----
### <u>[02-June-2018] count: 293 functions</u>

***6 functions removed*** - depending functions not available or the functions are doubled, ***added some links*** to the sources of ***origin*** of the functions. As far as findable some feature ***descriptions and example scripts added***.

- **LV_SetBackgroundURL()** - set a ListView's background image
- **GetBgBitMapHandle()** - returns the handle of a background bitmap in a gui
- **CreatePatternBrushFrom()** - can be used to repeat a pattern as background image in a gui
- **GetLastActivePopUp()** - passes the handle of the last active pop-up window of a parent window
- **Convert()** - converts ImageFiles
- **GUI_AutoHide()** - Autohide the GUI function
- **DeskIcons()** - i think its for showing all desktop icons
- **WinFadeToggle()**
- **KilProcess()** - uses DllCalls to end a process
- **ConsoleSend()** - Sends text to a console's input stream
- **StdOutStream()** - Store command line output in autohotkey variable. Supports both x86 and x64.
- **LV_MoveRow()** - moves a listview row up or down
- **SetButtonF()** - Set a button control to call a function instead of a label subroutine 
- **GetScriptVARs()** - returns a key, value array with all script variables (e.g. for debugging purposes)
- **GetAllInputChars()** - Returns a string with input characters
- **LoadScriptResource()** - loads a resource into memory (e.g. picture, scripts..)
- **HIconFromBuffer()** - function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)
- **hBMPFromPNGBuffer()** - Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)
- **getNextControl()** - I'm not sure if this function works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms
- **SaveSetColours()** - Sys colours saving adapted from an approach found in Bertrand Deo's code

-----
### <u>[28-May-2018] count: 280 functions</u>

***Organized layout***, some functions moved to the right topic, delete duplicate functions, adding more info and examples*

***Functionlist to Markdown.ahk*** - my script to handle the Markdown table output for this page. It's not a dynamic script! The output depends from the following syntax: 

```Autohotkey
SystemCursor(OnOff=1) {  							;-- hiding mouse cursor
```

-> it search for '**(**' followed by a '**;--**' , then it recognized it as a function, it uses the comment as short description

-> it ignores all functions without '**;--**' or functions that marked with '**;{ sub**' at the beginning and '**;}**' at the end:

```Autohotkey
;{ sub
;If [var] in [ .. ]
InVar(Haystack, Needle, Delimiter := ",", OmitChars := "") {
	Loop, Parse, % Needle, %Delimiter%, %OmitChars%
		if (A_LoopField = Haystack)
			return 1
	return 0
}

IsWindow(hWnd*) {
	if !hWnd.MaxIndex()
		return DllCall("User32.dll\GetForegroundWindow")
	return i := DllCall("User32.dll\IsWindow", "Ptr", hWnd[1] )
		, ErrorLevel := !i
}
;}
```

***new functions:***

- **LVGetCount()** - get current count of notes in a Listbox

- **LV_SetSelColors()** - Sets the colors for selected rows in a ListView.

- **LV_Select()** - de- or select a row in a ListView

- **![splitbutton](https://raw.githubusercontent.com/Ixiko/AHK-Forum/master/images/SplitButton.png)SplitButton()** - drop down button 

- **TV_Find()** -  return the ID of an item based on the text of the item

- **FileCount(filter)** - count matching files in the working directory

- **AddToolTip()** - adds a ToolTip to a gui button

- **SetTaskbarProgress()** - Accesses Windows 7's ability to display a progress bar behind a taskbar button

- **RegExSplit()** -split a string by a regular expression pattern and receive an array as a result

- **CreateGist()** - sends your script to your gist

- **IsOfficeFile()** - checks if a file is an Office file

- **GetAllResponseHeaders()** - Gets the values of all HTTP headers

- **GetImageTypeW()** - Identify the image type (UniCode)

- **Edit_VCenter()** - Vertically Align Text

- **BetterBox()** - custom input box allows to choose the position of the text insertion point

- **BtnBox()** - show a custom MsgBox with arbitrarily named buttons

- **LoginBox()** - show a custom input box for credentials, return an object with Username and Password

- **MultiBox()** - show a multi-line input box, return the entered text

- **PassBox()** -show a custom input box for a password

- **LoadFile()** - Loads a script file as a child process and returns an object

- **RGBRange()** - returns an array for a color transition from x to y

- **SystemCursor()** - hiding mouse cursor

- **getSelectionCoords()** - creates a click-and-drag selection box to specify an area and returns the coordinates

- **Mean()** - returns Average values in comma delimited list

- **Median()** - returns Median in a set of numbers from a list

- **Mode()** - returns the mode from a list of numbers

- **FloodFill()** - filling an area using color banks

- **CreateBMPGradient()** - Horizontal/Vertical gradient

- **NetStat()** - passes information over network connections similar to the netstat -an CMD command.

- **TV_Load()** - loads TreeView items from an XML string

-----
### <u>[22-May-2018] count: 240 functions</u>

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs

+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized

+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging

+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 

+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12

+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.

+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm

+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

-----
### <u>[06-May-2018] count: 230 functions</u>

- **getByControlName()**  - function uses DllCalls
- **listAccChildProperty()** - uses COM functionality
- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string
- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of the currently selected tab, the second returns the tab name

-----
### <u>[01-May-2018] count: 221 functions</u>

- **PIC_GDI_GUI()** - a GDI Gui for showing pictures and more
- **FullScreenToggleUnderMouse()** - Window to pseudo fullscreen and back
- **ControlCreateGradient()** - Paint a gradient over a control - i think over buttons is not working
- **Edit control type functions** - 6 functions for reading and manipulating an Edit-Control
- **DPIFactor()** - get DPI Factor of system running this script, for easier creation of Gui windows
- **FindWindow()** - easily find any window
- **GetContextMenuState(), GetContextMenuID(), GetContextMenuText()** - self descripting
- **MenuGetAll(), MenuGetAll_sub()** - self-descriptive
- **GetListViewItemText(), GetListViewText()** - retreave info's from other Listview's
- **CatMull_ControlMove()** - move a control along a Bezier-Spline
- **WM_DEVICECHANGE()** - OnMessage Device Change function from Autohotkey-Forum
- **GetHTMLFragment()** - what exactly does this function is unknown - found anywhere, but maybe useful

<br>

-----

## <u>Complete List of functions</u>

*sometimes the function names are the same but they use different methods to get the same result*

| FNr  | Line  | name of function and description                             |
| :--: | :---: | ------------------------------------------------------------ |
| 001 | 00009 | **CMDret_RunReturn()** |
| 002 | 00122 | **ConsoleSend()** - *Sends text to a console's input stream* |
| 003 | 00180 | **StdOutStream()** - *Store command line output in autohotkey variable. Supports both x86 and x64.* |
| 004 | 00362 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 005 | 00371 | **TimePlus()** |
| 006 | 00381 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 007 | 00389 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 008 | 00409 | **GetProcesses()** - *get the name of all running processes* |
| 009 | 00450 | **getProcesses()** - *get running processes with search using comma separated list* |
| 010 | 00501 | **GetProcessWorkingDir()** - *like the name explains* |
| 011 | 00532 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 012 | 00542 | **GetTextSize()** - *different function to the above one* |
| 013 | 00626 | **MeasureText()** - *alternative to other functions which calculate the text size before display on the screen* |
| 014 | 00665 | **monitorInfo()** - *shows infos about your monitors* |
| 015 | 00682 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 016 | 00694 | **IsOfficeFile()** - *checks if a file is an Office file* |
| 017 | 00762 | **DeskIcons()** - *i think its for showing all desktop icons* |
| 018 | 00805 | **GetFuncDefs()** - *get function definitions from a script* |
| 019 | 00847 | **IndexOfIconResource()** - *function is used to convert an icon resource id (as those used in the registry) to icon index(as used by ahk)* |
| 020 | 00883 | **GetIconforext()** - *Gets default registered icon for an extension* |
| 021 | 00905 | **GetImageType()** - *returns whether a process is 32bit or 64bit* |
| 022 | 00925 | **GetProcessName()** - *Gets the process name from a window handle.* |
| 023 | 00931 | **GetDisplayOrientation()** - *working function to get the orientation of screen* |
| 024 | 00947 | **GetSysErrorText()** - *method to get meaningful data out of the error codes* |
| 025 | 00963 | **getSysLocale()** - *gets the system language* |
| 026 | 00978 | **GetThreadStartAddr()** - *returns start adresses from all threads of a process* |
| 027 | 01034 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 028 | 01413 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 029 | 01445 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 030 | 01496 | **Gdip_FillRoundedRectangle()** |
| 031 | 01517 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 032 | 01595 | **CreateSurface()** - *creates a drawing GDI surface* |
| 033 | 01673 | **DrawLine()** - *used DLLCall to draw a line* |
| 034 | 01680 | **DrawRectangle()** - *used DLLCall to draw a rectangle* |
| 035 | 01690 | **DrawRectangle()** - *this is for screenshots* |
| 036 | 01719 | **DrawFrameAroundControl()** - *paints a rectangle around a specified control* |
| 037 | 01787 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 038 | 01886 | **SetAlpha()** - *set alpha to a layered window* |
| 039 | 01893 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 040 | 01919 | **RotateAroundCenter()** - *GDIP rotate around center* |
| 041 | 01928 | **Screenshot()** - *screenshot function 1* |
| 042 | 01943 | **TakeScreenshot()** - *screenshot function 2* |
| 043 | 01971 | **CaptureWindow()** - *screenshot function 3* |
| 044 | 02001 | **CaptureScreen()** - *screenshot function 4 - orginally from CaptureScreen.ahk* |
| 045 | 02087 | **CaptureCursor()** - *this captures the cursor* |
| 046 | 02112 | **Zoomer()** - *zooms a HBitmap, depending function of CaptureScreen()* |
| 047 | 02129 | **Convert()** - *converts from one picture format to another one, depending on Gdip restriction only .bmp, .jpg, .png is possible* |
| 048 | 02194 | **SaveHBITMAPToFile()** - *saves a HBitmap to a file* |
| 049 | 02207 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 050 | 02237 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 051 | 02304 | **GetRange()** - *another good screen area selection function* |
| 052 | 02415 | **FloodFill()** - *filling an area using color banks* |
| 053 | 02464 | **CreateBMPGradient()** - *Horizontal/Vertical gradient* |
| 054 | 02487 | **BGR()** - *BGR() subfunction from CreateBMPGradient()* |
| 055 | 02495 | **CreatePatternBrushFrom()** - *as it says* |
| 056 | 02527 | **ResConImg()** - *Resize and convert images. png, bmp, jpg, tiff, or gif* |
| 057 | 02579 | **CreateCircleProgress()** - *very nice to see functions for a circle progress* |
| 058 | 02701 | **RGBrightnessToHex()** - *transform rbg (with brightness) values to hex* |
| 059 | 02706 | **GetHueColorFromFraction()** - *get hue color from fraction. example: h(0) is red, h(1/3) is green and h(2/3) is blue* |
| 060 | 02736 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 061 | 02807 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 062 | 02914 | **Popup()** - *Splashtext Gui* |
| 063 | 02938 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture* |
| 064 | 02976 | **SplitButton()** - *drop down button* |
| 065 | 03048 | **AddToolTip()** - *adds a ToolTip to a gui button* |
| 066 | 03135 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 067 | 03184 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 068 | 03232 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 069 | 03278 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 070 | 03323 | **PassBox()** - *show a custom input box for a password* |
| 071 | 03368 | **CreateHotkeyWindow()** - *Hotkey Window* |
| 072 | 03404 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 073 | 03596 | **guiMsgBox()** - *GUI Message Box to allow selection* |
| 074 | 03628 | **URLPrefGui()** - *shimanov's workaround for displaying URLs in a gui* |
| 075 | 03737 | **TaskDialog()** - *a Task Dialog is a new kind of dialogbox that has been added in Windows Vista and later. They are similar to message boxes, but with much more power.* |
| 076 | 03767 | **TaskDialogDirect()** |
| 077 | 03808 | **TaskDialogMsgBox()** |
| 078 | 03848 | **TaskDialogToUnicode()** |
| 079 | 03856 | **TaskDialogCallback()** |
| 080 | 03877 | **TT_Console()** - *Use Tooltip as a User Interface it returns the key which has been pressed* |
| 081 | 03936 | **ToolTipEx()** - *Display ToolTips with custom fonts and colors* |
| 082 | 04147 | **SafeInput()** - *makes sure sure the same window stays active after showing the InputBox. Otherwise you might get the text pasted into another window unexpectedly.* |
| 083 | 04159 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 084 | 04172 | **WinFadeToggle()** |
| 085 | 04234 | **winfade()** - *another winfade function* |
| 086 | 04251 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 087 | 04257 | **FrameShadow()** - *FrameShadow1* |
| 088 | 04268 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 089 | 04296 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 090 | 04339 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar* |
| 091 | 04353 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 092 | 04383 | **CreateFont()** - *creates HFont for use with GDI* |
| 093 | 04414 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 094 | 04435 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 095 | 04501 | **SetTaskbarProgress()** - *modified function* |
| 096 | 04568 | **WinSetPlacement()** - *Sets window position using workspace coordinates (-> no taskbar)* |
| 097 | 04597 | **AttachToolWindow()** - *Attaches a window as a tool window to another window from a different process.* |
| 098 | 04617 | **DeAttachToolWindow()** - *removes the attached ToolWindow* |
| 099 | 04639 | **Control_SetTextAndResize()** - *set a new text to a control and resize depending on textwidth and -height* |
| 100 | 04670 | **GetComboBoxChoice()** - *Combobox function* |
| 101 | 04704 | **Edit_Standard_Params()** - *these are helper functions to use with Edit or HEdit controls* |
| 102 | 04714 | **Edit_TextIsSelected()** |
| 103 | 04721 | **Edit_GetSelection()** |
| 104 | 04733 | **Edit_Select()** |
| 105 | 04745 | **Edit_SelectLine()** |
| 106 | 04777 | **Edit_DeleteLine()** |
| 107 | 04793 | **Edit_VCenter()** - *Vertically Align Text* |
| 108 | 04827 | **IL_LoadIcon()** |
| 109 | 04835 | **IL_GuiButtonIcon()** |
| 110 | 04862 | **LB_AdjustItemHeight()** - *Listbox function* |
| 111 | 04868 | **LB_GetItemHeight()** - *Listbox function* |
| 112 | 04875 | **LB_SetItemHeight()** - *Listbox function* |
| 113 | 04887 | **LV_GetCount()** - *get current count of notes in a listview* |
| 114 | 04897 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 115 | 04964 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 116 | 04986 | **LV_GetItemText()** - *read the text from an item in a TListView* |
| 117 | 05025 | **LV_GetText()** |
| 118 | 05150 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 119 | 05196 | **LV_MoveRow()** - *moves a listview row up or down* |
| 120 | 05216 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 121 | 05268 | **LV_Find()** - *I think it's usefull to find an item position a listview* |
| 122 | 05284 | **LV_GetSelectedText()** - *Returns text from selected rows in ListView (in a user friendly way IMO.)* |
| 123 | 05330 | **LV_Notification()** - *easy function for showing notifications by hovering over a listview* |
| 124 | 05355 | **LV_IsChecked()** - *alternate method to find out if a particular row number is checked* |
| 125 | 05362 | **LV_HeaderFontSet()** - *sets a different font to a Listview header (it's need CreateFont() function)* |
| 126 | 05456 | **LV_SetCheckState()** - *check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control* |
| 127 | 05487 | **LV_SetItemState()** - *with this function you can set all avaible states to a listview item* |
| 128 | 05525 | **NumPut()** - *mask* |
| 129 | 05526 | **NumPut()** - *iItem* |
| 130 | 05527 | **NumPut()** - *state* |
| 131 | 05528 | **NumPut()** - *stateMask* |
| 132 | 05539 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 133 | 05547 | **TabCtrl_GetItemText()** - *returns text of a tab* |
| 134 | 05592 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 135 | 05606 | **TV_Load()** - *loads TreeView items from an XML string* |
| 136 | 05792 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 137 | 05810 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 138 | 05847 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 139 | 05858 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 140 | 05874 | **ControlExists()** - *true/false for ControlClass* |
| 141 | 05886 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 142 | 05918 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 143 | 05947 | **GetOtherControl()** |
| 144 | 05953 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 145 | 05976 | **Control_GetClassNN()** - *no-loop* |
| 146 | 05988 | **ControlGetClassNN()** - *with loop* |
| 147 | 06002 | **Control_GetFont()** - *get the currently used font of a control* |
| 148 | 06024 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 149 | 06029 | **getControlNameByHwnd()** - *self explaining* |
| 150 | 06047 | **getByControlName()** - *search by control name return hwnd* |
| 151 | 06081 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 152 | 06132 | **IsControlUnderCursor()** - *Checks if a specific control is under the cursor and returns its ClassNN if it is.* |
| 153 | 06139 | **GetFocusedControl()** - *get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available* |
| 154 | 06174 | **ControlGetTextExt()** - *3 different variants are tried to determine the text of a control* |
| 155 | 06201 | **getControlInfo()** - *get width and heights of controls* |
| 156 | 06218 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 157 | 06228 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 158 | 06401 | **GetParent()** - *get parent win handle of a window* |
| 159 | 06407 | **GetWindow()** - *DllCall wrapper for GetWindow function* |
| 160 | 06413 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 161 | 06419 | **IsWindowVisible()** - *self explaining* |
| 162 | 06425 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 163 | 06432 | **IsClosed()** - *AHK function (WinWaitClose) wrapper* |
| 164 | 06439 | **GetClassLong()** |
| 165 | 06446 | **GetWindowLong()** |
| 166 | 06453 | **GetClassStyles()** |
| 167 | 06480 | **GetTabOrderIndex()** |
| 168 | 06507 | **GetCursor()** |
| 169 | 06514 | **GetExtraStyle()** - *get Extra Styles from a gui/window* |
| 170 | 06535 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 171 | 06593 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 172 | 06670 | **GetHeaderInfo()** |
| 173 | 06732 | **GetClientCoords()** |
| 174 | 06742 | **GetClientSize()** - *get size of window without border* |
| 175 | 06750 | **GetWindowCoords()** |
| 176 | 06757 | **GetWindowPos()** |
| 177 | 06767 | **GetWindowPlacement()** - *Gets window position using workspace coordinates (-> no taskbar)* |
| 178 | 06781 | **GetWindowInfo()** |
| 179 | 06803 | **GetOwner()** |
| 180 | 06807 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 181 | 06863 | **FindWindow()** - *Finds the first window matching specific criterias.* |
| 182 | 06893 | **ShowWindow()** - *uses a DllCall to show a window* |
| 183 | 06897 | **IsWindow()** - *wrapper for IsWindow DllCall* |
| 184 | 06901 | **IsWindowVisible()** |
| 185 | 06905 | **GetClassName()** - *wrapper for AHK WinGetClass function* |
| 186 | 06911 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 187 | 06941 | **FindChildWindow()** - *finds child window hwnds of the parent window* |
| 188 | 06986 | **EnumChildWindow()** - *sub function of FindChildWindow* |
| 189 | 06999 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 190 | 07013 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 191 | 07021 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 192 | 07025 | **GetFreeGuiNum()** - *gets a free gui number.* |
| 193 | 07041 | **IsWindowUnderCursor()** - *Checks if a specific window is under the cursor.* |
| 194 | 07049 | **GetCenterCoords()** - *?center a gui between 2 monitors?* |
| 195 | 07070 | **RMApp_NCHITTEST()** - *Determines what part of a window the mouse is currently over* |
| 196 | 07084 | **GetCPA_file_name()** - *retrieves Control Panel applet icon* |
| 197 | 07116 | **WinGetClientPos()** - *gives back the coordinates of client area inside a gui/window - with DpiFactor correction* |
| 198 | 07159 | **ChooseColor()** |
| 199 | 07180 | **GetWindowIcon()** |
| 200 | 07260 | **GetStatusBarText()** |
| 201 | 07276 | **GetAncestor()** |
| 202 | 07281 | **MinMaxInfo()** |
| 203 | 07300 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 204 | 07317 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 205 | 07338 | **ControlClick2()** - *ControlClick Double Click* |
| 206 | 07348 | **ControlFromPoint()** - *returns the hwnd of a control at a specific point on the screen* |
| 207 | 07388 | **EnumChildFindPoint()** - *this function is required by ControlFromPoint* |
| 208 | 07427 | **ControlDoubleClick()** - *simulates a double click on a control with left/middle or right mousebutton* |
| 209 | 07447 | **WinWaitForMinimized()** |
| 210 | 07465 | **CenterWindow()** - *Given a the window's width and height, calculates where to position its upper-left corner so that it is centered EVEN IF the task bar is on the left side or top side of the window* |
| 211 | 07484 | **GuiCenterButtons()** - *Center and resize a row of buttons automatically* |
| 212 | 07536 | **CenterControl()** - *Centers one control* |
| 213 | 07589 | **SetWindowIcon()** |
| 214 | 07595 | **SetWindowPos()** |
| 215 | 07599 | **TryKillWin()** |
| 216 | 07617 | **Win32_SendMessage()** - *Closing a window through sendmessage command* |
| 217 | 07629 | **Win32_TaskKill()** |
| 218 | 07638 | **Win32_Terminate()** |
| 219 | 07649 | **TabActivate()** |
| 220 | 07657 | **FocuslessScroll()** |
| 221 | 07758 | **FocuslessScrollHorizontal()** |
| 222 | 07792 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 223 | 07814 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 224 | 07834 | **GUI_AutoHide()** - *Autohide the GUI function* |
| 225 | 08101 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 226 | 08195 | **AddToolTip()** - *Add/Update tooltips to GUI controls.* |
| 227 | 08328 | **NumPut()** - *cbSize* |
| 228 | 08329 | **NumPut()** - *uFlags* |
| 229 | 08330 | **NumPut()** - *hwnd* |
| 230 | 08331 | **NumPut()** - *uId* |
| 231 | 08381 | **HelpToolTips()** - *To show defined GUI control help tooltips on hover.* |
| 232 | 08412 | **DisableFadeEffect()** - *disabling fade effect on gui animations* |
| 233 | 08436 | **SetWindowTransistionDisable()** - *disabling fade effect only the window of choice* |
| 234 | 08470 | **DisableMinimizeAnim()** - *disables or restores original minimize anim setting* |
| 235 | 08490 | **DisableCloseButton()** - *to disable/grey out the close button* |
| 236 | 08503 | **GetMenu()** - *returns hMenu handle* |
| 237 | 08508 | **GetSubMenu()** |
| 238 | 08512 | **GetMenuItemCount()** |
| 239 | 08516 | **GetMenuItemID()** |
| 240 | 08520 | **GetMenuString()** |
| 241 | 08535 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 242 | 08544 | **MenuGetAll_sub()** - *described above* |
| 243 | 08567 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 244 | 08605 | **GetContextMenuID()** - *returns the ID of a menu entry* |
| 245 | 08628 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 246 | 08687 | **Menu_AssignBitmap()** - *assign bitmap to any item in any AHk menu* |
| 247 | 08927 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 248 | 09004 | **Function_Eject()** - *ejects a drive medium* |
| 249 | 09036 | **FileGetDetail()** - *Get specific file property by index* |
| 250 | 09047 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 251 | 09063 | **DirExist()** - *Checks if a directory exists* |
| 252 | 09067 | **GetDetails()** - *Create an array of possible file properties* |
| 253 | 09081 | **Start()** - *Start programs or scripts easier* |
| 254 | 09100 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 255 | 09108 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 256 | 09257 | **WatchDirectory()** - *it's different from above not tested* |
| 257 | 09454 | **GetFileIcon()** |
| 258 | 09467 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 259 | 09481 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 260 | 09494 | **DestroyIcon()** |
| 261 | 09498 | **listfunc()** - *list all functions inside ahk scripts* |
| 262 | 09514 | **CreateOpenWithMenu()** - *creates an 'open with' menu for the passed file.* |
| 263 | 09666 | **FileCount()** - *count matching files in the working directory* |
| 264 | 09674 | **GetImageTypeW()** - *Identify the image type (UniCode)* |
| 265 | 09718 | **FileWriteLine()** - *to write data at specified line in a file.* |
| 266 | 09728 | **FileMD5()** - *file MD5 hashing* |
| 267 | 09744 | **FileCRC32()** - *computes and returns CRC32 hash for a File passed as parameter* |
| 268 | 09762 | **FindFreeFileName()** - *Finds a non-existing filename for Filepath by appending a number in brackets to the name* |
| 269 | 09775 | **CountFilesR()** - *count files recursive in specific folder (uses COM method)* |
| 270 | 09784 | **CountFiles()** - *count files in specific folder (uses COM method)* |
| 271 | 09790 | **PathInfo()** - *splits a given path to return as object* |
| 272 | 09808 | **CreateFont()** - *creates font in memory which can be used with any API function accepting font handles* |
| 273 | 09857 | **GetHFONT()** - *gets a handle to a font used in a AHK gui for example* |
| 274 | 09870 | **MsgBoxFont()** - *style your MsgBox with with your prefered font* |
| 275 | 09893 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 276 | 10127 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 277 | 10167 | **HDrop()** - *Drop files to another app* |
| 278 | 10200 | **WM_MOVE()** - *UpdateLayeredWindow* |
| 279 | 10213 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 280 | 10241 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 281 | 10245 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 282 | 10294 | **DownloadFile()** |
| 283 | 10317 | **NewLinkMsg()** |
| 284 | 10333 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 285 | 10343 | **GetSourceURL()** |
| 286 | 10355 | **DNS_QueryName()** |
| 287 | 10380 | **GetHTMLFragment()** |
| 288 | 10399 | **ScrubFragmentIdents()** |
| 289 | 10409 | **EnumClipFormats()** |
| 290 | 10417 | **GetClipFormatNames()** |
| 291 | 10436 | **GoogleTranslate()** |
| 292 | 10455 | **getText()** - *get text from html* |
| 293 | 10470 | **getHtmlById()** |
| 294 | 10475 | **getTextById()** |
| 295 | 10479 | **getHtmlByTagName()** |
| 296 | 10487 | **getTextByTagName()** |
| 297 | 10495 | **CreateGist()** |
| 298 | 10517 | **GetAllResponseHeaders()** - *Gets the values of all HTTP headers* |
| 299 | 10586 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 300 | 10684 | **ExtractTableData()** - *extracts tables from HTML files* |
| 301 | 10807 | **IsConnected()** - *Returns true if there is an available internet connection* |
| 302 | 10824 | **Min()** - *returns the smaller of 2 numbers* |
| 303 | 10828 | **Max()** - *determines the larger number* |
| 304 | 10832 | **Mean()** - *returns Average values in comma delimited list* |
| 305 | 10846 | **Median()** - *returns Median in a set of numbers from a list* |
| 306 | 10873 | **Mode()** - *returns the mode from a list of numbers* |
| 307 | 10902 | **Dec2Base()** - *Base to Decimal and* |
| 308 | 10908 | **Base2Dec()** - *Decimal to Base conversion* |
| 309 | 10914 | **HexToFloat()** - *Hexadecimal to Float conversion* |
| 310 | 10918 | **FloatToHex()** - *Float to Hexadecimal conversion* |
| 311 | 10928 | **CalculateDistance()** - *calculates the distance between two points in a 2D-Space* |
| 312 | 10932 | **IsInRange()** - *shows if a second variable is in range* |
| 313 | 10943 | **FormatFileSize()** - *Formats a file size in bytes to a human-readable size string* |
| 314 | 10963 | **ObjMerge()** |
| 315 | 10979 | **evalRPN()** - *Parsing/RPN calculator algorithm* |
| 316 | 11015 | **StackShow()** |
| 317 | 11023 | **ExploreObj()** - *Returns a string containing the formatted object keys and values (very nice for debugging!)* |
| 318 | 11038 | **Sort2DArray()** - *a two dimensional TDArray* |
| 319 | 11059 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 320 | 11092 | **QuickSort()** - *Sort array using QuickSort algorithm* |
| 321 | 11357 | **GetNestedTag()** |
| 322 | 11387 | **GetHTMLbyID()** - *uses COM* |
| 323 | 11402 | **GetHTMLbyTag()** - *uses COM* |
| 324 | 11417 | **GetXmlElement()** - *RegEx function* |
| 325 | 11435 | **sXMLget()** |
| 326 | 11448 | **ParseJsonStrToArr()** - *Parse Json string to an array* |
| 327 | 11480 | **parseJSON()** - *Parse Json string to an object* |
| 328 | 11501 | **AddTrailingBackslash()** |
| 329 | 11509 | **CheckQuotes()** |
| 330 | 11518 | **ReplaceForbiddenChars()** |
| 331 | 11531 | **cleanlines()** |
| 332 | 11545 | **cleancolon()** |
| 333 | 11555 | **cleanspace()** |
| 334 | 11568 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 335 | 11576 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 336 | 11583 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 337 | 11608 | **StringMD5()** - *String MD5 Hashing* |
| 338 | 11619 | **uriEncode()** - *A function to escape characters like & for use in URLs.* |
| 339 | 11634 | **Ansi2Unicode()** |
| 340 | 11654 | **Unicode2Ansi()** |
| 341 | 11678 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 342 | 11712 | **StringM()** - *String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)* |
| 343 | 11752 | **StrCount()** - *a very handy function to count a needle in a Haystack* |
| 344 | 11759 | **SuperInstr()** - *Returns min/max position for a | separated values of Needle(s)* |
| 345 | 11788 | **LineDelete()** - *deletes lines of text from variables / no loop* |
| 346 | 11856 | **ExtractFuncTOuserAHK()** - *extract user function and helps to write it to userAhk.api* |
| 347 | 11977 | **PdfToText()** - *copies a selected PDF file to memory - it needs xpdf - pdftotext.exe* |
| 348 | 12004 | **PdfPageCounter()** - *counts pages of a pdffile (works with 95% of pdf files)* |
| 349 | 12020 | **PasteWithIndent()** - *paste string to an editor with your prefered indent key* |
| 350 | 12036 | **SplitLine()** - *split string to key and value* |
| 351 | 12046 | **Ask_and_SetbackFocus()** - *by opening a msgbox you lost focus and caret pos in any editor - this func will restore the previous positions of the caret* |
| 352 | 12113 | **DelaySend()** - *Send keystrokes delayed* |
| 353 | 12159 | **SetLayout()** - *set a keyboard layout* |
| 354 | 12164 | **GetAllInputChars()** - *Returns a string with input characters* |
| 355 | 12174 | **ReleaseModifiers()** - *helps to solve the Hotkey stuck problem* |
| 356 | 12221 | **isaKeyPhysicallyDown()** - *belongs to ReleaseModifiers() function* |
| 357 | 12234 | **GetText()** - *copies the selected text to a variable while preserving the clipboard.(Ctrl+C method)* |
| 358 | 12251 | **PutText()** - *Pastes text from a variable while preserving the clipboard. (Ctrl+v method)* |
| 359 | 12273 | **ShowTrayBalloon()** |
| 360 | 12309 | **CreateNamedPipe()** - *creates an instance of a named pipe and returns a handle for subsequent pipe operations* |
| 361 | 12314 | **RestoreCursors()** - *for normal cursor at GUI* |
| 362 | 12319 | **SetSystemCursor()** - *enables an application to customize the system cursors by using a file or by using the system cursor* |
| 363 | 12400 | **SystemCursor()** - *hiding mouse cursor* |
| 364 | 12439 | **ToggleSystemCursor()** - *choose a cursor from system cursor list* |
| 365 | 12518 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 366 | 12554 | **GlobalVarsScript()** |
| 367 | 12579 | **patternScan()** |
| 368 | 12678 | **scanInBuf()** |
| 369 | 12716 | **hexToBinaryBuffer()** |
| 370 | 12739 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 371 | 12831 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 372 | 12904 | **KillProcess()** - *uses DllCalls to end a process* |
| 373 | 12937 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 374 | 12982 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 375 | 12997 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 376 | 13031 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 377 | 13065 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 378 | 13120 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 379 | 13185 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 380 | 13264 | **TimedFunction()** - *SetTimer functionality for functions* |
| 381 | 13291 | **ListGlobalVars()** - *ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string* |
| 382 | 13341 | **TaskList()** - *list all running tasks (no use of COM)* |
| 383 | 13392 | **MouseDpi()** - *Change the current dpi setting of the mouse* |
| 384 | 13412 | **SendToAHK()** - *Sends strings by using a hidden gui between AHK scripts* |
| 385 | 13441 | **ReceiveFromAHK()** - *Receiving strings from SendToAHK* |
| 386 | 13472 | **GetDllBase()** |
| 387 | 13494 | **getProcBaseFromModules()** |
| 388 | 13551 | **InjectDll()** - *injects a dll to a running process (ahkdll??)* |
| 389 | 13576 | **getProcessBaseAddress()** - *gives a pointer to the base address of a process for further memory reading* |
| 390 | 13596 | **getURL()** - *using shell.application* |
| 391 | 13609 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 392 | 13769 | **CreatePropertyConditionEx()** |
| 393 | 13799 | **UIAgetControlNameByHwnd()** |
| 394 | 13819 | **Acc_Get()** |
| 395 | 13871 | **Acc_Error()** |
| 396 | 13876 | **Acc_ChildrenByRole()** |
| 397 | 13918 | **listAccChildProperty()** |
| 398 | 13975 | **IEGet()** - *AutoHotkey_L* |
| 399 | 13983 | **IEGet()** - *AutoHotkey_Basic* |
| 400 | 13997 | **WBGet()** - *AHK_L: based on ComObjQuery docs* |
| 401 | 14011 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 402 | 14025 | **WBGet()** - *based on ComObjQuery docs* |
| 403 | 14042 | **TabActivate()** - *activate a TAB in InternetExplorer* |
| 404 | 14053 | **ReadProxy()** - *reads the proxy settings from the windows registry* |
| 405 | 14068 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 406 | 14084 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 407 | 14088 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 408 | 14093 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 409 | 14144 | **Valueof()** - *Super Variables processor by Avi Aryan, overcomes the limitation of a single level ( return %var% ) in nesting variables* |
| 410 | 14207 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq* |
