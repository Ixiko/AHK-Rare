# AHK-Rare

### My collection of rare or very useful single functions

------

Last modification date: ***10.06.2018***, *Changes are below!* At the end of this document you will find a complete list of all functions. The functions are sorted by topic as shown in the picture.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)

----

<br>

### [10-June-2018] count: 303 functions

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

### [02-June-2018] count: 293 functions

***6 functions removed*** - depending functions not available or the functions are doubled, ***added some links*** to the sources of ***origin*** of the functions. As far as findable some feature ***descriptions and example scripts added***.

- **LV_SetBackgroundURL()** - set a ListView's background image 

- **GetBgBitMapHandle()** - returns the handle of a background bitmap in a gui

- **CreatePatternBrushFrom()** - can be used to repeat a pattern as background image in a gui

- **GetLastActivePopUp()** - passes the handle of the last active pop-up window of a parent window

- **Convert()** - converts ImageFiles

- **GUI_AutoHide()** - Autohide the GUI function

- **DeskIcons()** - i think its for showing all desktop icons

- **WinFadeToggle()**

- **KillProcess()** - uses DllCalls to end a process

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

  

### [28-May-2018] count: 280 functions

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

- **![](https://raw.githubusercontent.com/Ixiko/AHK-Forum/master/images/SplitButton.png)SplitButton()** - drop down button 

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

  <br>

### [22-May-2018] count: 240 functions

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs

+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized

+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging

+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 

+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12

+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.

+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm

+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

  <br>

### [06-May-2018] count: 230 functions

- **getByControlName()**  - function uses DllCalls

- **listAccChildProperty()** - uses COM functionality

- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string

- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of the currently selected tab, the second returns the tab name

  <br>

### [01-May-2018] count: 221 functions

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

## Complete List of functions

*sometimes the function names are the same but they use different methods to get the same result*

| FNr  | Line  | name of function and description                             |
| :--: | :---: | ------------------------------------------------------------ |
| 001  | 00009 | **CMDret_RunReturn()**                                       |
| 002  | 00122 | **ConsoleSend()** - *Sends text to a console's input stream* |
| 003  | 00180 | **StdOutStream()** - *Store command line output in autohotkey variable. Supports both x86 and x64.* |
| 004  | 00330 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 005  | 00339 | **TimePlus()**                                               |
| 006  | 00349 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 007  | 00357 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 008  | 00377 | **GetProcesses()** - *get the name of all running processes* |
| 009  | 00418 | **getProcesses()** - *get running processes with search using comma separated list* |
| 010  | 00469 | **GetProcessWorkingDir()** - *like the name explains*        |
| 011  | 00500 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 012  | 00510 | **GetTextSize()** - *different function to the above one*    |
| 013  | 00558 | **monitorInfo()** - *shows infos about your monitors*        |
| 014  | 00575 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 015  | 00587 | **IsOfficeFile()** - *checks if a file is an Office file*    |
| 016  | 00655 | **DeskIcons()** - *i think its for showing all desktop icons* |
| 017  | 00707 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 018  | 01086 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 019  | 01118 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 020  | 01169 | **Gdip_FillRoundedRectangle()**                              |
| 021  | 01190 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 022  | 01268 | **CreateSurface()** - *creates a drawing GDI surface*        |
| 023  | 01346 | **DrawLine()** - *used DLLCall to draw a line*               |
| 024  | 01353 | **DrawRectangle()** - *used DLLCall to draw a rectangle*     |
| 025  | 01363 | **DrawRectangle()** - *this is for screenshots*              |
| 026  | 01392 | **DrawFrameAroundControl()**                                 |
| 027  | 01460 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 028  | 01559 | **SetAlpha()** - *set alpha to a layered window*             |
| 029  | 01566 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 030  | 01592 | **RotateAroundCenter()** - *GDIP rotate around center*       |
| 031  | 01601 | **Screenshot()** - *screenshot function 1*                   |
| 032  | 01616 | **TakeScreenshot()** - *screenshot function 2*               |
| 033  | 01644 | **CaptureWindow()** - *screenshot function 3*                |
| 034  | 01674 | **CaptureScreen()** - *screenshot function 4 - orginally from CaptureScreen.ahk* |
| 035  | 01760 | **CaptureCursor()** - *this captures the cursor*             |
| 036  | 01785 | **Zoomer()** - *zooms a HBitmap, depending function of CaptureScreen()* |
| 037  | 01802 | **Convert()** - *converts from one picture format to another one, depending on Gdip restriction only .bmp, .jpg, .png is possible* |
| 038  | 01867 | **SaveHBITMAPToFile()** - *saves a HBitmap to a file*        |
| 039  | 01880 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 040  | 01910 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 041  | 01977 | **FloodFill()** - *filling an area using color banks*        |
| 042  | 02026 | **CreateBMPGradient()** - *Horizontal/Vertical gradient*     |
| 043  | 02049 | **BGR()** - *BGR() subfunction from CreateBMPGradient()*     |
| 044  | 02057 | **CreatePatternBrushFrom()** - *as it says*                  |
| 045  | 02108 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 046  | 02179 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 047  | 02286 | **Popup()** - *Splashtext Gui*                               |
| 048  | 02310 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture*            |
| 049  | 02348 | **SplitButton()** - *drop down button*                       |
| 050  | 02420 | **AddToolTip()** - *adds a ToolTip to a gui button*          |
| 051  | 02507 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 052  | 02556 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 053  | 02604 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 054  | 02650 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 055  | 02695 | **PassBox()** - *show a custom input box for a password*     |
| 056  | 02740 | **CreateHotkeyWindow()** - *Hotkey Window*                   |
| 057  | 02776 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 058  | 02973 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 059  | 02986 | **WinFadeToggle()**                                          |
| 060  | 03048 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 061  | 03054 | **FrameShadow()** - *FrameShadow1*                           |
| 062  | 03065 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 063  | 03093 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 064  | 03136 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar*       |
| 065  | 03150 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 066  | 03180 | **CreateFont()** - *creates HFont for use with GDI*          |
| 067  | 03211 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 068  | 03232 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 069  | 03298 | **SetTaskbarProgress()** - *modified function*               |
| 070  | 03385 | **Edit_Standard_Params()** - *these are helper functions to use with Edit or HEdit controls* |
| 071  | 03395 | **Edit_TextIsSelected()**                                    |
| 072  | 03402 | **Edit_GetSelection()**                                      |
| 073  | 03414 | **Edit_Select()**                                            |
| 074  | 03426 | **Edit_SelectLine()**                                        |
| 075  | 03458 | **Edit_DeleteLine()**                                        |
| 076  | 03474 | **Edit_VCenter()** - *Vertically Align Text*                 |
| 077  | 03508 | **IL_LoadIcon()**                                            |
| 078  | 03516 | **IL_GuiButtonIcon()**                                       |
| 079  | 03543 | **LV_GetCount()** - *get current count of notes in a listview* |
| 080  | 03553 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 081  | 03620 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 082  | 03642 | **LV_HeaderFontSet()** - *sets the font of a listview header* |
| 083  | 03740 | **LV_GetItemText()** - *read the text from an item in a TListView* |
| 084  | 03779 | **LV_GetText()**                                             |
| 085  | 03904 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 086  | 03950 | **LV_MoveRow()** - *moves a listview row up or down*         |
| 087  | 03970 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 088  | 04026 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 089  | 04034 | **TabCtrl_GetItemText()** - *returns text of a tab*          |
| 090  | 04079 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 091  | 04094 | **TV_Load()** - *loads TreeView items from an XML string*    |
| 092  | 04280 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 093  | 04298 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 094  | 04336 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 095  | 04347 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 096  | 04363 | **ControlExists()** - *true/false for ControlClass*          |
| 097  | 04375 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 098  | 04407 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 099  | 04436 | **GetOtherControl()**                                        |
| 100  | 04442 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 101  | 04465 | **Control_GetClassNN()** - *no-loop*                         |
| 102  | 04477 | **ControlGetClassNN()** - *with loop*                        |
| 103  | 04491 | **Control_GetFont()** - *get the currently used font of a control* |
| 104  | 04513 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 105  | 04518 | **getControlNameByHwnd()** - *self explaining*               |
| 106  | 04535 | **getByControlName()** - *search by control name return hwnd* |
| 107  | 04567 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 108  | 04623 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 109  | 04633 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 110  | 04806 | **GetParent()** - *get parent win handle of a window*        |
| 111  | 04812 | **GetWindow()** - *DllCall wrapper for GetWindow function*   |
| 112  | 04818 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 113  | 04824 | **IsWindowVisible()** - *self explaining*                    |
| 114  | 04830 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 115  | 04837 | **IsClosed()** - *AHK function (WinWaitClose) wrapper*       |
| 116  | 04844 | **getProcessBaseAddress()**                                  |
| 117  | 04859 | **GetClassLong()**                                           |
| 118  | 04866 | **GetWindowLong()**                                          |
| 119  | 04873 | **GetClassStyles()**                                         |
| 120  | 04900 | **GetTabOrderIndex()**                                       |
| 121  | 04927 | **GetCursor()**                                              |
| 122  | 04934 | **GetExtraStyle()** - *get Extra Styles from a gui/window*   |
| 123  | 04955 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 124  | 05013 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 125  | 05090 | **GetHeaderInfo()**                                          |
| 126  | 05152 | **GetClientCoords()**                                        |
| 127  | 05162 | **GetWindowCoords()**                                        |
| 128  | 05169 | **GetWindowPos()**                                           |
| 129  | 05179 | **GetWindowPlacement()**                                     |
| 130  | 05193 | **GetWindowInfo()**                                          |
| 131  | 05215 | **GetOwner()**                                               |
| 132  | 05219 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 133  | 05275 | **ShowWindow()**                                             |
| 134  | 05279 | **IsWindow()**                                               |
| 135  | 05283 | **IsWindowVisible()**                                        |
| 136  | 05287 | **GetClassName()** - *wrapper for AHK WinGetClass function*  |
| 137  | 05293 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 138  | 05323 | **FindChildWindow()** - *finds child window hwnds of the parent window* |
| 139  | 05369 | **EnumChildWindow()** - *sub function of FindChildWindow*    |
| 140  | 05382 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 141  | 05396 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 142  | 05404 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 143  | 05410 | **GetMenu()** - *returns hMenu handle*                       |
| 144  | 05415 | **GetSubMenu()**                                             |
| 145  | 05419 | **GetMenuItemCount()**                                       |
| 146  | 05423 | **GetMenuItemID()**                                          |
| 147  | 05427 | **GetMenuString()**                                          |
| 148  | 05442 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 149  | 05451 | **MenuGetAll_sub()** - *described above*                     |
| 150  | 05474 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 151  | 05512 | **GetContextMenuID()** - *returns the ID of a menu entry*    |
| 152  | 05535 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 153  | 05598 | **ChooseColor()**                                            |
| 154  | 05619 | **GetWindowIcon()**                                          |
| 155  | 05699 | **GetImageType()**                                           |
| 156  | 05719 | **GetStatusBarText()**                                       |
| 157  | 05735 | **GetAncestor()**                                            |
| 158  | 05740 | **MinMaxInfo()**                                             |
| 159  | 05758 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 160  | 05775 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 161  | 05797 | **ControlClick2()** - *ControlClick Double Click*            |
| 162  | 05806 | **ControlFromPoint()**                                       |
| 163  | 05826 | **EnumChildFindPoint()**                                     |
| 164  | 05864 | **WinWaitForMinimized()**                                    |
| 165  | 05882 | **CenterWindow()**                                           |
| 166  | 05901 | **GuiCenterButtons()**                                       |
| 167  | 05932 | **CenterControl()**                                          |
| 168  | 05985 | **SetWindowIcon()**                                          |
| 169  | 05991 | **SetWindowPos()**                                           |
| 170  | 05995 | **TryKillWin()**                                             |
| 171  | 06013 | **Win32_SendMessage()**                                      |
| 172  | 06025 | **Win32_TaskKill()**                                         |
| 173  | 06034 | **Win32_Terminate()**                                        |
| 174  | 06045 | **TabActivate()**                                            |
| 175  | 06053 | **FocuslessScroll()**                                        |
| 176  | 06154 | **FocuslessScrollHorizontal()**                              |
| 177  | 06188 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 178  | 06210 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 179  | 06230 | **GUI_AutoHide()** - *Autohide the GUI function*             |
| 180  | 06497 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 181  | 06591 | **AddToolTip()** - *Add/Update tooltips to GUI controls.*    |
| 182  | 06724 | **NumPut()** - *cbSize*                                      |
| 183  | 06725 | **NumPut()** - *uFlags*                                      |
| 184  | 06726 | **NumPut()** - *hwnd*                                        |
| 185  | 06727 | **NumPut()** - *uId*                                         |
| 186  | 06840 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 187  | 06917 | **Function_Eject()** - *ejects a drive medium*               |
| 188  | 06949 | **FileGetDetail()** - *Get specific file property by index*  |
| 189  | 06960 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 190  | 06976 | **DirExist()** - *Checks if a directory exists*              |
| 191  | 06980 | **GetDetails()** - *Create an array of possible file properties* |
| 192  | 06994 | **Start()** - *Start programs or scripts easier*             |
| 193  | 07013 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 194  | 07021 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 195  | 07170 | **WatchDirectory()** - *it's different from above not tested* |
| 196  | 07380 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 197  | 07394 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 198  | 07407 | **DestroyIcon()**                                            |
| 199  | 07411 | **listfunc()** - *list all functions inside ahk scripts*     |
| 200  | 07427 | **CreateOpenWithMenu()**                                     |
| 201  | 07579 | **FileCount()** - *count matching files in the working directory* |
| 202  | 07587 | **GetImageTypeW()** - *Identify the image type (UniCode)*    |
| 203  | 07643 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 204  | 07877 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 205  | 07917 | **HDrop()** - *Drop files to another app*                    |
| 206  | 07950 | **WM_MOVE()** - *UpdateLayeredWindow*                        |
| 207  | 07963 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 208  | 07991 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 209  | 07995 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 210  | 08044 | **DownloadFile()**                                           |
| 211  | 08067 | **NewLinkMsg()**                                             |
| 212  | 08083 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 213  | 08093 | **GetSourceURL()**                                           |
| 214  | 08105 | **DNS_QueryName()**                                          |
| 215  | 08130 | **GetHTMLFragment()**                                        |
| 216  | 08149 | **ScrubFragmentIdents()**                                    |
| 217  | 08159 | **EnumClipFormats()**                                        |
| 218  | 08167 | **GetClipFormatNames()**                                     |
| 219  | 08186 | **GoogleTranslate()**                                        |
| 220  | 08205 | **getText()** - *get text from html*                         |
| 221  | 08220 | **getHtmlById()**                                            |
| 222  | 08225 | **getTextById()**                                            |
| 223  | 08229 | **getHtmlByTagName()**                                       |
| 224  | 08237 | **getTextByTagName()**                                       |
| 225  | 08245 | **CreateGist()**                                             |
| 226  | 08267 | **GetAllResponseHeaders()** - *Gets the values of all HTTP headers* |
| 227  | 08336 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 228  | 08434 | **ExtractTableData()** - *extracts tables from HTML files*   |
| 229  | 08569 | **Min()** - *returns the smaller of 2 numbers*               |
| 230  | 08573 | **Max()** - *determines the larger number*                   |
| 231  | 08577 | **Mean()** - *returns Average values in comma delimited list* |
| 232  | 08591 | **Median()** - *returns Median in a set of numbers from a list* |
| 233  | 08618 | **Mode()** - *returns the mode from a list of numbers*       |
| 234  | 08657 | **ObjMerge()**                                               |
| 235  | 08673 | **evalRPN()** - *Parsing/RPN calculator algorithm*           |
| 236  | 08709 | **StackShow()**                                              |
| 237  | 08725 | **Sort2DArray()** - *a two dimensional TDArray*              |
| 238  | 08746 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 239  | 08779 | **GetNestedTag()**                                           |
| 240  | 08809 | **GetHTMLbyID()** - *uses COM*                               |
| 241  | 08824 | **GetHTMLbyTag()** - *uses COM*                              |
| 242  | 08839 | **GetXmlElement()** - *RegEx function*                       |
| 243  | 08857 | **sXMLget()**                                                |
| 244  | 08870 | **ParseJsonStrToArr()** - *Parse Json string to an array*    |
| 245  | 08902 | **parseJSON()** - *Parse Json string to an object*           |
| 246  | 08923 | **AddTrailingBackslash()**                                   |
| 247  | 08931 | **CheckQuotes()**                                            |
| 248  | 08940 | **ReplaceForbiddenChars()**                                  |
| 249  | 08953 | **cleanlines()**                                             |
| 250  | 08967 | **cleancolon()**                                             |
| 251  | 08977 | **cleanspace()**                                             |
| 252  | 08990 | **uriEncode()** - *A function to escape characters like & for use in URLs.* |
| 253  | 09005 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 254  | 09013 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 255  | 09020 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 256  | 09045 | **Ansi2Unicode()**                                           |
| 257  | 09065 | **Unicode2Ansi()**                                           |
| 258  | 09089 | **QuickSort()** - *Sort array using QuickSort algorithm*     |
| 259  | 09354 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 260  | 09401 | **DelaySend()** - *Send keystrokes delayed*                  |
| 261  | 09447 | **SetLayout()** - *set a keyboard layout*                    |
| 262  | 09452 | **GetAllInputChars()** - *Returns a string with input characters* |
| 263  | 09469 | **ShowTrayBalloon()**                                        |
| 264  | 09504 | **CreateNamedPipe()**                                        |
| 265  | 09509 | **RestoreCursors()**                                         |
| 266  | 09514 | **SetSystemCursor()**                                        |
| 267  | 09596 | **SystemCursor()** - *hiding mouse cursor*                   |
| 268  | 09635 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 269  | 09671 | **TaskDialog()**                                             |
| 270  | 09700 | **TaskDialogDirect()**                                       |
| 271  | 09740 | **GlobalVarsScript()**                                       |
| 272  | 09764 | **patternScan()**                                            |
| 273  | 09855 | **scanInBuf()**                                              |
| 274  | 09888 | **hexToBinaryBuffer()**                                      |
| 275  | 09910 | **TaskDialogMsgBox()**                                       |
| 276  | 09949 | **TaskDialogToUnicode()**                                    |
| 277  | 09957 | **TaskDialogCallback()**                                     |
| 278  | 09977 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 279  | 10069 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 280  | 10142 | **KillProcess()** - *uses DllCalls to end a process*         |
| 281  | 10175 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 282  | 10220 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 283  | 10235 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 284  | 10269 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 285  | 10303 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 286  | 10358 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 287  | 10423 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 288  | 10504 | **GetDllBase()**                                             |
| 289  | 10526 | **getProcBaseFromModules()**                                 |
| 290  | 10586 | **getURL()** - *using shell.application*                     |
| 291  | 10599 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 292  | 10757 | **CreatePropertyConditionEx()**                              |
| 293  | 10787 | **getControlNameByHwnd()**                                   |
| 294  | 10805 | **Acc_Get()**                                                |
| 295  | 10855 | **Acc_Error()**                                              |
| 296  | 10859 | **Acc_ChildrenByRole()**                                     |
| 297  | 10901 | **listAccChildProperty()**                                   |
| 298  | 10957 | **IEGet()** - *AutoHotkey_L*                                 |
| 299  | 10965 | **IEGet()** - *AutoHotkey_Basic*                             |
| 300  | 10979 | **WBGet()** - *AHK_L: based on ComObjQuery docs*             |
| 301  | 10993 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 302  | 11007 | **WBGet()** - *based on ComObjQuery docs*                    |
| 303  | 11024 | **TabActivate()** - *activate a TAB in InternetExplorer*     |
| 304  | 11041 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 305  | 11057 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 306  | 11061 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 307  | 11066 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 308  | 11123 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq*     |