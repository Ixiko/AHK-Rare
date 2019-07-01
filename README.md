![AHK - Rare Logo](assets/AHK-Rare-Logo.png)

------

**AHK-Rare** - *collection of rare or very useful single functions* 

This is a collection of functions I found at Autohotkey-Forum or inside Autohotkey Scripts. Sometimes you will find one of it an official Autohotkey-Library. Approximately 90-95% of the functions can not be found in any of the 1000 libraries that I have also put together here at Github.

Some of the collected function seems to be multiple in this collection, because they sometimes use very different methods. This is a crucial difference. You wan’t find “THE ONLY ONE” good function here. Take what is the better right now! From that I build up a script individual library.

----

*Last modification date*: ***07/01/2019***, *Changes are below!* *At the end*: complete list of all functions. The functions are sorted by topic as shown in the picture. *Remark*: I didn’t tested all functions and sorting is very different.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](assets/AHK-Rare.ahk_Screenshot.png)



## ![Gem](../../../../../Eigene%20Dateien/Eigene%20Dokumente/AutoIt%20Scripte/GitHub/AHK-Rare/assets/GemSmall.png) [July 01, 2019]: +19 =  633

| Nr                | **FUNCTION**                  | **DESCRIPTION**                                              |
| :---------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| 01 | **GetProcessMemoryInfo()** | get informations about memory consumption of a process |
| 02 | **SetTimerEx()** | Similar to SetTimer, but calls a function, optionally with one or more parameters |
| 03 | **get_png_image_info()** | Getting PNG image info |
| 04 | **RapidHotkey()** | Using this function you can send keystrokes or launch a Label by pressing a key several times. |
| 05 | **hk()** | Disable all keyboard buttons |
| 06 | **ScriptExist()** | true oder false if script is running or not |
| 07 | **GetStartupWindowState()** | to check, if script exe was launched by windows’s shortcut with MAXIMIZE |
| 08 | **SetTextAndResize()** | resizes a control to adapt to updated values |
| 09 | **HWNDToClassNN()** | a different approach to get classNN from handle |
| 10 | **GetBitmapFromAnything()** | Supports paths, icon handles and hBitmaps |
| 11 | **LV_HeaderFontSet()** | sets font for listview headers |
| 12 | **UpdateScrollBars()** | immediate update of the window content when using a scrollbar |
| 13 | **SelectFolder()** | the Common File Dialog lets you add controls to it |
| 14 | **IsCheckboxStyle()** | checks style(code) if it’s a checkbox |
| 15 | **DropShadow()** | Drop Shadow On Borderless Window, (DWM STYLE) |
| 16 | **GetGuiClassStyle()** | returns the class style of a Autohotkey-Gui |
| 17 | **SetGuiClassStyle()** | sets the class style of a Autohotkey-Gui |
| 18 | **RandomString()** | builds a string with random char of specified length |
| 19 | **LV_SetSI()** | set icon for row “subItem” within Listview |



## ![Gem](assets/GemSmall.png) [February 16, 2019]: +37 =  614

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



## ![Gem](assets/GemSmall.png)[December 15, 2018]: +22 = 577

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



## ![Gem](assets/GemSmall.png) [September 30, 2018]: +140 = 555 functions

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



## ![Gem](assets/GemSmall.png) [July 15, 2018]: +79 = 415 functions

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
## ![Gem](assets/GemSmall.png) [June 13, 2018]: 326 functions

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
## ![Gem](assets/GemSmall.png) [June 10, 2018]: 316 functions

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
## ![Gem](assets/GemSmall.png) [June 02, 2018]: 306 functions

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
## ![Gem](assets/GemSmall.png) [May 28, 2018]: 293 functions

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
## ![Gem](assets/GemSmall.png) [May 22, 2018]: 253 functions

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs

+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized

+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging

+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 

+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12

+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.

+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm

+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

-----
## ![Gem](assets/GemSmall.png)[May 06, 2018]: 243 functions

- **getByControlName()**  - function uses DllCalls
- **listAccChildProperty()** - uses COM functionality
- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string
- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of 

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
| 042 | 01634 | **ScriptExist()** - *true oder false if Script is running or not* |
| 043 | 01656 | **GetStartupWindowState()** - *to check, if script exe was launched by windows's shortcut with MAXIMIZE* |
| 044 | 01705 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 045 | 02084 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 046 | 02116 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 047 | 02167 | **Gdip_FillRoundedRectangle()** |
| 048 | 02188 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 049 | 02266 | **CreateSurface()** - *creates a drawing GDI surface* |
| 050 | 02296 | **ShowSurface()** - *sub for CreateSurface* |
| 051 | 02302 | **HideSurface()** - *sub for CreateSurface* |
| 052 | 02306 | **WipeSurface()** - *sub for CreateSurface* |
| 053 | 02311 | **StartDraw()** - *sub for CreateSurface* |
| 054 | 02323 | **EndDraw()** - *sub for CreateSurface* |
| 055 | 02328 | **SetPen()** - *sub for CreateSurface* |
| 056 | 02345 | **DrawLine()** - *used DLLCall to draw a line* |
| 057 | 02352 | **DrawRectangle()** - *used DLLCall to draw a rectangle* |
| 058 | 02362 | **DrawRectangle()** - *this is for screenshots* |
| 059 | 02391 | **DrawFrameAroundControl()** - *paints a rectangle around a specified control* |
| 060 | 02459 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 061 | 02558 | **SetAlpha()** - *set alpha to a layered window* |
| 062 | 02565 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 063 | 02591 | **RotateAroundCenter()** - *GDIP rotate around center* |
| 064 | 02599 | **Screenshot()** - *screenshot function 1* |
| 065 | 02614 | **TakeScreenshot()** - *screenshot function 2* |
| 066 | 02642 | **CaptureWindow()** - *screenshot function 3* |
| 067 | 02672 | **CaptureScreen()** - *screenshot function 4 - orginally from CaptureScreen.ahk* |
| 068 | 02759 | **CaptureCursor()** - *sub for CaptureScreen() - this captures the cursor* |
| 069 | 02785 | **Zoomer()** - *sub for CaptureScreen() - zooms a HBitmap, depending function of CaptureScreen()* |
| 070 | 02803 | **Convert()** - *sub for CaptureScreen() - converts from one picture format to another one, depending on Gdip restriction only .bmp, .jpg, .png is possible* |
| 071 | 02869 | **SaveHBITMAPToFile()** - *sub for CaptureScreen() - saves a HBitmap to a file* |
| 072 | 02881 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 073 | 02911 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 074 | 02978 | **GetRange()** - *another good screen area selection function* |
| 075 | 03089 | **FloodFill()** - *filling an area using color banks* |
| 076 | 03138 | **CreateBMPGradient()** - *Horizontal/Vertical gradient* |
| 077 | 03162 | **BGR()** - *BGR() subfunction from CreateBMPGradient()* |
| 078 | 03170 | **CreatePatternBrushFrom()** - *as it says* |
| 079 | 03202 | **ResConImg()** - *Resize and convert images. png, bmp, jpg, tiff, or gif* |
| 080 | 03254 | **CreateCircleProgress()** - *very nice to see functions for a circle progress* |
| 081 | 03364 | **UpdateCircleProgress()** - *sub for CreateCircleProgress* |
| 082 | 03369 | **DestroyCircleProgress()** - *sub for CreateCircleProgress* |
| 083 | 03378 | **RGBrightnessToHex()** - *transform rbg (with brightness) values to hex* |
| 084 | 03383 | **GetHueColorFromFraction()** - *get hue color from fraction. example: h(0) is red, h(1/3) is green and h(2/3) is blue* |
| 085 | 03393 | **SaveHBITMAPToFile()** - *saves the hBitmap to a file* |
| 086 | 03403 | **DrawRotatePictureOnGraphics()** - *rotate a pBitmap* |
| 087 | 03420 | **CopyBitmapOnGraphic()** - *copy a pBitmap of a specific width and height to the Gdip graphics container (pGraphics)* |
| 088 | 03427 | **GDI_GrayscaleBitmap()** - *Converts GDI bitmap to 256 color GreyScale* |
| 089 | 03464 | **Convert_BlackWhite()** - *Convert exist imagefile to black&white , it uses machine code* |
| 090 | 03519 | **BlackWhite()** - *sub from Convert_BlackWhite* |
| 091 | 03529 | **getHBMinfo()** |
| 092 | 03537 | **CreateDIB()** - *a wonderfull function by SKAN to draw tiled backgrounds (like chess pattern) to a gui, it can also draw gradients* |
| 093 | 03590 | **GuiControlLoadImage()** - *scale down a picture to fit the given width and height of a picture control* |
| 094 | 03650 | **Gdip_ResizeBitmap()** - *returns resized bitmap* |
| 095 | 03696 | **Gdip_CropBitmap()** - *returns cropped bitmap. Specify how many pixels you want to crop (omit) from each side of bitmap rectangle* |
| 096 | 03733 | **GetBitmapSize()** - *Lexikos function to get the size of bitmap* |
| 097 | 03760 | **Gdip_BitmapReplaceColor()** - *using Mcode to replace a color with a specific variation* |
| 098 | 03807 | **Gdi_ExtFloodFill()** - *fills an area with the current brush* |
| 099 | 03861 | **Gdip_AlphaMask32v1()** - *32bit Gdip-AlphaMask with MCode - one of two builds* |
| 100 | 03908 | **Gdip_AlphaMask32v2()** - *32bit Gdip-AlphaMask with MCode  - second of two builds* |
| 101 | 03958 | **Gdip_AlphaMask64()** - *64bit Gdip-AlphaMask with MCode* |
| 102 | 03978 | **()** - *LTrim Join* |
| 103 | 04015 | **CircleCrop()** - *gdi circlecrop with MCode* |
| 104 | 04062 | **get_png_image_info()** - *Getting PNG image info* |
| 105 | 04146 | **byte_swap_32()** - *sub of get_png_image_info(), change endian-ness for 32-bit integer* |
| 106 | 04153 | **print_line()** - *sub of get_png_image_info(),  output line to STDOUT for debugging in my text editor (sublime)* |
| 107 | 04158 | **GetBitmapFromAnything()** - *Supports paths, icon handles and hBitmaps* |
| 108 | 04183 | **Image_TextBox()** - *Function to use Gdip to add text to image* |
| 109 | 04416 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 110 | 04486 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 111 | 04592 | **Popup()** - *Splashtext Gui* |
| 112 | 04616 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture* |
| 113 | 04654 | **SplitButton()** - *drop down button* |
| 114 | 04726 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 115 | 04774 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 116 | 04822 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 117 | 04868 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 118 | 04913 | **PassBox()** - *show a custom input box for a password* |
| 119 | 04958 | **CreateHotkeyWindow()** - *Hotkey Window* |
| 120 | 04994 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 121 | 05186 | **guiMsgBox()** - *GUI Message Box to allow selection* |
| 122 | 05218 | **URLPrefGui()** - *shimanov's workaround for displaying URLs in a gui* |
| 123 | 05326 | **TaskDialog()** - *a Task Dialog is a new kind of dialogbox that has been added in Windows Vista and later. They are similar to message boxes, but with much more power.* |
| 124 | 05356 | **TaskDialogDirect()** - *part of TaskDialog ?* |
| 125 | 05397 | **TaskDialogMsgBox()** - *part of TaskDialog ?* |
| 126 | 05437 | **TaskDialogToUnicode()** - *part of TaskDialog ?* |
| 127 | 05445 | **TaskDialogCallback()** - *part of TaskDialog ?* |
| 128 | 05465 | **TT_Console()** - *Use Tooltip as a User Interface it returns the key which has been pressed* |
| 129 | 05524 | **ToolTipEx()** - *Display ToolTips with custom fonts and colors* |
| 130 | 05734 | **SafeInput()** - *makes sure the same window stays active after showing the InputBox. Otherwise you might get the text pasted into another window unexpectedly.* |
| 131 | 05753 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 132 | 05766 | **WinFadeToggle()** - *smooth fading in out a window* |
| 133 | 05828 | **winfade()** - *another winfade function* |
| 134 | 05845 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 135 | 05851 | **FrameShadow()** - *FrameShadow1* |
| 136 | 05862 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 137 | 05890 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 138 | 05933 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar* |
| 139 | 05947 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 140 | 05977 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 141 | 05998 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 142 | 06064 | **SetTaskbarProgress()** - *modified function* |
| 143 | 06123 | **InVar()** - *sub of SetTaskbarProgress, parsing list search* |
| 144 | 06130 | **IsWindow()** - *sub of SetTaskbarProgress, different approach to IsWindow in gui + window - get/find section* |
| 145 | 06138 | **WinSetPlacement()** - *Sets window position using workspace coordinates (-> no taskbar)* |
| 146 | 06167 | **AttachToolWindow()** - *Attaches a window as a tool window to another window from a different process.* |
| 147 | 06187 | **DeAttachToolWindow()** - *removes the attached ToolWindow* |
| 148 | 06209 | **Control_SetTextAndResize()** - *set a new text to a control and resize depending on textwidth and -height* |
| 149 | 06234 | **DropShadow()** - *Drop Shadow On Borderless Window, (DWM STYLE)* |
| 150 | 06267 | **GetGuiClassStyle()** - *returns the class style of a Autohotkey-Gui* |
| 151 | 06278 | **SetGuiClassStyle()** - *sets the class style of a Autohotkey-Gui* |
| 152 | 06295 | **GetComboBoxChoice()** - *Combobox function* |
| 153 | 06316 | **Edit_Standard_Params()** - *these are helper functions to use with edit controls* |
| 154 | 06326 | **Edit_TextIsSelected()** - *returns bool if text is selected in an edit control* |
| 155 | 06333 | **Edit_GetSelection()** - *get selected text in an edit control* |
| 156 | 06345 | **Edit_Select()** - *selects text inside in an edit control* |
| 157 | 06357 | **Edit_SelectLine()** - *selects one line in an edit control* |
| 158 | 06389 | **Edit_DeleteLine()** - *delete one line in an edit control* |
| 159 | 06405 | **Edit_VCenter()** - *Vertically Align Text for edit controls* |
| 160 | 06440 | **IL_LoadIcon()** - *no description* |
| 161 | 06448 | **IL_GuiButtonIcon()** - *no description* |
| 162 | 06476 | **LB_AdjustItemHeight()** - *Listbox function* |
| 163 | 06482 | **LB_GetItemHeight()** - *Listbox function* |
| 164 | 06489 | **LB_SetItemHeight()** - *Listbox function* |
| 165 | 06502 | **LV_GetCount()** - *get current count of notes in from any listview* |
| 166 | 06512 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 167 | 06579 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 168 | 06601 | **LV_GetItemText()** - *read the text from an item in a ListView* |
| 169 | 06640 | **LV_GetText()** - *get text by item and subitem from a Listview* |
| 170 | 06729 | **ExtractInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 171 | 06753 | **InsertInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 172 | 06767 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 173 | 06813 | **LV_MoveRow()** - *moves a listview row up or down* |
| 174 | 06833 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 175 | 06885 | **LV_Find()** - *I think it's usefull to find an item position a listview* |
| 176 | 06901 | **LV_GetSelectedText()** - *Returns text from selected rows in ListView (in a user friendly way IMO.)* |
| 177 | 06952 | **LV_Notification()** - *easy function for showing notifications by hovering over a listview* |
| 178 | 06977 | **LV_IsChecked()** - *alternate method to find out if a particular row number is checked* |
| 179 | 06984 | **LV_HeaderFontSet()** - *sets a different font to a Listview header (it's need CreateFont() function)* |
| 180 | 07078 | **LV_SetCheckState()** - *check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control* |
| 181 | 07109 | **LV_SetItemState()** - *with this function you can set all avaible states to a listview item* |
| 182 | 07147 | **NumPut()** - *mask* |
| 183 | 07148 | **NumPut()** - *iItem* |
| 184 | 07149 | **NumPut()** - *state* |
| 185 | 07150 | **NumPut()** - *stateMask* |
| 186 | 07157 | **LV_SubitemHitTest()** - *get's clicked column in listview* |
| 187 | 07211 | **LV_EX_FindString()** - *find an item in any listview , function works with ANSI and UNICODE (tested)* |
| 188 | 07225 | **LV_RemoveSelBorder()** - *remove the listview's selection border* |
| 189 | 07240 | **LV_SetExplorerTheme()** - *set 'Explorer' theme for ListViews & TreeViews on Vista+* |
| 190 | 07251 | **LV_Update()** - *update one listview item* |
| 191 | 07255 | **LV_RedrawItem()** - *this one redraws on listview item* |
| 192 | 07262 | **LV_SetExStyle()** - *set / remove / alternate extended styles to the listview control* |
| 193 | 07282 | **LV_GetExStyle()** - *get / remove / alternate extended styles to the listview control* |
| 194 | 07286 | **LV_IsItemVisible()** - *determines if a listview item is visible* |
| 195 | 07290 | **LV_SetIconSpacing()** - *Sets the space between icons in the icon view* |
| 196 | 07303 | **LV_GetIconSpacing()** - *Get the space between icons in the icon view* |
| 197 | 07315 | **LV_GetItemPos()** - *obtains the position of an item* |
| 198 | 07334 | **LV_SetItemPos()** - *set the position of an item* |
| 199 | 07352 | **LV_MouseGetCellPos()** - *returns the number (row, col) of a cell in a listview at present mouseposition* |
| 200 | 07392 | **LV_GetColOrderLocal()** - *returns the order of listview columns for a local listview* |
| 201 | 07430 | **LV_GetColOrder()** - *returns the order of listview columns for a listview* |
| 202 | 07489 | **LV_SetColOrderLocal()** - *pass listview hWnd (not listview header hWnd)* |
| 203 | 07502 | **LV_SetColOrder()** - *pass listview hWnd (not listview header hWnd)* |
| 204 | 07554 | **LV_GetCheckedItems()** - *Returns a list of checked items from a standard ListView Control* |
| 205 | 07567 | **LV_ClickRow()** - *simulates a left mousebutton click on a specific row in a listview* |
| 206 | 07580 | **LV_HeaderFontSet()** - *sets font for listview headers* |
| 207 | 07673 | **LV_SetSI()** - *set icon for row "subItem" within Listview* |
| 208 | 07733 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 209 | 07741 | **TabCtrl_GetItemText()** - *returns text of a tab* |
| 210 | 07787 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 211 | 07801 | **TV_Load()** - *loads TreeView items from an XML string* |
| 212 | 07983 | **TV_GetItemText()** - *retrieves the text/name of the specified treeview node +* |
| 213 | 08035 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 214 | 08053 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 215 | 08088 | **UpdateScrollBars()** - *immediate update of the window content when using a scrollbar* |
| 216 | 08282 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 217 | 08293 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 218 | 08309 | **ControlExists()** - *true/false for ControlClass* |
| 219 | 08321 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 220 | 08353 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 221 | 08382 | **GetOtherControl()** |
| 222 | 08388 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 223 | 08411 | **Control_GetClassNN()** - *no-loop* |
| 224 | 08423 | **ControlGetClassNN()** - *with loop* |
| 225 | 08437 | **ControlGetClassNN()** - *different method is used here in compare to the already existing functions in this collection* |
| 226 | 08451 | **GetClassName()** - *returns HWND's class name without its instance number, e.g. "Edit" or "SysListView32"* |
| 227 | 08458 | **Control_GetFont()** - *get the currently used font of a control* |
| 228 | 08480 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 229 | 08485 | **getControlNameByHwnd()** - *self explaining* |
| 230 | 08503 | **getByControlName()** - *search by control name return hwnd* |
| 231 | 08537 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 232 | 08588 | **IsControlUnderCursor()** - *Checks if a specific control is under the cursor and returns its ClassNN if it is.* |
| 233 | 08595 | **GetFocusedControl()** - *get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available* |
| 234 | 08630 | **ControlGetTextExt()** - *3 different variants are tried to determine the text of a control* |
| 235 | 08657 | **getControlInfo()** - *get width and heights of controls* |
| 236 | 08670 | **FocusedControl()** - *returns the HWND of the currently focused control, or 0 if there was a problem* |
| 237 | 08679 | **Control_GetFont()** - *retrieves the used font of a control* |
| 238 | 08691 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 239 | 08721 | **GetExtraStyle()** - *get Extra Styles from a control* |
| 240 | 08742 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 241 | 08800 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 242 | 08877 | **GetHeaderInfo()** - *Returns an object containing width and text for each item of a remote header control* |
| 243 | 08939 | **WinSaveCheckboxes()** - *save the status of checkboxes in other apps* |
| 244 | 09023 | **GetButtonType()** - *uses the style of a button to get it's name* |
| 245 | 09100 | **HWNDToClassNN()** - *a different approach to get classNN from handle* |
| 246 | 09121 | **IsCheckboxStyle()** - *checks style(code) if it's a checkbox* |
| 247 | 09171 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 248 | 09181 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 249 | 09354 | **GetParent()** - *get parent win handle of a window* |
| 250 | 09360 | **GetWindow()** - *DllCall wrapper for GetWindow function* |
| 251 | 09366 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 252 | 09372 | **IsWindowVisible()** - *self explaining* |
| 253 | 09376 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 254 | 09383 | **IsClosed()** - *AHK function (WinWaitClose) wrapper* |
| 255 | 09390 | **GetClassLong()** |
| 256 | 09397 | **GetWindowLong()** |
| 257 | 09404 | **GetClassStyles()** |
| 258 | 09431 | **GetTabOrderIndex()** |
| 259 | 09458 | **GetCursor()** |
| 260 | 09465 | **GetClientCoords()** |
| 261 | 09475 | **GetClientSize()** - *get size of window without border* |
| 262 | 09483 | **GetWindowCoords()** |
| 263 | 09490 | **GetWindowPos()** |
| 264 | 09500 | **GetWindowPlacement()** - *Gets window position using workspace coordinates (-> no taskbar), returns an object* |
| 265 | 09514 | **GetWindowInfo()** - *returns an Key:Val Object with the most informations about a window (Pos, Client Size, Style, ExStyle, Border size...)* |
| 266 | 09536 | **GetOwner()** |
| 267 | 09540 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 268 | 09596 | **FindWindow()** - *Finds the first window matching specific criterias.* |
| 269 | 09626 | **ShowWindow()** - *uses a DllCall to show a window* |
| 270 | 09630 | **IsWindow()** - *wrapper for IsWindow DllCall* |
| 271 | 09634 | **GetClassName()** - *wrapper for AHK WinGetClass function* |
| 272 | 09639 | **FindChildWindow()** - *finds childWindow Hwnds of the parent window* |
| 273 | 09703 | **EnumChildWindow()** - *sub function of FindChildWindow* |
| 274 | 09720 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 275 | 09734 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 276 | 09742 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 277 | 09746 | **GetFreeGuiNum()** - *gets a free gui number.* |
| 278 | 09762 | **IsWindowUnderCursor()** - *Checks if a specific window is under the cursor.* |
| 279 | 09770 | **GetCenterCoords()** - *?center a gui between 2 monitors?* |
| 280 | 09791 | **RMApp_NCHITTEST()** - *Determines what part of a window the mouse is currently over* |
| 281 | 09805 | **GetCPA_file_name()** - *retrieves Control Panel applet icon* |
| 282 | 09837 | **WinGetClientPos()** - *gives back the coordinates of client area inside a gui/window - with DpiFactor correction* |
| 283 | 09875 | **CheckWindowStatus()** - *check's if a window is responding or not responding (hung or crashed) -* |
| 284 | 09910 | **GetWindowOrder()** - *determines the window order for a given (parent-)hwnd* |
| 285 | 09945 | **EnumWindows()** - *Get a list with all the top-level windows on the screen or controls in the window* |
| 286 | 09999 | **WinEnum()** - *wrapper for Enum(Child)Windows from cocobelgica. a different solution to that one I collected before* |
| 287 | 10061 | **WinWaitProgress()** - *Waits for the progress bar on a window to reach (>=) a given value (a Lexikos function)* |
| 288 | 10111 | **ChooseColor()** - *what is this for?* |
| 289 | 10132 | **GetWindowIcon()** |
| 290 | 10212 | **GetStatusBarText()** |
| 291 | 10228 | **GetAncestor()** |
| 292 | 10233 | **MinMaxInfo()** |
| 293 | 10246 | **GetMouseTaskButton()** - *Gets the index+1 of the taskbar button which the mouse is hovering over* |
| 294 | 10351 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 295 | 10368 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 296 | 10389 | **ControlClick2()** - *ControlClick Double Click* |
| 297 | 10399 | **ControlFromPoint()** - *returns the hwnd of a control at a specific point on the screen* |
| 298 | 10439 | **EnumChildFindPoint()** - *this function is required by ControlFromPoint* |
| 299 | 10478 | **ControlDoubleClick()** - *simulates a double click on a control with left/middle or right mousebutton* |
| 300 | 10498 | **WinWaitForMinimized()** - *waits until the window is minimized* |
| 301 | 10516 | **CenterWindow()** - *Given a the window's width and height, calculates where to position its upper-left corner so that it is centered EVEN IF the task bar is on the left side or top side of the window* |
| 302 | 10535 | **GuiCenterButtons()** - *Center and resize a row of buttons automatically* |
| 303 | 10587 | **CenterControl()** - *Centers one control* |
| 304 | 10638 | **SetWindowIcon()** |
| 305 | 10644 | **SetWindowPos()** |
| 306 | 10648 | **TryKillWin()** |
| 307 | 10666 | **Win32_SendMessage()** - *Closing a window through sendmessage command* |
| 308 | 10678 | **Win32_TaskKill()** |
| 309 | 10687 | **Win32_Terminate()** |
| 310 | 10698 | **TabActivate()** |
| 311 | 10706 | **FocuslessScroll()** |
| 312 | 10807 | **FocuslessScrollHorizontal()** |
| 313 | 10841 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 314 | 10863 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 315 | 10883 | **GUI_AutoHide()** - *Autohide the GUI function* |
| 316 | 11150 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 317 | 11244 | **AddToolTip()** - *Add/Update tooltips to GUI controls.* |
| 318 | 11377 | **NumPut()** - *cbSize* |
| 319 | 11378 | **NumPut()** - *uFlags* |
| 320 | 11379 | **NumPut()** - *hwnd* |
| 321 | 11380 | **NumPut()** - *uId* |
| 322 | 11430 | **HelpToolTips()** - *To show defined GUI control help tooltips on hover.* |
| 323 | 11461 | **DisableFadeEffect()** - *disabling fade effect on gui animations* |
| 324 | 11485 | **SetWindowTransistionDisable()** - *disabling fade effect only the window of choice* |
| 325 | 11519 | **DisableMinimizeAnim()** - *disables or restores original minimize anim setting* |
| 326 | 11539 | **DisableCloseButton()** - *to disable/grey out the close button* |
| 327 | 11548 | **AutoCloseBlockingWindows()** - *close all open popup (childwindows), without knowing their names, of a parent window* |
| 328 | 11637 | **WinActivateEx()** - *Activate a Window, with extra Error Checking and More Features* |
| 329 | 11674 | **ClickOK()** - *function that search for any button in a window that might be an 'Ok' button to close a window dialog* |
| 330 | 11740 | **ControlSelectTab()** - *SendMessage wrapper to select the current tab on a MS Tab Control.* |
| 331 | 11759 | **SetParentByClass()** - *set parent window by using its window class* |
| 332 | 11767 | **MoveTogether()** - *move 2 windows together - using DllCall to DeferWindowPos* |
| 333 | 11853 | **WinWaitCreated()** - *Wait for a window to be created, returns 0 on timeout and ahk_id otherwise* |
| 334 | 11887 | **closeContextMenu()** - *a smart way to close a context menu* |
| 335 | 11904 | **SetWindowTheme()** - *set Windows UI Theme by window handle* |
| 336 | 11920 | **HideFocusBorder()** - *hides the focus border for the given GUI control or GUI and all of its children* |
| 337 | 11964 | **unmovable()** - *makes Gui unmovable* |
| 338 | 11975 | **movable()** - *makes Gui movable* |
| 339 | 11982 | **GuiDisableMove()** - *to fix a gui/window to its coordinates* |
| 340 | 11988 | **WinInsertAfter()** - *insert a window after a specific window handle* |
| 341 | 12005 | **CenterWindow()** - *center a window or set position optional by using Top, Left, Right, Bottom or a combination of it* |
| 342 | 12048 | **SetHoverText()** - *change control's text on mouseover* |
| 343 | 12129 | **SetTextAndResize()** - *resizes a control to adapt to updated values* |
| 344 | 12195 | **GetMenu()** - *returns hMenu handle* |
| 345 | 12200 | **GetSubMenu()** |
| 346 | 12204 | **GetMenuItemCount()** |
| 347 | 12208 | **GetMenuItemID()** |
| 348 | 12212 | **GetMenuString()** |
| 349 | 12227 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 350 | 12236 | **MenuGetAll_sub()** - *described above* |
| 351 | 12259 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 352 | 12297 | **GetContextMenuID()** - *returns the ID of a menu entry* |
| 353 | 12320 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 354 | 12379 | **Menu_AssignBitmap()** - *assign bitmap to any item in any AHk menu* |
| 355 | 12539 | **InvokeVerb()** - *executes the context menu item of the given path* |
| 356 | 12617 | **Menu_Show()** - *its an alternative to Menu, Show, which can display menu without blocking monitored messages* |
| 357 | 12647 | **CreateMenu()** - *creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 358 | 12778 | **CreateDDMenu()** - *Creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 359 | 12933 | **ExtractIcon()** - *extract icon from a resource file* |
| 360 | 13013 | **GetIconSize()** - *determines the size of the icon (Lexikos function)* |
| 361 | 13049 | **Gdip_GetHICONDimensions()** - *get icon dimensions* |
| 362 | 13088 | **SetTrayIcon()** - *sets a hex coded icon to as try icon* |
| 363 | 13130 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 364 | 13207 | **Function_Eject()** - *ejects a drive medium* |
| 365 | 13239 | **FileGetDetail()** - *Get specific file property by index* |
| 366 | 13250 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 367 | 13266 | **DirExist()** - *Checks if a directory exists* |
| 368 | 13270 | **GetDetails()** - *Create an array of possible file properties* |
| 369 | 13284 | **Start()** - *Start programs or scripts easier* |
| 370 | 13303 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 371 | 13311 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 372 | 13460 | **WatchDirectory()** - *it's different from above not tested* |
| 373 | 13657 | **GetFileIcon()** |
| 374 | 13670 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 375 | 13684 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 376 | 13697 | **DestroyIcon()** |
| 377 | 13701 | **listfunc()** - *list all functions inside ahk scripts* |
| 378 | 13717 | **CreateOpenWithMenu()** - *creates an 'open with' menu for the passed file.* |
| 379 | 13869 | **FileCount()** - *count matching files in the working directory* |
| 380 | 13877 | **GetImageTypeW()** - *Identify the image type (UniCode)* |
| 381 | 13921 | **FileWriteLine()** - *to write data at specified line in a file.* |
| 382 | 13931 | **FileMD5()** - *file MD5 hashing* |
| 383 | 13947 | **FileCRC32()** - *computes and returns CRC32 hash for a File passed as parameter* |
| 384 | 13965 | **FindFreeFileName()** - *Finds a non-existing filename for Filepath by appending a number in brackets to the name* |
| 385 | 13978 | **CountFilesR()** - *count files recursive in specific folder (uses COM method)* |
| 386 | 13987 | **CountFiles()** - *count files in specific folder (uses COM method)* |
| 387 | 13993 | **PathInfo()** - *splits a given path to return as object* |
| 388 | 13998 | **DriveSpace()** - *retrieves the DriveSpace* |
| 389 | 14006 | **GetBinaryType()** - *determines the bit architecture of an executable program* |
| 390 | 14016 | **GetFileAttributes()** - *get attributes of a file or folder* |
| 391 | 14055 | **SetFileTime()** - *to set the time* |
| 392 | 14064 | **SetFileAttributes()** - *set attributes of a file or folder* |
| 393 | 14102 | **FileSetSecurity()** - *set security for the file / folder* |
| 394 | 14156 | **FileSetOwner()** - *set the owner to file / directory* |
| 395 | 14176 | **FileGetOwner()** - *get the owner to file / directory* |
| 396 | 14193 | **GetFileFormat()** - *retreaves the codepage format of a file* |
| 397 | 14213 | **HashFile()** - *calculate hashes (MD2,MD5,SH1,SHA256, SHA384, SHA512) from file* |
| 398 | 14324 | **PathCombine()** - *combine the 2 routes provided in a single absolute path* |
| 399 | 14348 | **GetParentDir()** - *small RegEx function to get parent dir from a given string* |
| 400 | 14352 | **DirGetParent()** - *returns a string containing parent dir, it's possible to set the level of parent dir* |
| 401 | 14362 | **SelectFolder()** - *the Common File Dialog lets you add controls to it* |
| 402 | 14461 | **CreateFont()** - *creates font in memory which can be used with any API function accepting font handles* |
| 403 | 14514 | **GetHFONT()** - *gets a handle to a font used in a AHK gui for example* |
| 404 | 14527 | **MsgBoxFont()** - *style your MsgBox with with your prefered font* |
| 405 | 14541 | **GetFontProperties()** - *to get the current font's width and height* |
| 406 | 14587 | **FontEnum()** - *enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure* |
| 407 | 14627 | **GetFontTextDimension()** - *calculate the height and width of the text in the specified font* |
| 408 | 14682 | **FontClone()** - *backup hFont in memory for further processing* |
| 409 | 14724 | **GuiDefaultFont()** - *returns the default Fontname & Fontsize* |
| 410 | 14760 | **StrGetDimAvgCharWidth()** - *average width of a character in pixels* |
| 411 | 14803 | **CreateFont()** - *creates HFont for use with GDI* |
| 412 | 14834 | **MeasureText()** - *Measures the single-line width and height of the passed text* |
| 413 | 14890 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 414 | 15124 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 415 | 15164 | **HDrop()** - *Drop files to another app* |
| 416 | 15197 | **WM_MOVE()** - *UpdateLayeredWindow* |
| 417 | 15210 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 418 | 15220 | **WM_WINDOWPOSCHANGING()** - *second examples of handling a WM_WINDOWPOSCHANGING* |
| 419 | 15238 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 420 | 15242 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 421 | 15281 | **ObjectNameChange()** - *titlebar hook to detect when title changes, (Lexikos' code)* |
| 422 | 15330 | **DownloadFile()** |
| 423 | 15353 | **NewLinkMsg()** |
| 424 | 15369 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 425 | 15379 | **GetSourceURL()** |
| 426 | 15391 | **DNS_QueryName()** |
| 427 | 15416 | **GetHTMLFragment()** |
| 428 | 15436 | **ScrubFragmentIdents()** |
| 429 | 15447 | **EnumClipFormats()** |
| 430 | 15456 | **GetClipFormatNames()** |
| 431 | 15475 | **GoogleTranslate()** |
| 432 | 15494 | **getText()** - *get text from html* |
| 433 | 15509 | **getHtmlById()** |
| 434 | 15514 | **getTextById()** |
| 435 | 15518 | **getHtmlByTagName()** |
| 436 | 15526 | **getTextByTagName()** |
| 437 | 15534 | **CreateGist()** |
| 438 | 15556 | **GetAllResponseHeaders()** - *gets the values of all HTTP headers* |
| 439 | 15625 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 440 | 15723 | **ExtractTableData()** - *extracts tables from HTML files* |
| 441 | 15846 | **IsConnected()** - *Returns true if there is an available internet connection* |
| 442 | 15850 | **HostToIp()** - *gets the IP address for the given host directly using the WinSock 2.0 dll, without using temp files or third party utilities* |
| 443 | 15953 | **LocalIps()** - *with small changes to HostToIP() this can be used to retrieve all LocalIP's* |
| 444 | 16022 | **GetAdaptersInfo()** - *GetAdaptersAddresses function & IP_ADAPTER_ADDRESSES structure* |
| 445 | 16077 | **DNSQuery()** - *retrieve IP adresses or host/domain names from DNS* |
| 446 | 16195 | **Min()** - *returns the smaller of 2 numbers* |
| 447 | 16199 | **Max()** - *determines the larger number* |
| 448 | 16203 | **Mean()** - *returns Average values in comma delimited list* |
| 449 | 16217 | **Median()** - *returns Median in a set of numbers from a list* |
| 450 | 16244 | **Mode()** - *returns the mode from a list of numbers* |
| 451 | 16273 | **Dec2Base()** - *Base to Decimal and* |
| 452 | 16279 | **Base2Dec()** - *Decimal to Base conversion* |
| 453 | 16285 | **HexToFloat()** - *Hexadecimal to Float conversion* |
| 454 | 16289 | **FloatToHex()** - *Float to Hexadecimal conversion* |
| 455 | 16299 | **CalculateDistance()** - *calculates the distance between two points in a 2D-Space* |
| 456 | 16303 | **IsInRange()** - *shows if a second variable is in range* |
| 457 | 16314 | **FormatFileSize()** - *Formats a file size in bytes to a human-readable size string* |
| 458 | 16322 | **Color_RGBtoHSV()** - *converts beetween color two color spaces: RGB -> HSV* |
| 459 | 16352 | **Color_HSVtoRGB()** - *converts beetween color two color spaces: HSV -> RGB* |
| 460 | 16423 | **JEE_HexToBinData()** - *hexadecimal to binary* |
| 461 | 16433 | **JEE_BinDataToHex()** - *binary to hexadecimal* |
| 462 | 16444 | **JEE_BinDataToHex2()** - *binary to hexadecimal2* |
| 463 | 16452 | **RadianToDegree()** - *convert radian (rad) to degree* |
| 464 | 16465 | **DegreeToRadian()** - *convert degree to radian (rad)* |
| 465 | 16479 | **RGBToARGB()** - *convert RGB to ARGB* |
| 466 | 16506 | **ARGBToRGB()** - *convert ARGB to RGB.* |
| 467 | 16525 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB .... (for AHK_V1)* |
| 468 | 16555 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB ....(for AHK_V2)* |
| 469 | 16596 | **ObjMerge()** - *merge two objects* |
| 470 | 16611 | **evalRPN()** - *Parsing/RPN calculator algorithm* |
| 471 | 16649 | **StackShow()** |
| 472 | 16656 | **ExploreObj()** - *print object function* |
| 473 | 16712 | **KeyValueObjectFromLists()** - *merge two lists into one key-value object, useful for 2 two lists you retreave from WinGet* |
| 474 | 16779 | **GetCallStack()** - *retrieves the current callstack* |
| 475 | 16853 | **Traceback()** - *get stack trace* |
| 476 | 16943 | **Sort2DArray()** - *a two dimensional TDArray* |
| 477 | 16964 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 478 | 16997 | **QuickSort()** - *Sort array using QuickSort algorithm* |
| 479 | 17263 | **sortArray()** - *sorts an array (another way)* |
| 480 | 17344 | **StringMD5()** - *String MD5 Hashing* |
| 481 | 17354 | **uriEncode()** - *a function to escape characters like & for use in URLs.* |
| 482 | 17369 | **Ansi2Unicode()** - *easy convertion from Ansi to Unicode, you can set prefered codepage* |
| 483 | 17389 | **Unicode2Ansi()** - *easy convertion from Unicode to Ansi, you can set prefered codepage* |
| 484 | 17413 | **Ansi2Oem()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 485 | 17419 | **Oem2Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 486 | 17425 | **Ansi2UTF8()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 487 | 17431 | **UTF82Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 488 | 17437 | **CRC32()** - *CRC32 function, uses MCode* |
| 489 | 17452 | **ParseJsonStrToArr()** - *Parse Json string to an array* |
| 490 | 17478 | **parseJSON()** - *Parse Json string to an object* |
| 491 | 17499 | **GetNestedTag()** |
| 492 | 17529 | **GetHTMLbyID()** - *uses COM* |
| 493 | 17544 | **GetHTMLbyTag()** - *uses COM* |
| 494 | 17559 | **GetXmlElement()** - *RegEx function* |
| 495 | 17577 | **sXMLget()** - *simple solution to get information out of xml and html* |
| 496 | 17595 | **cleanlines()** - *removes all empty lines* |
| 497 | 17608 | **cleancolon()** - *what for? removes on ':' at beginning of a string* |
| 498 | 17618 | **cleanspace()** - *removes all Space chars* |
| 499 | 17631 | **SplitLine()** - *split string to key and value* |
| 500 | 17641 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 501 | 17649 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 502 | 17656 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 503 | 17681 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 504 | 17716 | **StringM()** - *String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)* |
| 505 | 17756 | **StrCount()** - *a very handy function to count a needle in a Haystack* |
| 506 | 17763 | **SuperInstr()** - *Returns min/max position for a | separated values of Needle(s)* |
| 507 | 17792 | **LineDelete()** - *deletes a specific line or a range of lines from a variable containing one or more lines of text. No use of any loop!* |
| 508 | 17868 | **GetWordsNumbered()** - *gives back an array of words from a string, you can specify the position of the words you want to keep* |
| 509 | 17900 | **AddTrailingBackslash()** - *adds a backslash to the beginning of a string if there is none* |
| 510 | 17908 | **CheckQuotes()** |
| 511 | 17917 | **ReplaceForbiddenChars()** - *hopefully working, not tested function, it uses RegExReplace* |
| 512 | 17929 | **WrapText()** - *basic function to wrap a text-string to a given length* |
| 513 | 17967 | **ExtractFuncTOuserAHK()** - *extract user function and helps to write it to userAhk.api* |
| 514 | 18088 | **PdfToText()** - *copies a selected PDF file to memory - it needs xpdf - pdftotext.exe* |
| 515 | 18115 | **PdfPageCounter()** - *counts pages of a pdffile (works with 95% of pdf files)* |
| 516 | 18131 | **PasteWithIndent()** - *paste string to an editor with your prefered indent key* |
| 517 | 18147 | **Ask_and_SetbackFocus()** - *by opening a msgbox you lost focus and caret pos in any editor - this func will restore the previous positions of the caret* |
| 518 | 18195 | **CleanLine()** - *Return a line with leading and trailing spaces removed, and tabs converted to spaces* |
| 519 | 18217 | **StrTrim()** - *Remove all leading and trailing whitespace including tabs, spaces, CR and LF* |
| 520 | 18238 | **StrDiff()** - *SIFT3 : Super Fast and Accurate string distance algorithm* |
| 521 | 18306 | **PrintArr()** - *show values of an array in a listview gui for debugging* |
| 522 | 18348 | **List2Array()** - *function uses StrSplit () to return an array* |
| 523 | 18352 | **Array_Gui()** - *shows your array as an interactive TreeView* |
| 524 | 18414 | **RandomString()** - *builds a string with random char of specified length* |
| 525 | 18452 | **DelaySend()** - *Send keystrokes delayed* |
| 526 | 18498 | **SetLayout()** - *set a keyboard layout* |
| 527 | 18503 | **GetAllInputChars()** - *Returns a string with input characters* |
| 528 | 18513 | **ReleaseModifiers()** - *helps to solve the Hotkey stuck problem* |
| 529 | 18560 | **isaKeyPhysicallyDown()** - *belongs to ReleaseModifiers() function* |
| 530 | 18573 | **GetText()** - *copies the selected text to a variable while preserving the clipboard.(Ctrl+C method)* |
| 531 | 18590 | **PutText()** - *Pastes text from a variable while preserving the clipboard. (Ctrl+v method)* |
| 532 | 18602 | **Hotkeys()** - *a handy function to show all used hotkeys in script* |
| 533 | 18653 | **BlockKeyboard()** - *block keyboard, and unblock it through usage of keyboard* |
| 534 | 18705 | **RapidHotkey()** - *Using this function you can send keystrokes or launch a Label by pressing a key several times.* |
| 535 | 18853 | **hk()** - *Disable all keyboard buttons* |
| 536 | 18949 | **ShowTrayBalloon()** |
| 537 | 18975 | **ColoredTooltip()** - *show a tooltip for a given time with a custom color in rgb format (fore and background is supported). This function shows how to obtain the hWnd of the tooltip.* |
| 538 | 19022 | **AddToolTip()** - *very easy to use function to add a tooltip to a control* |
| 539 | 19293 | **AddToolTip()** - *add ToolTips to controls - Advanced ToolTip features + Unicode* |
| 540 | 19888 | **AddToolTip()** - *just a simple add on to allow tooltips to be added to controls without having to monitor the wm_mousemove messages* |
| 541 | 19959 | **AddToolTip()** - *this is a function from jballi -* |
| 542 | 20091 | **NumPut()** - *cbSize* |
| 543 | 20092 | **NumPut()** - *uFlags* |
| 544 | 20093 | **NumPut()** - *hwnd* |
| 545 | 20094 | **NumPut()** - *uId* |
| 546 | 20152 | **CreateNamedPipe()** - *creates an instance of a named pipe and returns a handle for subsequent pipe operations* |
| 547 | 20157 | **RestoreCursors()** - *for normal cursor at GUI* |
| 548 | 20162 | **SetSystemCursor()** - *enables an application to customize the system cursors by using a file or by using the system cursor* |
| 549 | 20243 | **SystemCursor()** - *hiding mouse cursor* |
| 550 | 20282 | **ToggleSystemCursor()** - *choose a cursor from system cursor list* |
| 551 | 20361 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 552 | 20398 | **GlobalVarsScript()** |
| 553 | 20422 | **patternScan()** - *scan for a pattern in memory* |
| 554 | 20521 | **scanInBuf()** - *scan for a pattern in memory buffer* |
| 555 | 20559 | **hexToBinaryBuffer()** |
| 556 | 20582 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines (for ansi- and unicode)* |
| 557 | 20675 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 558 | 20748 | **KillProcess()** - *uses DllCalls to end a process* |
| 559 | 20781 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 560 | 20826 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 561 | 20841 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 562 | 20875 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 563 | 20909 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 564 | 20964 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 565 | 21029 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 566 | 21108 | **TimedFunction()** - *SetTimer functionality for functions* |
| 567 | 21135 | **ListGlobalVars()** - *ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string* |
| 568 | 21185 | **TaskList()** - *list all running tasks (no use of COM)* |
| 569 | 21236 | **MouseDpi()** - *Change the current dpi setting of the mouse* |
| 570 | 21256 | **SendToAHK()** - *Sends strings by using a hidden gui between AHK scripts* |
| 571 | 21285 | **ReceiveFromAHK()** - *Receiving strings from SendToAHK* |
| 572 | 21314 | **GetUIntByAddress()** - *get UInt direct from memory. I found this functions only within one script* |
| 573 | 21328 | **SetUIntByAddress()** - *write UInt direct to memory* |
| 574 | 21343 | **SetRestrictedDacl()** - *run this in your script to hide it from Task Manager* |
| 575 | 21430 | **getActiveProcessName()** - *this function finds the process to the 'ForegroundWindow'* |
| 576 | 21445 | **enumChildCallback()** - *i think this retreave's the child process ID for a known gui hwnd and the main process ID* |
| 577 | 21452 | **GetDllBase()** |
| 578 | 21474 | **getProcBaseFromModules()** |
| 579 | 21531 | **InjectDll()** - *injects a dll to a running process (ahkdll??)* |
| 580 | 21556 | **getProcessBaseAddress()** - *gives a pointer to the base address of a process for further memory reading* |
| 581 | 21572 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 582 | 21663 | **ReadProcessMemory()** - *reads data from a memory area in a given process.* |
| 583 | 21687 | **WriteProcessMemory()** - *writes data to a memory area in a specified process. the entire area to be written must be accessible or the operation will fail* |
| 584 | 21706 | **CopyMemory()** - *Copy a block of memory from one place to another* |
| 585 | 21716 | **MoveMemory()** - *moves a block memory from one place to another* |
| 586 | 21724 | **FillMemory()** - *fills a block of memory with the specified value* |
| 587 | 21729 | **ZeroMemory()** - *fills a memory block with zeros* |
| 588 | 21733 | **CompareMemory()** - *compare two memory blocks* |
| 589 | 21750 | **VirtualAlloc()** - *changes the state of a region of memory within the virtual address space of a specified process. the memory is assigned to zero.AtEOF* |
| 590 | 21794 | **VirtualFree()** - *release a region of pages within the virtual address space of the specified process* |
| 591 | 21808 | **ReduceMem()** - *reduces usage of memory from calling script* |
| 592 | 21829 | **GlobalLock()** - *memory management functions* |
| 593 | 21847 | **LocalFree()** - *free a locked memory object* |
| 594 | 21854 | **CreateStreamOnHGlobal()** - *creates a stream object that uses an HGLOBAL memory handle to store the stream contents. This object is the OLE-provided implementation of the IStream interface.* |
| 595 | 21859 | **CoTaskMemFree()** - *releases a memory block from a previously assigned task through a call to the CoTaskMemAlloc () or CoTaskMemAlloc () function.* |
| 596 | 21865 | **CoTaskMemAlloc()** - *assign a working memory block* |
| 597 | 21874 | **CoTaskMemRealloc()** - *change the size of a previously assigned block of working memory* |
| 598 | 21884 | **VarAdjustCapacity()** - *adjusts the capacity of a variable to its content* |
| 599 | 21902 | **DllListExports()** - *List of Function exports of a DLL* |
| 600 | 21942 | **RtlUlongByteSwap64()** - *routine reverses the ordering of the four bytes in a 32-bit unsigned integer value (AHK v2)* |
| 601 | 21966 | **RtlUlongByteSwap64()** - *routine reverses the ordering of the four bytes in a 32-bit unsigned integer value (AHK v1)* |
| 602 | 21994 | **PIDfromAnyID()** - *for easy retreaving of process ID's (PID)* |
| 603 | 22045 | **processPriority()** - *retrieves the priority of a process via PID* |
| 604 | 22049 | **GetProcessMemoryInfo()** - *get informations about memory consumption of a process* |
| 605 | 22082 | **SetTimerEx()** - *Similar to SetTimer, but calls a function, optionally with one or more parameters* |
| 606 | 22213 | **UserAccountsEnum()** - *list all users with information* |
| 607 | 22239 | **GetCurrentUserInfo()** - *obtains information from the current user* |
| 608 | 22260 | **GetHandleInformation()** - *obtain certain properties of a HANDLE* |
| 609 | 22285 | **SetHandleInformation()** - *establishes the properties of a HANDLE* |
| 610 | 22300 | **GetPhysicallyInstalledSystemMemory()** - *recovers the amount of RAM in physically installed KB from the SMBIOS (System Management BIOS) firmware tables, WIN_V SP1+* |
| 611 | 22311 | **GlobalMemoryStatus()** - *retrieves information about the current use of physical and virtual memory of the system* |
| 612 | 22327 | **GetSystemFileCacheSize()** - *retrieves the current size limits for the working set of the system cache* |
| 613 | 22339 | **Is64bitProcess()** - *check if a process is running in 64bit* |
| 614 | 22351 | **getSessionId()** - *this functions finds out ID of current session* |
| 615 | 22378 | **CreatePropertyCondition()** - *I hope this one works* |
| 616 | 22394 | **CreatePropertyCondition()** - *I hope this one is better* |
| 617 | 22427 | **CreatePropertyConditionEx()** |
| 618 | 22457 | **UIAgetControlNameByHwnd()** |
| 619 | 22469 | **MouseGetText()** - *get the text in the specified coordinates, function uses Microsoft UIA* |
| 620 | 22537 | **Acc_Get()** |
| 621 | 22589 | **Acc_Error()** |
| 622 | 22594 | **Acc_ChildrenByRole()** |
| 623 | 22636 | **listAccChildProperty()** |
| 624 | 22683 | **GetInfoUnderCursor()** - *retreavies ACC-Child under cursor* |
| 625 | 22691 | **GetAccPath()** - *get the Acc path from (child) handle* |
| 626 | 22706 | **GetEnumIndex()** - *for Acc child object* |
| 627 | 22731 | **IEGet()** - *AutoHotkey_L* |
| 628 | 22739 | **IEGet()** - *AutoHotkey_Basic* |
| 629 | 22753 | **WBGet()** - *AHK_L: based on ComObjQuery docs* |
| 630 | 22767 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 631 | 22781 | **WBGet()** - *based on ComObjQuery docs* |
| 632 | 22799 | **IE_TabActivateByName()** - *activate a TAB by name in InternetExplorer* |
| 633 | 22815 | **IE_TabActivateByHandle()** - *activates a tab by hwnd in InternetExplorer* |
| 634 | 22834 | **IE_TabWinID()** - *find the HWND of an IE window with a given tab name* |
| 635 | 22854 | **ReadProxy()** - *reads the proxy settings from the windows registry* |
| 636 | 22862 | **IE_getURL()** - *using shell.application* |
| 637 | 22875 | **ACCTabActivate()** - *activate a Tab in IE - function uses acc.ahk library* |
| 638 | 22890 | **TabActivate()** - *a different approach to activate a Tab in IE - function uses acc.ahk library* |
| 639 | 22908 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 640 | 22925 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 641 | 22930 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 642 | 22935 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 643 | 22986 | **Valueof()** - *Super Variables processor by Avi Aryan, overcomes the limitation of a single level ( return %var% ) in nesting variables* |
| 644 | 23041 | **type()** - *Object version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 645 | 23065 | **type()** - *COM version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 646 | 23086 | **A_DefaultGui()** - *a nice function to have a possibility to get the number of the default gui* |
| 647 | 23122 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq* |
| 648 | 23156 | **GetCommState()** - *this function retrieves the configuration settings of a given serial port* |
| 649 | 23270 | **pauseSuspendScript()** - *function to suspend/pause another script* |
| 650 | 23307 | **RtlGetVersion()** - *retrieves version of installed windows system* |
| 651 | 23326 | **PostMessageUnderMouse()** - *Post a message to the window underneath the mouse cursor, can be used to do things involving the mouse scroll wheel* |
| 652 | 23347 | **WM_SETCURSOR()** - *Prevent "sizing arrow" cursor when hovering over window border* |
| 653 | 23364 | **FoxitInvoke()** - *wm_command wrapper for FoxitReader Version:  9.1* |
| 654 | 23608 | **MoveMouse_Spiral()** - *move mouse in a spiral* |

