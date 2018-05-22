# AHK-Rare
### My collection of rare and maybe very useful functions

------

changes below! At the end of this document you can find a complete list of all functions inside

------

#### [22-May-2018] count: 227 functions

+ **FindChildWindow()** - a very good function to get handles from child windows like MDI childs
+ **WinGetMinMaxState()** - returns the state of a window if maximized or minimized
+ **TimeCode()** - result is a date-time string or only time-string (13.05.2018, 11:35:01.241) - can be useful for any kind of logging
+ **RegRead64(), RegWrite64()** - This script provides **RegRead64()** and **RegWrite64()** functions that do not redirect to Wow6432Node on 64-bit machines. Registry calls from 32 bit applications running on 64 bit machines are normally intercepted by the system and redirected from HKLM\SOFTWARE to HKLM\SOFTWARE\Wow6432Node. 
+ **CreateOpenWithMenu()** - Creates an 'open with' menu for the passed file. a function by just me based on code from qwerty12
+ **CircularText(), RotateAroundCenter()** - Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.
+ **QuickSort()** -  Sort dense arrays or matrices based on Quicksort algorithm
+ **FrameShadow(HGui)** - Drop Shadow On Borderless Window, (DWM STYLE)

####[06-May-2018] count: 217 functions

- **getByControlName()**  - function uses DllCalls
- **listAccChildProperty()** - uses COM functionality
- **getText(), getHtmlById(), getTextById(), getHtmlByTagName(), getTextByTagName()** -get text or html from a string
- **TabCtrl_GetCurSel(), TabCtrl_GetItemText()** - the first returns the 1-based index of the currently selected tab, the second returns the tab name


####[01-May-2018] count: 208 functions

+more functions added<br>

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



+changing the layout of this file (hope you can easily find your function)

![New Layout](https://raw.githubusercontent.com/Ixiko/AHK-Rare/master/Misc-Functions.ahk.png)

<br>

-----

## Complete List of functions

*sometimes the function names are the same but they use different methods to get the same result*

| Line | name of function |
| ---- | ---- |
| [9] |  CMDret_RunReturn(CMDin, WorkingDir=0)       |
| [130] |  PrettyTickCount(timeInMilliSeconds)       |
| [139] |  TimePlus(one, two)       |
| [148] |  FormatSeconds(Sekunden)       |
| [154] |  TimeCode(MaT)       |
| [173] |  GetProcesses()       |
| [264] |  GetProcessWorkingDir(PID)       |
| [293] |  GetTextSize(pStr, pSize, pFont, pWeight = 400, pHeight = false)       |
| [301] |  GetTextSize(pStr, pFont="", pHeight=false)       |
| [348] |  monitorInfo()       |
| [365] |  whichMonitor(x="",y="",byref monitorInfo="")       |
| [759] |  GetImageDimensionProperty(ImgPath, Byref width, Byref height, PropertyName="dimensions")       |
| [789] |  GetImageDimensions(ImgPath, Byref width, Byref height)       |
| [799] |  Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r)       |
| [818] |  Redraw(hwnd=0)       |
| [924] |  ShowSurface()       |
| [930] |  HideSurface()       |
| [934] |  WipeSurface(hwnd)       |
| [950] |  EndDraw(hdc)       |
| [955] |  SetPen(color, thickness, hdc)       |
| [969] |  DrawLine(hdc, rX1, rY1, rX2, rY2)       |
| [974] |  DrawRectangle(hdc, left, top, right, bottom)       |
| [1009] |  DrawFrameAroundControl(ControlID, WindowUniqueID, frame_t)       |
| [1076] |  Highlight(reg, delay=1500)       |
| [1175] |  SetAlpha(hwnd, alpha)       |
| [1180] |  CircularText(Angle, Str, Width, Height, Font, Options)       |
| [1206] |  RotateAroundCenter(G, Angle, Width, Height)       |
| [1213] |  Screenshot(outfile, screen)       |
| [1227] |  TakeScreenshot()       |
| [1258] |  CaptureWindow(hwndOwner, hwnd)       |
| [1298] |  HtmlBox(Html, Title="", Timeout=0, Permanent=False, GUIOptions="Resize MaximizeBox Minsize420x320", ControlOptions="W400 H300", Margin=10, Hotkey=True)       |
| [1366] |  EditBox(Text, Title="", Timeout=0, Permanent=False, GUIOptions="Resize MaximizeBox Minsize420x320", ControlOptions="VScroll W400 H300", Margin=10)       |
| [1406] |  Popup(title,action,close=true,image="",w=197,h=46)       |
| [1428] |  GetTextSize(str, size, font,ByRef height,ByRef width)       |
| [1437] |  AddGraphicButtonPlus(ImgPath, Options="", Text="")       |
| [1467] |  PIC_GDI_GUI(GuiName, byref File, GDIx, GDIy , GDIw, GDIh)       |
| [1510] |  FadeGui(guihwnd, fading_time, inout)       |
| [1523] |  ShadowBorder(handle)       |
| [1527] |  FrameShadow(handle)       |
| [1538] |  FrameShadow(HGui)       |
| [1566] |  AddGraphicButtonPlus(ImgPath, Options="", Text="")       |
| [1598] |  RemoveWindowFromTaskbar(WinTitle)       |
| [1631] |  vtable(ptr, n)       |
| [1650] |  ToggleFakeFullscreen()       |
| [1677] |  ListView_HeaderFontSet(p_hwndlv="", p_fontstyle="", p_fontname="")       |
| [1774] |  CreateFont(nHeight, nWidth, nEscapement, nOrientation, fnWeight, fdwItalic, fdwUnderline, fdwStrikeOut, fdwCharSet, fdwOutputPrecision, fdwClipPrecision, fdwQuality, fdwPitchAndFamily, lpszFace)       |
| [1803] |  FullScreenToggleUnderMouse(WT)       |
| [1861] |  Edit_Standard_Params(ByRef Control, ByRef WinTitle)       |
| [1871] |  Edit_TextIsSelected(Control="", WinTitle="")       |
| [1878] |  Edit_GetSelection(ByRef start, ByRef end, Control="", WinTitle="")       |
| [1890] |  Edit_Select(start=0, end=-1, Control="", WinTitle="")       |
| [1902] |  Edit_SelectLine(line=0, include_newline=false, Control="", WinTitle="")       |
| [1934] |  Edit_DeleteLine(line=0, Control="", WinTitle="")       |
| [1992] |  screenDims()       |
| [2001] |  DPIFactor()       |
| [2013] |  ControlExists(class)       |
| [2025] |  GetFocusedControl()       |
| [2057] |  GetControls(hwnd, controls="")       |
| [2084] |  GetOtherControl(refHwnd,shift,controls,type="hwnd")       |
| [2090] |  ListControls(hwnd, obj=0, arr="")       |
| [2111] |  Control_GetClassNN( hWnd,hCtrl )       |
| [2121] |  ControlGetClassNN(hWndWindow,hWndControl)       |
| [2153] |  IsControlFocused(hwnd)       |
| [2158] |  getControlNameByHwnd(winHwnd,controlHwnd)       |
| [2175] |  getByControlName(winHwnd,name)       |
| [2209] |  IsOverTitleBar(x, y, hWnd)       |
| [2217] |  WinGetPosEx(hWindow,ByRef X="",ByRef Y="",ByRef Width="",ByRef Height="",ByRef Offset_X="",ByRef Offset_Y="")       |
| [2391] |  GetParent(hWnd)       |
| [2395] |  GetWindow(hWnd,uCmd)       |
| [2399] |  GetForegroundWindow()       |
| [2403] |  IsWindowVisible(hWnd)       |
| [2407] |  IsFullScreen()       |
| [2412] |  IsClosed(win, wait)       |
| [2417] |  getProcessBaseAddress(WindowTitle, MatchMode=3)       |
| [2431] |  GetClassLong(hWnd, Param)       |
| [2436] |  GetWindowLong(hWnd, Param)       |
| [2441] |  GetClassStyles(Style)       |
| [2466] |  GetTabOrderIndex(hWnd)       |
| [2492] |  GetCursor(CursorHandle)       |
| [2497] |  GetExtraStyle(hWnd)       |
| [2516] |  GetToolbarItems(hToolbar)       |
| [2573] |  ControlGetTabs(hTab)       |
| [2634] |  GetHeaderInfo(hHeader)       |
| [2696] |  GetClientCoords(hWnd, ByRef x, ByRef y)       |
| [2706] |  GetWindowCoords(hWnd, ByRef x, ByRef y)       |
| [2713] |  GetWindowPos(hWnd, ByRef X, ByRef Y, ByRef W, ByRef H)       |
| [2723] |  GetWindowPlacement(hWnd)       |
| [2737] |  GetWindowInfo(hWnd)       |
| [2759] |  GetParent(hWnd)       |
| [2763] |  GetOwner(hWnd)       |
| [2825] |  IsWindow(hWnd)       |
| [2829] |  IsWindowVisible(hWnd)       |
| [2833] |  GetClassName(hWnd)       |
| [2839] |  WinForms_GetClassNN(WinID, fromElement, ElementName)       |
| [2869] |  FindChildWindow(Parent, ChildWinTitle, DetectHiddenWindow="On")       |
| [2915] |  EnumChildWindow(hwnd, lParam)       |
| [2928] |  WinGetMinMaxState(hwnd)       |
| [2945] |  GetMenu(hWnd)       |
| [2950] |  GetSubMenu(hMenu, nPos)       |
| [2954] |  GetMenuItemCount(hMenu)       |
| [2958] |  GetMenuItemID(hMenu, nPos)       |
| [2962] |  GetMenuString(hMenu, uIDItem)       |
| [2977] |  MenuGetAll(hwnd)       |
| [2984] |  MenuGetAll_sub(menu, prefix, ByRef cmds)       |
| [3007] |  GetContextMenuState(hWnd, Position)       |
| [3045] |  GetContextMenuID(hWnd, Position)       |
| [3068] |  GetContextMenuText(hWnd, Position)       |
| [3126] |  ExtractInteger(ByRef pSource, pOffset = 0, pIsSigned = false, pSize = 4)       |
| [3150] |  InsertInteger(pInteger, ByRef pDest, pOffset = 0, pSize = 4)       |
| [3166] |  GetListViewItemText(item_index, sub_index, ctrl_id, win_id)       |
| [3182] |  GetListViewText(hListView, iItem, iSubItem, ByRef lpString, nMaxCount)       |
| [3270] |  TabCtrl_GetCurSel(HWND)       |
| [3278] |  TabCtrl_GetItemText(HWND, Index = 0)       |
| [3311] |  SetError(ErrorValue, ReturnValue)       |
| [3420] |  GetImageType(PID)       |
| [3440] |  GetStatusBarText(hWnd)       |
| [3477] |  SureControlClick(CName, WinTitle, WinText="")       |
| [3494] |  SureControlCheck(CName, WinTitle, WinText="")       |
| [3516] |  ControlClick2(X, Y, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")       |
| [3525] |  ControlFromPoint(X, Y, WinTitle="", WinText="", ByRef cX="", ByRef cY="", ExcludeTitle="", ExcludeText="")       |
| [3545] |  EnumChildFindPoint(aWnd, lParam)       |
| [3583] |  WinWaitForMinimized(ByRef winID, timeOut = 1000)       |
| [3601] |  CenterWindow(aWidth,aHeight)       |
| [3650] |  CenterControl(hWnd,hCtrl,X=1,Y=1)       |
| [3713] |  TryKillWin(win)       |
| [3731] |  Win32_SendMessage(win)       |
| [3743] |  Win32_TaskKill(win)       |
| [3752] |  Win32_Terminate(win)       |
| [3763] |  TabActivate(no)       |
| [3771] |  FocuslessScroll(Function inside)       |
| [3784] |  FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)       |
| [3825] |  LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)       |
| [3837] |  If(AccelerationType = "P")       |
| [3872] |  FocuslessScrollHorizontal(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)       |
| [3902] |  Menu_Show( hMenu, hWnd=0, mX="", mY="", Flags=0x1 )       |
| [3927] |  CatMull_ControlMove( px0, py0, px1, py1, px2, py2, px3, py3, Segments=8, Rel=0, Speed=2 )       |
| [3994] |  InvokeVerb(path, menu, validate=True)       |
| [4022] |  Function_Eject(Drive)       |
| [4054] |  FileGetDetail(FilePath, Index)       |
| [4065] |  FileGetDetails(FilePath)       |
| [4081] |  DirExist(dirPath)       |
| [4085] |  GetDetails()       |
| [4099] |  Start(Target, Minimal = false, Title = "")       |
| [4118] |  IsFileEqual(filename1, filename2)       |
| [4287] |  ExtractAssociatedIcon(ByRef ipath, ByRef idx)       |
| [4300] |  ExtractAssociatedIconEx(ByRef ipath, ByRef idx, ByRef iID)       |
| [4313] |  DestroyIcon(hIcon)       |
| [4317] |  listfunc(file)       |
| [4599] |  ReceiveData(wParam, lParam)       |
| [4641] |  HDrop(fnames,x=0,y=0)       |
| [4672] |  WM_MOVE(wParam, lParam, nMsg, hWnd)       |
| [4696] |  WM_WINDOWPOSCHANGING(wParam, lParam)       |
| [4712] |  CallNextHookEx(nCode, wParam, lParam, hHook = 0)       |
| [4716] |  WM_DEVICECHANGE( wParam, lParam)       |
| [4763] |  DownloadFile(url, file, info="")       |
| [4786] |  NewLinkMsg(VideoSite, VideoName = "")       |
| [4800] |  TimeGap(ntp="de.pool.ntp.org")       |
| [4808] |  GetSourceURL( str )       |
| [4843] |  GetHTMLFragment()       |
| [4862] |  ScrubFragmentIdents( HTMFrag )       |
| [4872] |  EnumClipFormats()       |
| [4880] |  GetClipFormatNames( FmtArr )       |
| [4899] |  GoogleTranslate(phrase,LangIn,LangOut)       |
| [4918] |  getText(byref html)       |
| [4932] |  getHtmlById(byref html,id,outer=false)       |
| [4937] |  getTextById(byref html,id,trim=true)       |
| [4941] |  getHtmlByTagName(byref html,tagName,outer=false)       |
| [4949] |  getTextByTagName(byref html,tagName,trim=true)       |
| [4968] |  Min(x, y)       |
| [4972] |  Max(x, y)       |
| [4983] |  ObjMerge(OrigObj, MergingObj, MergeBase=True)       |
| [4998] |  evalRPN(s)       |
| [5027] |  StackShow(stack)       |
| [5041] |  Sort2DArray(Byref TDArray, KeyName, Order=1)       |
| [5061] |  SortArray(Array, Order="A")       |
| [5093] |  GetNestedTag(data,tag,occurrence="1")       |
| [5123] |  GetHTMLbyID(HTMLSource, ID, Format=0)       |
| [5136] |  GetHTMLbyTag(HTMLSource, Tag, Occurrence=1, Format=0)       |
| [5149] |  GetXmlElement(xml, pathToElement)       |
| [5165] |  sXMLget( xml, node, attr = "" )       |
| [5175] |  ParseJsonStrToArr(json_data)       |
| [5207] |  parseJSON(txt)       |
| [5226] |  AddTrailingBackslash(ptext)       |
| [5233] |  CheckQuotes(Path)       |
| [5242] |  ReplaceForbiddenChars(S_IN, ReplaceByStr = "")       |
| [5254] |  cleanlines(ByRef txt)       |
| [5268] |  cleancolon(txt)       |
| [5277] |  cleanspace(ByRef txt)       |
| [5290] |  uriEncode(str)       |
| [5305] |  EnsureEndsWith(string, char)       |
| [5312] |  EnsureStartsWith(string, char)       |
| [5319] |  StrPutVar(string, ByRef var, encoding)       |
| [5344] |  Ansi2Unicode(ByRef sString, ByRef wString, CP = 0)       |
| [5364] |  Unicode2Ansi(ByRef wString, ByRef sString, CP = 0)       |
| [5524] |  QuickAux(Arr,Ascend, N, LI, NCol)       |
| [5664] |  DelaySend(Key, Interval=200, SendMethod="Send")       |
| [5710] |  SetLayout(layout, winid)       |
| [5721] |  ShowTrayBalloon(TipTitle = "", TipText = "", ShowTime = 5000, TipType = 1)       |
| [5746] |  CreateHotkeyWindow(key)       |
| [5766] |  GetTextSize(str, size, font,ByRef height,ByRef width)       |
| [5789] |  CreateNamedPipe(Name, OpenMode=3, PipeMode=0, MaxInstances=255)       |
| [5794] |  RestoreCursors()       |
| [5799] |  SetSystemCursor( Cursor = "", cx = 0, cy = 0 )       |
| [5880] |  SetTimerF( Function, Period=0, ParmObject=0, Priority=0 )       |
| [5985] |  GlobalVarsScript(var="",size=102400,ByRef object=0)       |
| [6008] |  patternScan(pattern, haystackAddress, haystackSize)       |
| [6099] |  scanInBuf(haystackAddr, needleAddr, haystackSize, needleSize, StartOffset = 0)       |
| [6132] |  hexToBinaryBuffer(hexString, byRef buffer)       |
| [6191] |  TaskDialogToUnicode(String, ByRef Var)       |
| [6197] |  TaskDialogCallback(H, N, W, L, D)       |
| [6215] |  RegRead64(sRootKey, sKeyName, sValueName = "", DataMaxSize=1024)       |
| [6307] |  RegWrite64(sValueType, sRootKey, sKeyName, sValueName = "", sValue = "")       |
| [6362] |  ExtractData(pointer)       |
| [6380] |  GetDllBase(DllName, PID = 0)       |
| [6402] |  getProcBaseFromModules(process)       |
| [6462] |  getURL(t)       |
| [6566] |  getControlNameByHwnd(_, controlHwnd)       |
| [6584] |  Acc_Get(Cmd, ChildPath="", ChildID=0, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")       |
| [6634] |  Acc_Error(p="")       |
| [6638] |  Acc_ChildrenByRole(Acc, Role)       |
| [6658] |  VARIANTstruct()       |
| [6680] |  listAccChildProperty(hwnd)       |
| [6736] |  IEGet(name="")       |
| [6744] |  IEGet(name="")       |
| [6758] |  WBGet(WinTitle="ahk_class IEFrame", Svr#=1)       |
| [6772] |  WBGet(WinTitle="ahk_class IEFrame", Svr#=1)       |
| [6786] |  WBGet(WinTitle="ahk_class IEFrame", Svr#=1)       |
| [6843] |  GetAllInputChars()       |
| [6852] |  CalcAddrHash(addr, length, algid, byref hash = 0, byref hashlength = 0)       |
| [6883] |  CalcStringHash(string, algid, encoding = "utf-8", byref hash = 0, byref hashlength = 0)       |
| [6891] |  getNetControl(winHwnd, controlName="", accName="", classNN="", accHelp="")       |
| [6945] |  LoadScriptString(scriptResource)       |
| [6964] |  LoadScriptResource(Name, ByRef DataSize = 0, Type = 10)       |
| [6973] |  ResourceHackerIcons(dotIcoFile)       |

