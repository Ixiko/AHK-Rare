![AHK - Rare Logo](assets/AHK-Rare-Logo.png)

------

**AHK-Rare** - *collection of rare or very useful single functions* 

This is a collection of functions I found at Autohotkey-Forum or inside Autohotkey Scripts. Sometimes you will find one of it an official Autohotkey-Library. Approximately 90-95% of the functions can not be found in any of the 2500 libraries that I have also put together here at Github.

Some of the collected function seems to be multiple in this collection, because they sometimes use very different methods. This is a crucial difference. You wan’t find “THE ONLY ONE” good function here. Take what is the better right now! From that I build up a script individual library.

----

*Last modification date*: ***07/29/2019***, *Changes are below!* *At the end*: complete list of all functions. The functions are sorted by topic as shown in the picture. *Remark*: I didn’t tested all functions and sorting is very different.

In the [AHK forum](https://autohotkey.com/boards/) I read that "Codefolding does not work". After trying it with [Sublime Text Editor](https://www.sublimetext.com) I noticed that Sublime does not natively support codefolding via the syntax **;{** , **;}**. Maybe that's the problem. The collection was created with [Scite4Autohotkey](https://github.com/fincs/SciTE4AutoHotkey). 

------

![New Layout](assets/AHK-Rare-theGui_Screenshot.png)



## ![Gem](assets/GemSmall.png)[July 29, 2019]: +5 =  638

There are only a few new functions this time, as I have created a script (alpha release) for a more comfortable presentation of the function collection (AHK-Rare_TheGui.ahk). The gui is divided into 2 areas. In the upper area, all functions are displayed for selection. In the lower area you will find more information after selecting a function. A search function is not yet programmed, but will be added later.
With a right click on the displayed code or the detailed description, the function will be transferred to the clipboard.

| **Nr** | FUNCTION                       | DESCRIPTION                                                  |
| :----: | ------------------------------ | ------------------------------------------------------------ |
|   01   | **GetClassNN()**               | missing subfunction of FindChildWindow                       |
|   02   | **GetClassNN_EnumChildProc()** | missing subfunction of FindChildWindow                       |
|   03   | **ScaleToFit()**               | returns the dimensions of the scaled source rectangle that fits within the destination rectangle |
|   04   | **gcd()**                      | MCode GCD - Find the greatest common divisor (GCD) of two numbers |
|   05   | **LVM_CalculateSize()**        | calculate the width and height required to display a given number of rows of a ListView control |



## ![Gem](assets/GemSmall.png) [July 01, 2019]: +19 =  633

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

| FNr  | Line  | name of function and description                             |
| :--: | :---: | ------------------------------------------------------------ |
| 001  | 00011 | **ClipboardGetDropEffect()** - *Clipboard function. Retrieves if files in clipboard comes from an explorer cut or copy operation.* |
| 002  | 00034 | **ClipboardSetFiles()** - *Explorer function for Drag&Drop and Pasting. Enables the explorer paste context menu option.* |
| 003  | 00081 | **CopyFilesToClipboard()** - *copy files to clipboard*       |
| 004  | 00137 | **FileToClipboard()** - *copying the path to clipboard*      |
| 005  | 00168 | **FileToClipboard()** - *a second way to copying the path to clipboard* |
| 006  | 00205 | **ImageToClipboard()** - *Copies image data from file to the clipboard. (first of three approaches)* |
| 007  | 00219 | **Gdip_ImageToClipboard()** - *Copies image data from file to the clipboard. (second approach)* |
| 008  | 00240 | **Gdip_ImageToClipboard()** - *Copies image data from file to the clipboard. (third approach)* |
| 009  | 00286 | **AppendToClipboard()** - *Appends files to CF_HDROP structure in clipboard* |
| 010  | 00307 | **CMDret_RunReturn()**                                       |
| 011  | 00420 | **ConsoleSend()** - *Sends text to a console's input stream* |
| 012  | 00472 | **ScanCode()** - *subfunction for ConsoleSend*               |
| 013  | 00477 | **StdOutStream()** - *Store command line output in autohotkey variable. Supports both x86 and x64.* |
| 014  | 00646 | **StdoutToVar_CreateProcess()** - *Runs a command line program and returns its output* |
| 015  | 00713 | **RunUTF8()** - *if a .exe file really requires its command line to be encoded as UTF-8, the following might work (a lexikos function)* |
| 016  | 00740 | **PrettyTickCount()** - *takes a time in milliseconds and displays it in a readable fashion* |
| 017  | 00749 | **TimePlus()**                                               |
| 018  | 00759 | **FormatSeconds()** - *formats seconds to hours,minutes and seconds -> 12:36:10* |
| 019  | 00767 | **TimeCode()** - *TimCode can be used for protokoll or error logs* |
| 020  | 00779 | **Time()** - *calculate with time, add minutes, hours, days - add or subtract time* |
| 021  | 00925 | **DateDiff()** - *returns the difference between two timestamps in the specified units* |
| 022  | 01023 | **GetProcesses()** - *get the name of all running processes* |
| 023  | 01064 | **getProcesses()** - *get running processes with search using comma separated list* |
| 024  | 01115 | **GetProcessWorkingDir()** - *like the name explains*        |
| 025  | 01146 | **GetTextSize()** - *precalcute the Textsize (Width & Height)* |
| 026  | 01156 | **GetTextSize()** - *different function to the above one*    |
| 027  | 01232 | **MeasureText()** - *alternative to other functions which calculate the text size before display on the screen* |
| 028  | 01271 | **monitorInfo()** - *shows infos about your monitors*        |
| 029  | 01288 | **whichMonitor()** - *return [current monitor, monitor count]* |
| 030  | 01300 | **IsOfficeFile()** - *checks if a file is an Office file*    |
| 031  | 01368 | **DeskIcons()** - *i think its for showing all desktop icons* |
| 032  | 01411 | **GetFuncDefs()** - *get function definitions from a script* |
| 033  | 01453 | **IndexOfIconResource()** - *function is used to convert an icon resource id (as those used in the registry) to icon index(as used by ahk)* |
| 034  | 01475 | **IndexOfIconResource_EnumIconResources()** - *subfunction of IndexOfIconResource()* |
| 035  | 01488 | **GetIconforext()** - *Gets default registered icon for an extension* |
| 036  | 01510 | **GetImageType()** - *returns whether a process is 32bit or 64bit* |
| 037  | 01530 | **GetProcessName()** - *Gets the process name from a window handle.* |
| 038  | 01536 | **GetDisplayOrientation()** - *working function to get the orientation of screen* |
| 039  | 01552 | **GetSysErrorText()** - *method to get meaningful data out of the error codes* |
| 040  | 01568 | **getSysLocale()** - *gets the system language*              |
| 041  | 01583 | **GetThreadStartAddr()** - *returns start adresses from all threads of a process* |
| 042  | 01626 | **ScriptExist()** - *true oder false if Script is running or not* |
| 043  | 01648 | **GetStartupWindowState()** - *to check, if script exe was launched by windows's shortcut with MAXIMIZE* |
| 044  | 01696 | **LoadPicture()** - *Loads a picture and returns an HBITMAP or HICON to the caller* |
| 045  | 02075 | **GetImageDimensionProperty()** - *this retrieves the dimensions from a dummy Gui* |
| 046  | 02107 | **GetImageDimensions()** - *Retrieves image width and height of a specified image file* |
| 047  | 02147 | **Gdip_FillRoundedRectangle()**                              |
| 048  | 02168 | **Redraw()** - *redraws the overlay window(s) using the position, text and scrolling settings* |
| 049  | 02246 | **CreateSurface()** - *creates a drawing GDI surface*        |
| 050  | 02275 | **ShowSurface()** - *subfunction for CreateSurface*          |
| 051  | 02281 | **HideSurface()** - *subfunction for CreateSurface*          |
| 052  | 02285 | **WipeSurface()** - *subfunction for CreateSurface*          |
| 053  | 02290 | **StartDraw()** - *subfunction for CreateSurface*            |
| 054  | 02302 | **EndDraw()** - *subfunction for CreateSurface*              |
| 055  | 02307 | **SetPen()** - *subfunction for CreateSurface*               |
| 056  | 02323 | **DrawLine()** - *used DLLCall to draw a line*               |
| 057  | 02330 | **DrawRectangle()** - *used DLLCall to draw a rectangle*     |
| 058  | 02340 | **DrawRectangle()** - *this is for screenshots*              |
| 059  | 02369 | **DrawFrameAroundControl()** - *paints a rectangle around a specified control* |
| 060  | 02437 | **Highlight()** - *Show a red rectangle outline to highlight specified region, it's useful to debug* |
| 061  | 02536 | **SetAlpha()** - *set alpha to a layered window*             |
| 062  | 02543 | **CircularText()** - *given a string it will generate a bitmap of the characters drawn with a given angle between each char* |
| 063  | 02569 | **RotateAroundCenter()** - *GDIP rotate around center*       |
| 064  | 02577 | **Screenshot()** - *screenshot function 1*                   |
| 065  | 02592 | **TakeScreenshot()** - *screenshot function 2*               |
| 066  | 02620 | **CaptureWindow()** - *screenshot function 3*                |
| 067  | 02650 | **CaptureScreen()** - *screenshot function 4 - orginally from CaptureScreen.ahk* |
| 068  | 02742 | **CaptureCursor()** - *subfunction for CaptureScreen() - this captures the cursor* |
| 069  | 02768 | **Zoomer()** - *subfunction for CaptureScreen() - zooms a HBitmap, depending function of CaptureScreen()* |
| 070  | 02786 | **Convert()** - *subfunction for CaptureScreen() - converts from one picture format to another one, depending on Gdip restriction only .bmp, .jpg, .png is possible* |
| 071  | 02852 | **SaveHBITMAPToFile()** - *subfunction for CaptureScreen() - saves a HBitmap to a file* |
| 072  | 02863 | **RGBRange()** - *returns an array for a color transition from x to y* |
| 073  | 02893 | **getSelectionCoords()** - *creates a click-and-drag selection box to specify an area* |
| 074  | 02960 | **GetRange()** - *another good screen area selection function* |
| 075  | 03071 | **FloodFill()** - *filling an area using color banks*        |
| 076  | 03120 | **CreateBMPGradient()** - *Horizontal/Vertical gradient*     |
| 077  | 03143 | **BGR()** - *BGR() subfunction from CreateBMPGradient()*     |
| 078  | 03150 | **CreatePatternBrushFrom()** - *as it says*                  |
| 079  | 03182 | **ResConImg()** - *Resize and convert images. png, bmp, jpg, tiff, or gif* |
| 080  | 03234 | **CreateCircleProgress()** - *very nice to see functions for a circle progress* |
| 081  | 03343 | **UpdateCircleProgress()** - *subfunction for CreateCircleProgress* |
| 082  | 03348 | **DestroyCircleProgress()** - *subfunction for CreateCircleProgress* |
| 083  | 03356 | **RGBrightnessToHex()** - *transform rbg (with brightness) values to hex* |
| 084  | 03361 | **GetHueColorFromFraction()** - *get hue color from fraction. example: h(0) is red, h(1/3) is green and h(2/3) is blue* |
| 085  | 03371 | **SaveHBITMAPToFile()** - *saves the hBitmap to a file*      |
| 086  | 03381 | **DrawRotatePictureOnGraphics()** - *rotate a pBitmap*       |
| 087  | 03398 | **CopyBitmapOnGraphic()** - *copy a pBitmap of a specific width and height to the Gdip graphics container (pGraphics)* |
| 088  | 03405 | **GDI_GrayscaleBitmap()** - *Converts GDI bitmap to 256 color GreyScale* |
| 089  | 03442 | **Convert_BlackWhite()** - *Convert exist imagefile to black&white , it uses machine code* |
| 090  | 03496 | **BlackWhite()** - *sub from Convert_BlackWhite*             |
| 091  | 03505 | **getHBMinfo()**                                             |
| 092  | 03513 | **CreateDIB()** - *a wonderfull function by SKAN to draw tiled backgrounds (like chess pattern) to a gui, it can also draw gradients* |
| 093  | 03566 | **GuiControlLoadImage()** - *scale down a picture to fit the given width and height of a picture control* |
| 094  | 03626 | **Gdip_ResizeBitmap()** - *returns resized bitmap*           |
| 095  | 03672 | **Gdip_CropBitmap()** - *returns cropped bitmap. Specify how many pixels you want to crop (omit) from each side of bitmap rectangle* |
| 096  | 03709 | **GetBitmapSize()** - *Lexikos function to get the size of bitmap* |
| 097  | 03736 | **Gdip_BitmapReplaceColor()** - *using Mcode to replace a color with a specific variation* |
| 098  | 03783 | **Gdi_ExtFloodFill()** - *fills an area with the current brush* |
| 099  | 03837 | **Gdip_AlphaMask32v1()** - *32bit Gdip-AlphaMask with MCode - one of two builds* |
| 100  | 03884 | **Gdip_AlphaMask32v2()** - *32bit Gdip-AlphaMask with MCode  - second of two builds* |
| 101  | 03934 | **Gdip_AlphaMask64()** - *64bit Gdip-AlphaMask with MCode*   |
| 102  | 03954 | **()** - *LTrim Join*                                        |
| 103  | 03991 | **CircleCrop()** - *gdi circlecrop with MCode*               |
| 104  | 04038 | **get_png_image_info()** - *Getting PNG image info*          |
| 105  | 04121 | **byte_swap_32()** - *subfunction of get_png_image_info(), change endian-ness for 32-bit integer* |
| 106  | 04127 | **print_line()** - *subfunction of get_png_image_info(),  output line to STDOUT for debugging in my text editor (sublime)* |
| 107  | 04131 | **GetBitmapFromAnything()** - *Supports paths, icon handles and hBitmaps* |
| 108  | 04156 | **Image_TextBox()** - *Function to use Gdip to add text to image* |
| 109  | 04386 | **HtmlBox()** - *Gui with ActiveX - Internet Explorer - Control* |
| 110  | 04456 | **EditBox()** - *Displays an edit box with the given text, tile, and options* |
| 111  | 04562 | **Popup()** - *Splashtext Gui*                               |
| 112  | 04586 | **PIC_GDI_GUI()** - *a GDI-gui to show a picture*            |
| 113  | 04624 | **SplitButton()** - *drop down button*                       |
| 114  | 04696 | **BetterBox()** - *custom input box allows to choose the position of the text insertion point* |
| 115  | 04744 | **BtnBox()** - *show a custom MsgBox with arbitrarily named buttons* |
| 116  | 04792 | **LoginBox()** - *show a custom input box for credentials, return an object with Username and Password* |
| 117  | 04838 | **MultiBox()** - *show a multi-line input box, return the entered text* |
| 118  | 04883 | **PassBox()** - *show a custom input box for a password*     |
| 119  | 04928 | **CreateHotkeyWindow()** - *Hotkey Window*                   |
| 120  | 04964 | **GetUserInput()** - *allows you to create custom dialogs that can store different values (each value has a different set of controls)* |
| 121  | 05156 | **guiMsgBox()** - *GUI Message Box to allow selection*       |
| 122  | 05188 | **URLPrefGui()** - *shimanov's workaround for displaying URLs in a gui* |
| 123  | 05296 | **TaskDialog()** - *a Task Dialog is a new kind of dialogbox that has been added in Windows Vista and later. They are similar to message boxes, but with much more power.* |
| 124  | 05326 | **TaskDialogDirect()** - *part of TaskDialog ?*              |
| 125  | 05367 | **TaskDialogMsgBox()** - *part of TaskDialog ?*              |
| 126  | 05407 | **TaskDialogToUnicode()** - *part of TaskDialog ?*           |
| 127  | 05415 | **TaskDialogCallback()** - *part of TaskDialog ?*            |
| 128  | 05435 | **TT_Console()** - *Use Tooltip as a User Interface it returns the key which has been pressed* |
| 129  | 05491 | **ToolTipEx()** - *Display ToolTips with custom fonts and colors* |
| 130  | 05701 | **SafeInput()** - *makes sure the same window stays active after showing the InputBox. Otherwise you might get the text pasted into another window unexpectedly.* |
| 131  | 05720 | **FadeGui()** - *used DllCall to Animate (Fade in/out) a window* |
| 132  | 05733 | **WinFadeToggle()** - *smooth fading in out a window*        |
| 133  | 05795 | **winfade()** - *another winfade function*                   |
| 134  | 05812 | **ShadowBorder()** - *used DllCall to draw a shadow around a gui* |
| 135  | 05818 | **FrameShadow()** - *FrameShadow1*                           |
| 136  | 05829 | **FrameShadow()** - *FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)* |
| 137  | 05857 | **RemoveWindowFromTaskbar()** - *remove the active window from the taskbar by using COM* |
| 138  | 05891 | **vtable()** - *subfunction of RemoveWindowFromTaskbar(), ; NumGet(ptr+0) returns the address of the object's virtual function* |
| 139  | 05898 | **ToggleTitleMenuBar()** - *show or hide Titlemenubar*       |
| 140  | 05912 | **ToggleFakeFullscreen()** - *sets styles to a window to look like a fullscreen* |
| 141  | 05942 | **FullScreenToggleUnderMouse()** - *toggles a window under the mouse to look like fullscreen* |
| 142  | 05963 | **SetTaskbarProgress()** - *accesses Windows 7's ability to display a progress bar behind a taskbar button.* |
| 143  | 06029 | **SetTaskbarProgress()** - *modified function*               |
| 144  | 06086 | **InVar()** - *sub of SetTaskbarProgress, parsing list search* |
| 145  | 06093 | **IsWindow()** - *sub of SetTaskbarProgress, different approach to IsWindow in gui + window - get/find section* |
| 146  | 06100 | **WinSetPlacement()** - *Sets window position using workspace coordinates (-> no taskbar)* |
| 147  | 06129 | **AttachToolWindow()** - *Attaches a window as a tool window to another window from a different process.* |
| 148  | 06149 | **DeAttachToolWindow()** - *removes the attached ToolWindow* |
| 149  | 06171 | **Control_SetTextAndResize()** - *set a new text to a control and resize depending on textwidth and -height* |
| 150  | 06196 | **DropShadow()** - *Drop Shadow On Borderless Window, (DWM STYLE)* |
| 151  | 06229 | **GetGuiClassStyle()** - *returns the class style of a Autohotkey-Gui* |
| 152  | 06240 | **SetGuiClassStyle()** - *sets the class style of a Autohotkey-Gui* |
| 153  | 06257 | **GetComboBoxChoice()** - *Combobox function*                |
| 154  | 06277 | **Edit_Standard_Params()** - *these are helper functions to use with edit controls* |
| 155  | 06287 | **Edit_TextIsSelected()** - *returns bool if text is selected in an edit control* |
| 156  | 06294 | **Edit_GetSelection()** - *get selected text in an edit control* |
| 157  | 06306 | **Edit_Select()** - *selects text inside in an edit control* |
| 158  | 06318 | **Edit_SelectLine()** - *selects one line in an edit control* |
| 159  | 06350 | **Edit_DeleteLine()** - *delete one line in an edit control* |
| 160  | 06366 | **Edit_VCenter()** - *Vertically Align Text for edit controls* |
| 161  | 06401 | **IL_LoadIcon()** - *no description*                         |
| 162  | 06409 | **IL_GuiButtonIcon()** - *no description*                    |
| 163  | 06435 | **LB_AdjustItemHeight()** - *Listbox function*               |
| 164  | 06441 | **LB_GetItemHeight()** - *Listbox function*                  |
| 165  | 06448 | **LB_SetItemHeight()** - *Listbox function*                  |
| 166  | 06461 | **LV_GetCount()** - *get current count of notes in from any listview* |
| 167  | 06471 | **LV_SetSelColors()** - *sets the colors for selected rows in a listView.* |
| 168  | 06538 | **LV_Select()** - *select/deselect 1 to all rows of a listview* |
| 169  | 06560 | **LV_GetItemText()** - *read the text from an item in a ListView* |
| 170  | 06599 | **LV_GetText()** - *get text by item and subitem from a Listview* |
| 171  | 06688 | **ExtractInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 172  | 06712 | **InsertInteger()** - *Sub of LV_GetItemText and LV_GetText* |
| 173  | 06726 | **LV_SetBackgroundURL()** - *set a ListView's background image - please pay attention to the description* |
| 174  | 06772 | **LV_MoveRow()** - *moves a listview row up or down*         |
| 175  | 06792 | **LV_MoveRow()** - *the same like above, but slightly different. With integrated script example.* |
| 176  | 06844 | **LV_Find()** - *I think it's usefull to find an item position a listview* |
| 177  | 06860 | **LV_GetSelectedText()** - *Returns text from selected rows in ListView (in a user friendly way IMO.)* |
| 178  | 06911 | **LV_Notification()** - *easy function for showing notifications by hovering over a listview* |
| 179  | 06936 | **LV_IsChecked()** - *alternate method to find out if a particular row number is checked* |
| 180  | 06943 | **LV_HeaderFontSet()** - *sets a different font to a Listview header (it's need CreateFont() function)* |
| 181  | 07037 | **LV_SetCheckState()** - *check (add check mark to) or uncheck (remove the check mark from) an item in the ListView control* |
| 182  | 07068 | **LV_SetItemState()** - *with this function you can set all avaible states to a listview item* |
| 183  | 07106 | **NumPut()** - *mask*                                        |
| 184  | 07107 | **NumPut()** - *iItem*                                       |
| 185  | 07108 | **NumPut()** - *state*                                       |
| 186  | 07109 | **NumPut()** - *stateMask*                                   |
| 187  | 07116 | **LV_SubitemHitTest()** - *get's clicked column in listview* |
| 188  | 07170 | **LV_EX_FindString()** - *find an item in any listview , function works with ANSI and UNICODE (tested)* |
| 189  | 07184 | **LV_RemoveSelBorder()** - *remove the listview's selection border* |
| 190  | 07199 | **LV_SetExplorerTheme()** - *set 'Explorer' theme for ListViews & TreeViews on Vista+* |
| 191  | 07210 | **LV_Update()** - *update one listview item*                 |
| 192  | 07214 | **LV_RedrawItem()** - *this one redraws on listview item*    |
| 193  | 07221 | **LV_SetExStyle()** - *set / remove / alternate extended styles to the listview control* |
| 194  | 07241 | **LV_GetExStyle()** - *get / remove / alternate extended styles to the listview control* |
| 195  | 07245 | **LV_IsItemVisible()** - *determines if a listview item is visible* |
| 196  | 07249 | **LV_SetIconSpacing()** - *Sets the space between icons in the icon view* |
| 197  | 07262 | **LV_GetIconSpacing()** - *Get the space between icons in the icon view* |
| 198  | 07274 | **LV_GetItemPos()** - *obtains the position of an item*      |
| 199  | 07293 | **LV_SetItemPos()** - *set the position of an item*          |
| 200  | 07311 | **LV_MouseGetCellPos()** - *returns the number (row, col) of a cell in a listview at present mouseposition* |
| 201  | 07351 | **LV_GetColOrderLocal()** - *returns the order of listview columns for a local listview* |
| 202  | 07389 | **LV_GetColOrder()** - *returns the order of listview columns for a listview* |
| 203  | 07448 | **LV_SetColOrderLocal()** - *pass listview hWnd (not listview header hWnd)* |
| 204  | 07461 | **LV_SetColOrder()** - *pass listview hWnd (not listview header hWnd)* |
| 205  | 07513 | **LV_GetCheckedItems()** - *Returns a list of checked items from a standard ListView Control* |
| 206  | 07526 | **LV_ClickRow()** - *simulates a left mousebutton click on a specific row in a listview* |
| 207  | 07539 | **LV_HeaderFontSet()** - *sets font for listview headers*    |
| 208  | 07632 | **LV_SetSI()** - *set icon for row "subItem" within Listview* |
| 209  | 07686 | **LVM_CalculateSize()** - *calculate the width and height required to display a given number of rows of a ListView control* |
| 210  | 07873 | **r_Width :=()** - *LOWORD*                                  |
| 211  | 07874 | **r_Height:=()** - *HIWORD*                                  |
| 212  | 07881 | **TabCtrl_GetCurSel()** - *Indexnumber of active tab in a gui* |
| 213  | 07889 | **TabCtrl_GetItemText()** - *returns text of a tab*          |
| 214  | 07921 | **SetError()** - *sub of TabCtrl functions*                  |
| 215  | 07931 | **TV_Find()** - *returns the ID of an item based on the text of the item* |
| 216  | 07945 | **TV_Load()** - *loads TreeView items from an XML string*    |
| 217  | 07991 | **()** - *oin*                                               |
| 218  | 08010 | **()** - *oin*                                               |
| 219  | 08127 | **TV_GetItemText()** - *retrieves the text/name of the specified treeview node +* |
| 220  | 08179 | **ControlCreateGradient()** - *draws a gradient as background picture* |
| 221  | 08195 | **AddGraphicButtonPlus()** - *GDI+ add a graphic button to a gui* |
| 222  | 08230 | **UpdateScrollBars()** - *immediate update of the window content when using a scrollbar* |
| 223  | 08418 | **screenDims()** - *returns informations of active screen (size, DPI and orientation)* |
| 224  | 08429 | **DPIFactor()** - *determines the Windows setting to the current DPI factor* |
| 225  | 08445 | **ControlExists()** - *true/false for ControlClass*          |
| 226  | 08457 | **GetFocusedControl()** - *retrieves the ahk_id (HWND) of the active window's focused control.* |
| 227  | 08489 | **GetControls()** - *returns an array with ClassNN, Hwnd and text of all controls of a window* |
| 228  | 08518 | **GetOtherControl()**                                        |
| 229  | 08524 | **ListControls()** - *similar function to GetControls but returns a comma seperated list* |
| 230  | 08547 | **Control_GetClassNN()** - *no-loop*                         |
| 231  | 08559 | **ControlGetClassNN()** - *with loop*                        |
| 232  | 08573 | **ControlGetClassNN()** - *different method is used here in compare to the already existing functions in this collection* |
| 233  | 08587 | **GetClassName()** - *returns HWND's class name without its instance number, e.g. "Edit" or "SysListView32"* |
| 234  | 08594 | **Control_GetFont()** - *get the currently used font of a control* |
| 235  | 08616 | **IsControlFocused()** - *true/false if a specific control is focused* |
| 236  | 08621 | **getControlNameByHwnd()** - *self explaining*               |
| 237  | 08639 | **getByControlName()** - *search by control name return hwnd* |
| 238  | 08673 | **getNextControl()** - *I'm not sure if this feature works could be an AHK code for the Control.GetNextControl method for System.Windows.Forms* |
| 239  | 08724 | **IsControlUnderCursor()** - *Checks if a specific control is under the cursor and returns its ClassNN if it is.* |
| 240  | 08731 | **GetFocusedControl()** - *get focused control from active window -multi Options[ClassNN \ Hwnd \ Text \ List \ All] available* |
| 241  | 08766 | **ControlGetTextExt()** - *3 different variants are tried to determine the text of a control* |
| 242  | 08793 | **getControlInfo()** - *get width and heights of controls*   |
| 243  | 08806 | **FocusedControl()** - *returns the HWND of the currently focused control, or 0 if there was a problem* |
| 244  | 08815 | **Control_GetFont()** - *retrieves the used font of a control* |
| 245  | 08827 | **WinForms_GetClassNN()** - *Check which ClassNN an element has* |
| 246  | 08857 | **GetExtraStyle()** - *get Extra Styles from a control*      |
| 247  | 08878 | **GetToolbarItems()** - *retrieves the text/names of all items of a toolbar* |
| 248  | 08936 | **ControlGetTabs()** - *retrieves the text of tabs in a tab control* |
| 249  | 09013 | **GetHeaderInfo()** - *Returns an object containing width and text for each item of a remote header control* |
| 250  | 09075 | **WinSaveCheckboxes()** - *save the status of checkboxes in other apps* |
| 251  | 09159 | **GetButtonType()** - *uses the style of a button to get it's name* |
| 252  | 09236 | **HWNDToClassNN()** - *a different approach to get classNN from handle* |
| 253  | 09257 | **IsCheckboxStyle()** - *checks style(code) if it's a checkbox* |
| 254  | 09307 | **IsOverTitleBar()** - *WM_NCHITTEST wrapping: what's under a screen point?* |
| 255  | 09317 | **WinGetPosEx()** - *gets the position, size, and offset of a window* |
| 256  | 09490 | **GetParent()** - *get parent win handle of a window*        |
| 257  | 09496 | **GetWindow()** - *DllCall wrapper for GetWindow function*   |
| 258  | 09502 | **GetForegroundWindow()** - *returns handle of the foreground window* |
| 259  | 09506 | **IsWindowVisible()** - *self explaining*                    |
| 260  | 09510 | **IsFullScreen()** - *specific window is a fullscreen window?* |
| 261  | 09517 | **IsClosed()** - *AHK function (WinWaitClose) wrapper*       |
| 262  | 09524 | **GetClassLong()**                                           |
| 263  | 09531 | **GetWindowLong()**                                          |
| 264  | 09538 | **GetClassStyles()**                                         |
| 265  | 09565 | **GetTabOrderIndex()**                                       |
| 266  | 09592 | **GetCursor()**                                              |
| 267  | 09599 | **GetClientCoords()**                                        |
| 268  | 09609 | **GetClientSize()** - *get size of window without border*    |
| 269  | 09617 | **GetWindowCoords()**                                        |
| 270  | 09624 | **GetWindowPos()**                                           |
| 271  | 09634 | **GetWindowPlacement()** - *Gets window position using workspace coordinates (-> no taskbar), returns an object* |
| 272  | 09648 | **GetWindowInfo()** - *returns an Key:Val Object with the most informations about a window (Pos, Client Size, Style, ExStyle, Border size...)* |
| 273  | 09670 | **GetOwner()**                                               |
| 274  | 09674 | **FindWindow()** - *Finds the requested window,and return it's ID* |
| 275  | 09730 | **FindWindow()** - *Finds the first window matching specific criterias.* |
| 276  | 09760 | **ShowWindow()** - *uses a DllCall to show a window*         |
| 277  | 09764 | **IsWindow()** - *wrapper for IsWindow DllCall*              |
| 278  | 09768 | **GetClassName()** - *wrapper for AHK WinGetClass function*  |
| 279  | 09773 | **FindChildWindow()** - *finds childWindow Hwnds of the parent window* |
| 280  | 09839 | **EnumChildWindow()** - *sub function of FindChildWindow*    |
| 281  | 09855 | **WinGetMinMaxState()** - *get state if window ist maximized or minimized* |
| 282  | 09883 | **GetBgBitMapHandle()** - *returns the handle of a background bitmap in a gui* |
| 283  | 09889 | **GetLastActivePopup()** - *passes the handle of the last active pop-up window of a parent window* |
| 284  | 09893 | **GetFreeGuiNum()** - *gets a free gui number.*              |
| 285  | 09909 | **IsWindowUnderCursor()** - *Checks if a specific window is under the cursor.* |
| 286  | 09917 | **GetCenterCoords()** - *?center a gui between 2 monitors?*  |
| 287  | 09938 | **RMApp_NCHITTEST()** - *Determines what part of a window the mouse is currently over* |
| 288  | 09952 | **GetCPA_file_name()** - *retrieves Control Panel applet icon* |
| 289  | 09984 | **WinGetClientPos()** - *gives back the coordinates of client area inside a gui/window - with DpiFactor correction* |
| 290  | 10022 | **CheckWindowStatus()** - *check's if a window is responding or not responding (hung or crashed) -* |
| 291  | 10057 | **GetWindowOrder()** - *determines the window order for a given (parent-)hwnd* |
| 292  | 10092 | **EnumWindows()** - *Get a list with all the top-level windows on the screen or controls in the window* |
| 293  | 10146 | **WinEnum()** - *wrapper for Enum(Child)Windows from cocobelgica. a different solution to that one I collected before* |
| 294  | 10208 | **WinWaitProgress()** - *Waits for the progress bar on a window to reach (>=) a given value (a Lexikos function)* |
| 295  | 10246 | **ControlGetProgress()** - *sub function of WinWaitProgress* |
| 296  | 10251 | **GetClassNN()** - *sub function of FindChildWindow*         |
| 297  | 10264 | **GetClassNN_EnumChildProc()** - *sub function of FindChildWindow* |
| 298  | 10276 | **ChooseColor()** - *what is this for?*                      |
| 299  | 10297 | **GetWindowIcon()**                                          |
| 300  | 10377 | **GetStatusBarText()**                                       |
| 301  | 10393 | **GetAncestor()**                                            |
| 302  | 10398 | **MinMaxInfo()**                                             |
| 303  | 10411 | **GetMouseTaskButton()** - *Gets the index+1 of the taskbar button which the mouse is hovering over* |
| 304  | 10516 | **SureControlClick()** - *Window Activation + ControlDelay to -1 + checked if control received the click* |
| 305  | 10533 | **SureControlCheck()** - *Window Activation + ControlDelay to -1 + Check if the control is really checked now* |
| 306  | 10554 | **ControlClick2()** - *ControlClick Double Click*            |
| 307  | 10564 | **ControlFromPoint()** - *returns the hwnd of a control at a specific point on the screen* |
| 308  | 10604 | **EnumChildFindPoint()** - *this function is required by ControlFromPoint* |
| 309  | 10643 | **ControlDoubleClick()** - *simulates a double click on a control with left/middle or right mousebutton* |
| 310  | 10663 | **WinWaitForMinimized()** - *waits until the window is minimized* |
| 311  | 10681 | **CenterWindow()** - *Given a the window's width and height, calculates where to position its upper-left corner so that it is centered EVEN IF the task bar is on the left side or top side of the window* |
| 312  | 10700 | **GuiCenterButtons()** - *Center and resize a row of buttons automatically* |
| 313  | 10752 | **CenterControl()** - *Centers one control*                  |
| 314  | 10803 | **SetWindowIcon()**                                          |
| 315  | 10809 | **SetWindowPos()**                                           |
| 316  | 10813 | **TryKillWin()**                                             |
| 317  | 10831 | **Win32_SendMessage()** - *Closing a window through sendmessage command* |
| 318  | 10843 | **Win32_TaskKill()**                                         |
| 319  | 10852 | **Win32_Terminate()**                                        |
| 320  | 10863 | **TabActivate()**                                            |
| 321  | 10871 | **FocuslessScroll()**                                        |
| 322  | 10972 | **FocuslessScrollHorizontal()**                              |
| 323  | 11006 | **Menu_Show()** - *alternate to Menu, Show , which can display menu without blocking monitored messages...* |
| 324  | 11028 | **CatMull_ControlMove()** - *Moves the mouse through 4 points (without control point "gaps")* |
| 325  | 11048 | **GUI_AutoHide()** - *Autohide the GUI function*             |
| 326  | 11315 | **SetButtonF()** - *Set a button control to call a function instead of a label subroutine* |
| 327  | 11409 | **AddToolTip()** - *Add/Update tooltips to GUI controls.*    |
| 328  | 11542 | **NumPut()** - *cbSize*                                      |
| 329  | 11543 | **NumPut()** - *uFlags*                                      |
| 330  | 11544 | **NumPut()** - *hwnd*                                        |
| 331  | 11545 | **NumPut()** - *uId*                                         |
| 332  | 11595 | **HelpToolTips()** - *To show defined GUI control help tooltips on hover.* |
| 333  | 11626 | **DisableFadeEffect()** - *disabling fade effect on gui animations* |
| 334  | 11650 | **SetWindowTransistionDisable()** - *disabling fade effect only the window of choice* |
| 335  | 11684 | **DisableMinimizeAnim()** - *disables or restores original minimize anim setting* |
| 336  | 11704 | **DisableCloseButton()** - *to disable/grey out the close button* |
| 337  | 11713 | **AutoCloseBlockingWindows()** - *close all open popup (childwindows), without knowing their names, of a parent window* |
| 338  | 11802 | **WinActivateEx()** - *Activate a Window, with extra Error Checking and More Features* |
| 339  | 11839 | **ClickOK()** - *function that search for any button in a window that might be an 'Ok' button to close a window dialog* |
| 340  | 11905 | **ControlSelectTab()** - *SendMessage wrapper to select the current tab on a MS Tab Control.* |
| 341  | 11924 | **SetParentByClass()** - *set parent window by using its window class* |
| 342  | 11932 | **MoveTogether()** - *move 2 windows together - using DllCall to DeferWindowPos* |
| 343  | 12018 | **WinWaitCreated()** - *Wait for a window to be created, returns 0 on timeout and ahk_id otherwise* |
| 344  | 12052 | **closeContextMenu()** - *a smart way to close a context menu* |
| 345  | 12069 | **SetWindowTheme()** - *set Windows UI Theme by window handle* |
| 346  | 12085 | **HideFocusBorder()** - *hides the focus border for the given GUI control or GUI and all of its children* |
| 347  | 12129 | **unmovable()** - *makes Gui unmovable*                      |
| 348  | 12140 | **movable()** - *makes Gui movable*                          |
| 349  | 12147 | **GuiDisableMove()** - *to fix a gui/window to its coordinates* |
| 350  | 12153 | **WinInsertAfter()** - *insert a window after a specific window handle* |
| 351  | 12170 | **CenterWindow()** - *center a window or set position optional by using Top, Left, Right, Bottom or a combination of it* |
| 352  | 12213 | **SetHoverText()** - *change control's text on mouseover*    |
| 353  | 12294 | **SetTextAndResize()** - *resizes a control to adapt to updated values* |
| 354  | 12360 | **GetMenu()** - *returns hMenu handle*                       |
| 355  | 12365 | **GetSubMenu()**                                             |
| 356  | 12369 | **GetMenuItemCount()**                                       |
| 357  | 12373 | **GetMenuItemID()**                                          |
| 358  | 12377 | **GetMenuString()**                                          |
| 359  | 12392 | **MenuGetAll()** - *this function and MenuGetAll_sub return all Menu commands from the choosed menu* |
| 360  | 12401 | **MenuGetAll_sub()** - *described above*                     |
| 361  | 12424 | **GetContextMenuState()** - *returns the state of a menu entry* |
| 362  | 12462 | **GetContextMenuID()** - *returns the ID of a menu entry*    |
| 363  | 12485 | **GetContextMenuText()** - *returns the text of a menu entry (standard windows context menus only!!!)* |
| 364  | 12544 | **Menu_AssignBitmap()** - *assign bitmap to any item in any AHk menu* |
| 365  | 12704 | **InvokeVerb()** - *executes the context menu item of the given path* |
| 366  | 12782 | **Menu_Show()** - *its an alternative to Menu, Show, which can display menu without blocking monitored messages* |
| 367  | 12812 | **CreateMenu()** - *creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 368  | 12943 | **CreateDDMenu()** - *Creates menu from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left (indentation)* |
| 369  | 13098 | **ExtractIcon()** - *extract icon from a resource file*      |
| 370  | 13178 | **GetIconSize()** - *determines the size of the icon (Lexikos function)* |
| 371  | 13214 | **Gdip_GetHICONDimensions()** - *get icon dimensions*        |
| 372  | 13253 | **SetTrayIcon()** - *sets a hex coded icon to as try icon*   |
| 373  | 13295 | **InvokeVerb()** - *Executes the context menu item of the given path* |
| 374  | 13372 | **Function_Eject()** - *ejects a drive medium*               |
| 375  | 13404 | **FileGetDetail()** - *Get specific file property by index*  |
| 376  | 13415 | **FileGetDetails()** - *Create an array of concrete file properties* |
| 377  | 13431 | **DirExist()** - *Checks if a directory exists*              |
| 378  | 13435 | **GetDetails()** - *Create an array of possible file properties* |
| 379  | 13449 | **Start()** - *Start programs or scripts easier*             |
| 380  | 13468 | **IsFileEqual()** - *Returns whether or not two files are equal* |
| 381  | 13476 | **WatchDirectory()** - *Watches a directory/file for file changes* |
| 382  | 13625 | **WatchDirectory()** - *it's different from above not tested* |
| 383  | 13822 | **GetFileIcon()**                                            |
| 384  | 13835 | **ExtractAssociatedIcon()** - *Extracts the associated icon's index for the file specified in path* |
| 385  | 13849 | **ExtractAssociatedIconEx()** - *Extracts the associated icon's index and ID for the file specified in path* |
| 386  | 13862 | **DestroyIcon()**                                            |
| 387  | 13866 | **listfunc()** - *list all functions inside ahk scripts*     |
| 388  | 13882 | **CreateOpenWithMenu()** - *creates an 'open with' menu for the passed file.* |
| 389  | 14034 | **FileCount()** - *count matching files in the working directory* |
| 390  | 14042 | **GetImageTypeW()** - *Identify the image type (UniCode)*    |
| 391  | 14086 | **FileWriteLine()** - *to write data at specified line in a file.* |
| 392  | 14096 | **FileMD5()** - *file MD5 hashing*                           |
| 393  | 14112 | **FileCRC32()** - *computes and returns CRC32 hash for a File passed as parameter* |
| 394  | 14130 | **FindFreeFileName()** - *Finds a non-existing filename for Filepath by appending a number in brackets to the name* |
| 395  | 14143 | **CountFilesR()** - *count files recursive in specific folder (uses COM method)* |
| 396  | 14152 | **CountFiles()** - *count files in specific folder (uses COM method)* |
| 397  | 14158 | **PathInfo()** - *splits a given path to return as object*   |
| 398  | 14163 | **DriveSpace()** - *retrieves the DriveSpace*                |
| 399  | 14171 | **GetBinaryType()** - *determines the bit architecture of an executable program* |
| 400  | 14181 | **GetFileAttributes()** - *get attributes of a file or folder* |
| 401  | 14220 | **SetFileTime()** - *to set the time*                        |
| 402  | 14229 | **SetFileAttributes()** - *set attributes of a file or folder* |
| 403  | 14267 | **FileSetSecurity()** - *set security for the file / folder* |
| 404  | 14321 | **FileSetOwner()** - *set the owner to file / directory*     |
| 405  | 14341 | **FileGetOwner()** - *get the owner to file / directory*     |
| 406  | 14358 | **GetFileFormat()** - *retreaves the codepage format of a file* |
| 407  | 14378 | **HashFile()** - *calculate hashes (MD2,MD5,SH1,SHA256, SHA384, SHA512) from file* |
| 408  | 14489 | **PathCombine()** - *combine the 2 routes provided in a single absolute path* |
| 409  | 14513 | **GetParentDir()** - *small RegEx function to get parent dir from a given string* |
| 410  | 14517 | **DirGetParent()** - *returns a string containing parent dir, it's possible to set the level of parent dir* |
| 411  | 14527 | **SelectFolder()** - *the Common File Dialog lets you add controls to it* |
| 412  | 14626 | **CreateFont()** - *creates font in memory which can be used with any API function accepting font handles* |
| 413  | 14679 | **GetHFONT()** - *gets a handle to a font used in a AHK gui for example* |
| 414  | 14692 | **MsgBoxFont()** - *style your MsgBox with with your prefered font* |
| 415  | 14706 | **GetFontProperties()** - *to get the current font's width and height* |
| 416  | 14752 | **FontEnum()** - *enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure* |
| 417  | 14792 | **GetFontTextDimension()** - *calculate the height and width of the text in the specified font* |
| 418  | 14824 | **GetStockObject()** - *subfunction of GetFontTextDimension()* |
| 419  | 14845 | **FontClone()** - *backup hFont in memory for further processing* |
| 420  | 14887 | **GuiDefaultFont()** - *returns the default Fontname & Fontsize* |
| 421  | 14923 | **StrGetDimAvgCharWidth()** - *average width of a character in pixels* |
| 422  | 14966 | **CreateFont()** - *creates HFont for use with GDI*          |
| 423  | 14997 | **MeasureText()** - *Measures the single-line width and height of the passed text* |
| 424  | 15053 | **OnMessageEx()** - *Allows multiple functions to be called automatically when the script receives the specified message* |
| 425  | 15287 | **ReceiveData()** - *By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.* |
| 426  | 15327 | **HDrop()** - *Drop files to another app*                    |
| 427  | 15360 | **WM_MOVE()** - *UpdateLayeredWindow*                        |
| 428  | 15372 | **WM_WINDOWPOSCHANGING()** - *two different examples of handling a WM_WINDOWPOSCHANGING* |
| 429  | 15402 | **WM_WINDOWPOSCHANGING()** - *second examples of handling a WM_WINDOWPOSCHANGING* |
| 430  | 15420 | **CallNextHookEx()** - *Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information* |
| 431  | 15424 | **WM_DEVICECHANGE()** - *Detects whether a CD has been inserted instead and also outputs the drive - global drv* |
| 432  | 15463 | **ObjectNameChange()** - *titlebar hook to detect when title changes, (Lexikos' code)* |
| 433  | 15511 | **DownloadFile()**                                           |
| 434  | 15534 | **NewLinkMsg()**                                             |
| 435  | 15550 | **TimeGap()** - *Determine by what amount the local system time differs to that of an ntp server* |
| 436  | 15560 | **GetSourceURL()**                                           |
| 437  | 15572 | **DNS_QueryName()**                                          |
| 438  | 15597 | **GetHTMLFragment()**                                        |
| 439  | 15617 | **ScrubFragmentIdents()**                                    |
| 440  | 15628 | **EnumClipFormats()**                                        |
| 441  | 15637 | **GetClipFormatNames()**                                     |
| 442  | 15656 | **GoogleTranslate()**                                        |
| 443  | 15675 | **getText()** - *get text from html*                         |
| 444  | 15690 | **getHtmlById()**                                            |
| 445  | 15695 | **getTextById()**                                            |
| 446  | 15699 | **getHtmlByTagName()**                                       |
| 447  | 15707 | **getTextByTagName()**                                       |
| 448  | 15715 | **CreateGist()**                                             |
| 449  | 15737 | **GetAllResponseHeaders()** - *gets the values of all HTTP headers* |
| 450  | 15806 | **NetStat()** - *passes information over network connections similar to the netstat -an CMD command.* |
| 451  | 15904 | **ExtractTableData()** - *extracts tables from HTML files*   |
| 452  | 16027 | **IsConnected()** - *Returns true if there is an available internet connection* |
| 453  | 16031 | **HostToIp()** - *gets the IP address for the given host directly using the WinSock 2.0 dll, without using temp files or third party utilities* |
| 454  | 16134 | **LocalIps()** - *with small changes to HostToIP() this can be used to retrieve all LocalIP's* |
| 455  | 16203 | **GetAdaptersInfo()** - *GetAdaptersAddresses function & IP_ADAPTER_ADDRESSES structure* |
| 456  | 16258 | **DNSQuery()** - *retrieve IP adresses or host/domain names from DNS* |
| 457  | 16376 | **Min()** - *returns the smaller of 2 numbers*               |
| 458  | 16380 | **Max()** - *determines the larger number*                   |
| 459  | 16384 | **Mean()** - *returns Average values in comma delimited list* |
| 460  | 16398 | **Median()** - *returns Median in a set of numbers from a list* |
| 461  | 16425 | **Mode()** - *returns the mode from a list of numbers*       |
| 462  | 16454 | **Dec2Base()** - *Base to Decimal and*                       |
| 463  | 16460 | **Base2Dec()** - *Decimal to Base conversion*                |
| 464  | 16466 | **HexToFloat()** - *Hexadecimal to Float conversion*         |
| 465  | 16470 | **FloatToHex()** - *Float to Hexadecimal conversion*         |
| 466  | 16480 | **CalculateDistance()** - *calculates the distance between two points in a 2D-Space* |
| 467  | 16484 | **IsInRange()** - *shows if a second variable is in range*   |
| 468  | 16495 | **FormatFileSize()** - *Formats a file size in bytes to a human-readable size string* |
| 469  | 16503 | **Color_RGBtoHSV()** - *converts beetween color two color spaces: RGB -> HSV* |
| 470  | 16533 | **Color_HSVtoRGB()** - *converts beetween color two color spaces: HSV -> RGB* |
| 471  | 16604 | **JEE_HexToBinData()** - *hexadecimal to binary*             |
| 472  | 16614 | **JEE_BinDataToHex()** - *binary to hexadecimal*             |
| 473  | 16625 | **JEE_BinDataToHex2()** - *binary to hexadecimal2*           |
| 474  | 16633 | **RadianToDegree()** - *convert radian (rad) to degree*      |
| 475  | 16646 | **DegreeToRadian()** - *convert degree to radian (rad)*      |
| 476  | 16660 | **RGBToARGB()** - *convert RGB to ARGB*                      |
| 477  | 16687 | **ARGBToRGB()** - *convert ARGB to RGB.*                     |
| 478  | 16706 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB .... (for AHK_V1)* |
| 479  | 16736 | **FormatByteSize()** - *give's back the given bytes in KB, MB, GB ....(for AHK_V2)* |
| 480  | 16777 | **ObjMerge()** - *merge two objects*                         |
| 481  | 16792 | **evalRPN()** - *Parsing/RPN calculator algorithm*           |
| 482  | 16830 | **StackShow()**                                              |
| 483  | 16837 | **ExploreObj()** - *print object function*                   |
| 484  | 16893 | **KeyValueObjectFromLists()** - *merge two lists into one key-value object, useful for 2 two lists you retreave from WinGet* |
| 485  | 16960 | **GetCallStack()** - *retrieves the current callstack*       |
| 486  | 17034 | **Traceback()** - *get stack trace*                          |
| 487  | 17124 | **Sort2DArray()** - *a two dimensional TDArray*              |
| 488  | 17145 | **SortArray()** - *ordered sort: Ascending, Descending, Reverse* |
| 489  | 17178 | **QuickSort()** - *Sort array using QuickSort algorithm*     |
| 490  | 17313 | **QuickAux()** - *subfunction of Quicksort*                  |
| 491  | 17391 | **Cat()** - *subfunction of Quicksort*                       |
| 492  | 17406 | **CatCol()** - *subfunction of Quicksort*                    |
| 493  | 17439 | **sortArray()** - *sorts an array (another way)*             |
| 494  | 17520 | **StringMD5()** - *String MD5 Hashing*                       |
| 495  | 17530 | **uriEncode()** - *a function to escape characters like & for use in URLs.* |
| 496  | 17545 | **Ansi2Unicode()** - *easy convertion from Ansi to Unicode, you can set prefered codepage* |
| 497  | 17565 | **Unicode2Ansi()** - *easy convertion from Unicode to Ansi, you can set prefered codepage* |
| 498  | 17589 | **Ansi2Oem()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 499  | 17595 | **Oem2Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 500  | 17601 | **Ansi2UTF8()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 501  | 17607 | **UTF82Ansi()** - *using Ansi2Unicode and Unicode2Ansi functions* |
| 502  | 17613 | **CRC32()** - *CRC32 function, uses MCode*                   |
| 503  | 17628 | **ParseJsonStrToArr()** - *Parse Json string to an array*    |
| 504  | 17654 | **parseJSON()** - *Parse Json string to an object*           |
| 505  | 17675 | **GetNestedTag()**                                           |
| 506  | 17705 | **GetHTMLbyID()** - *uses COM*                               |
| 507  | 17720 | **GetHTMLbyTag()** - *uses COM*                              |
| 508  | 17735 | **GetXmlElement()** - *RegEx function*                       |
| 509  | 17753 | **sXMLget()** - *simple solution to get information out of xml and html* |
| 510  | 17771 | **cleanlines()** - *removes all empty lines*                 |
| 511  | 17784 | **cleancolon()** - *what for? removes on ':' at beginning of a string* |
| 512  | 17794 | **cleanspace()** - *removes all Space chars*                 |
| 513  | 17807 | **SplitLine()** - *split string to key and value*            |
| 514  | 17817 | **EnsureEndsWith()** - *Ensure that the string given ends with a given char* |
| 515  | 17825 | **EnsureStartsWith()** - *Ensure that the string given starts with a given char* |
| 516  | 17832 | **StrPutVar()** - *Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on* |
| 517  | 17857 | **RegExSplit()** - *split a String by a regular expressin pattern and you will receive an array as a result* |
| 518  | 17882 | **ExtractSE()** - *subfunction of RegExSplit*                |
| 519  | 17890 | **StringM()** - *String manipulation with many options is using RegExReplace  (bloat, drop, Flip, Only, Pattern, Repeat, Replace, Scramble, Split)* |
| 520  | 17930 | **StrCount()** - *a very handy function to count a needle in a Haystack* |
| 521  | 17937 | **SuperInstr()** - *Returns min/max position for a           |
| 522  | 17966 | **LineDelete()** - *deletes a specific line or a range of lines from a variable containing one or more lines of text. No use of any loop!* |
| 523  | 18042 | **GetWordsNumbered()** - *gives back an array of words from a string, you can specify the position of the words you want to keep* |
| 524  | 18074 | **AddTrailingBackslash()** - *adds a backslash to the beginning of a string if there is none* |
| 525  | 18082 | **CheckQuotes()**                                            |
| 526  | 18091 | **ReplaceForbiddenChars()** - *hopefully working, not tested function, it uses RegExReplace* |
| 527  | 18103 | **WrapText()** - *basic function to wrap a text-string to a given length* |
| 528  | 18141 | **ExtractFuncTOuserAHK()** - *extract user function and helps to write it to userAhk.api* |
| 529  | 18262 | **PdfToText()** - *copies a selected PDF file to memory - it needs xpdf - pdftotext.exe* |
| 530  | 18289 | **PdfPageCounter()** - *counts pages of a pdffile (works with 95% of pdf files)* |
| 531  | 18305 | **PasteWithIndent()** - *paste string to an editor with your prefered indent key* |
| 532  | 18321 | **Ask_and_SetbackFocus()** - *by opening a msgbox you lost focus and caret pos in any editor - this func will restore the previous positions of the caret* |
| 533  | 18369 | **CleanLine()** - *Return a line with leading and trailing spaces removed, and tabs converted to spaces* |
| 534  | 18391 | **StrTrim()** - *Remove all leading and trailing whitespace including tabs, spaces, CR and LF* |
| 535  | 18412 | **StrDiff()** - *SIFT3 : Super Fast and Accurate string distance algorithm* |
| 536  | 18480 | **PrintArr()** - *show values of an array in a listview gui for debugging* |
| 537  | 18522 | **List2Array()** - *function uses StrSplit () to return an array* |
| 538  | 18526 | **Array_Gui()** - *shows your array as an interactive TreeView* |
| 539  | 18588 | **RandomString()** - *builds a string with random char of specified length* |
| 540  | 18626 | **DelaySend()** - *Send keystrokes delayed*                  |
| 541  | 18672 | **SetLayout()** - *set a keyboard layout*                    |
| 542  | 18677 | **GetAllInputChars()** - *Returns a string with input characters* |
| 543  | 18687 | **ReleaseModifiers()** - *helps to solve the Hotkey stuck problem* |
| 544  | 18734 | **isaKeyPhysicallyDown()** - *belongs to ReleaseModifiers() function* |
| 545  | 18747 | **GetText()** - *copies the selected text to a variable while preserving the clipboard.(Ctrl+C method)* |
| 546  | 18764 | **PutText()** - *Pastes text from a variable while preserving the clipboard. (Ctrl+v method)* |
| 547  | 18776 | **Hotkeys()** - *a handy function to show all used hotkeys in script* |
| 548  | 18827 | **BlockKeyboard()** - *block keyboard, and unblock it through usage of keyboard* |
| 549  | 18876 | **RapidHotkey()** - *Using this function you can send keystrokes or launch a Label by pressing a key several times.* |
| 550  | 19022 | **hk()** - *Disable all keyboard buttons*                    |
| 551  | 19118 | **ShowTrayBalloon()**                                        |
| 552  | 19144 | **ColoredTooltip()** - *show a tooltip for a given time with a custom color in rgb format (fore and background is supported). This function shows how to obtain the hWnd of the tooltip.* |
| 553  | 19191 | **AddToolTip()** - *very easy to use function to add a tooltip to a control* |
| 554  | 19462 | **AddToolTip()** - *add ToolTips to controls - Advanced ToolTip features + Unicode* |
| 555  | 20057 | **AddToolTip()** - *just a simple add on to allow tooltips to be added to controls without having to monitor the wm_mousemove messages* |
| 556  | 20128 | **AddToolTip()** - *this is a function from jballi -*        |
| 557  | 20260 | **NumPut()** - *cbSize*                                      |
| 558  | 20261 | **NumPut()** - *uFlags*                                      |
| 559  | 20262 | **NumPut()** - *hwnd*                                        |
| 560  | 20263 | **NumPut()** - *uId*                                         |
| 561  | 20321 | **CreateNamedPipe()** - *creates an instance of a named pipe and returns a handle for subsequent pipe operations* |
| 562  | 20326 | **RestoreCursors()** - *for normal cursor at GUI*            |
| 563  | 20331 | **SetSystemCursor()** - *enables an application to customize the system cursors by using a file or by using the system cursor* |
| 564  | 20412 | **SystemCursor()** - *hiding mouse cursor*                   |
| 565  | 20451 | **ToggleSystemCursor()** - *choose a cursor from system cursor list* |
| 566  | 20530 | **SetTimerF()** - *Starts a timer that can call functions and object methods* |
| 567  | 20567 | **GlobalVarsScript()**                                       |
| 568  | 20591 | **patternScan()** - *scan for a pattern in memory*           |
| 569  | 20690 | **scanInBuf()** - *scan for a pattern in memory buffer*      |
| 570  | 20728 | **hexToBinaryBuffer()**                                      |
| 571  | 20751 | **RegRead64()** - *Provides RegRead64() function that do not redirect to Wow6432Node on 64-bit machines (for ansi- and unicode)* |
| 572  | 20844 | **RegWrite64()** - *RegWrite64() function that do not redirect to Wow6432Node on 64-bit machines* |
| 573  | 20917 | **KillProcess()** - *uses DllCalls to end a process*         |
| 574  | 20950 | **LoadScriptResource()** - *loads a resource into memory (e.g. picture, scripts..)* |
| 575  | 20995 | **HIconFromBuffer()** - *Function provides a HICON handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 576  | 21010 | **hBMPFromPNGBuffer()** - *Function provides a hBitmap handle e.g. from a resource previously loaded into memory (LoadScriptResource)* |
| 577  | 21044 | **SaveSetColours()** - *Sys colours saving adapted from an approach found in Bertrand Deo's code* |
| 578  | 21078 | **ChangeMacAdress()** - *change MacAdress, it makes changes to the registry!* |
| 579  | 21133 | **ListAHKStats()** - *Select desired section: ListLines, ListVars, ListHotkeys, KeyHistory* |
| 580  | 21198 | **MouseExtras()** - *Allows to use subroutines for Holding and Double Clicking a Mouse Button.* |
| 581  | 21277 | **TimedFunction()** - *SetTimer functionality for functions* |
| 582  | 21304 | **ListGlobalVars()** - *ListGlobalVars() neither shows nor activates the AutoHotkey main window, it returns a string* |
| 583  | 21354 | **TaskList()** - *list all running tasks (no use of COM)*    |
| 584  | 21405 | **MouseDpi()** - *Change the current dpi setting of the mouse* |
| 585  | 21425 | **SendToAHK()** - *Sends strings by using a hidden gui between AHK scripts* |
| 586  | 21454 | **ReceiveFromAHK()** - *Receiving strings from SendToAHK*    |
| 587  | 21483 | **GetUIntByAddress()** - *get UInt direct from memory. I found this functions only within one script* |
| 588  | 21497 | **SetUIntByAddress()** - *write UInt direct to memory*       |
| 589  | 21512 | **SetRestrictedDacl()** - *run this in your script to hide it from Task Manager* |
| 590  | 21599 | **getActiveProcessName()** - *this function finds the process to the 'ForegroundWindow'* |
| 591  | 21614 | **enumChildCallback()** - *i think this retreave's the child process ID for a known gui hwnd and the main process ID* |
| 592  | 21621 | **GetDllBase()**                                             |
| 593  | 21643 | **getProcBaseFromModules()**                                 |
| 594  | 21700 | **InjectDll()** - *injects a dll to a running process (ahkdll??)* |
| 595  | 21725 | **getProcessBaseAddress()** - *gives a pointer to the base address of a process for further memory reading* |
| 596  | 21741 | **LoadFile()** - *Loads a script file as a child process and returns an object* |
| 597  | 21832 | **ReadProcessMemory()** - *reads data from a memory area in a given process.* |
| 598  | 21856 | **WriteProcessMemory()** - *writes data to a memory area in a specified process. the entire area to be written must be accessible or the operation will fail* |
| 599  | 21875 | **CopyMemory()** - *Copy a block of memory from one place to another* |
| 600  | 21885 | **MoveMemory()** - *moves a block memory from one place to another* |
| 601  | 21893 | **FillMemory()** - *fills a block of memory with the specified value* |
| 602  | 21898 | **ZeroMemory()** - *fills a memory block with zeros*         |
| 603  | 21902 | **CompareMemory()** - *compare two memory blocks*            |
| 604  | 21919 | **VirtualAlloc()** - *changes the state of a region of memory within the virtual address space of a specified process. the memory is assigned to zero.AtEOF* |
| 605  | 21963 | **VirtualFree()** - *release a region of pages within the virtual address space of the specified process* |
| 606  | 21977 | **ReduceMem()** - *reduces usage of memory from calling script* |
| 607  | 21998 | **GlobalLock()** - *memory management functions*             |
| 608  | 22016 | **LocalFree()** - *free a locked memory object*              |
| 609  | 22023 | **CreateStreamOnHGlobal()** - *creates a stream object that uses an HGLOBAL memory handle to store the stream contents. This object is the OLE-provided implementation of the IStream interface.* |
| 610  | 22028 | **CoTaskMemFree()** - *releases a memory block from a previously assigned task through a call to the CoTaskMemAlloc () or CoTaskMemAlloc () function.* |
| 611  | 22034 | **CoTaskMemAlloc()** - *assign a working memory block*       |
| 612  | 22043 | **CoTaskMemRealloc()** - *change the size of a previously assigned block of working memory* |
| 613  | 22053 | **VarAdjustCapacity()** - *adjusts the capacity of a variable to its content* |
| 614  | 22071 | **DllListExports()** - *List of Function exports of a DLL*   |
| 615  | 22111 | **RtlUlongByteSwap64()** - *routine reverses the ordering of the four bytes in a 32-bit unsigned integer value (AHK v2)* |
| 616  | 22135 | **RtlUlongByteSwap64()** - *routine reverses the ordering of the four bytes in a 32-bit unsigned integer value (AHK v1)* |
| 617  | 22163 | **PIDfromAnyID()** - *for easy retreaving of process ID's (PID)* |
| 618  | 22214 | **processPriority()** - *retrieves the priority of a process via PID* |
| 619  | 22218 | **GetProcessMemoryInfo()** - *get informations about memory consumption of a process* |
| 620  | 22251 | **SetTimerEx()** - *Similar to SetTimer, but calls a function, optionally with one or more parameters* |
| 621  | 22382 | **UserAccountsEnum()** - *list all users with information*   |
| 622  | 22408 | **GetCurrentUserInfo()** - *obtains information from the current user* |
| 623  | 22429 | **GetHandleInformation()** - *obtain certain properties of a HANDLE* |
| 624  | 22454 | **SetHandleInformation()** - *establishes the properties of a HANDLE* |
| 625  | 22469 | **GetPhysicallyInstalledSystemMemory()** - *recovers the amount of RAM in physically installed KB from the SMBIOS (System Management BIOS) firmware tables, WIN_V SP1+* |
| 626  | 22480 | **GlobalMemoryStatus()** - *retrieves information about the current use of physical and virtual memory of the system* |
| 627  | 22496 | **GetSystemFileCacheSize()** - *retrieves the current size limits for the working set of the system cache* |
| 628  | 22508 | **Is64bitProcess()** - *check if a process is running in 64bit* |
| 629  | 22520 | **getSessionId()** - *this functions finds out ID of current session* |
| 630  | 22547 | **CreatePropertyCondition()** - *I hope this one works*      |
| 631  | 22563 | **CreatePropertyCondition()** - *I hope this one is better*  |
| 632  | 22596 | **CreatePropertyConditionEx()**                              |
| 633  | 22626 | **UIAgetControlNameByHwnd()**                                |
| 634  | 22638 | **MouseGetText()** - *get the text in the specified coordinates, function uses Microsoft UIA* |
| 635  | 22706 | **Acc_Get()**                                                |
| 636  | 22758 | **Acc_Error()**                                              |
| 637  | 22763 | **Acc_ChildrenByRole()**                                     |
| 638  | 22805 | **listAccChildProperty()**                                   |
| 639  | 22852 | **GetInfoUnderCursor()** - *retreavies ACC-Child under cursor* |
| 640  | 22860 | **GetAccPath()** - *get the Acc path from (child) handle*    |
| 641  | 22875 | **GetEnumIndex()** - *for Acc child object*                  |
| 642  | 22900 | **IEGet()** - *AutoHotkey_L*                                 |
| 643  | 22908 | **IEGet()** - *AutoHotkey_Basic*                             |
| 644  | 22922 | **WBGet()** - *AHK_L: based on ComObjQuery docs*             |
| 645  | 22936 | **WBGet()** - *AHK_Basic: based on Sean's GetWebBrowser function* |
| 646  | 22950 | **WBGet()** - *based on ComObjQuery docs*                    |
| 647  | 22968 | **IE_TabActivateByName()** - *activate a TAB by name in InternetExplorer* |
| 648  | 22984 | **IE_TabActivateByHandle()** - *activates a tab by hwnd in InternetExplorer* |
| 649  | 23003 | **IE_TabWinID()** - *find the HWND of an IE window with a given tab name* |
| 650  | 23023 | **ReadProxy()** - *reads the proxy settings from the windows registry* |
| 651  | 23031 | **IE_getURL()** - *using shell.application*                  |
| 652  | 23044 | **ACCTabActivate()** - *activate a Tab in IE - function uses acc.ahk library* |
| 653  | 23059 | **TabActivate()** - *a different approach to activate a Tab in IE - function uses acc.ahk library* |
| 654  | 23077 | **ComVar()** - *Creates an object which can be used to pass a value ByRef.* |
| 655  | 23094 | **ComVarGet()** - *Called when script accesses an unknown field.* |
| 656  | 23099 | **ComVarSet()** - *Called when script sets an unknown field.* |
| 657  | 23104 | **GetScriptVARs()** - *returns a key, value array with all script variables (e.g. for debugging purposes)* |
| 658  | 23155 | **Valueof()** - *Super Variables processor by Avi Aryan, overcomes the limitation of a single level ( return %var% ) in nesting variables* |
| 659  | 23210 | **type()** - *Object version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 660  | 23234 | **type()** - *COM version: Returns the type of a value: "Integer", "String", "Float" or "Object"* |
| 661  | 23255 | **A_DefaultGui()** - *a nice function to have a possibility to get the number of the default gui* |
| 662  | 23290 | **MCode_Bin2Hex()** - *By Lexikos, http://goo.gl/LjP9Zq*     |
| 663  | 23317 | **gcd()** - *MCode GCD - Find the greatest common divisor (GCD) of two numbers* |
| 664  | 23354 | **GetCommState()** - *this function retrieves the configuration settings of a given serial port* |
| 665  | 23468 | **pauseSuspendScript()** - *function to suspend/pause another script* |
| 666  | 23505 | **RtlGetVersion()** - *retrieves version of installed windows system* |
| 667  | 23524 | **PostMessageUnderMouse()** - *Post a message to the window underneath the mouse cursor, can be used to do things involving the mouse scroll wheel* |
| 668  | 23545 | **WM_SETCURSOR()** - *Prevent "sizing arrow" cursor when hovering over window border* |
| 669  | 23562 | **FoxitInvoke()** - *wm_command wrapper for FoxitReader Version:  9.1* |
| 670  | 23806 | **MoveMouse_Spiral()** - *move mouse in a spiral*            |
| 671  | 23855 | **ScaleToFit()** - *returns the dimensions of the scaled source rectangle that fits within the destination rectangle* |