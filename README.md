![AHK - Rare Logo](assets/AHK-Rare-Logo.png)

------

**AHK-Rare** - *collection of rare or very useful single functions* 

This is a collection of functions I found at Autohotkey-Forum or inside Autohotkey Scripts. Sometimes you will find one of it an official Autohotkey-Library. Approximately 90-95% of the functions can not be found in any of the 1000 libraries that I have also put together here at Github.

Some of the collected function seems to be multiple in this collection, because they sometimes use very different methods. This is a crucial difference. You wan’t find “THE ONLY ONE” good function here. Take what is the better right now! From that I build up a script individual library.

----

*Last modification date*: ***02/16/2019***, *Changes are below!* *At the end*: complete list of all functions. The functions are sorted by topic as shown in the picture. *Remark*: I didn’t tested all functions and sorting is very different.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](assets/AHK-Rare.ahk_Screenshot.png)



## ![Gem](assets/GemSmall.png) [February 16, 2019]: 37(new)+564(old) =  601

| **FUNCTION**                  | **DESCRIPTION**                                              |
| :---------------------------- | :----------------------------------------------------------- |
| **ExtratIcon()**              | extract icon from a resource file                            |
| **GetIconSize()**             | determines the size of the icon (Lexikos function)           |
| **Gdip_GetHICONDimensions()** | get icon dimensions                                          |
| **FoxitInvoke()**             | wm_command wrapper for FoxitReader Version:  9.1             |
| **WinSaveCheckboxes()**       | save the status of checkboxes in other apps                  |
| **GetButtonType()**           | uses the style of a button to get it’s name                  |
| **KeyValueObjectFromLists()** | merge two lists into one key-value object, useful for 2 two lists you retreave from WinGet |
| **List2Array()**              | function uses StrSplit () to return an array                 |
| **CRC32()**                   | CRC32 function, uses MCode                                   |
| **MeasureText()**             | Measures the single-line width and height of the passed text |
| **Gdip_BitmapReplaceColor()** | using Mcode to replace a color with a specific variation     |
| **Gdi_ExtFloodFill()**        | fills an area with the current brush                         |
| **Gdip_AlphaMask32v1()**      | 32bit Gdip-AlphaMask with MCode - one of two builds          |
| **Gdip_AlphaMask32v2()**      | 32bit Gdip-AlphaMask with MCode  - second of two builds      |
| **Gdip_AlphaMask64()**        | 64bit Gdip-AlphaMask with MCode                              |
| **CircleCrop()**              | gdip circlecrop with MCode                                   |
| **ExploreObj()**              | renewed function to print contents of an object              |
| **PIDfromAnyID()**            | for easy retreaving of process ID’s (PID)                    |
| **sortArray()**               | well working function (*with example*)                       |
| **GetCallStack()**            | retrieves the current callstack                              |
| **Traceback()**               | get stack trace                                              |
| **WrapText()**                | basic function to wrap a text to a given width (length)      |
| **processPriority()**         | retrieves the priority of a process via PID                  |
| **Array_Gui()**               | shows your array as an interactive TreeView                  |
| **MoveMouse_Spiral()**        | move mouse in a spiral                                       |
| **TV_GetItemText()**          | retrieves the text/name of the specified treeview node       |
| **WinEnum()**                 | wrapper for Enum(Child)Windows from cocobelgica. a different solution to that one I collected before |
| **SetHoverText()**            | change control’s text on mouseover                           |
| **Menu_Show()**               | its an alternative to Menu, Show, which can display menu without blocking monitored messages |
| **CreateMenu()**              | creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation) |
| **CreateDDMenu()**            | Creates dropdown menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation) |
| **FormatByteSize()**          | give’s back the given bytes in KB, MB, GB …. (for AHK_V1 and a second function for AHK_V2) |
| **PathCombine()**             | combine the 2 routes provided in a single absolute path      |
| **GetParentDir()**            | small RegEx function to get parent dir from a given string   |
| **DirGetParent()**            | returns a string containing parent dir, it’s possible to set the level of parent dir |
| **WinWaitProgress()**         | Waits for the progress bar on a window to reach (>=) a given value (a Lexikos function) |



## ![Gem](assets/GemSmall.png)[December 15, 2018] - 22(new)+542(old) = 564

optimized layout, began to assign a number for functions identification, Split topics to find functions faster, each function will get the following description* over time:

```Autohotkey
/*    	DESCRIPTION of function 
    	----------------------------------------------------------------------------
		Description  	:	
		Link           	:	
		Author         	:	
		Date           	:	
		AHK-Version 	:	
		License        	:	
		Parameter(s)	:
		Return value	:
		Remark(s)    	:	
		Dependencies	:	
		KeyWords    	:	
    	----------------------------------------------------------------------------
*/
```

**in preparation for a comfortable search and editing program*.



- **Ansi2Oem()** - using Ansi2Unicode and Unicode2Ansi functions
- **Oem2Ansi()** - using Ansi2Unicode and Unicode2Ansi functions
- **Ansi2UTF8()** - using Ansi2Unicode and Unicode2Ansi functions
- **UTF82Ansi()** - using Ansi2Unicode and Unicode2Ansi functions
- **FindChildWindow()** - ***new version!*** - If there was no title or text for the childwindow, the returned value was empty, so this function can handle now a new search parameter  -Class or ClassNN-
- **StdoutToVar_CreateProcess()** - Runs a command line program and returns its output
- **DNSQuery()** - retrieve IP adresses or host/domain names from DNS
- **CreateDIB()** - a wonderfull function by SKAN to draw tiled backgrounds (like chess pattern) to a gui, it can also draw gradients
- **GuiControlLoadImage()** - scale down a picture to fit the given width and height of a picture control
- **Gdip_ResizeBitmap()** - returns resized bitmap
- **Gdip_CropBitmap()** - returns cropped bitmap. Specify how many pixels you want to crop (omit) from each side of bitmap rectangle
- **FontClone()** - backup hFont in memory for further processing
- **GuiDefaultFont()** - returns the default Fontname & Fontsize
- **DateDiff()** - returns the difference between two timestamps in the specified units
- **ObjectNameChange()** - titlebar hook to detect when title changes, (Lexikos’ code)
- **StrGetDimAvgCharWidth()** - average width of a character in pixels
- **BlockKeyboard()** - block keyboard, and unblock it through usage of keyboard
- **GetFileFormat()** - retreaves the codepage format of a file
- **RunUTF8()** - if a .exe file really requires its command line to be encoded as UTF-8, the following might work (a lexikos function)
- **Is64bitProcess()** - check if a process is running in 64bit
- **getSessionId()** - this functions finds out ID of current session
- **SetTrayIcon()** - sets a hex coded icon to as try icon
- **HashFile()** - calculate hashes (MD2,MD5,SH1,SHA256, SHA384, SHA512) from file ;23



## ![Gem](assets/GemSmall.png) [September 30, 2018]: 140+402 = 542 functions

### **functions for controls** (10)

- **ControlGetClassNN()** - different method is used here in compare to the already existing functions in this collection
- **FocusedControl()** - returns the HWND of the currently focused control, or 0 if there was a problem**
- **GetClassName()** - returns HWND‘s class name without its instance number, e.g. “Edit” or “SysListView32”
- **ControlSelectTab()** - SendMessage wrapper to select the current tab on a MS Tab Control.
- **ClickOK()** - function that search for any button in a window that might be an ‘Ok’ button to close a window dialog
- 4 different **AddToolTip() functions** - very easy to use function to add a tooltip to a control
- **Control_GetFont()** - retrieves the used font of a control



### **networking and Internet** (9)

- **HostToIp()** - gets the IP address for the given host directly using the WinSock 2.0 dll, without using temp files or third party utilities

- **LocalIps()** - with small changes to HostToIP() this can be used to retrieve all LocalIP‘s

- **IE_TabActivateByHandle()** - activates a tab by hwnd in InternetExplorer

- **IE_TabWinID()** - find the HWND of an IE window with a given tab name

- **GetAdaptersInfo()** - GetAdaptersAddresses function & IP_ADAPTER_ADDRESSES structure

- **Color_RGBtoHSV()** - converts beetween color two color spaces: RGB -> HSV

- **Color_HSVtoRGB()** - converts beetween color two color spaces: HSV -> RGB

- **ACCTabActivate()** - activate a Tab in IE - function uses acc.ahk library

- **TabActivate()** - a different approach to activate a Tab in IE - function uses acc.ahk library



### **Strings search and handling** (5)

- **CleanLine()** - Return a line with leading and trailing spaces removed, and tabs converted to spaces

- **StrTrim()** - Remove all leading and trailing whitespace including tabs, spaces, CR and LF

- **GetWordsNumbered()** - gives back an array of words from a string, you can specify the position of the words you want to keep

- **PrintArr()** - show values of an array in a listview gui for debugging

- **StrDiff()** - SIFT3 : Super Fast and Accurate string distance algorithm



### **more ListView functions** (19)

- **LV_SubitemHitTest()** - get‘s clicked column in listview

- **LV_EX_FindString()** - find an item in any listview , function works with ANSI and UNICODE (tested)

- **LV_RemoveSelBorder()** - remove the listview‘s selection border

- **LV_SetExplorerTheme()** - set ‘Explorer’ theme for ListViews & TreeViews on Vista+

- **LV_Update()** - update one listview item

- **LV_RedrawItem()** - this one redraws on listview item

- **LV_SetExStyle()** - set / remove / alternate extended styles to the listview control

- **LV_GetExStyle()** - get / remove / alternate extended styles to the listview control

- **LV_IsItemVisible()** - determines if a listview item is visible

- **LV_SetIconSpacing()** - Sets the space between icons in the icon view

- **LV_GetIconSpacing()** - Get the space between icons in the icon view

- **LV_GetItemPos()** - obtains the position of an item

- **LV_SetItemPos()** - set the position of an item

- **LV_MouseGetCellPos()** - returns the number (row, col) of a cell in a listview at present mouseposition  

- **LV_GetColOrderLocal()** - returns the order of listview columns for a local listview

- **LV_GetColOrder()** - returns the order of listview columns for a listview

- **LV_SetColOrderLocal()** - pass listview hWnd (not listview header hWnd)

- **LV_GetCheckedItems()** - Returns a list of checked items from a standard ListView Control

- **LV_ClickRow()** - simulates a left mousebutton click on a specific row in a listview



### **functions to deal with windows** (22)

- **WinActivateEx()** - Activate a Window, with extra Error Checking and More Features

- **AutoCloseBlockingWindows()** - close all open popup (childwindows), without knowing their names, of a parent window

- **SetParentByClass()** - set parent window by using its window class

- **MoveTogether()** - move 2 windows together - using DllCall to DeferWindowPos

- **SetWindowTheme()** - set Windows UI Theme by window handle

- **HideFocusBorder()** - hides the focus border for the given GUI control or GUI and all of its children

- **WinWaitCreated()** - Wait for a window to be created, returns 0 on timeout and ahk_id otherwise

- **closeContextMenu()** - a smart way to close a context menu

- **CheckWindowStatus()** - check’s if a window is responding or not responding (hung or crashed) - 

- **GuiDisableMove()** - to fix a gui/window to its coordinates

- **WinInsertAfter()** - insert a window after a specific window handle

- **GetWindowOrder()** - determines the window order for a given (parent-)hwnd 

- **EnumWindows()** - Get a list with all the top-level windows on the screen or controls in the window

- **CenterWindow()** - center a window or set position optional by using Top, Left, Right, Bottom or a combination of it

- **MouseGetText()** - get the text in the specified coordinates, function uses Microsoft UIA

- **unmovable()** - makes Gui unmovable

- **movable()** - makes Gui movable

- **A_DefaultGui()** - a nice function to have a possibility to get the number of the default gui

- **GetInfoUnderCursor()** - retreavies ACC-Child under cursor

- **GetAccPath()** - get the Acc path from (child) handle

- **GetEnumIndex()** - for Acc child object

- **enumChildCallback()** - i think this retreave’s the child process ID for a known gui hwnd and the main process ID



### **File System** (6)

- **GetFileAttributes()** - get attributes of a file or folder

- **SetFileTime()** - to set the time

- **SetFileAttributes()** - set attributes of a file or folder

- **FileSetSecurity()** -  set security for the file / folder

- **FileSetOwner()** - set the owner to file / directory

- **FileGetOwner()** - get the owner to file / director



### **Graphic/GDI Functions** (6)

- **GDI_GrayscaleBitmap()** - Converts GDI bitmap to 256 color GreyScale

- **Convert_BlackWhite()** - Convert exist imagefile to black&white , it uses machine code

- **getHBMinfo()**

- **SaveHBITMAPToFile()** - saves the hBitmap to a file

- **DrawRotatePictureOnGraphics()** - rotate a pBitmap

- **CopyBitmapOnGraphic()** - copy a pBitmap of a specific width and height to the Gdip graphics container (pGraphics)



### **ClipBoard Functions** (9)

- **ClipboardGetDropEffect()** - Clipboard function. Retrieves if files in clipboard comes from an explorer cut or copy operation.

- **ClipboardSetFiles()** - Explorer function for Drag&Drop and Pasting. Enables the explorer paste context menu option.

- **CopyFilesToClipboard()** - copy files to clipboard

- **FileToClipboard()** - copying the path to clipboard

- **FileToClipboard()** - a second way to copying the path to clipboard

- **ImageToClipboard()** - Copies image data from file to the clipboard. (first of three approaches)

- **Gdip_ImageToClipboard()** - Copies image data from file to the clipboard. (second approach)

- **Gdip_ImageToClipboard()** - Copies image data from file to the clipboard. (third approach)

- **AppendToClipboard()** - Appends files to CF_HDROP structure in clipboard



### **memory functions** (19)

- **ReadProcessMemory()** - reads data from a memory area in a given process.

- **WriteProcessMemory()** - writes data to a memory area in a specified process. the entire area to be written must be accessible or the operation will fail

- **CopyMemory()** - Copy a block of memory from one place to another 

- **MoveMemory()** - moves a block memory from one place to another

- **FillMemory()** - fills a block of memory with the specified value

- **ZeroMemory()** - fills a memory block with zeros

- **CompareMemory()** - compare two memory blocks

- **VirtualAlloc()** - changes the state of a region of memory within the virtual address space of a specified process. the memory is assigned to zero.AtEOF

- **VirtualFree()** - release a region of pages within the virtual address space of the specified process 

- **ReduceMem()** - reduces usage of memory from calling script 

- **GlobalLock()** - memory management function

- **LocalFree()** - free a locked memory object

- **CreateStreamOnHGlobal()** - creates a stream object that uses an HGLOBAL memory handle to store the stream contents. This object is the OLE-provided implementation of the IStream interface.

- **CoTaskMemFree()** - releases a memory block from a previously assigned task through a call to the CoTaskMemAlloc () or CoTaskMemAlloc () function.

- **CoTaskMemRealloc()** - change the size of a previously assigned block of working memory

- **VarAdjustCapacity()** - adjusts the capacity of a variable to its content

- **GetUIntByAddress()** - get UInt direct from memory. I found this functions only within one script 

- **SetUIntByAddress()** - write UInt direct to memory

- **RtlUlongByteSwap64()** - routine reverses the ordering of the four bytes in a 32-bit unsigned integer value (2 functions for AHK v1 und AHK v2)



### **Systeminformations** (7)

- **GetPhysicallyInstalledSystemMemory()** - recovers the amount of RAM in physically installed KB from the SMBIOS (System Management BIOS) firmware tables, WIN_V SP1+

- **GlobalMemoryStatus()** - retrieves information about the current use of physical and virtual memory of the system

- **GetSystemFileCacheSize()** - retrieves the current size limits for the working set of the system cache

- **DriveSpace()** - retrieves the DriveSpace

- **RtlGetVersion()** - retrieves version of installed windows system

- **UserAccountsEnum()** - list all users with information

- **GetCurrentUserInfo()** - obtains information from the current user



### **Font handling** (3)

- **FontEnum()** - enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure

- **GetFontTextDimension()** - calculate the height and width of the text in the specified font 

- **GetFontProperties()** - to get the current font‘s width and height



### **converting functions** (8)

- **RadianToDegree()** - convert radian (rad) to degree 

- **DegreeToRadian()** - convert degree to radian (rad)

- **RGBToARGB()** - convert RGB to ARGB

- **ARGBToRGB()** - convert ARGB to RGB.

- **JEE_HexToBinData()** - hexadecimal to binary

- **JEE_BinDataToHex()** - binary to hexadecimal 

- **JEE_BinDataToHex2()** - binary to hexadecimal2

- **DllListExports()** - List of Function exports of a DLL



### **functions for different purposes** (17)

- **pauseSuspendScript()** - function to suspend/pause another script

- **GetCommState()** - this function retrieves the configuration settings of a given serial port

- **Hotkeys()** - a handy function to show all used hotkeys in script

- **ColoredTooltip()** - show a tooltip for a given time with a custom color in rgb format (fore and background is supported). This function shows how to obtain the hWnd of the tooltip.

- **PostMessageUnderMouse()** - Post a message to the window underneath the mouse cursor, can be used to do things involving the mouse scroll wheel

- **GetBinaryType()** - determines the bit architecture of an executable program

- **SetRestrictedDacl()** - run this in your script to hide it from Task Manager

- **type(v)** - Object version: Returns the type of a value: “Integer”, “String”, “Float” or “Object” by Lexikos

- **type(ByRef v)** - COM version: Returns the type of a value: “Integer”, “String”, “Float” or “Object” by Lexikos

- **Time()** - calculate with time, add minutes, hours, days - add or subtract time

- **WM_SETCURSOR()** - Prevent “sizing arrow” cursor when hovering over window border

- **getActiveProcessName()** - this function finds the process to the ‘ForegroundWindow’

- **GetHandleInformation()** - obtain certain properties of a HANDLE

- **SetHandleInformation()** - establishes the properties of a HANDLE

- **InvokeVerb()** - executes the context menu item of the given path



## ![Gem](assets/GemSmall.png) [July 15, 2018]: 79(new)+323(old) = 402 functions

I’ve found a lot function this time. I checked the found functions that these can not actually be found in any library, so that these can really be called "Rare". I added some more descriptions, examples, links and moved some functions to the right category. 

---------

***** changing the signs to default code folding signs. I changed **;{** to **{ ;** and **;}** to **}**. I hope it will work in most cases and most code editors.  

-------------

####*+added new section:* RegEx - Strings - useful strings for RegExMatch or Replace

- **2 RegEx strings to find AHK-functions** - not tested yet

  ### Strings/Arrays/Objects/Text/Variables

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

  ### Windows/Gui

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

  ### Listview

- **LV_HeaderFontSet()** - sets a different font to a Listview header (it's need CreateFont() function) - formerly this function needs a function as a rewrite of SendMessage, I changed it to a DLLCall without an extra function, the depending function *CreateFont()* can be also found in this file

- **LV_Find()** - I think it‘s usefull to find an item position a listview

- **LV_GetSelectedText()** - returns text from selected rows in ListView (in a user friendly way IMO.)

- **LV_Notification()** - easy function for showing notifications by hovering over a listview

- **LV_IsChecked()** - alternate method to find out if a particular row number is checked

- **LV_SetCheckState()** - check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control

- **LV_SetItemState()** - with this function you can set all avaible states to a listview item

  ### Controls

- **ControlDoubleClick()** - simulates a double click on a control with left/middle or right mousebutton

- **GetFocusedControl()** - get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available 

- **ControlGetTextExt()** - 3 different variants are tried to determine the text of a control

- **getControlInfo()** - get width and heights of controls

- **ControlSetTextAndResize()** - set a new text to a control and resize depending on textwidth and -height

- **GetCPA_file_name()** - retrieves Control Panel applet icon

- **IsControlUnderCursor()** - Checks if a specific control is under the cursor and returns its ClassNN if it is

  ### Other

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
## ![Gem](assets/GemSmall.png) [June 13, 2018]: 323 functions

- **TimedFunction()** - SetTimer functionality for functions
- **ListGlobalVars()** - ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string
- **HelpToolTips()** -  To show defined GUI control help tooltips on hover.
- **StringM()** -  String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)
- **FileWriteLine()** -  To write data at specified line in a file.
- **FileMD5()** - File MD5 Hashing
- **StringMD5()** - String MD5 Hashing
- **Dec2Base()** - Base to Decimal and 
- **Base2Dec()** - Decimal to Base conversion
- **InjectDll()** - injects a dll to a running process (ahkdll??)
- **HexToFloat()** - Hexadecimal to Float conversion
- **FloatToHex()** - Float to Hexadecimal conversion
- **CalculateDistance()** - calculates the distance between two points in a 2D-Space 
- **IsInRange()** - shows if a second variable is in range
- **GetRange()** - another good screen area selection function
- **GetComboBoxChoice()** - Combobox function
- **LB_AdjustItemHeight()** - Listbox function
- **LB_GetItemHeight()** - Listbox function
- **LB_SetItemHeight()**- Listbox function
- **GetClientSize()** - get size of window without border

----
## ![Gem](assets/GemSmall.png) [June 10, 2018] count: 303 functions

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
## ![Gem](assets/GemSmall.png) [June 02, 2018] count: 293 functions

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
## ![Gem](assets/GemSmall.png) [May 28, 2018] count: 280 functions

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
## ![Gem](assets/GemSmall.png) [May 22, 2018] count: 240 functions

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs

+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized

+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging

+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 

+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12

+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.

+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm

+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

-----
## ![Gem](assets/GemSmall.png)[May 06, 2018] count: 230 functions

- **getByControlName()**  - function uses DllCalls
- **listAccChildProperty()** - uses COM functionality
- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string
- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of the currently selected tab, the second returns the tab name

-----
## ![Gem](assets/GemSmall.png) [May 01, 2018] count: 221 functions

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

## ![Gem](assets/GemSmall.png) Complete List of functions ![Gem](assets/GemSmall.png)

*sometimes the function names are the same but they use different methods to get the same result*

| FNr | Line | name of function and description |
|:--: | :--: |
| 001 | 00011 | **ClipboardGetDropEffect()** - *Clipboard function. Retrieves if files in clipboard comes from an explorer cut or copy operation.* |
| 002 | 00034 | **ClipboardSetFiles()** - *Explorer function for Drag&Drop and Pasting. Enables the explorer paste context menu option.* |
| 003 | 00081 | **CopyFilesToClipboard()** - *copy files to clipboard* |
| 004 | 00137 | **FileToClipboard()** - *copying the path to clipboard* |
| 005 | 00168 | **FileToClipboard()** - *a second way to copying the path to clipboard* |
| 006 | 00205 | **ImageToClipboard()** - *Copies image data from file to the clipboard. (first of three approaches)* |
| 007 | 00219 | **Gdip_ImageToClipboard()** - *Copies image data from file to the clipboard. (second approach)* |
| 008 | 00240 | **Gdip_ImageToClipboard()** - *Copies image data from file to the clipboard. (third approach)* |
| 009 | 00286 | **AppendToClipboard()** - *Appends files to CF_HDROP structure in clipboard* |
| 010 | 00308 | **CMDret_RunReturn()** |
| 011 | 00421 | **ConsoleSend()** - *Sends text to a console's input stream* |
| 012 | 00474 | **ScanCode()** - *sub for ConsoleSend* |
| 013 | 00480 | **StdOutStream()** - *Store command line output in autohotkey variable. Supports both x86 and x64.* |
| 014 | 00652 | **StdoutToVar_CreateProcess()** - *Runs a command line program and returns its output* |
| 015 | 00719 | **RunUTF8()** - *if a .exe file really requires its command line to be encoded as UTF-8, the following might work (a lexikos function)* |
| 016 | 00746 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 017 | 00755 | **TimePlus()** |
| 018 | 00765 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 019 | 00773 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 020 | 00785 | **Time()** - *calculate with time, add minutes, hours, days - add or subtract time* |
| 021 | 00931 | **DateDiff()** - *returns the difference between two timestamps in the specified units* |
| 022 | 01029 | **GetProcesses()** - *get the name of all running processes* |
| 023 | 01070 | **getProcesses()** - *get running processes with search using comma separated list* |
| 024 | 01121 | **GetProcessWorkingDir()** - *like the name explains* |
| 025 | 01152 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 026 | 01162 | **GetTextSize()** - *different function to the above one* |
| 027 | 01238 | **MeasureText()** - *alternative to other functions which calculate the text size before display on the screen* |
| 028 | 01277 | **monitorInfo()** - *shows infos about your monitors* |
| 029 | 01294 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 030 | 01306 | **IsOfficeFile()** - *checks if a file is an Office file* |
| 031 | 01374 | **DeskIcons()** - *i think its for showing all desktop icons* |
| 032 | 01417 | **GetFuncDefs()** - *get function definitions from a script* |
| 033 | 01459 | **IndexOfIconResource()** - *function is used to convert an icon resource id (as those used in the registry) to icon index(as used by ahk)* |
| 034 | 01482 | **IndexOfIconResource_EnumIconResources()** - *sub of IndexOfIconResource()* |
| 035 | 01496 | **GetIconforext()** - *Gets default registered icon for an extension* |
| 036 | 01518 | **GetImageType()** - *returns whether a process is 32bit or 64bit* |
| 037 | 01538 | **GetProcessName()** - *Gets the process name from a window handle.* |
| 038 | 01544 | **GetDisplayOrientation()** - *working function to get the orientation of screen* |
| 039 | 01560 | **GetSysErrorText()** - *method to get meaningful data out of the error codes* |
| 040 | 01576 | **getSysLocale()** - *gets the system language* |
| 041 | 01591 | **GetThreadStartAddr()** - *returns start adresses from all threads of a process* |
| 042 | 01646 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 043 | 02025 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 044 | 02057 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 045 | 02108 | **Gdip_FillRoundedRectangle()** |
| 046 | 02129 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 047 | 02207 | **CreateSurface()** - *creates a drawing GDI surface* |
| 048 | 02237 | **ShowSurface()** - *sub for CreateSurface* |
| 049 | 02243 | **HideSurface()** - *sub for CreateSurface* |
| 050 | 02247 | **WipeSurface()** - *sub for CreateSurface* |
| 051 | 02252 | **StartDraw()** - *sub for CreateSurface* |
| 052 | 02264 | **EndDraw()** - *sub for CreateSurface* |
| 053 | 02269 | **SetPen()** - *sub for CreateSurface* |
| 054 | 02286 | **DrawLine()** - *used DLLCall to draw a line* |
| 055 | 02293 | **DrawRectangle()** - *used DLLCall to draw a rectangle* |
| 056 | 02303 | **DrawRectangle()** - *this is for screenshots* |
| 057 | 02332 | **DrawFrameAroundControl()** - *paints a rectangle around a specified control* |
| 058 | 02400 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 059 | 02499 | **SetAlpha()** - *set alpha to a layered window* |
| 060 | 02506 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 061 | 02532 | **RotateAroundCenter()** - *GDIP rotate around center* |
| 062 | 02540 | **Screenshot()** - *screenshot function 1* |
| 063 | 02555 | **TakeScreenshot()** - *screenshot function 2* |
| 064 | 02583 | **CaptureWindow()** - *screenshot function 3* |
| 065 | 02613 | **CaptureScreen()** - *screenshot function 4 - orginally from CaptureScreen.ahk* |
| 066 | 02700 | **CaptureCursor()** - *sub for CaptureScreen() - this captures the cursor* |
| 067 | 02726 | **Zoomer()** - *sub for CaptureScreen() - zooms a HBitmap, depending function of CaptureScreen()* |
| 068 | 02744 | **Convert()** - *sub for CaptureScreen() - converts from one picture format to another one, depending on Gdip restriction only .bmp, .jpg, .png is possible* |
| 069 | 02810 | **SaveHBITMAPToFile()** - *sub for CaptureScreen() - saves a HBitmap to a file* |
| 070 | 02822 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 071 | 02852 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 072 | 02919 | **GetRange()** - *another good screen area selection function* |
| 073 | 03030 | **FloodFill()** - *filling an area using color banks* |
| 074 | 03079 | **CreateBMPGradient()** - *Horizontal/Vertical gradient* |
| 075 | 03103 | **BGR()** - *BGR() subfunction from CreateBMPGradient()* |
| 076 | 03111 | **CreatePatternBrushFrom()** - *as it says* |
| 077 | 03143 | **ResConImg()** - *Resize and convert images. png, bmp, jpg, tiff, or gif* |
| 078 | 03195 | **CreateCircleProgress()** - *very nice to see functions for a circle progress* |
| 079 | 03305 | **UpdateCircleProgress()** - *sub for CreateCircleProgress* |
| 080 | 03310 | **DestroyCircleProgress()** - *sub for CreateCircleProgress* |
| 081 | 03319 | **RGBrightnessToHex()** - *transform rbg (with brightness) values to hex* |
| 082 | 03324 | **GetHueColorFromFraction()** - *get hue color from fraction. example: h(0) is red, h(1/3) is green and h(2/3) is blue* |
| 083 | 03334 | **SaveHBITMAPToFile()** - *saves the hBitmap to a file* |
| 084 | 03344 | **DrawRotatePictureOnGraphics()** - *rotate a pBitmap* |
| 085 | 03361 | **CopyBitmapOnGraphic()** - *copy a pBitmap of a specific width and height to the Gdip graphics container (pGraphics)* |
| 086 | 03368 | **GDI_GrayscaleBitmap()** - *Converts GDI bitmap to 256 color GreyScale* |
| 087 | 03405 | **Convert_BlackWhite()** - *Convert exist imagefile to black&white , it uses machine code* |
| 088 | 03460 | **BlackWhite()** - *sub from Convert_BlackWhite* |
| 089 | 03470 | **getHBMinfo()** |
| 090 | 03478 | **CreateDIB()** - *a wonderfull function by SKAN to draw tiled backgrounds (like chess pattern) to a gui, it can also draw gradients* |
| 091 | 03531 | **GuiControlLoadImage()** - *scale down a picture to fit the given width and height of a picture control* |
| 092 | 03591 | **Gdip_ResizeBitmap()** - *returns resized bitmap* |
| 093 | 03637 | **Gdip_CropBitmap()** - *returns cropped bitmap. Specify how many pixels you want to crop (omit) from each side of bitmap rectangle* |
| 094 | 03674 | **GetBitmapSize()** - *Lexikos function to get the size of bitmap* |
| 095 | 03701 | **Gdip_BitmapReplaceColor()** - *using Mcode to replace a color with a specific variation* |
| 096 | 03748 | **Gdi_ExtFloodFill()** - *fills an area with the current brush* |
| 097 | 03802 | **Gdip_AlphaMask32v1()** - *32bit Gdip-AlphaMask with MCode - one of two builds* |
| 098 | 03849 | **Gdip_AlphaMask32v2()** - *32bit Gdip-AlphaMask with MCode  - second of two builds* |
| 099 | 03899 | **Gdip_AlphaMask64()** - *64bit Gdip-AlphaMask with MCode* |
| 100 | 03919 | **()** - *LTrim Join* |
| 101 | 03956 | **CircleCrop()** - *gdi circlecrop with MCode* |
| 102 | 04024 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 103 | 04094 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 104 | 04200 | **Popup()** - *Splashtext Gui* |
| 105 | 04224 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture* |
| 106 | 04262 | **SplitButton()** - *drop down button* |
| 107 | 04334 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 108 | 04382 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 109 | 04430 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 110 | 04476 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 111 | 04521 | **PassBox()** - *show a custom input box for a password* |
| 112 | 04566 | **CreateHotkeyWindow()** - *Hotkey Window* |
| 113 | 04602 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 114 | 04794 | **guiMsgBox()** - *GUI Message Box to allow selection* |
| 115 | 04826 | **URLPrefGui()** - *shimanov's workaround for displaying URLs in a gui* |
| 116 | 04934 | **TaskDialog()** - *a Task Dialog is a new kind of dialogbox that has been added in Windows Vista and later. They are similar to message boxes, but with much more power.* |
| 117 | 04964 | **TaskDialogDirect()** - *part of TaskDialog ?* |
| 118 | 05005 | **TaskDialogMsgBox()** - *part of TaskDialog ?* |
| 119 | 05045 | **TaskDialogToUnicode()** - *part of TaskDialog ?* |
| 120 | 05053 | **TaskDialogCallback()** - *part of TaskDialog ?* |
| 121 | 05073 | **TT_Console()** - *Use Tooltip as a User Interface it returns the key which has been pressed* |
| 122 | 05132 | **ToolTipEx()** - *Display ToolTips with custom fonts and colors* |
| 123 | 05342 | **SafeInput()** - *makes sure the same window stays active after showing the InputBox. Otherwise you might get the text pasted into another window unexpectedly.* |
| 124 | 05361 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 125 | 05374 | **WinFadeToggle()** - *smooth fading in out a window* |
| 126 | 05436 | **winfade()** - *another winfade function* |
| 127 | 05453 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 128 | 05459 | **FrameShadow()** - *FrameShadow1* |
| 129 | 05470 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 130 | 05498 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 131 | 05541 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar* |
| 132 | 05555 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 133 | 05585 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 134 | 05606 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 135 | 05672 | **SetTaskbarProgress()** - *modified function* |
| 136 | 05731 | **InVar()** - *sub of SetTaskbarProgress, parsing list search* |
| 137 | 05738 | **IsWindow()** - *sub of SetTaskbarProgress, different approach to IsWindow in gui + window - get/find section* |
| 138 | 05746 | **WinSetPlacement()** - *Sets window position using workspace coordinates (-> no taskbar)* |
| 139 | 05775 | **AttachToolWindow()** - *Attaches a window as a tool window to another window from a different process.* |
| 140 | 05795 | **DeAttachToolWindow()** - *removes the attached ToolWindow* |
| 141 | 05817 | **Control_SetTextAndResize()** - *set a new text to a control and resize depending on textwidth and -height* |
| 142 | 05854 | **GetComboBoxChoice()** - *Combobox function* |
| 143 | 05875 | **Edit_Standard_Params()** - *these are helper functions to use with edit controls* |
| 144 | 05885 | **Edit_TextIsSelected()** - *returns bool if text is selected in an edit control* |
| 145 | 05892 | **Edit_GetSelection()** - *get selected text in an edit control* |
| 146 | 05904 | **Edit_Select()** - *selects text inside in an edit control* |
| 147 | 05916 | **Edit_SelectLine()** - *selects one line in an edit control* |
| 148 | 05948 | **Edit_DeleteLine()** - *delete one line in an edit control* |
| 149 | 05964 | **Edit_VCenter()** - *Vertically Align Text for edit controls* |
| 150 | 05999 | **IL_LoadIcon()** - *no description* |
| 151 | 06007 | **IL_GuiButtonIcon()** - *no description* |
| 152 | 06035 | **LB_AdjustItemHeight()** - *Listbox function* |
| 153 | 06041 | **LB_GetItemHeight()** - *Listbox function* |
| 154 | 06048 | **LB_SetItemHeight()** - *Listbox function* |
| 155 | 06061 | **LV_GetCount()** - *get current count of notes in from any listview* |
| 156 | 06071 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 157 | 06138 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 158 | 06160 | **LV_GetItemText()** - *read the text from an item in a ListView* |
| 159 | 06199 | **LV_GetText()** - *get text by item and subitem from a Listview* |
| 160 | 06288 | **ExtractInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 161 | 06312 | **InsertInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 162 | 06326 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 163 | 06372 | **LV_MoveRow()** - *moves a listview row up or down* |
| 164 | 06392 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 165 | 06444 | **LV_Find()** - *I think it's usefull to find an item position a listview* |
| 166 | 06460 | **LV_GetSelectedText()** - *Returns text from selected rows in ListView (in a user friendly way IMO.)* |
| 167 | 06511 | **LV_Notification()** - *easy function for showing notifications by hovering over a listview* |
| 168 | 06536 | **LV_IsChecked()** - *alternate method to find out if a particular row number is checked* |
| 169 | 06543 | **LV_HeaderFontSet()** - *sets a different font to a Listview header (it's need CreateFont() function)* |
| 170 | 06637 | **LV_SetCheckState()** - *check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control* |
| 171 | 06668 | **LV_SetItemState()** - *with this function you can set all avaible states to a listview item* |
| 172 | 06706 | **NumPut()** - *mask* |
| 173 | 06707 | **NumPut()** - *iItem* |
| 174 | 06708 | **NumPut()** - *state* |
| 175 | 06709 | **NumPut()** - *stateMask* |
| 176 | 06716 | **LV_SubitemHitTest()** - *get's clicked column in listview* |
| 177 | 06770 | **LV_EX_FindString()** - *find an item in any listview , function works with ANSI and UNICODE (tested)* |
| 178 | 06784 | **LV_RemoveSelBorder()** - *remove the listview's selection border* |
| 179 | 06799 | **LV_SetExplorerTheme()** - *set 'Explorer' theme for ListViews & TreeViews on Vista+* |
| 180 | 06810 | **LV_Update()** - *update one listview item* |
| 181 | 06814 | **LV_RedrawItem()** - *this one redraws on listview item* |
| 182 | 06821 | **LV_SetExStyle()** - *set / remove / alternate extended styles to the listview control* |
| 183 | 06841 | **LV_GetExStyle()** - *get / remove / alternate extended styles to the listview control* |
| 184 | 06845 | **LV_IsItemVisible()** - *determines if a listview item is visible* |
| 185 | 06849 | **LV_SetIconSpacing()** - *Sets the space between icons in the icon view* |
| 186 | 06862 | **LV_GetIconSpacing()** - *Get the space between icons in the icon view* |
| 187 | 06874 | **LV_GetItemPos()** - *obtains the position of an item* |
| 188 | 06893 | **LV_SetItemPos()** - *set the position of an item* |
| 189 | 06911 | **LV_MouseGetCellPos()** - *returns the number (row, col) of a cell in a listview at present mouseposition* |
| 190 | 06951 | **LV_GetColOrderLocal()** - *returns the order of listview columns for a local listview* |
| 191 | 06989 | **LV_GetColOrder()** - *returns the order of listview columns for a listview* |
| 192 | 07048 | **LV_SetColOrderLocal()** - *pass listview hWnd (not listview header hWnd)* |
| 193 | 07061 | **LV_SetColOrder()** - *pass listview hWnd (not listview header hWnd)* |
| 194 | 07113 | **LV_GetCheckedItems()** - *Returns a list of checked items from a standard ListView Control* |
| 195 | 07126 | **LV_ClickRow()** - *simulates a left mousebutton click on a specific row in a listview* |
| 196 | 07143 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 197 | 07151 | **TabCtrl_GetItemText()** - *returns text of a tab* |
| 198 | 07197 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 199 | 07211 | **TV_Load()** - *loads TreeView items from an XML string* |
| 200 | 07393 | **TV_GetItemText()** - *retrieves the text/name of the specified treeview node +* |
| 201 | 07446 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 202 | 07464 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 203 | 07526 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 204 | 07537 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 205 | 07553 | **ControlExists()** - *true/false for ControlClass* |
| 206 | 07565 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 207 | 07597 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 208 | 07626 | **GetOtherControl()** |
| 209 | 07632 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 210 | 07655 | **Control_GetClassNN()** - *no-loop* |
| 211 | 07667 | **ControlGetClassNN()** - *with loop* |
| 212 | 07681 | **ControlGetClassNN()** - *different method is used here in compare to the already existing functions in this collection* |
| 213 | 07695 | **GetClassName()** - *returns HWND's class name without its instance number, e.g. "Edit" or "SysListView32"* |
| 214 | 07703 | **Control_GetFont()** - *get the currently used font of a control* |
| 215 | 07725 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 216 | 07730 | **getControlNameByHwnd()** - *self explaining* |
| 217 | 07748 | **getByControlName()** - *search by control name return hwnd* |
| 218 | 07782 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 219 | 07833 | **IsControlUnderCursor()** - *Checks if a specific control is under the cursor and returns its ClassNN if it is.* |
| 220 | 07840 | **GetFocusedControl()** - *get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available* |
| 221 | 07875 | **ControlGetTextExt()** - *3 different variants are tried to determine the text of a control* |
| 222 | 07902 | **getControlInfo()** - *get width and heights of controls* |
| 223 | 07915 | **FocusedControl()** - *returns the HWND of the currently focused control, or 0 if there was a problem* |
| 224 | 07924 | **Control_GetFont()** - *retrieves the used font of a control* |
| 225 | 07936 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 226 | 07966 | **GetExtraStyle()** - *get Extra Styles from a control* |
| 227 | 07987 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 228 | 08045 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 229 | 08122 | **GetHeaderInfo()** - *Returns an object containing width and text for each item of a remote header control* |
| 230 | 08184 | **WinSaveCheckboxes()** - *save the status of checkboxes in other apps* |
| 231 | 08268 | **GetButtonType()** - *uses the style of a button to get it's name* |
| 232 | 08349 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 233 | 08359 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 234 | 08532 | **GetParent()** - *get parent win handle of a window* |
| 235 | 08538 | **GetWindow()** - *DllCall wrapper for GetWindow function* |
| 236 | 08544 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 237 | 08550 | **IsWindowVisible()** - *self explaining* |
| 238 | 08554 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 239 | 08561 | **IsClosed()** - *AHK function (WinWaitClose) wrapper* |
| 240 | 08568 | **GetClassLong()** |
| 241 | 08575 | **GetWindowLong()** |
| 242 | 08582 | **GetClassStyles()** |
| 243 | 08609 | **GetTabOrderIndex()** |
| 244 | 08636 | **GetCursor()** |
| 245 | 08643 | **GetClientCoords()** |
| 246 | 08653 | **GetClientSize()** - *get size of window without border* |
| 247 | 08661 | **GetWindowCoords()** |
| 248 | 08668 | **GetWindowPos()** |
| 249 | 08678 | **GetWindowPlacement()** - *Gets window position using workspace coordinates (-> no taskbar), returns an object* |
| 250 | 08692 | **GetWindowInfo()** - *returns an Key:Val Object with the most informations about a window (Pos, Client Size, Style, ExStyle, Border size...)* |
| 251 | 08714 | **GetOwner()** |
| 252 | 08718 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 253 | 08774 | **FindWindow()** - *Finds the first window matching specific criterias.* |
| 254 | 08804 | **ShowWindow()** - *uses a DllCall to show a window* |
| 255 | 08808 | **IsWindow()** - *wrapper for IsWindow DllCall* |
| 256 | 08812 | **GetClassName()** - *wrapper for AHK WinGetClass function* |
| 257 | 08817 | **FindChildWindow()** - *finds childWindow Hwnds of the parent window* |
| 258 | 08881 | **EnumChildWindow()** - *sub function of FindChildWindow* |
| 259 | 08898 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 260 | 08912 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 261 | 08920 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 262 | 08924 | **GetFreeGuiNum()** - *gets a free gui number.* |
| 263 | 08940 | **IsWindowUnderCursor()** - *Checks if a specific window is under the cursor.* |
| 264 | 08948 | **GetCenterCoords()** - *?center a gui between 2 monitors?* |
| 265 | 08969 | **RMApp_NCHITTEST()** - *Determines what part of a window the mouse is currently over* |
| 266 | 08983 | **GetCPA_file_name()** - *retrieves Control Panel applet icon* |
| 267 | 09015 | **WinGetClientPos()** - *gives back the coordinates of client area inside a gui/window - with DpiFactor correction* |
| 268 | 09053 | **CheckWindowStatus()** - *check's if a window is responding or not responding (hung or crashed) -* |
| 269 | 09088 | **GetWindowOrder()** - *determines the window order for a given (parent-)hwnd* |
| 270 | 09123 | **EnumWindows()** - *Get a list with all the top-level windows on the screen or controls in the window* |
| 271 | 09177 | **WinEnum()** - *wrapper for Enum(Child)Windows from cocobelgica. a different solution to that one I collected before* |
| 272 | 09239 | **WinWaitProgress()** - *Waits for the progress bar on a window to reach (>=) a given value (a Lexikos function)* |
| 273 | 09289 | **ChooseColor()** - *what is this for?* |
| 274 | 09310 | **GetWindowIcon()** |
| 275 | 09390 | **GetStatusBarText()** |
| 276 | 09406 | **GetAncestor()** |
| 277 | 09411 | **MinMaxInfo()** |
| 278 | 09424 | **GetMouseTaskButton()** - *Gets the index+1 of the taskbar button which the mouse is hovering over* |
| 279 | 09529 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 280 | 09546 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 281 | 09567 | **ControlClick2()** - *ControlClick Double Click* |
| 282 | 09577 | **ControlFromPoint()** - *returns the hwnd of a control at a specific point on the screen* |
| 283 | 09617 | **EnumChildFindPoint()** - *this function is required by ControlFromPoint* |
| 284 | 09656 | **ControlDoubleClick()** - *simulates a double click on a control with left/middle or right mousebutton* |
| 285 | 09676 | **WinWaitForMinimized()** - *waits until the window is minimized* |
| 286 | 09694 | **CenterWindow()** - *Given a the window's width and height, calculates where to position its upper-left corner so that it is centered EVEN IF the task bar is on the left side or top side of the window* |
| 287 | 09713 | **GuiCenterButtons()** - *Center and resize a row of buttons automatically* |
| 288 | 09765 | **CenterControl()** - *Centers one control* |
| 289 | 09816 | **SetWindowIcon()** |
| 290 | 09822 | **SetWindowPos()** |
| 291 | 09826 | **TryKillWin()** |
| 292 | 09844 | **Win32_SendMessage()** - *Closing a window through sendmessage command* |
| 293 | 09856 | **Win32_TaskKill()** |
| 294 | 09865 | **Win32_Terminate()** |
| 295 | 09876 | **TabActivate()** |
| 296 | 09884 | **FocuslessScroll()** |
| 297 | 09985 | **FocuslessScrollHorizontal()** |
| 298 | 10019 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 299 | 10041 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 300 | 10061 | **GUI_AutoHide()** - *Autohide the GUI function* |
| 301 | 10328 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 302 | 10422 | **AddToolTip()** - *Add/Update tooltips to GUI controls.* |
| 303 | 10555 | **NumPut()** - *cbSize* |
| 304 | 10556 | **NumPut()** - *uFlags* |
| 305 | 10557 | **NumPut()** - *hwnd* |
| 306 | 10558 | **NumPut()** - *uId* |
| 307 | 10608 | **HelpToolTips()** - *To show defined GUI control help tooltips on hover.* |
| 308 | 10639 | **DisableFadeEffect()** - *disabling fade effect on gui animations* |
| 309 | 10663 | **SetWindowTransistionDisable()** - *disabling fade effect only the window of choice* |
| 310 | 10697 | **DisableMinimizeAnim()** - *disables or restores original minimize anim setting* |
| 311 | 10717 | **DisableCloseButton()** - *to disable/grey out the close button* |
| 312 | 10726 | **AutoCloseBlockingWindows()** - *close all open popup (childwindows), without knowing their names, of a parent window* |
| 313 | 10815 | **WinActivateEx()** - *Activate a Window, with extra Error Checking and More Features* |
| 314 | 10852 | **ClickOK()** - *function that search for any button in a window that might be an 'Ok' button to close a window dialog* |
| 315 | 10918 | **ControlSelectTab()** - *SendMessage wrapper to select the current tab on a MS Tab Control.* |
| 316 | 10937 | **SetParentByClass()** - *set parent window by using its window class* |
| 317 | 10945 | **MoveTogether()** - *move 2 windows together - using DllCall to DeferWindowPos* |
| 318 | 11031 | **WinWaitCreated()** - *Wait for a window to be created, returns 0 on timeout and ahk_id otherwise* |
| 319 | 11065 | **closeContextMenu()** - *a smart way to close a context menu* |
| 320 | 11082 | **SetWindowTheme()** - *set Windows UI Theme by window handle* |
| 321 | 11098 | **HideFocusBorder()** - *hides the focus border for the given GUI control or GUI and all of its children* |
| 322 | 11142 | **unmovable()** - *makes Gui unmovable* |
| 323 | 11153 | **movable()** - *makes Gui movable* |
| 324 | 11160 | **GuiDisableMove()** - *to fix a gui/window to its coordinates* |
| 325 | 11166 | **WinInsertAfter()** - *insert a window after a specific window handle* |
| 326 | 11183 | **CenterWindow()** - *center a window or set position optional by using Top, Left, Right, Bottom or a combination of it* |
| 327 | 11226 | **SetHoverText()** - *change control's text on mouseover* |
| 328 | 11323 | **GetMenu()** - *returns hMenu handle* |
| 329 | 11328 | **GetSubMenu()** |
| 330 | 11332 | **GetMenuItemCount()** |
| 331 | 11336 | **GetMenuItemID()** |
| 332 | 11340 | **GetMenuString()** |
| 333 | 11355 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 334 | 11364 | **MenuGetAll_sub()** - *described above* |
| 335 | 11387 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 336 | 11425 | **GetContextMenuID()** - *returns the ID of a menu entry* |
| 337 | 11448 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 338 | 11507 | **Menu_AssignBitmap()** - *assign bitmap to any item in any AHk menu* |
| 339 | 11667 | **InvokeVerb()** - *executes the context menu item of the given path* |
| 340 | 11745 | **Menu_Show()** - *its an alternative to Menu, Show, which can display menu without blocking monitored messages* |
| 341 | 11775 | **CreateMenu()** - *creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 342 | 11906 | **CreateDDMenu()** - *Creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 343 | 12061 | **ExtractIcon()** - *extract icon from a resource file* |
| 344 | 12141 | **GetIconSize()** - *determines the size of the icon (Lexikos function)* |
| 345 | 12177 | **Gdip_GetHICONDimensions()** - *get icon dimensions* |
| 346 | 12216 | **SetTrayIcon()** - *sets a hex coded icon to as try icon* |
| 347 | 12258 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 348 | 12335 | **Function_Eject()** - *ejects a drive medium* |
| 349 | 12367 | **FileGetDetail()** - *Get specific file property by index* |
| 350 | 12378 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 351 | 12394 | **DirExist()** - *Checks if a directory exists* |
| 352 | 12398 | **GetDetails()** - *Create an array of possible file properties* |
| 353 | 12412 | **Start()** - *Start programs or scripts easier* |
| 354 | 12431 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 355 | 12439 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 356 | 12588 | **WatchDirectory()** - *it's different from above not tested* |
| 357 | 12785 | **GetFileIcon()** |
| 358 | 12798 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 359 | 12812 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 360 | 12825 | **DestroyIcon()** |
| 361 | 12829 | **listfunc()** - *list all functions inside ahk scripts* |
| 362 | 12845 | **CreateOpenWithMenu()** - *creates an 'open with' menu for the passed file.* |
| 363 | 12997 | **FileCount()** - *count matching files in the working directory* |
| 364 | 13005 | **GetImageTypeW()** - *Identify the image type (UniCode)* |
| 365 | 13049 | **FileWriteLine()** - *to write data at specified line in a file.* |
| 366 | 13059 | **FileMD5()** - *file MD5 hashing* |
| 367 | 13075 | **FileCRC32()** - *computes and returns CRC32 hash for a File passed as parameter* |
| 368 | 13093 | **FindFreeFileName()** - *Finds a non-existing filename for Filepath by appending a number in brackets to the name* |
| 369 | 13106 | **CountFilesR()** - *count files recursive in specific folder (uses COM method)* |
| 370 | 13115 | **CountFiles()** - *count files in specific folder (uses COM method)* |
| 371 | 13121 | **PathInfo()** - *splits a given path to return as object* |
| 372 | 13126 | **DriveSpace()** - *retrieves the DriveSpace* |
| 373 | 13134 | **GetBinaryType()** - *determines the bit architecture of an executable program* |
| 374 | 13144 | **GetFileAttributes()** - *get attributes of a file or folder* |
| 375 | 13183 | **SetFileTime()** - *to set the time* |
| 376 | 13192 | **SetFileAttributes()** - *set attributes of a file or folder* |
| 377 | 13230 | **FileSetSecurity()** - *set security for the file / folder* |
| 378 | 13284 | **FileSetOwner()** - *set the owner to file / directory* |
| 379 | 13304 | **FileGetOwner()** - *get the owner to file / directory* |
| 380 | 13321 | **GetFileFormat()** - *retreaves the codepage format of a file* |
| 381 | 13341 | **HashFile()** - *calculate hashes (MD2,MD5,SH1,SHA256, SHA384, SHA512) from file* |
| 382 | 13452 | **PathCombine()** - *combine the 2 routes provided in a single absolute path* |
| 383 | 13476 | **GetParentDir()** - *small RegEx function to get parent dir from a given string* |
| 384 | 13480 | **DirGetParent()** - *returns a string containing parent dir, it's possible to set the level of parent dir* |
| 385 | 13506 | **CreateFont()** - *creates font in memory which can be used with any API function accepting font handles* |
| 386 | 13559 | **GetHFONT()** - *gets a handle to a font used in a AHK gui for example* |
| 387 | 13572 | **MsgBoxFont()** - *style your MsgBox with with your prefered font* |
| 388 | 13586 | **GetFontProperties()** - *to get the current font's width and height* |
| 389 | 13632 | **FontEnum()** - *enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure* |
| 390 | 13672 | **GetFontTextDimension()** - *calculate the height and width of the text in the specified font* |
| 391 | 13727 | **FontClone()** - *backup hFont in memory for further processing* |
| 392 | 13769 | **GuiDefaultFont()** - *returns the default Fontname & Fontsize* |
| 393 | 13805 | **StrGetDimAvgCharWidth()** - *average width of a character in pixels* |
| 394 | 13848 | **CreateFont()** - *creates HFont for use with GDI* |
| 395 | 13879 | **MeasureText()** - *Measures the single-line width and height of the passed text* |
| 396 | 13935 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 397 | 14169 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 398 | 14209 | **HDrop()** - *Drop files to another app* |
| 399 | 14242 | **WM_MOVE()** - *UpdateLayeredWindow* |
| 400 | 14255 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 401 | 14265 | **WM_WINDOWPOSCHANGING()** - *second examples of handling a WM_WINDOWPOSCHANGING* |
| 402 | 14283 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 403 | 14287 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 404 | 14326 | **ObjectNameChange()** - *titlebar hook to detect when title changes, (Lexikos' code)* |
| 405 | 14375 | **DownloadFile()** |
| 406 | 14398 | **NewLinkMsg()** |
| 407 | 14414 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 408 | 14424 | **GetSourceURL()** |
| 409 | 14436 | **DNS_QueryName()** |
| 410 | 14461 | **GetHTMLFragment()** |
| 411 | 14481 | **ScrubFragmentIdents()** |
| 412 | 14492 | **EnumClipFormats()** |
| 413 | 14501 | **GetClipFormatNames()** |
| 414 | 14520 | **GoogleTranslate()** |
| 415 | 14539 | **getText()** - *get text from html* |
| 416 | 14554 | **getHtmlById()** |
| 417 | 14559 | **getTextById()** |
| 418 | 14563 | **getHtmlByTagName()** |
| 419 | 14571 | **getTextByTagName()** |
| 420 | 14579 | **CreateGist()** |
| 421 | 14601 | **GetAllResponseHeaders()** - *gets the values of all HTTP headers* |
| 422 | 14670 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 423 | 14768 | **ExtractTableData()** - *extracts tables from HTML files* |
| 424 | 14891 | **IsConnected()** - *Returns true if there is an available internet connection* |
| 425 | 14895 | **HostToIp()** - *gets the IP address for the given host directly using the WinSock 2.0 dll, without using temp files or third party utilities* |
| 426 | 14998 | **LocalIps()** - *with small changes to HostToIP() this can be used to retrieve all LocalIP's* |
| 427 | 15067 | **GetAdaptersInfo()** - *GetAdaptersAddresses function & IP_ADAPTER_ADDRESSES structure* |
| 428 | 15122 | **DNSQuery()** - *retrieve IP adresses or host/domain names from DNS* |
| 429 | 15240 | **Min()** - *returns the smaller of 2 numbers* |
| 430 | 15244 | **Max()** - *determines the larger number* |
| 431 | 15248 | **Mean()** - *returns Average values in comma delimited list* |
| 432 | 15262 | **Median()** - *returns Median in a set of numbers from a list* |
| 433 | 15289 | **Mode()** - *returns the mode from a list of numbers* |
| 434 | 15318 | **Dec2Base()** - *Base to Decimal and* |
| 435 | 15324 | **Base2Dec()** - *Decimal to Base conversion* |
| 436 | 15330 | **HexToFloat()** - *Hexadecimal to Float conversion* |
| 437 | 15334 | **FloatToHex()** - *Float to Hexadecimal conversion* |
| 438 | 15344 | **CalculateDistance()** - *calculates the distance between two points in a 2D-Space* |
| 439 | 15348 | **IsInRange()** - *shows if a second variable is in range* |
| 440 | 15359 | **FormatFileSize()** - *Formats a file size in bytes to a human-readable size string* |
| 441 | 15367 | **Color_RGBtoHSV()** - *converts beetween color two color spaces: RGB -> HSV* |
| 442 | 15397 | **Color_HSVtoRGB()** - *converts beetween color two color spaces: HSV -> RGB* |
| 443 | 15468 | **JEE_HexToBinData()** - *hexadecimal to binary* |
| 444 | 15478 | **JEE_BinDataToHex()** - *binary to hexadecimal* |
| 445 | 15489 | **JEE_BinDataToHex2()** - *binary to hexadecimal2* |
| 446 | 15497 | **RadianToDegree()** - *convert radian (rad) to degree* |
| 447 | 15510 | **DegreeToRadian()** - *convert degree to radian (rad)* |
| 448 | 15524 | **RGBToARGB()** - *convert RGB to ARGB* |
| 449 | 15551 | **ARGBToRGB()** - *convert ARGB to RGB.* |
| 450 | 15570 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB .... (for AHK_V1)* |
| 451 | 15600 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB ....(for AHK_V2)* |
| 452 | 15641 | **ObjMerge()** - *merge two objects* |
| 453 | 15656 | **evalRPN()** - *Parsing/RPN calculator algorithm* |
| 454 | 15694 | **StackShow()** |
| 455 | 15701 | **ExploreObj()** - *print object function* |
| 456 | 15757 | **KeyValueObjectFromLists()** - *merge two lists into one key-value object, useful for 2 two lists you retreave from WinGet* |
| 457 | 15824 | **GetCallStack()** - *retrieves the current callstack* |
| 458 | 15898 | **Traceback()** - *get stack trace* |
| 459 | 15988 | **Sort2DArray()** - *a two dimensional TDArray* |
| 460 | 16009 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 461 | 16042 | **QuickSort()** - *Sort array using QuickSort algorithm* |
| 462 | 16308 | **sortArray()** - *sorts an array (another way)* |
| 463 | 16389 | **StringMD5()** - *String MD5 Hashing* |
| 464 | 16399 | **uriEncode()** - *a function to escape characters like & for use in URLs.* |
| 465 | 16414 | **Ansi2Unicode()** - *easy convertion from Ansi to Unicode, you can set prefered codepage* |
| 466 | 16434 | **Unicode2Ansi()** - *easy convertion from Unicode to Ansi, you can set prefered codepage* |
| 467 | 16458 | **Ansi2Oem()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 468 | 16464 | **Oem2Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 469 | 16470 | **Ansi2UTF8()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 470 | 16476 | **UTF82Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 471 | 16482 | **CRC32()** - *CRC32 function, uses MCode* |
| 472 | 16497 | **ParseJsonStrToArr()** - *Parse Json string to an array* |
| 473 | 16523 | **parseJSON()** - *Parse Json string to an object* |
| 474 | 16544 | **GetNestedTag()** |
| 475 | 16574 | **GetHTMLbyID()** - *uses COM* |
| 476 | 16589 | **GetHTMLbyTag()** - *uses COM* |
| 477 | 16604 | **GetXmlElement()** - *RegEx function* |
| 478 | 16622 | **sXMLget()** - *simple solution to get information out of xml and html* |
| 479 | 16640 | **cleanlines()** - *removes all empty lines* |
| 480 | 16653 | **cleancolon()** - *what for? removes on ':' at beginning of a string* |
| 481 | 16663 | **cleanspace()** - *removes all Space chars* |
| 482 | 16676 | **SplitLine()** - *split string to key and value* |
| 483 | 16686 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 484 | 16694 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 485 | 16701 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 486 | 16726 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 487 | 16761 | **StringM()** - *String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)* |
| 488 | 16801 | **StrCount()** - *a very handy function to count a needle in a Haystack* |
| 489 | 16808 | **SuperInstr()** - *Returns min/max position for a | separated values of Needle(s)* |
| 490 | 16837 | **LineDelete()** - *deletes a specific line or a range of lines from a variable containing one or more lines of text. No use of any loop!* |
| 491 | 16909 | **GetWordsNumbered()** - *gives back an array of words from a string, you can specify the position of the words you want to keep* |
| 492 | 16941 | **AddTrailingBackslash()** - *adds a backslash to the beginning of a string if there is none* |
| 493 | 16949 | **CheckQuotes()** |
| 494 | 16958 | **ReplaceForbiddenChars()** - *hopefully working, not tested function, it uses RegExReplace* |
| 495 | 16970 | **WrapText()** - *basic function to wrap a text-string to a given length* |
| 496 | 17009 | **ExtractFuncTOuserAHK()** - *extract user function and helps to write it to userAhk.api* |
| 497 | 17130 | **PdfToText()** - *copies a selected PDF file to memory - it needs xpdf - pdftotext.exe* |
| 498 | 17157 | **PdfPageCounter()** - *counts pages of a pdffile (works with 95% of pdf files)* |
| 499 | 17173 | **PasteWithIndent()** - *paste string to an editor with your prefered indent key* |
| 500 | 17189 | **Ask_and_SetbackFocus()** - *by opening a msgbox you lost focus and caret pos in any editor - this func will restore the previous positions of the caret* |
| 501 | 17237 | **CleanLine()** - *Return a line with leading and trailing spaces removed, and tabs converted to spaces* |
| 502 | 17259 | **StrTrim()** - *Remove all leading and trailing whitespace including tabs, spaces, CR and LF* |
| 503 | 17280 | **StrDiff()** - *SIFT3 : Super Fast and Accurate string distance algorithm* |
| 504 | 17348 | **PrintArr()** - *show values of an array in a listview gui for debugging* |
| 505 | 17390 | **List2Array()** - *function uses StrSplit () to return an array* |
| 506 | 17394 | **Array_Gui()** - *shows your array as an interactive TreeView* |
| 507 | 17484 | **DelaySend()** - *Send keystrokes delayed* |
| 508 | 17530 | **SetLayout()** - *set a keyboard layout* |
| 509 | 17535 | **GetAllInputChars()** - *Returns a string with input characters* |
| 510 | 17545 | **ReleaseModifiers()** - *helps to solve the Hotkey stuck problem* |
| 511 | 17592 | **isaKeyPhysicallyDown()** - *belongs to ReleaseModifiers() function* |
| 512 | 17605 | **GetText()** - *copies the selected text to a variable while preserving the clipboard.(Ctrl+C method)* |
| 513 | 17622 | **PutText()** - *Pastes text from a variable while preserving the clipboard. (Ctrl+v method)* |
| 514 | 17634 | **Hotkeys()** - *a handy function to show all used hotkeys in script* |
| 515 | 17685 | **BlockKeyboard()** - *block keyboard, and unblock it through usage of keyboard* |
| 516 | 17746 | **ShowTrayBalloon()** |
| 517 | 17772 | **ColoredTooltip()** - *show a tooltip for a given time with a custom color in rgb format (fore and background is supported). This function shows how to obtain the hWnd of the tooltip.* |
| 518 | 17821 | **AddToolTip()** - *very easy to use function to add a tooltip to a control* |
| 519 | 18092 | **AddToolTip()** - *add ToolTips to controls - Advanced ToolTip features + Unicode* |
| 520 | 18687 | **AddToolTip()** - *just a simple add on to allow tooltips to be added to controls without having to monitor the wm_mousemove messages* |
| 521 | 18758 | **AddToolTip()** - *this is a function from jballi -* |
| 522 | 18890 | **NumPut()** - *cbSize* |
| 523 | 18891 | **NumPut()** - *uFlags* |
| 524 | 18892 | **NumPut()** - *hwnd* |
| 525 | 18893 | **NumPut()** - *uId* |
| 526 | 18952 | **CreateNamedPipe()** - *creates an instance of a named pipe and returns a handle for subsequent pipe operations* |
| 527 | 18957 | **RestoreCursors()** - *for normal cursor at GUI* |
| 528 | 18962 | **SetSystemCursor()** - *enables an application to customize the system cursors by using a file or by using the system cursor* |
| 529 | 19043 | **SystemCursor()** - *hiding mouse cursor* |
| 530 | 19082 | **ToggleSystemCursor()** - *choose a cursor from system cursor list* |
| 531 | 19161 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 532 | 19198 | **GlobalVarsScript()** |
| 533 | 19223 | **patternScan()** - *scan for a pattern in memory* |
| 534 | 19322 | **scanInBuf()** - *scan for a pattern in memory buffer* |
| 535 | 19360 | **hexToBinaryBuffer()** |
| 536 | 19383 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines (for ansi- and unicode)* |
| 537 | 19476 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 538 | 19676 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 539 | 19710 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 540 | 19765 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 541 | 19830 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 542 | 19909 | **TimedFunction()** - *SetTimer functionality for functions* |
| 543 | 19936 | **ListGlobalVars()** - *ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string* |
| 544 | 19986 | **TaskList()** - *list all running tasks (no use of COM)* |
| 545 | 20037 | **MouseDpi()** - *Change the current dpi setting of the mouse* |
| 546 | 20057 | **SendToAHK()** - *Sends strings by using a hidden gui between AHK scripts* |
| 547 | 20086 | **ReceiveFromAHK()** - *Receiving strings from SendToAHK* |
| 548 | 20115 | **GetUIntByAddress()** - *get UInt direct from memory. I found this functions only within one script* |
| 549 | 20129 | **SetUIntByAddress()** - *write UInt direct to memory* |
| 550 | 20144 | **SetRestrictedDacl()** - *run this in your script to hide it from Task Manager* |
| 551 | 20231 | **getActiveProcessName()** - *this function finds the process to the 'ForegroundWindow'* |
| 552 | 20246 | **enumChildCallback()** - *i think this retreave's the child process ID for a known gui hwnd and the main process ID* |
| 553 | 20253 | **GetDllBase()** |
| 554 | 20275 | **getProcBaseFromModules()** |
| 555 | 20332 | **InjectDll()** - *injects a dll to a running process (ahkdll??)* |
| 556 | 20357 | **getProcessBaseAddress()** - *gives a pointer to the base address of a process for further memory reading* |
| 557 | 20373 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 558 | 20795 | **PIDfromAnyID()** - *for easy retreaving of process ID's (PID)* |
| 559 | 20846 | **processPriority()** - *retrieves the priority of a process via PID* |
| 560 | 20870 | **UserAccountsEnum()** - *list all users with information* |
| 561 | 20896 | **GetCurrentUserInfo()** - *obtains information from the current user* |
| 562 | 20917 | **GetHandleInformation()** - *obtain certain properties of a HANDLE* |
| 563 | 20942 | **SetHandleInformation()** - *establishes the properties of a HANDLE* |
| 564 | 20957 | **GetPhysicallyInstalledSystemMemory()** - *recovers the amount of RAM in physically installed KB from the SMBIOS (System Management BIOS) firmware tables, WIN_V SP1+* |
| 565 | 20968 | **GlobalMemoryStatus()** - *retrieves information about the current use of physical and virtual memory of the system* |
| 566 | 20984 | **GetSystemFileCacheSize()** - *retrieves the current size limits for the working set of the system cache* |
| 567 | 20996 | **Is64bitProcess()** - *check if a process is running in 64bit* |
| 568 | 21008 | **getSessionId()** - *this functions finds out ID of current session* |
| 569 | 21035 | **CreatePropertyCondition()** - *I hope this one works* |
| 570 | 21051 | **CreatePropertyCondition()** - *I hope this one is better* |
| 571 | 21084 | **CreatePropertyConditionEx()** |
| 572 | 21114 | **UIAgetControlNameByHwnd()** |
| 573 | 21126 | **MouseGetText()** - *get the text in the specified coordinates, function uses Microsoft UIA* |
| 574 | 21194 | **Acc_Get()** |
| 575 | 21246 | **Acc_Error()** |
| 576 | 21251 | **Acc_ChildrenByRole()** |
| 577 | 21293 | **listAccChildProperty()** |
| 578 | 21340 | **GetInfoUnderCursor()** - *retreavies ACC-Child under cursor* |
| 579 | 21348 | **GetAccPath()** - *get the Acc path from (child) handle* |
| 580 | 21363 | **GetEnumIndex()** - *for Acc child object* |
| 581 | 21388 | **IEGet()** - *AutoHotkey_L* |
| 582 | 21396 | **IEGet()** - *AutoHotkey_Basic* |
| 583 | 21410 | **WBGet()** - *AHK_L: based on ComObjQuery docs* |
| 584 | 21424 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 585 | 21438 | **WBGet()** - *based on ComObjQuery docs* |
| 586 | 21455 | **IE_TabActivateByName()** - *activate a TAB by name in InternetExplorer* |
| 587 | 21471 | **IE_TabActivateByHandle()** - *activates a tab by hwnd in InternetExplorer* |
| 588 | 21490 | **IE_TabWinID()** - *find the HWND of an IE window with a given tab name* |
| 589 | 21510 | **ReadProxy()** - *reads the proxy settings from the windows registry* |
| 590 | 21518 | **IE_getURL()** - *using shell.application* |
| 591 | 21531 | **ACCTabActivate()** - *activate a Tab in IE - function uses acc.ahk library* |
| 592 | 21546 | **TabActivate()** - *a different approach to activate a Tab in IE - function uses acc.ahk library* |
| 593 | 21564 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 594 | 21581 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 595 | 21586 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 596 | 21591 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 597 | 21642 | **Valueof()** - *Super Variables processor by Avi Aryan, overcomes the limitation of a single level ( return %var% ) in nesting variables* |
| 598 | 21697 | **type()** - *Object version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 599 | 21721 | **type()** - *COM version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 600 | 21742 | **A_DefaultGui()** - *a nice function to have a possibility to get the number of the default gui* |
| 601 | 21777 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq* |
| 602 | 21811 | **GetCommState()** - *this function retrieves the configuration settings of a given serial port* |
| 603 | 21925 | **pauseSuspendScript()** - *function to suspend/pause another script* |
| 604 | 21962 | **RtlGetVersion()** - *retrieves version of installed windows system* |
| 605 | 21981 | **PostMessageUnderMouse()** - *Post a message to the window underneath the mouse cursor, can be used to do things involving the mouse scroll wheel* |
| 606 | 22002 | **WM_SETCURSOR()** - *Prevent "sizing arrow" cursor when hovering over window border* |
| 607 | 22019 | **FoxitInvoke()** - *wm_command wrapper for FoxitReader Version:  9.1* |
| 608 | 22263 | **MoveMouse_Spiral()** - *move mouse in a spiral* |
