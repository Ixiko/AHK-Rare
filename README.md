# AHK-Rare

### My collection of rare or very useful single functions

------

Last modification date: ***02.06.2018***, *Changes are below!* At the end of this document you will find a complete list of all functions. The functions are sorted by topic as shown in the picture.

------

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)

----

<br>

### [02-June-2018] count: 293 functions

***6 functions removed*** - depending functions not available or doubled, ***added some links*** to the sources of ***origin*** of the functions. As far as findable some feature ***descriptions and example scripts added***.

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
| 004  | 00329 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 005  | 00338 | **TimePlus()**                                               |
| 006  | 00348 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 007  | 00356 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 008  | 00375 | **GetProcesses()** - *get the name of all running processes* |
| 009  | 00416 | **getProcesses()** - *get running processes with search using comma separated list* |
| 010  | 00467 | **GetProcessWorkingDir()** - *like the name explains*        |
| 011  | 00498 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 012  | 00508 | **GetTextSize()** - *different function to the above one*    |
| 013  | 00556 | **monitorInfo()** - *shows infos about your monitors*        |
| 014  | 00573 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 015  | 00585 | **IsOfficeFile()** - *checks if a file is an Office file*    |
| 016  | 00653 | **DeskIcons()** - *i think its for showing all desktop icons* |
| 017  | 00704 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 018  | 01083 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 019  | 01115 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 020  | 01166 | **Gdip_FillRoundedRectangle()**                              |
| 021  | 01187 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 022  | 01265 | **CreateSurface()** - *creates a drawing GDI surface*        |
| 023  | 01343 | **DrawLine()** - *used DLLCall to draw a line*               |
| 024  | 01350 | **DrawRectangle()** - *used DLLCall to draw a rectangle*     |
| 025  | 01360 | **DrawRectangle()** - *this is for screenshots*              |
| 026  | 01389 | **DrawFrameAroundControl()**                                 |
| 027  | 01457 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 028  | 01556 | **SetAlpha()** - *set alpha to a layered window*             |
| 029  | 01563 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 030  | 01589 | **RotateAroundCenter()** - *GDIP rotate around center*       |
| 031  | 01598 | **Screenshot()** - *screenshot function 1*                   |
| 032  | 01613 | **TakeScreenshot()** - *screenshot function 2*               |
| 033  | 01645 | **CaptureWindow()** - *screenshot function 3*                |
| 034  | 01676 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 035  | 01706 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 036  | 01773 | **FloodFill()** - *filling an area using color banks*        |
| 037  | 01822 | **CreateBMPGradient()** - *Horizontal/Vertical gradient*     |
| 038  | 01845 | **BGR()** - *BGR() subfunction from CreateBMPGradient()*     |
| 039  | 01853 | **CreatePatternBrushFrom()** - *as it says*                  |
| 040  | 01885 | **Convert()** - *Converts ImageFiles*                        |
| 041  | 01954 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 042  | 02025 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 043  | 02132 | **Popup()** - *Splashtext Gui*                               |
| 044  | 02156 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture*            |
| 045  | 02194 | **SplitButton()** - *drop down button*                       |
| 046  | 02266 | **AddToolTip()** - *adds a ToolTip to a gui button*          |
| 047  | 02353 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 048  | 02402 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 049  | 02450 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 050  | 02496 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 051  | 02541 | **PassBox()** - *show a custom input box for a password*     |
| 052  | 02586 | **CreateHotkeyWindow()** - *Hotkey Window*                   |
| 053  | 02626 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 054  | 02639 | **WinFadeToggle()**                                          |
| 055  | 02701 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 056  | 02707 | **FrameShadow()** - *FrameShadow1*                           |
| 057  | 02718 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 058  | 02746 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 059  | 02789 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar*       |
| 060  | 02803 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 061  | 02833 | **CreateFont()** - *creates HFont for use with GDI*          |
| 062  | 02864 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 063  | 02885 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 064  | 02951 | **SetTaskbarProgress()** - *modified function*               |
| 065  | 03038 | **Edit_Standard_Params()** - *these are helper functions to use with Edit or HEdit controls* |
| 066  | 03048 | **Edit_TextIsSelected()**                                    |
| 067  | 03055 | **Edit_GetSelection()**                                      |
| 068  | 03067 | **Edit_Select()**                                            |
| 069  | 03079 | **Edit_SelectLine()**                                        |
| 070  | 03111 | **Edit_DeleteLine()**                                        |
| 071  | 03127 | **Edit_VCenter()** - *Vertically Align Text*                 |
| 072  | 03161 | **IL_LoadIcon()**                                            |
| 073  | 03169 | **IL_GuiButtonIcon()**                                       |
| 074  | 03196 | **LV_GetCount()** - *get current count of notes in a listview* |
| 075  | 03206 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 076  | 03273 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 077  | 03295 | **LV_HeaderFontSet()** - *sets the font of a listview header* |
| 078  | 03393 | **LV_GetItemText()** - *read the text from an item in a TListView* |
| 079  | 03432 | **LV_GetText()**                                             |
| 080  | 03557 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 081  | 03603 | **LV_MoveRow()** - *moves a listview row up or down*         |
| 082  | 03627 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 083  | 03635 | **TabCtrl_GetItemText()** - *returns text of a tab*          |
| 084  | 03680 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 085  | 03695 | **TV_Load()** - *loads TreeView items from an XML string*    |
| 086  | 03881 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 087  | 03899 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 088  | 03937 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 089  | 03948 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 090  | 03964 | **ControlExists()** - *true/false for ControlClass*          |
| 091  | 03976 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 092  | 04008 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 093  | 04037 | **GetOtherControl()**                                        |
| 094  | 04043 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 095  | 04066 | **Control_GetClassNN()** - *no-loop*                         |
| 096  | 04078 | **ControlGetClassNN()** - *with loop*                        |
| 097  | 04092 | **Control_GetFont()** - *get the currently used font of a control* |
| 098  | 04114 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 099  | 04119 | **getControlNameByHwnd()** - *self explaining*               |
| 100  | 04136 | **getByControlName()** - *search by control name return hwnd* |
| 101  | 04168 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 102  | 04224 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 103  | 04234 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 104  | 04407 | **GetParent()** - *get parent win handle of a window*        |
| 105  | 04413 | **GetWindow()** - *DllCall wrapper for GetWindow function*   |
| 106  | 04419 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 107  | 04425 | **IsWindowVisible()** - *self explaining*                    |
| 108  | 04431 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 109  | 04438 | **IsClosed()** - *AHK function (WinWaitClose) wrapper*       |
| 110  | 04445 | **getProcessBaseAddress()**                                  |
| 111  | 04460 | **GetClassLong()**                                           |
| 112  | 04467 | **GetWindowLong()**                                          |
| 113  | 04474 | **GetClassStyles()**                                         |
| 114  | 04501 | **GetTabOrderIndex()**                                       |
| 115  | 04528 | **GetCursor()**                                              |
| 116  | 04535 | **GetExtraStyle()** - *get Extra Styles from a gui/window*   |
| 117  | 04556 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 118  | 04614 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 119  | 04691 | **GetHeaderInfo()**                                          |
| 120  | 04753 | **GetClientCoords()**                                        |
| 121  | 04763 | **GetWindowCoords()**                                        |
| 122  | 04770 | **GetWindowPos()**                                           |
| 123  | 04780 | **GetWindowPlacement()**                                     |
| 124  | 04794 | **GetWindowInfo()**                                          |
| 125  | 04816 | **GetOwner()**                                               |
| 126  | 04820 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 127  | 04876 | **ShowWindow()**                                             |
| 128  | 04880 | **IsWindow()**                                               |
| 129  | 04884 | **IsWindowVisible()**                                        |
| 130  | 04888 | **GetClassName()** - *wrapper for AHK WinGetClass function*  |
| 131  | 04894 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 132  | 04924 | **FindChildWindow()** - *finds child window hwnds of the parent window* |
| 133  | 04970 | **EnumChildWindow()** - *sub function of FindChildWindow*    |
| 134  | 04983 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 135  | 04997 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 136  | 05005 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 137  | 05011 | **GetMenu()** - *returns hMenu handle*                       |
| 138  | 05016 | **GetSubMenu()**                                             |
| 139  | 05020 | **GetMenuItemCount()**                                       |
| 140  | 05024 | **GetMenuItemID()**                                          |
| 141  | 05028 | **GetMenuString()**                                          |
| 142  | 05043 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 143  | 05052 | **MenuGetAll_sub()** - *described above*                     |
| 144  | 05075 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 145  | 05113 | **GetContextMenuID()** - *returns the ID of a menu entry*    |
| 146  | 05136 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 147  | 05199 | **ChooseColor()**                                            |
| 148  | 05220 | **GetWindowIcon()**                                          |
| 149  | 05300 | **GetImageType()**                                           |
| 150  | 05320 | **GetStatusBarText()**                                       |
| 151  | 05336 | **GetAncestor()**                                            |
| 152  | 05341 | **MinMaxInfo()**                                             |
| 153  | 05359 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 154  | 05376 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 155  | 05398 | **ControlClick2()** - *ControlClick Double Click*            |
| 156  | 05407 | **ControlFromPoint()**                                       |
| 157  | 05427 | **EnumChildFindPoint()**                                     |
| 158  | 05465 | **WinWaitForMinimized()**                                    |
| 159  | 05483 | **CenterWindow()**                                           |
| 160  | 05502 | **GuiCenterButtons()**                                       |
| 161  | 05533 | **CenterControl()**                                          |
| 162  | 05586 | **SetWindowIcon()**                                          |
| 163  | 05592 | **SetWindowPos()**                                           |
| 164  | 05596 | **TryKillWin()**                                             |
| 165  | 05614 | **Win32_SendMessage()**                                      |
| 166  | 05626 | **Win32_TaskKill()**                                         |
| 167  | 05635 | **Win32_Terminate()**                                        |
| 168  | 05646 | **TabActivate()**                                            |
| 169  | 05654 | **FocuslessScroll()**                                        |
| 170  | 05755 | **FocuslessScrollHorizontal()**                              |
| 171  | 05789 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 172  | 05811 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 173  | 05831 | **GUI_AutoHide()** - *Autohide the GUI function*             |
| 174  | 06098 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 175  | 06249 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 176  | 06326 | **Function_Eject()** - *ejects a drive medium*               |
| 177  | 06358 | **FileGetDetail()** - *Get specific file property by index*  |
| 178  | 06369 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 179  | 06385 | **DirExist()** - *Checks if a directory exists*              |
| 180  | 06389 | **GetDetails()** - *Create an array of possible file properties* |
| 181  | 06403 | **Start()** - *Start programs or scripts easier*             |
| 182  | 06422 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 183  | 06430 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 184  | 06579 | **WatchDirectory()** - *it's different from above not tested* |
| 185  | 06789 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 186  | 06803 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 187  | 06816 | **DestroyIcon()**                                            |
| 188  | 06820 | **listfunc()** - *list all functions inside ahk scripts*     |
| 189  | 06836 | **CreateOpenWithMenu()**                                     |
| 190  | 06988 | **FileCount()** - *count matching files in the working directory* |
| 191  | 06996 | **GetImageTypeW()** - *Identify the image type (UniCode)*    |
| 192  | 07050 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 193  | 07284 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 194  | 07324 | **HDrop()** - *Drop files to another app*                    |
| 195  | 07357 | **WM_MOVE()** - *UpdateLayeredWindow*                        |
| 196  | 07370 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 197  | 07398 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 198  | 07402 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 199  | 07450 | **DownloadFile()**                                           |
| 200  | 07473 | **NewLinkMsg()**                                             |
| 201  | 07489 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 202  | 07499 | **GetSourceURL()**                                           |
| 203  | 07511 | **DNS_QueryName()**                                          |
| 204  | 07536 | **GetHTMLFragment()**                                        |
| 205  | 07555 | **ScrubFragmentIdents()**                                    |
| 206  | 07565 | **EnumClipFormats()**                                        |
| 207  | 07573 | **GetClipFormatNames()**                                     |
| 208  | 07592 | **GoogleTranslate()**                                        |
| 209  | 07611 | **getText()** - *get text from html*                         |
| 210  | 07626 | **getHtmlById()**                                            |
| 211  | 07631 | **getTextById()**                                            |
| 212  | 07635 | **getHtmlByTagName()**                                       |
| 213  | 07643 | **getTextByTagName()**                                       |
| 214  | 07651 | **CreateGist()**                                             |
| 215  | 07673 | **GetAllResponseHeaders()** - *Gets the values of all HTTP headers* |
| 216  | 07742 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 217  | 07849 | **Min()** - *returns the smaller of 2 numbers*               |
| 218  | 07853 | **Max()** - *determines the larger number*                   |
| 219  | 07857 | **Mean()** - *returns Average values in comma delimited list* |
| 220  | 07871 | **Median()** - *returns Median in a set of numbers from a list* |
| 221  | 07898 | **Mode()** - *returns the mode from a list of numbers*       |
| 222  | 07935 | **ObjMerge()**                                               |
| 223  | 07951 | **evalRPN()** - *Parsing/RPN calculator algorithm*           |
| 224  | 07987 | **StackShow()**                                              |
| 225  | 08003 | **Sort2DArray()** - *a two dimensional TDArray*              |
| 226  | 08024 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 227  | 08057 | **GetNestedTag()**                                           |
| 228  | 08087 | **GetHTMLbyID()** - *uses COM*                               |
| 229  | 08102 | **GetHTMLbyTag()** - *uses COM*                              |
| 230  | 08117 | **GetXmlElement()** - *RegEx function*                       |
| 231  | 08135 | **sXMLget()**                                                |
| 232  | 08148 | **ParseJsonStrToArr()** - *Parse Json string to an array*    |
| 233  | 08180 | **parseJSON()** - *Parse Json string to an object*           |
| 234  | 08201 | **AddTrailingBackslash()**                                   |
| 235  | 08209 | **CheckQuotes()**                                            |
| 236  | 08218 | **ReplaceForbiddenChars()**                                  |
| 237  | 08231 | **cleanlines()**                                             |
| 238  | 08245 | **cleancolon()**                                             |
| 239  | 08255 | **cleanspace()**                                             |
| 240  | 08268 | **uriEncode()** - *A function to escape characters like & for use in URLs.* |
| 241  | 08283 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 242  | 08291 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 243  | 08298 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 244  | 08323 | **Ansi2Unicode()**                                           |
| 245  | 08343 | **Unicode2Ansi()**                                           |
| 246  | 08367 | **QuickSort()** - *Sort array using QuickSort algorithm*     |
| 247  | 08632 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 248  | 08678 | **DelaySend()** - *Send keystrokes delayed*                  |
| 249  | 08724 | **SetLayout()** - *set a keyboard layout*                    |
| 250  | 08729 | **GetAllInputChars()** - *Returns a string with input characters* |
| 251  | 08746 | **ShowTrayBalloon()**                                        |
| 252  | 08781 | **CreateNamedPipe()**                                        |
| 253  | 08786 | **RestoreCursors()**                                         |
| 254  | 08791 | **SetSystemCursor()**                                        |
| 255  | 08873 | **SystemCursor()** - *hiding mouse cursor*                   |
| 256  | 08912 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 257  | 08948 | **TaskDialog()**                                             |
| 258  | 08977 | **TaskDialogDirect()**                                       |
| 259  | 09017 | **GlobalVarsScript()**                                       |
| 260  | 09041 | **patternScan()**                                            |
| 261  | 09132 | **scanInBuf()**                                              |
| 262  | 09165 | **hexToBinaryBuffer()**                                      |
| 263  | 09187 | **TaskDialogMsgBox()**                                       |
| 264  | 09226 | **TaskDialogToUnicode()**                                    |
| 265  | 09234 | **TaskDialogCallback()**                                     |
| 266  | 09254 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 267  | 09346 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 268  | 09419 | **KillProcess()** - *uses DllCalls to end a process*         |
| 269  | 09452 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 270  | 09497 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 271  | 09512 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 272  | 09546 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 273  | 09582 | **GetDllBase()**                                             |
| 274  | 09604 | **getProcBaseFromModules()**                                 |
| 275  | 09664 | **getURL()** - *using shell.application*                     |
| 276  | 09677 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 277  | 09833 | **CreatePropertyConditionEx()**                              |
| 278  | 09863 | **getControlNameByHwnd()**                                   |
| 279  | 09881 | **Acc_Get()**                                                |
| 280  | 09931 | **Acc_Error()**                                              |
| 281  | 09935 | **Acc_ChildrenByRole()**                                     |
| 282  | 09977 | **listAccChildProperty()**                                   |
| 283  | 10033 | **IEGet()** - *AutoHotkey_L*                                 |
| 284  | 10041 | **IEGet()** - *AutoHotkey_Basic*                             |
| 285  | 10055 | **WBGet()** - *AHK_L: based on ComObjQuery docs*             |
| 286  | 10069 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 287  | 10083 | **WBGet()** - *based on ComObjQuery docs*                    |
| 288  | 10100 | **TabActivate()** - *activate a TAB in InternetExplorer*     |
| 289  | 10117 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 290  | 10133 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 291  | 10137 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 292  | 10142 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 293  | 10199 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq*     |