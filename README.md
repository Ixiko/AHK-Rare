![AHK - Rare Logo](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/AHK%20-%20rare.jpg)

------

**AHK-Rare** - *collection of rare or very useful single functions* 

Last modification date: ***13.06.2018***, *Changes are below!* At the end of this document you will find a complete list of all functions. The functions are sorted by topic as shown in the picture.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)



<br>

### <u>[13-June-2018] count: 323 functions</u>

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

  <br>

### <u>[22-May-2018] count: 240 functions</u>

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs
+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized
+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging
+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 
+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12
+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.
+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm
+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

  <br>

### <u>[06-May-2018] count: 230 functions</u>

- **getByControlName()**  - function uses DllCalls
- **listAccChildProperty()** - uses COM functionality
- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string
- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of the currently selected tab, the second returns the tab name

  <br>

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
| 041  | 01977 | **GetRange()** - *another good screen area selection function* |
| 042  | 02088 | **FloodFill()** - *filling an area using color banks*        |
| 043  | 02137 | **CreateBMPGradient()** - *Horizontal/Vertical gradient*     |
| 044  | 02160 | **BGR()** - *BGR() subfunction from CreateBMPGradient()*     |
| 045  | 02168 | **CreatePatternBrushFrom()** - *as it says*                  |
| 046  | 02219 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 047  | 02290 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 048  | 02397 | **Popup()** - *Splashtext Gui*                               |
| 049  | 02421 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture*            |
| 050  | 02459 | **SplitButton()** - *drop down button*                       |
| 051  | 02531 | **AddToolTip()** - *adds a ToolTip to a gui button*          |
| 052  | 02618 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 053  | 02667 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 054  | 02715 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 055  | 02761 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 056  | 02806 | **PassBox()** - *show a custom input box for a password*     |
| 057  | 02851 | **CreateHotkeyWindow()** - *Hotkey Window*                   |
| 058  | 02887 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 059  | 03084 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 060  | 03097 | **WinFadeToggle()**                                          |
| 061  | 03159 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 062  | 03165 | **FrameShadow()** - *FrameShadow1*                           |
| 063  | 03176 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 064  | 03204 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 065  | 03247 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar*       |
| 066  | 03261 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 067  | 03291 | **CreateFont()** - *creates HFont for use with GDI*          |
| 068  | 03322 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 069  | 03343 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 070  | 03409 | **SetTaskbarProgress()** - *modified function*               |
| 071  | 03482 | **GetComboBoxChoice()** - *Combobox function*                |
| 072  | 03516 | **Edit_Standard_Params()** - *these are helper functions to use with Edit or HEdit controls* |
| 073  | 03526 | **Edit_TextIsSelected()**                                    |
| 074  | 03533 | **Edit_GetSelection()**                                      |
| 075  | 03545 | **Edit_Select()**                                            |
| 076  | 03557 | **Edit_SelectLine()**                                        |
| 077  | 03589 | **Edit_DeleteLine()**                                        |
| 078  | 03605 | **Edit_VCenter()** - *Vertically Align Text*                 |
| 079  | 03639 | **IL_LoadIcon()**                                            |
| 080  | 03647 | **IL_GuiButtonIcon()**                                       |
| 081  | 03674 | **LB_AdjustItemHeight()** - *Listbox function*               |
| 082  | 03680 | **LB_GetItemHeight()** - *Listbox function*                  |
| 083  | 03687 | **LB_SetItemHeight()** - *Listbox function*                  |
| 084  | 03699 | **LV_GetCount()** - *get current count of notes in a listview* |
| 085  | 03709 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 086  | 03776 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 087  | 03798 | **LV_HeaderFontSet()** - *sets the font of a listview header* |
| 088  | 03896 | **LV_GetItemText()** - *read the text from an item in a TListView* |
| 089  | 03935 | **LV_GetText()**                                             |
| 090  | 04060 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 091  | 04106 | **LV_MoveRow()** - *moves a listview row up or down*         |
| 092  | 04126 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 093  | 04182 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 094  | 04190 | **TabCtrl_GetItemText()** - *returns text of a tab*          |
| 095  | 04235 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 096  | 04250 | **TV_Load()** - *loads TreeView items from an XML string*    |
| 097  | 04436 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 098  | 04454 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 099  | 04492 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 100  | 04503 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 101  | 04519 | **ControlExists()** - *true/false for ControlClass*          |
| 102  | 04531 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 103  | 04563 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 104  | 04592 | **GetOtherControl()**                                        |
| 105  | 04598 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 106  | 04621 | **Control_GetClassNN()** - *no-loop*                         |
| 107  | 04633 | **ControlGetClassNN()** - *with loop*                        |
| 108  | 04647 | **Control_GetFont()** - *get the currently used font of a control* |
| 109  | 04669 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 110  | 04674 | **getControlNameByHwnd()** - *self explaining*               |
| 111  | 04691 | **getByControlName()** - *search by control name return hwnd* |
| 112  | 04723 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 113  | 04779 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 114  | 04789 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 115  | 04962 | **GetParent()** - *get parent win handle of a window*        |
| 116  | 04968 | **GetWindow()** - *DllCall wrapper for GetWindow function*   |
| 117  | 04974 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 118  | 04980 | **IsWindowVisible()** - *self explaining*                    |
| 119  | 04986 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 120  | 04993 | **IsClosed()** - *AHK function (WinWaitClose) wrapper*       |
| 121  | 05000 | **getProcessBaseAddress()**                                  |
| 122  | 05015 | **GetClassLong()**                                           |
| 123  | 05022 | **GetWindowLong()**                                          |
| 124  | 05029 | **GetClassStyles()**                                         |
| 125  | 05056 | **GetTabOrderIndex()**                                       |
| 126  | 05083 | **GetCursor()**                                              |
| 127  | 05090 | **GetExtraStyle()** - *get Extra Styles from a gui/window*   |
| 128  | 05111 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 129  | 05169 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 130  | 05246 | **GetHeaderInfo()**                                          |
| 131  | 05308 | **GetClientCoords()**                                        |
| 132  | 05318 | **GetClientSize()** - *get size of window without border*    |
| 133  | 05326 | **GetWindowCoords()**                                        |
| 134  | 05333 | **GetWindowPos()**                                           |
| 135  | 05343 | **GetWindowPlacement()**                                     |
| 136  | 05357 | **GetWindowInfo()**                                          |
| 137  | 05379 | **GetOwner()**                                               |
| 138  | 05383 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 139  | 05439 | **ShowWindow()**                                             |
| 140  | 05443 | **IsWindow()**                                               |
| 141  | 05447 | **IsWindowVisible()**                                        |
| 142  | 05451 | **GetClassName()** - *wrapper for AHK WinGetClass function*  |
| 143  | 05457 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 144  | 05487 | **FindChildWindow()** - *finds child window hwnds of the parent window* |
| 145  | 05533 | **EnumChildWindow()** - *sub function of FindChildWindow*    |
| 146  | 05546 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 147  | 05560 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 148  | 05568 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 149  | 05574 | **GetMenu()** - *returns hMenu handle*                       |
| 150  | 05579 | **GetSubMenu()**                                             |
| 151  | 05583 | **GetMenuItemCount()**                                       |
| 152  | 05587 | **GetMenuItemID()**                                          |
| 153  | 05591 | **GetMenuString()**                                          |
| 154  | 05606 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 155  | 05615 | **MenuGetAll_sub()** - *described above*                     |
| 156  | 05638 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 157  | 05676 | **GetContextMenuID()** - *returns the ID of a menu entry*    |
| 158  | 05699 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 159  | 05762 | **ChooseColor()**                                            |
| 160  | 05783 | **GetWindowIcon()**                                          |
| 161  | 05863 | **GetImageType()**                                           |
| 162  | 05883 | **GetStatusBarText()**                                       |
| 163  | 05899 | **GetAncestor()**                                            |
| 164  | 05904 | **MinMaxInfo()**                                             |
| 165  | 05922 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 166  | 05939 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 167  | 05961 | **ControlClick2()** - *ControlClick Double Click*            |
| 168  | 05970 | **ControlFromPoint()**                                       |
| 169  | 05990 | **EnumChildFindPoint()**                                     |
| 170  | 06028 | **WinWaitForMinimized()**                                    |
| 171  | 06046 | **CenterWindow()**                                           |
| 172  | 06065 | **GuiCenterButtons()**                                       |
| 173  | 06096 | **CenterControl()**                                          |
| 174  | 06149 | **SetWindowIcon()**                                          |
| 175  | 06155 | **SetWindowPos()**                                           |
| 176  | 06159 | **TryKillWin()**                                             |
| 177  | 06177 | **Win32_SendMessage()**                                      |
| 178  | 06189 | **Win32_TaskKill()**                                         |
| 179  | 06198 | **Win32_Terminate()**                                        |
| 180  | 06209 | **TabActivate()**                                            |
| 181  | 06217 | **FocuslessScroll()**                                        |
| 182  | 06318 | **FocuslessScrollHorizontal()**                              |
| 183  | 06352 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 184  | 06374 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 185  | 06394 | **GUI_AutoHide()** - *Autohide the GUI function*             |
| 186  | 06661 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 187  | 06755 | **AddToolTip()** - *Add/Update tooltips to GUI controls.*    |
| 188  | 06888 | **NumPut()** - *cbSize*                                      |
| 189  | 06889 | **NumPut()** - *uFlags*                                      |
| 190  | 06890 | **NumPut()** - *hwnd*                                        |
| 191  | 06891 | **NumPut()** - *uId*                                         |
| 192  | 06941 | **HelpToolTips()** - *To show defined GUI control help tooltips on hover.* |
| 193  | 07041 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 194  | 07118 | **Function_Eject()** - *ejects a drive medium*               |
| 195  | 07150 | **FileGetDetail()** - *Get specific file property by index*  |
| 196  | 07161 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 197  | 07177 | **DirExist()** - *Checks if a directory exists*              |
| 198  | 07181 | **GetDetails()** - *Create an array of possible file properties* |
| 199  | 07195 | **Start()** - *Start programs or scripts easier*             |
| 200  | 07214 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 201  | 07222 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 202  | 07371 | **WatchDirectory()** - *it's different from above not tested* |
| 203  | 07581 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 204  | 07595 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 205  | 07608 | **DestroyIcon()**                                            |
| 206  | 07612 | **listfunc()** - *list all functions inside ahk scripts*     |
| 207  | 07628 | **CreateOpenWithMenu()**                                     |
| 208  | 07780 | **FileCount()** - *count matching files in the working directory* |
| 209  | 07788 | **GetImageTypeW()** - *Identify the image type (UniCode)*    |
| 210  | 07832 | **FileWriteLine()** - *To write data at specified line in a file.* |
| 211  | 07842 | **FileMD5()** - *File MD5 Hashing*                           |
| 212  | 07871 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 213  | 08105 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 214  | 08145 | **HDrop()** - *Drop files to another app*                    |
| 215  | 08178 | **WM_MOVE()** - *UpdateLayeredWindow*                        |
| 216  | 08191 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 217  | 08219 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 218  | 08223 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 219  | 08272 | **DownloadFile()**                                           |
| 220  | 08295 | **NewLinkMsg()**                                             |
| 221  | 08311 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 222  | 08321 | **GetSourceURL()**                                           |
| 223  | 08333 | **DNS_QueryName()**                                          |
| 224  | 08358 | **GetHTMLFragment()**                                        |
| 225  | 08377 | **ScrubFragmentIdents()**                                    |
| 226  | 08387 | **EnumClipFormats()**                                        |
| 227  | 08395 | **GetClipFormatNames()**                                     |
| 228  | 08414 | **GoogleTranslate()**                                        |
| 229  | 08433 | **getText()** - *get text from html*                         |
| 230  | 08448 | **getHtmlById()**                                            |
| 231  | 08453 | **getTextById()**                                            |
| 232  | 08457 | **getHtmlByTagName()**                                       |
| 233  | 08465 | **getTextByTagName()**                                       |
| 234  | 08473 | **CreateGist()**                                             |
| 235  | 08495 | **GetAllResponseHeaders()** - *Gets the values of all HTTP headers* |
| 236  | 08564 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 237  | 08662 | **ExtractTableData()** - *extracts tables from HTML files*   |
| 238  | 08797 | **Min()** - *returns the smaller of 2 numbers*               |
| 239  | 08801 | **Max()** - *determines the larger number*                   |
| 240  | 08805 | **Mean()** - *returns Average values in comma delimited list* |
| 241  | 08819 | **Median()** - *returns Median in a set of numbers from a list* |
| 242  | 08846 | **Mode()** - *returns the mode from a list of numbers*       |
| 243  | 08875 | **Dec2Base()** - *Base to Decimal and*                       |
| 244  | 08881 | **Base2Dec()** - *Decimal to Base conversion*                |
| 245  | 08887 | **HexToFloat()** - *Hexadecimal to Float conversion*         |
| 246  | 08891 | **FloatToHex()** - *Float to Hexadecimal conversion*         |
| 247  | 08901 | **CalculateDistance()** - *calculates the distance between two points in a 2D-Space* |
| 248  | 08905 | **IsInRange()** - *shows if a second variable is in range*   |
| 249  | 08927 | **ObjMerge()**                                               |
| 250  | 08943 | **evalRPN()** - *Parsing/RPN calculator algorithm*           |
| 251  | 08979 | **StackShow()**                                              |
| 252  | 08996 | **Sort2DArray()** - *a two dimensional TDArray*              |
| 253  | 09017 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 254  | 09050 | **GetNestedTag()**                                           |
| 255  | 09080 | **GetHTMLbyID()** - *uses COM*                               |
| 256  | 09095 | **GetHTMLbyTag()** - *uses COM*                              |
| 257  | 09110 | **GetXmlElement()** - *RegEx function*                       |
| 258  | 09128 | **sXMLget()**                                                |
| 259  | 09141 | **ParseJsonStrToArr()** - *Parse Json string to an array*    |
| 260  | 09173 | **parseJSON()** - *Parse Json string to an object*           |
| 261  | 09194 | **AddTrailingBackslash()**                                   |
| 262  | 09202 | **CheckQuotes()**                                            |
| 263  | 09211 | **ReplaceForbiddenChars()**                                  |
| 264  | 09224 | **cleanlines()**                                             |
| 265  | 09238 | **cleancolon()**                                             |
| 266  | 09248 | **cleanspace()**                                             |
| 267  | 09261 | **uriEncode()** - *A function to escape characters like & for use in URLs.* |
| 268  | 09276 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 269  | 09284 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 270  | 09291 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 271  | 09316 | **Ansi2Unicode()**                                           |
| 272  | 09336 | **Unicode2Ansi()**                                           |
| 273  | 09360 | **QuickSort()** - *Sort array using QuickSort algorithm*     |
| 274  | 09625 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 275  | 09659 | **StringM()** - *String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)* |
| 276  | 09699 | **StringMD5()** - *String MD5 Hashing*                       |
| 277  | 09725 | **DelaySend()** - *Send keystrokes delayed*                  |
| 278  | 09771 | **SetLayout()** - *set a keyboard layout*                    |
| 279  | 09776 | **GetAllInputChars()** - *Returns a string with input characters* |
| 280  | 09794 | **ShowTrayBalloon()**                                        |
| 281  | 09830 | **CreateNamedPipe()**                                        |
| 282  | 09835 | **RestoreCursors()**                                         |
| 283  | 09840 | **SetSystemCursor()**                                        |
| 284  | 09922 | **SystemCursor()** - *hiding mouse cursor*                   |
| 285  | 09961 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 286  | 09997 | **TaskDialog()**                                             |
| 287  | 10026 | **TaskDialogDirect()**                                       |
| 288  | 10066 | **GlobalVarsScript()**                                       |
| 289  | 10090 | **patternScan()**                                            |
| 290  | 10181 | **scanInBuf()**                                              |
| 291  | 10214 | **hexToBinaryBuffer()**                                      |
| 292  | 10236 | **TaskDialogMsgBox()**                                       |
| 293  | 10275 | **TaskDialogToUnicode()**                                    |
| 294  | 10283 | **TaskDialogCallback()**                                     |
| 295  | 10303 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 296  | 10395 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 297  | 10468 | **KillProcess()** - *uses DllCalls to end a process*         |
| 298  | 10501 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 299  | 10546 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 300  | 10561 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 301  | 10595 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 302  | 10629 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 303  | 10684 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 304  | 10749 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 305  | 10828 | **TimedFunction()** - *SetTimer functionality for functions* |
| 306  | 10855 | **ListGlobalVars()** - *ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string* |
| 307  | 10907 | **GetDllBase()**                                             |
| 308  | 10929 | **getProcBaseFromModules()**                                 |
| 309  | 10986 | **InjectDll()** - *injects a dll to a running process (ahkdll??)* |
| 310  | 11014 | **getURL()** - *using shell.application*                     |
| 311  | 11027 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 312  | 11186 | **CreatePropertyConditionEx()**                              |
| 313  | 11216 | **getControlNameByHwnd()**                                   |
| 314  | 11235 | **Acc_Get()**                                                |
| 315  | 11285 | **Acc_Error()**                                              |
| 316  | 11289 | **Acc_ChildrenByRole()**                                     |
| 317  | 11331 | **listAccChildProperty()**                                   |
| 318  | 11388 | **IEGet()** - *AutoHotkey_L*                                 |
| 319  | 11396 | **IEGet()** - *AutoHotkey_Basic*                             |
| 320  | 11410 | **WBGet()** - *AHK_L: based on ComObjQuery docs*             |
| 321  | 11424 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 322  | 11438 | **WBGet()** - *based on ComObjQuery docs*                    |
| 323  | 11455 | **TabActivate()** - *activate a TAB in InternetExplorer*     |
| 324  | 11473 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 325  | 11489 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 326  | 11493 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 327  | 11498 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 328  | 11556 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq*     |