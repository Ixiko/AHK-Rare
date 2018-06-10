# AHK-Rare

### My collection of rare and maybe very useful functions

------

Last modification date: ***28.05.2018***, *Changes are below!* At the end of this document you will find a complete list of all functions. The functions are sorted by topic as shown in the picture.

------

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)

----

<br>

### [28-May-2018] count: 280 functions

*Organized layout, some functions moved to the right topic, delete duplicate functions, adding more info and examples*

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
| ---- | ----- | ------------------------------------------------------------ |
| 001  | 00009 | **CMDret_RunReturn()**                                       |
| 002  | 00129 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 003  | 00138 | **TimePlus()**                                               |
| 004  | 00148 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 005  | 00156 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 006  | 00175 | **GetProcesses()** - *get the name of all running processes* |
| 007  | 00216 | **getProcesses()** - *get running processes with search using comma separated list* |
| 008  | 00267 | **GetProcessWorkingDir()** - *like the name explains*        |
| 009  | 00298 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 010  | 00308 | **GetTextSize()** - *different function to the above one*    |
| 011  | 00356 | **monitorInfo()** - *shows infos about your monitors*        |
| 012  | 00373 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 013  | 00385 | **IsOfficeFile()** - *checks if a file is an Office file*    |
| 014  | 00462 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 015  | 00841 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 016  | 00873 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 017  | 00924 | **Gdip_FillRoundedRectangle()**                              |
| 018  | 00945 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 019  | 01023 | **CreateSurface()** - *creates a drawing GDI surface*        |
| 020  | 01101 | **DrawLine()** - *used DLLCall to draw a line*               |
| 021  | 01108 | **DrawRectangle()** - *used DLLCall to draw a rectangle*     |
| 022  | 01118 | **DrawRectangle()** - *this is for screenshots*              |
| 023  | 01147 | **DrawFrameAroundControl()**                                 |
| 024  | 01215 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 025  | 01314 | **SetAlpha()** - *set alpha to a layered window*             |
| 026  | 01321 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 027  | 01347 | **RotateAroundCenter()** - *GDIP rotate around center*       |
| 028  | 01356 | **Screenshot()** - *screenshot function 1*                   |
| 029  | 01370 | **TakeScreenshot()** - *screenshot function 2*               |
| 030  | 01401 | **CaptureWindow()** - *screenshot function 3*                |
| 031  | 01430 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 032  | 01460 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 033  | 01527 | **FloodFill()** - *filling an area using color banks*        |
| 034  | 01576 | **CreateBMPGradient()** - *Horizontal/Vertical gradient*     |
| 035  | 01599 | **BGR()** - *BGR() subfunction from CreateBMPGradient()*     |
| 036  | 01623 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 037  | 01694 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 038  | 01801 | **Popup()** - *Splashtext Gui*                               |
| 039  | 01825 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture*            |
| 040  | 01863 | **SplitButton()** - *drop down button*                       |
| 041  | 01935 | **AddToolTip()** - *adds a ToolTip to a gui button*          |
| 042  | 02022 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 043  | 02071 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 044  | 02119 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 045  | 02165 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 046  | 02210 | **PassBox()** - *show a custom input box for a password*     |
| 047  | 02255 | **CreateHotkeyWindow()** - *Hotkey Window*                   |
| 048  | 02295 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 049  | 02308 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 050  | 02314 | **FrameShadow()** - *FrameShadow1*                           |
| 051  | 02325 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 052  | 02353 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 053  | 02396 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar*       |
| 054  | 02410 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 055  | 02440 | **CreateFont()** - *creates HFont for use with GDI*          |
| 056  | 02471 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 057  | 02492 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 058  | 02558 | **SetTaskbarProgress()** - *modified function*               |
| 059  | 02645 | **Edit_Standard_Params()** - *these are helper functions to use with Edit or HEdit controls* |
| 060  | 02655 | **Edit_TextIsSelected()**                                    |
| 061  | 02662 | **Edit_GetSelection()**                                      |
| 062  | 02674 | **Edit_Select()**                                            |
| 063  | 02686 | **Edit_SelectLine()**                                        |
| 064  | 02718 | **Edit_DeleteLine()**                                        |
| 065  | 02734 | **Edit_VCenter()** - *Vertically Align Text*                 |
| 066  | 02768 | **IL_LoadIcon()**                                            |
| 067  | 02776 | **IL_GuiButtonIcon()**                                       |
| 068  | 02803 | **LV_GetCount()** - *get current count of notes in a listview* |
| 069  | 02813 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 070  | 02880 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 071  | 02902 | **LV_HeaderFontSet()** - *sets the font of a listview header* |
| 072  | 03000 | **LV_GetItemText()** - *read the text from an item in a TListView* |
| 073  | 03039 | **LV_GetText()**                                             |
| 074  | 03167 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 075  | 03175 | **TabCtrl_GetItemText()** - *returns text of a tab*          |
| 076  | 03220 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 077  | 03235 | **TV_Load()** - *loads TreeView items from an XML string*    |
| 078  | 03421 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 079  | 03439 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 080  | 03477 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 081  | 03488 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 082  | 03504 | **ControlExists()** - *true/false for ControlClass*          |
| 083  | 03516 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 084  | 03548 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 085  | 03577 | **GetOtherControl()**                                        |
| 086  | 03583 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 087  | 03606 | **Control_GetClassNN()** - *no-loop*                         |
| 088  | 03618 | **ControlGetClassNN()** - *with loop*                        |
| 089  | 03632 | **Control_GetFont()** - *get the currently used font of a control* |
| 090  | 03654 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 091  | 03659 | **getControlNameByHwnd()** - *self explaining*               |
| 092  | 03676 | **getByControlName()** - *search by control name return hwnd* |
| 093  | 03712 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 094  | 03722 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 095  | 03897 | **GetParent()** - *get parent win handle of a window*        |
| 096  | 03903 | **GetWindow()** - *DllCall wrapper for GetWindow function*   |
| 097  | 03909 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 098  | 03915 | **IsWindowVisible()** - *self explaining*                    |
| 099  | 03921 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 100  | 03928 | **IsClosed()** - *AHK function (WinWaitClose) wrapper*       |
| 101  | 03935 | **getProcessBaseAddress()**                                  |
| 102  | 03950 | **GetClassLong()**                                           |
| 103  | 03957 | **GetWindowLong()**                                          |
| 104  | 03964 | **GetClassStyles()**                                         |
| 105  | 03991 | **GetTabOrderIndex()**                                       |
| 106  | 04018 | **GetCursor()**                                              |
| 107  | 04025 | **GetExtraStyle()** - *get Extra Styles from a gui/window*   |
| 108  | 04046 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 109  | 04104 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 110  | 04181 | **GetHeaderInfo()**                                          |
| 111  | 04243 | **GetClientCoords()**                                        |
| 112  | 04253 | **GetWindowCoords()**                                        |
| 113  | 04260 | **GetWindowPos()**                                           |
| 114  | 04270 | **GetWindowPlacement()**                                     |
| 115  | 04284 | **GetWindowInfo()**                                          |
| 116  | 04306 | **GetOwner()**                                               |
| 117  | 04310 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 118  | 04366 | **ShowWindow()**                                             |
| 119  | 04370 | **IsWindow()**                                               |
| 120  | 04374 | **IsWindowVisible()**                                        |
| 121  | 04378 | **GetClassName()** - *wrapper for AHK WinGetClass function*  |
| 122  | 04384 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 123  | 04414 | **FindChildWindow()** - *finds child window hwnds of the parent window* |
| 124  | 04460 | **EnumChildWindow()** - *sub function of FindChildWindow*    |
| 125  | 04473 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 126  | 04490 | **GetMenu()** - *returns hMenu handle*                       |
| 127  | 04495 | **GetSubMenu()**                                             |
| 128  | 04499 | **GetMenuItemCount()**                                       |
| 129  | 04503 | **GetMenuItemID()**                                          |
| 130  | 04507 | **GetMenuString()**                                          |
| 131  | 04522 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 132  | 04531 | **MenuGetAll_sub()** - *described above*                     |
| 133  | 04554 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 134  | 04592 | **GetContextMenuID()** - *returns the ID of a menu entry*    |
| 135  | 04615 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 136  | 04678 | **ChooseColor()**                                            |
| 137  | 04699 | **GetWindowIcon()**                                          |
| 138  | 04779 | **GetImageType()**                                           |
| 139  | 04799 | **GetStatusBarText()**                                       |
| 140  | 04815 | **GetAncestor()**                                            |
| 141  | 04820 | **MinMaxInfo()**                                             |
| 142  | 04838 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 143  | 04855 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 144  | 04877 | **ControlClick2()**                                          |
| 145  | 04886 | **ControlFromPoint()**                                       |
| 146  | 04906 | **EnumChildFindPoint()**                                     |
| 147  | 04944 | **WinWaitForMinimized()**                                    |
| 148  | 04962 | **CenterWindow()**                                           |
| 149  | 04981 | **GuiCenterButtons()**                                       |
| 150  | 05012 | **CenterControl()**                                          |
| 151  | 05065 | **SetWindowIcon()**                                          |
| 152  | 05071 | **SetWindowPos()**                                           |
| 153  | 05075 | **TryKillWin()**                                             |
| 154  | 05093 | **Win32_SendMessage()**                                      |
| 155  | 05105 | **Win32_TaskKill()**                                         |
| 156  | 05114 | **Win32_Terminate()**                                        |
| 157  | 05125 | **TabActivate()**                                            |
| 158  | 05133 | **FocuslessScroll()**                                        |
| 159  | 05234 | **FocuslessScrollHorizontal()**                              |
| 160  | 05265 | **Menu_Show()**                                              |
| 161  | 05290 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 162  | 05365 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 163  | 05442 | **Function_Eject()** - *ejects a drive medium*               |
| 164  | 05474 | **FileGetDetail()** - *Get specific file property by index*  |
| 165  | 05485 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 166  | 05501 | **DirExist()** - *Checks if a directory exists*              |
| 167  | 05505 | **GetDetails()** - *Create an array of possible file properties* |
| 168  | 05519 | **Start()** - *Start programs or scripts easier*             |
| 169  | 05538 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 170  | 05546 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 171  | 05695 | **WatchDirectory()** - *it's different from above not tested* |
| 172  | 05905 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 173  | 05919 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 174  | 05932 | **DestroyIcon()**                                            |
| 175  | 05936 | **listfunc()** - *list all functions inside ahk scripts*     |
| 176  | 05952 | **CreateOpenWithMenu()**                                     |
| 177  | 06104 | **FileCount()** - *count matching files in the working directory* |
| 178  | 06112 | **GetImageTypeW()** - *Identify the image type (UniCode)*    |
| 179  | 06166 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 180  | 06400 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 181  | 06440 | **HDrop()** - *Drop files to another app*                    |
| 182  | 06473 | **WM_MOVE()** - *UpdateLayeredWindow*                        |
| 183  | 06486 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 184  | 06514 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 185  | 06518 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 186  | 06566 | **DownloadFile()**                                           |
| 187  | 06589 | **NewLinkMsg()**                                             |
| 188  | 06605 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 189  | 06615 | **GetSourceURL()**                                           |
| 190  | 06627 | **DNS_QueryName()**                                          |
| 191  | 06652 | **GetHTMLFragment()**                                        |
| 192  | 06671 | **ScrubFragmentIdents()**                                    |
| 193  | 06681 | **EnumClipFormats()**                                        |
| 194  | 06689 | **GetClipFormatNames()**                                     |
| 195  | 06708 | **GoogleTranslate()**                                        |
| 196  | 06727 | **getText()** - *get text from html*                         |
| 197  | 06742 | **getHtmlById()**                                            |
| 198  | 06747 | **getTextById()**                                            |
| 199  | 06751 | **getHtmlByTagName()**                                       |
| 200  | 06759 | **getTextByTagName()**                                       |
| 201  | 06767 | **CreateGist()**                                             |
| 202  | 06789 | **GetAllResponseHeaders()** - *Gets the values of all HTTP headers* |
| 203  | 06858 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 204  | 06965 | **Min()** - *returns the smaller of 2 numbers*               |
| 205  | 06969 | **Max()** - *determines the larger number*                   |
| 206  | 06973 | **Mean()** - *returns Average values in comma delimited list* |
| 207  | 06987 | **Median()** - *returns Median in a set of numbers from a list* |
| 208  | 07014 | **Mode()** - *returns the mode from a list of numbers*       |
| 209  | 07051 | **ObjMerge()**                                               |
| 210  | 07067 | **evalRPN()** - *Parsing/RPN calculator algorithm*           |
| 211  | 07103 | **StackShow()**                                              |
| 212  | 07119 | **Sort2DArray()** - *a two dimensional TDArray*              |
| 213  | 07140 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 214  | 07173 | **GetNestedTag()**                                           |
| 215  | 07203 | **GetHTMLbyID()** - *uses COM*                               |
| 216  | 07218 | **GetHTMLbyTag()** - *uses COM*                              |
| 217  | 07233 | **GetXmlElement()** - *RegEx function*                       |
| 218  | 07251 | **sXMLget()**                                                |
| 219  | 07264 | **ParseJsonStrToArr()** - *Parse Json string to an array*    |
| 220  | 07296 | **parseJSON()** - *Parse Json string to an object*           |
| 221  | 07317 | **AddTrailingBackslash()**                                   |
| 222  | 07325 | **CheckQuotes()**                                            |
| 223  | 07334 | **ReplaceForbiddenChars()**                                  |
| 224  | 07347 | **cleanlines()**                                             |
| 225  | 07361 | **cleancolon()**                                             |
| 226  | 07371 | **cleanspace()**                                             |
| 227  | 07384 | **uriEncode()** - *A function to escape characters like & for use in URLs.* |
| 228  | 07399 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 229  | 07407 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 230  | 07414 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 231  | 07439 | **Ansi2Unicode()**                                           |
| 232  | 07459 | **Unicode2Ansi()**                                           |
| 233  | 07483 | **QuickSort()** - *Sort array using QuickSort algorithm*     |
| 234  | 07748 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 235  | 07794 | **DelaySend()** - *Send keystrokes delayed*                  |
| 236  | 07840 | **SetLayout()** - *set a keyboard layout*                    |
| 237  | 07851 | **ShowTrayBalloon()**                                        |
| 238  | 07885 | **CreateNamedPipe()**                                        |
| 239  | 07890 | **RestoreCursors()**                                         |
| 240  | 07895 | **SetSystemCursor()**                                        |
| 241  | 07977 | **SystemCursor()** - *hiding mouse cursor*                   |
| 242  | 08016 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 243  | 08052 | **TaskDialog()**                                             |
| 244  | 08081 | **TaskDialogDirect()**                                       |
| 245  | 08121 | **GlobalVarsScript()**                                       |
| 246  | 08145 | **patternScan()**                                            |
| 247  | 08236 | **scanInBuf()**                                              |
| 248  | 08269 | **hexToBinaryBuffer()**                                      |
| 249  | 08291 | **TaskDialogMsgBox()**                                       |
| 250  | 08330 | **TaskDialogToUnicode()**                                    |
| 251  | 08338 | **TaskDialogCallback()**                                     |
| 252  | 08358 | **RegRead64()** - *Provides RegRead64() and RegWrite64() functions that do not redirect to Wow6432Node on 64-bit machines* |
| 253  | 08450 | **RegWrite64()**                                             |
| 254  | 08505 | **ExtractData()**                                            |
| 255  | 08522 | **GetDllBase()**                                             |
| 256  | 08544 | **getProcBaseFromModules()**                                 |
| 257  | 08604 | **getURL()** - *using shell.application*                     |
| 258  | 08617 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 259  | 08771 | **CreatePropertyConditionEx()**                              |
| 260  | 08801 | **getControlNameByHwnd()**                                   |
| 261  | 08819 | **Acc_Get()**                                                |
| 262  | 08869 | **Acc_Error()**                                              |
| 263  | 08873 | **Acc_ChildrenByRole()**                                     |
| 264  | 08915 | **listAccChildProperty()**                                   |
| 265  | 08971 | **IEGet()** - *AutoHotkey_L*                                 |
| 266  | 08979 | **IEGet()** - *AutoHotkey_Basic*                             |
| 267  | 08993 | **WBGet()** - *AHK_L: based on ComObjQuery docs*             |
| 268  | 09007 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 269  | 09021 | **WBGet()** - *based on ComObjQuery docs*                    |
| 270  | 09046 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 271  | 09062 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 272  | 09066 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 273  | 09079 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq*     |
| 274  | 09113 | **GetAllInputChars()**                                       |
| 275  | 09122 | **CalcAddrHash()**                                           |
| 276  | 09153 | **CalcStringHash()**                                         |
| 277  | 09161 | **getNetControl()**                                          |
| 278  | 09212 | **LoadScriptString()**                                       |
| 279  | 09231 | **LoadScriptResource()**                                     |
| 280  | 09242 | **ResourceHackerIcons()**                                    |