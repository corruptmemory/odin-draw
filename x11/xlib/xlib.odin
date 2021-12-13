package xlib

import _c "core:c"

XPointer :: cstring
XExtData :: Xextdata
XExtCodes :: AnonymousStruct0
XPixmapFormatValues :: AnonymousStruct1
XgcValues :: AnonymousStruct2
Gc :: ^Xgc
Visual :: AnonymousStruct3
Depth :: AnonymousStruct4
Screen :: AnonymousStruct5
WcharT :: u16
KeyCode :: u8
Font :: u32
Pixmap :: u32
GContext :: u32
Drawable :: u32
Cursor :: u32
Colormap :: u32
VisualId :: u32
Atom :: u32
Window :: u32
Xid :: u32
Time :: u32
Status :: i32
Bool :: i32
ScreenFormat :: AnonymousStruct6
XSetWindowAttributes :: AnonymousStruct7
XWindowAttributes :: AnonymousStruct8
XHostAddress :: AnonymousStruct9
XServerInterpretedAddress :: AnonymousStruct10
XImage :: Ximage
XWindowChanges :: AnonymousStruct11
XColor :: AnonymousStruct12
XSegment :: AnonymousStruct13
XPoint :: AnonymousStruct14
XRectangle :: AnonymousStruct15
XArc :: AnonymousStruct16
XKeyboardControl :: AnonymousStruct17
XKeyboardState :: AnonymousStruct18
XTimeCoord :: AnonymousStruct19
XModifierKeymap :: AnonymousStruct20
Display :: Xdisplay
Xprivdisplay :: ^AnonymousStruct21
XKeyEvent :: AnonymousStruct22
XKeyPressedEvent :: XKeyEvent
XKeyReleasedEvent :: XKeyEvent
XButtonEvent :: AnonymousStruct23
XButtonPressedEvent :: XButtonEvent
XButtonReleasedEvent :: XButtonEvent
XMotionEvent :: AnonymousStruct24
XPointerMovedEvent :: XMotionEvent
XCrossingEvent :: AnonymousStruct25
XEnterWindowEvent :: XCrossingEvent
XLeaveWindowEvent :: XCrossingEvent
XFocusChangeEvent :: AnonymousStruct26
XFocusInEvent :: XFocusChangeEvent
XFocusOutEvent :: XFocusChangeEvent
XKeymapEvent :: AnonymousStruct27
XExposeEvent :: AnonymousStruct28
XGraphicsExposeEvent :: AnonymousStruct29
XNoExposeEvent :: AnonymousStruct30
XVisibilityEvent :: AnonymousStruct31
XCreateWindowEvent :: AnonymousStruct32
XDestroyWindowEvent :: AnonymousStruct33
XUnmapEvent :: AnonymousStruct34
XMapEvent :: AnonymousStruct35
XMapRequestEvent :: AnonymousStruct36
XReparentEvent :: AnonymousStruct37
XConfigureEvent :: AnonymousStruct38
XGravityEvent :: AnonymousStruct39
XResizeRequestEvent :: AnonymousStruct40
XConfigureRequestEvent :: AnonymousStruct41
XCirculateEvent :: AnonymousStruct42
XCirculateRequestEvent :: AnonymousStruct43
XPropertyEvent :: AnonymousStruct44
XSelectionClearEvent :: AnonymousStruct45
XSelectionRequestEvent :: AnonymousStruct46
XSelectionEvent :: AnonymousStruct47
XColormapEvent :: AnonymousStruct48
XClientMessageEvent :: AnonymousStruct49
XMappingEvent :: AnonymousStruct50
XErrorEvent :: AnonymousStruct51
XAnyEvent :: AnonymousStruct52
XGenericEvent :: AnonymousStruct53
XGenericEventCookie :: AnonymousStruct54
XEvent :: Xevent
XCharStruct :: AnonymousStruct55
XFontProp :: AnonymousStruct56
XFontStruct :: AnonymousStruct57
XTextItem :: AnonymousStruct58
XChar2B :: AnonymousStruct59
XTextItem16 :: AnonymousStruct60
XeDataObject :: AnonymousUnion1
XFontSetExtents :: AnonymousStruct61
Xom :: ^XomT
Xoc :: ^XocT
XFontSet :: ^Xoc
XmbTextItem :: AnonymousStruct62
XwcTextItem :: AnonymousStruct63
XomCharSetList :: AnonymousStruct64
XOrientation :: AnonymousEnum0
XomOrientation :: AnonymousStruct65
XomFontInfo :: AnonymousStruct66
Xim :: ^XimT
Xic :: ^XicT
XimProc :: #type proc()
XicProc :: #type proc()
XidProc :: #type proc()
XimStyle :: _c.ulong
XimStyles :: AnonymousStruct67
XVaNestedList :: rawptr
XimCallback :: AnonymousStruct68
XicCallback :: AnonymousStruct69
XimFeedback :: _c.ulong
XimText :: Ximtext
XimPreeditState :: _c.ulong
XimPreeditStateNotifyCallbackStruct :: Ximpreeditstatenotifycallbackstruct
XimResetState :: _c.ulong
XimStringConversionFeedback :: _c.ulong
XimStringConversionText :: Ximstringconversiontext
XimStringConversionPosition :: _c.ushort
XimStringConversionType :: _c.ushort
XimStringConversionOperation :: _c.ushort
XimCaretDirection :: AnonymousEnum1
XimStringConversionCallbackStruct :: Ximstringconversioncallbackstruct
XimPreeditDrawCallbackStruct :: Ximpreeditdrawcallbackstruct
XimCaretStyle :: AnonymousEnum2
XimPreeditCaretCallbackStruct :: Ximpreeditcaretcallbackstruct
XimStatusDataType :: AnonymousEnum3
XimStatusDrawCallbackStruct :: Ximstatusdrawcallbackstruct
XimHotKeyTrigger :: Ximhotkeytrigger
XimHotKeyTriggers :: Ximhotkeytriggers
XimHotKeyState :: _c.ulong
XimValuesList :: AnonymousStruct70
XErrorHandler :: #type proc()
XioErrorHandler :: #type proc()
XConnectionWatchProc :: #type proc()

AnonymousEnum0 :: enum i32 {
    XomorientationLtrTtb,
    XomorientationRtlTtb,
    XomorientationTtbLtr,
    XomorientationTtbRtl,
    XomorientationContext,
}

AnonymousEnum1 :: enum i32 {
    XimForwardChar,
    XimBackwardChar,
    XimForwardWord,
    XimBackwardWord,
    XimCaretUp,
    XimCaretDown,
    XimNextLine,
    XimPreviousLine,
    XimLineStart,
    XimLineEnd,
    XimAbsolutePosition,
    XimDontChange,
}

AnonymousEnum2 :: enum i32 {
    XimIsInvisible,
    XimIsPrimary,
    XimIsSecondary,
}

AnonymousEnum3 :: enum i32 {
    XimTextType,
    XimBitmapType,
}

Xextdata :: struct {
    number : _c.int,
    next : ^Xextdata,
    freePrivate : #type proc(),
    privateData : XPointer,
}

AnonymousStruct0 :: struct {
    extension : _c.int,
    majorOpcode : _c.int,
    firstEvent : _c.int,
    firstError : _c.int,
}

AnonymousStruct1 :: struct {
    depth : _c.int,
    bitsPerPixel : _c.int,
    scanlinePad : _c.int,
}

AnonymousStruct2 :: struct {
    function : _c.int,
    planeMask : _c.ulong,
    foreground : _c.ulong,
    background : _c.ulong,
    lineWidth : _c.int,
    lineStyle : _c.int,
    capStyle : _c.int,
    joinStyle : _c.int,
    fillStyle : _c.int,
    fillRule : _c.int,
    arcMode : _c.int,
    tile : Pixmap,
    stipple : Pixmap,
    tsX_origin : _c.int,
    tsY_origin : _c.int,
    font : Font,
    subwindowMode : _c.int,
    graphicsExposures : _c.int,
    clipX_origin : _c.int,
    clipY_origin : _c.int,
    clipMask : Pixmap,
    dashOffset : _c.int,
    dashes : _c.char,
}

Xgc :: struct {}

AnonymousStruct3 :: struct {
    extData : ^XExtData,
    visualid : VisualId,
    class : _c.int,
    redMask : _c.ulong,
    greenMask : _c.ulong,
    blueMask : _c.ulong,
    bitsPerRgb : _c.int,
    mapEntries : _c.int,
}

AnonymousStruct4 :: struct {
    depth : _c.int,
    nvisuals : _c.int,
    visuals : ^Visual,
}

Xdisplay :: struct {}

AnonymousStruct5 :: struct {
    extData : ^XExtData,
    display : ^Xdisplay,
    root : Window,
    width : _c.int,
    height : _c.int,
    mwidth : _c.int,
    mheight : _c.int,
    ndepths : _c.int,
    depths : ^Depth,
    rootDepth : _c.int,
    rootVisual : ^Visual,
    defaultGc : Gc,
    cmap : Colormap,
    whitePixel : _c.ulong,
    blackPixel : _c.ulong,
    maxMaps : _c.int,
    minMaps : _c.int,
    backingStore : _c.int,
    saveUnders : _c.int,
    rootInputMask : _c.long,
}

AnonymousStruct6 :: struct {
    extData : ^XExtData,
    depth : _c.int,
    bitsPerPixel : _c.int,
    scanlinePad : _c.int,
}

AnonymousStruct7 :: struct {
    backgroundPixmap : Pixmap,
    backgroundPixel : _c.ulong,
    borderPixmap : Pixmap,
    borderPixel : _c.ulong,
    bitGravity : _c.int,
    winGravity : _c.int,
    backingStore : _c.int,
    backingPlanes : _c.ulong,
    backingPixel : _c.ulong,
    saveUnder : _c.int,
    eventMask : _c.long,
    doNotPropagateMask : _c.long,
    overrideRedirect : _c.int,
    colormap : Colormap,
    cursor : Cursor,
}

AnonymousStruct8 :: struct {
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    borderWidth : _c.int,
    depth : _c.int,
    visual : ^Visual,
    root : Window,
    class : _c.int,
    bitGravity : _c.int,
    winGravity : _c.int,
    backingStore : _c.int,
    backingPlanes : _c.ulong,
    backingPixel : _c.ulong,
    saveUnder : _c.int,
    colormap : Colormap,
    mapInstalled : _c.int,
    mapState : _c.int,
    allEventMasks : _c.long,
    yourEventMask : _c.long,
    doNotPropagateMask : _c.long,
    overrideRedirect : _c.int,
    screen : ^Screen,
}

AnonymousStruct9 :: struct {
    family : _c.int,
    length : _c.int,
    address : cstring,
}

AnonymousStruct10 :: struct {
    typelength : _c.int,
    valuelength : _c.int,
    type : cstring,
    value : cstring,
}

Ximage :: struct {
    width : _c.int,
    height : _c.int,
    xoffset : _c.int,
    format : _c.int,
    data : cstring,
    byteOrder : _c.int,
    bitmapUnit : _c.int,
    bitmapBitOrder : _c.int,
    bitmapPad : _c.int,
    depth : _c.int,
    bytesPerLine : _c.int,
    bitsPerPixel : _c.int,
    redMask : _c.ulong,
    greenMask : _c.ulong,
    blueMask : _c.ulong,
    obdata : XPointer,
    f : Funcs,
}

Funcs :: struct {
    createImage : #type proc(),
    destroyImage : #type proc(),
    getPixel : #type proc(),
    putPixel : #type proc(),
    subImage : #type proc(),
    addPixel : #type proc(),
}

AnonymousStruct11 :: struct {
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    borderWidth : _c.int,
    sibling : Window,
    stackMode : _c.int,
}

AnonymousStruct12 :: struct {
    pixel : _c.ulong,
    red : _c.ushort,
    green : _c.ushort,
    blue : _c.ushort,
    flags : _c.char,
    pad : _c.char,
}

AnonymousStruct13 :: struct {
    x1 : _c.short,
    y1 : _c.short,
    x2 : _c.short,
    y2 : _c.short,
}

AnonymousStruct14 :: struct {
    x : _c.short,
    y : _c.short,
}

AnonymousStruct15 :: struct {
    x : _c.short,
    y : _c.short,
    width : _c.ushort,
    height : _c.ushort,
}

AnonymousStruct16 :: struct {
    x : _c.short,
    y : _c.short,
    width : _c.ushort,
    height : _c.ushort,
    angle1 : _c.short,
    angle2 : _c.short,
}

AnonymousStruct17 :: struct {
    keyClickPercent : _c.int,
    bellPercent : _c.int,
    bellPitch : _c.int,
    bellDuration : _c.int,
    led : _c.int,
    ledMode : _c.int,
    key : _c.int,
    autoRepeatMode : _c.int,
}

AnonymousStruct18 :: struct {
    keyClickPercent : _c.int,
    bellPercent : _c.int,
    bellPitch : _c.uint,
    bellDuration : _c.int,
    ledMask : _c.ulong,
    globalAutoRepeat : _c.int,
    autoRepeats : [32]_c.char,
}

AnonymousStruct19 :: struct {
    time : Time,
    x : _c.short,
    y : _c.short,
}

AnonymousStruct20 :: struct {
    maxKeypermod : _c.int,
    modifiermap : ^KeyCode,
}

Xprivate :: struct {}

Xrmhashbucketrec :: struct {}

AnonymousStruct21 :: struct {
    extData : ^XExtData,
    private1 : ^Xprivate,
    fd : _c.int,
    private2 : _c.int,
    protoMajorVersion : _c.int,
    protoMinorVersion : _c.int,
    vendor : cstring,
    private3 : Xid,
    private4 : Xid,
    private5 : Xid,
    private6 : _c.int,
    resourceAlloc : #type proc(),
    byteOrder : _c.int,
    bitmapUnit : _c.int,
    bitmapPad : _c.int,
    bitmapBitOrder : _c.int,
    nformats : _c.int,
    pixmapFormat : ^ScreenFormat,
    private8 : _c.int,
    release : _c.int,
    private9 : ^Xprivate,
    private10 : ^Xprivate,
    qlen : _c.int,
    lastRequestRead : _c.ulong,
    request : _c.ulong,
    private11 : XPointer,
    private12 : XPointer,
    private13 : XPointer,
    private14 : XPointer,
    maxRequestSize : _c.uint,
    db : ^Xrmhashbucketrec,
    private15 : #type proc(),
    displayName : cstring,
    defaultScreen : _c.int,
    nscreens : _c.int,
    screens : ^Screen,
    motionBuffer : _c.ulong,
    private16 : _c.ulong,
    minKeycode : _c.int,
    maxKeycode : _c.int,
    private17 : XPointer,
    private18 : XPointer,
    private19 : _c.int,
    xdefaults : cstring,
}

AnonymousStruct22 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    root : Window,
    subwindow : Window,
    time : Time,
    x : _c.int,
    y : _c.int,
    x_root : _c.int,
    y_root : _c.int,
    state : _c.uint,
    keycode : _c.uint,
    sameScreen : _c.int,
}

AnonymousStruct23 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    root : Window,
    subwindow : Window,
    time : Time,
    x : _c.int,
    y : _c.int,
    x_root : _c.int,
    y_root : _c.int,
    state : _c.uint,
    button : _c.uint,
    sameScreen : _c.int,
}

AnonymousStruct24 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    root : Window,
    subwindow : Window,
    time : Time,
    x : _c.int,
    y : _c.int,
    x_root : _c.int,
    y_root : _c.int,
    state : _c.uint,
    isHint : _c.char,
    sameScreen : _c.int,
}

AnonymousStruct25 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    root : Window,
    subwindow : Window,
    time : Time,
    x : _c.int,
    y : _c.int,
    x_root : _c.int,
    y_root : _c.int,
    mode : _c.int,
    detail : _c.int,
    sameScreen : _c.int,
    focus : _c.int,
    state : _c.uint,
}

AnonymousStruct26 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    mode : _c.int,
    detail : _c.int,
}

AnonymousStruct27 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    keyVector : [32]_c.char,
}

AnonymousStruct28 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    count : _c.int,
}

AnonymousStruct29 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    drawable : Drawable,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    count : _c.int,
    majorCode : _c.int,
    minorCode : _c.int,
}

AnonymousStruct30 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    drawable : Drawable,
    majorCode : _c.int,
    minorCode : _c.int,
}

AnonymousStruct31 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    state : _c.int,
}

AnonymousStruct32 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    parent : Window,
    window : Window,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    borderWidth : _c.int,
    overrideRedirect : _c.int,
}

AnonymousStruct33 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
}

AnonymousStruct34 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    fromConfigure : _c.int,
}

AnonymousStruct35 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    overrideRedirect : _c.int,
}

AnonymousStruct36 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    parent : Window,
    window : Window,
}

AnonymousStruct37 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    parent : Window,
    x : _c.int,
    y : _c.int,
    overrideRedirect : _c.int,
}

AnonymousStruct38 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    borderWidth : _c.int,
    above : Window,
    overrideRedirect : _c.int,
}

AnonymousStruct39 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    x : _c.int,
    y : _c.int,
}

AnonymousStruct40 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    width : _c.int,
    height : _c.int,
}

AnonymousStruct41 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    parent : Window,
    window : Window,
    x : _c.int,
    y : _c.int,
    width : _c.int,
    height : _c.int,
    borderWidth : _c.int,
    above : Window,
    detail : _c.int,
    valueMask : _c.ulong,
}

AnonymousStruct42 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    event : Window,
    window : Window,
    place : _c.int,
}

AnonymousStruct43 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    parent : Window,
    window : Window,
    place : _c.int,
}

AnonymousStruct44 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    atom : Atom,
    time : Time,
    state : _c.int,
}

AnonymousStruct45 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    selection : Atom,
    time : Time,
}

AnonymousStruct46 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    owner : Window,
    requestor : Window,
    selection : Atom,
    target : Atom,
    property : Atom,
    time : Time,
}

AnonymousStruct47 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    requestor : Window,
    selection : Atom,
    target : Atom,
    property : Atom,
    time : Time,
}

AnonymousStruct48 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    colormap : Colormap,
    new : _c.int,
    state : _c.int,
}

AnonymousStruct49 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    messageType : Atom,
    format : _c.int,
    data : AnonymousUnion0,
}

AnonymousStruct50 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
    request : _c.int,
    firstKeycode : _c.int,
    count : _c.int,
}

AnonymousStruct51 :: struct {
    type : _c.int,
    display : ^Display,
    resourceid : Xid,
    serial : _c.ulong,
    errorCode : _c.uchar,
    requestCode : _c.uchar,
    minorCode : _c.uchar,
}

AnonymousStruct52 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    window : Window,
}

AnonymousStruct53 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    extension : _c.int,
    evtype : _c.int,
}

AnonymousStruct54 :: struct {
    type : _c.int,
    serial : _c.ulong,
    sendEvent : _c.int,
    display : ^Display,
    extension : _c.int,
    evtype : _c.int,
    cookie : _c.uint,
    data : rawptr,
}

AnonymousStruct55 :: struct {
    lbearing : _c.short,
    rbearing : _c.short,
    width : _c.short,
    ascent : _c.short,
    descent : _c.short,
    attributes : _c.ushort,
}

AnonymousStruct56 :: struct {
    name : Atom,
    card32 : _c.ulong,
}

AnonymousStruct57 :: struct {
    extData : ^XExtData,
    fid : Font,
    direction : _c.uint,
    minCharOrByte2 : _c.uint,
    maxCharOrByte2 : _c.uint,
    minByte1 : _c.uint,
    maxByte1 : _c.uint,
    allCharsExist : _c.int,
    defaultChar : _c.uint,
    n_properties : _c.int,
    properties : ^XFontProp,
    minBounds : XCharStruct,
    maxBounds : XCharStruct,
    perChar : ^XCharStruct,
    ascent : _c.int,
    descent : _c.int,
}

AnonymousStruct58 :: struct {
    chars : cstring,
    nchars : _c.int,
    delta : _c.int,
    font : Font,
}

AnonymousStruct59 :: struct {
    byte1 : _c.uchar,
    byte2 : _c.uchar,
}

AnonymousStruct60 :: struct {
    chars : ^XChar2B,
    nchars : _c.int,
    delta : _c.int,
    font : Font,
}

AnonymousStruct61 :: struct {
    maxInkExtent : XRectangle,
    maxLogicalExtent : XRectangle,
}

XomT :: struct {}

XocT :: struct {}

AnonymousStruct62 :: struct {
    chars : cstring,
    nchars : _c.int,
    delta : _c.int,
    fontSet : XFontSet,
}

AnonymousStruct63 :: struct {
    chars : ^WcharT,
    nchars : _c.int,
    delta : _c.int,
    fontSet : XFontSet,
}

AnonymousStruct64 :: struct {
    charsetCount : _c.int,
    charsetList : ^cstring,
}

AnonymousStruct65 :: struct {
    numOrientation : _c.int,
    orientation : ^XOrientation,
}

AnonymousStruct66 :: struct {
    numFont : _c.int,
    fontStructList : ^^XFontStruct,
    fontNameList : ^cstring,
}

XimT :: struct {}

XicT :: struct {}

AnonymousStruct67 :: struct {
    countStyles : _c.ushort,
    supportedStyles : ^_c.ulong,
}

AnonymousStruct68 :: struct {
    clientData : XPointer,
    callback : XimProc,
}

AnonymousStruct69 :: struct {
    clientData : XPointer,
    callback : XicProc,
}

Ximtext :: struct {
    length : _c.ushort,
    feedback : ^_c.ulong,
    encodingIsWchar : _c.int,
    string : AnonymousUnion2,
}

Ximpreeditstatenotifycallbackstruct :: struct {
    state : _c.ulong,
}

Ximstringconversiontext :: struct {
    length : _c.ushort,
    feedback : ^_c.ulong,
    encodingIsWchar : _c.int,
    string : AnonymousUnion3,
}

Ximstringconversioncallbackstruct :: struct {
    position : _c.ushort,
    direction : XimCaretDirection,
    operation : _c.ushort,
    factor : _c.ushort,
    text : ^XimStringConversionText,
}

Ximpreeditdrawcallbackstruct :: struct {
    caret : _c.int,
    chgFirst : _c.int,
    chgLength : _c.int,
    text : ^XimText,
}

Ximpreeditcaretcallbackstruct :: struct {
    position : _c.int,
    direction : XimCaretDirection,
    style : XimCaretStyle,
}

Ximstatusdrawcallbackstruct :: struct {
    type : XimStatusDataType,
    data : AnonymousUnion4,
}

Ximhotkeytrigger :: struct {
    keysym : _c.uint,
    modifier : _c.int,
    modifierMask : _c.int,
}

Ximhotkeytriggers :: struct {
    numHotKey : _c.int,
    key : ^XimHotKeyTrigger,
}

AnonymousStruct70 :: struct {
    countValues : _c.ushort,
    supportedValues : ^cstring,
}

AnonymousUnion0 :: struct #raw_union {
    b : [20]_c.char,
    s : [10]_c.short,
    l : [5]_c.long,
}

Xevent :: struct #raw_union {
    type : _c.int,
    xany : XAnyEvent,
    xkey : XKeyEvent,
    xbutton : XButtonEvent,
    xmotion : XMotionEvent,
    xcrossing : XCrossingEvent,
    xfocus : XFocusChangeEvent,
    xexpose : XExposeEvent,
    xgraphicsexpose : XGraphicsExposeEvent,
    xnoexpose : XNoExposeEvent,
    xvisibility : XVisibilityEvent,
    xcreatewindow : XCreateWindowEvent,
    xdestroywindow : XDestroyWindowEvent,
    xunmap : XUnmapEvent,
    xmap : XMapEvent,
    xmaprequest : XMapRequestEvent,
    xreparent : XReparentEvent,
    xconfigure : XConfigureEvent,
    xgravity : XGravityEvent,
    xresizerequest : XResizeRequestEvent,
    xconfigurerequest : XConfigureRequestEvent,
    xcirculate : XCirculateEvent,
    xcirculaterequest : XCirculateRequestEvent,
    xproperty : XPropertyEvent,
    xselectionclear : XSelectionClearEvent,
    xselectionrequest : XSelectionRequestEvent,
    xselection : XSelectionEvent,
    xcolormap : XColormapEvent,
    xclient : XClientMessageEvent,
    xmapping : XMappingEvent,
    xerror : XErrorEvent,
    xkeymap : XKeymapEvent,
    xgeneric : XGenericEvent,
    xcookie : XGenericEventCookie,
    pad : [24]_c.long,
}

AnonymousUnion1 :: struct #raw_union {
    display : ^Display,
    gc : Gc,
    visual : ^Visual,
    screen : ^Screen,
    pixmapFormat : ^ScreenFormat,
    font : ^XFontStruct,
}

AnonymousUnion2 :: struct #raw_union {
    multiByte : cstring,
    wideChar : ^WcharT,
}

AnonymousUnion3 :: struct #raw_union {
    mbs : cstring,
    wcs : ^WcharT,
}

AnonymousUnion4 :: struct #raw_union {
    text : ^XimText,
    bitmap : Pixmap,
}

foreign import x11_xlib "system:XLib"


@(default_calling_convention="c")
foreign x11_xlib {

    @(link_name="_Xmblen")
    xmblen :: proc(
        str : cstring,
        len : _c.int,
    ) -> _c.int ---

    @(link_name="XLoadQueryFont")
    load_query_font :: proc(
        display : ^Display,
        name : cstring,
    ) -> ^XFontStruct ---

    @(link_name="XQueryFont")
    query_font :: proc(
        display : ^Display,
        fontId : Xid,
    ) -> ^XFontStruct ---

    @(link_name="XGetMotionEvents")
    get_motion_events :: proc(
        display : ^Display,
        w : Window,
        start : Time,
        stop : Time,
        neventsReturn : ^_c.int,
    ) -> ^XTimeCoord ---

    @(link_name="XDeleteModifiermapEntry")
    delete_modifiermap_entry :: proc(
        modmap : ^XModifierKeymap,
        keycodeEntry : KeyCode,
        modifier : _c.int,
    ) -> ^XModifierKeymap ---

    @(link_name="XGetModifierMapping")
    get_modifier_mapping :: proc(display : ^Display) -> ^XModifierKeymap ---

    @(link_name="XInsertModifiermapEntry")
    insert_modifiermap_entry :: proc(
        modmap : ^XModifierKeymap,
        keycodeEntry : KeyCode,
        modifier : _c.int,
    ) -> ^XModifierKeymap ---

    @(link_name="XNewModifiermap")
    new_modifiermap :: proc(maxKeysPerMod : _c.int) -> ^XModifierKeymap ---

    @(link_name="XCreateImage")
    create_image :: proc(
        display : ^Display,
        visual : ^Visual,
        depth : _c.uint,
        format : _c.int,
        offset : _c.int,
        data : cstring,
        width : _c.uint,
        height : _c.uint,
        bitmapPad : _c.int,
        bytesPerLine : _c.int,
    ) -> ^XImage ---

    @(link_name="XInitImage")
    init_image :: proc(image : ^XImage) -> Status ---

    @(link_name="XGetImage")
    get_image :: proc(
        display : ^Display,
        d : Drawable,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        planeMask : _c.ulong,
        format : _c.int,
    ) -> ^XImage ---

    @(link_name="XGetSubImage")
    get_sub_image :: proc(
        display : ^Display,
        d : Drawable,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        planeMask : _c.ulong,
        format : _c.int,
        destImage : ^XImage,
        destX : _c.int,
        destY : _c.int,
    ) -> ^XImage ---

    @(link_name="XOpenDisplay")
    open_display :: proc(displayName : cstring) -> ^Display ---

    @(link_name="XrmInitialize")
    rm_initialize :: proc() ---

    @(link_name="XFetchBytes")
    fetch_bytes :: proc(
        display : ^Display,
        nbytesReturn : ^_c.int,
    ) -> cstring ---

    @(link_name="XFetchBuffer")
    fetch_buffer :: proc(
        display : ^Display,
        nbytesReturn : ^_c.int,
        buffer : _c.int,
    ) -> cstring ---

    @(link_name="XGetAtomName")
    get_atom_name :: proc(
        display : ^Display,
        atom : Atom,
    ) -> cstring ---

    @(link_name="XGetAtomNames")
    get_atom_names :: proc(
        dpy : ^Display,
        atoms : ^Atom,
        count : _c.int,
        namesReturn : ^cstring,
    ) -> Status ---

    @(link_name="XGetDefault")
    get_default :: proc(
        display : ^Display,
        program : cstring,
        option : cstring,
    ) -> cstring ---

    @(link_name="XDisplayName")
    display_name :: proc(string : cstring) -> cstring ---

    @(link_name="XKeysymToString")
    keysym_to_string :: proc(keysym : _c.uint) -> cstring ---

    @(link_name="XInternAtom")
    intern_atom :: proc(
        display : ^Display,
        atomName : cstring,
        onlyIfExists : Bool,
    ) -> Atom ---

    @(link_name="XInternAtoms")
    intern_atoms :: proc(
        dpy : ^Display,
        names : ^cstring,
        count : _c.int,
        onlyIfExists : Bool,
        atomsReturn : ^Atom,
    ) -> Status ---

    @(link_name="XCopyColormapAndFree")
    copy_colormap_and_free :: proc(
        display : ^Display,
        colormap : Colormap,
    ) -> Colormap ---

    @(link_name="XCreateColormap")
    create_colormap :: proc(
        display : ^Display,
        w : Window,
        visual : ^Visual,
        alloc : _c.int,
    ) -> Colormap ---

    @(link_name="XCreatePixmapCursor")
    create_pixmap_cursor :: proc(
        display : ^Display,
        source : Pixmap,
        mask : Pixmap,
        foregroundColor : ^XColor,
        backgroundColor : ^XColor,
        x : _c.uint,
        y : _c.uint,
    ) -> Cursor ---

    @(link_name="XCreateGlyphCursor")
    create_glyph_cursor :: proc(
        display : ^Display,
        sourceFont : Font,
        maskFont : Font,
        sourceChar : _c.uint,
        maskChar : _c.uint,
        foregroundColor : ^XColor,
        backgroundColor : ^XColor,
    ) -> Cursor ---

    @(link_name="XCreateFontCursor")
    create_font_cursor :: proc(
        display : ^Display,
        shape : _c.uint,
    ) -> Cursor ---

    @(link_name="XLoadFont")
    load_font :: proc(
        display : ^Display,
        name : cstring,
    ) -> Font ---

    @(link_name="XCreateGC")
    create_gc :: proc(
        display : ^Display,
        d : Drawable,
        valuemask : _c.ulong,
        values : ^XgcValues,
    ) -> Gc ---

    @(link_name="XGContextFromGC")
    g_context_from_gc :: proc(gc : Gc) -> GContext ---

    @(link_name="XFlushGC")
    flush_gc :: proc(
        display : ^Display,
        gc : Gc,
    ) ---

    @(link_name="XCreatePixmap")
    create_pixmap :: proc(
        display : ^Display,
        d : Drawable,
        width : _c.uint,
        height : _c.uint,
        depth : _c.uint,
    ) -> Pixmap ---

    @(link_name="XCreateBitmapFromData")
    create_bitmap_from_data :: proc(
        display : ^Display,
        d : Drawable,
        data : cstring,
        width : _c.uint,
        height : _c.uint,
    ) -> Pixmap ---

    @(link_name="XCreatePixmapFromBitmapData")
    create_pixmap_from_bitmap_data :: proc(
        display : ^Display,
        d : Drawable,
        data : cstring,
        width : _c.uint,
        height : _c.uint,
        fg : _c.ulong,
        bg : _c.ulong,
        depth : _c.uint,
    ) -> Pixmap ---

    @(link_name="XCreateSimpleWindow")
    create_simple_window :: proc(
        display : ^Display,
        parent : Window,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        borderWidth : _c.uint,
        border : _c.ulong,
        background : _c.ulong,
    ) -> Window ---

    @(link_name="XGetSelectionOwner")
    get_selection_owner :: proc(
        display : ^Display,
        selection : Atom,
    ) -> Window ---

    @(link_name="XCreateWindow")
    create_window :: proc(
        display : ^Display,
        parent : Window,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        borderWidth : _c.uint,
        depth : _c.int,
        class : _c.uint,
        visual : ^Visual,
        valuemask : _c.ulong,
        attributes : ^XSetWindowAttributes,
    ) -> Window ---

    @(link_name="XListInstalledColormaps")
    list_installed_colormaps :: proc(
        display : ^Display,
        w : Window,
        numReturn : ^_c.int,
    ) -> ^Colormap ---

    @(link_name="XListFonts")
    list_fonts :: proc(
        display : ^Display,
        pattern : cstring,
        maxnames : _c.int,
        actualCountReturn : ^_c.int,
    ) -> ^cstring ---

    @(link_name="XListFontsWithInfo")
    list_fonts_with_info :: proc(
        display : ^Display,
        pattern : cstring,
        maxnames : _c.int,
        countReturn : ^_c.int,
        infoReturn : ^^XFontStruct,
    ) -> ^cstring ---

    @(link_name="XGetFontPath")
    get_font_path :: proc(
        display : ^Display,
        npathsReturn : ^_c.int,
    ) -> ^cstring ---

    @(link_name="XListExtensions")
    list_extensions :: proc(
        display : ^Display,
        nextensionsReturn : ^_c.int,
    ) -> ^cstring ---

    @(link_name="XListProperties")
    list_properties :: proc(
        display : ^Display,
        w : Window,
        numPropReturn : ^_c.int,
    ) -> ^Atom ---

    @(link_name="XListHosts")
    list_hosts :: proc(
        display : ^Display,
        nhostsReturn : ^_c.int,
        stateReturn : ^Bool,
    ) -> ^XHostAddress ---

    @(link_name="XKeycodeToKeysym")
    keycode_to_keysym :: proc(
        display : ^Display,
        keycode : KeyCode,
        index : _c.int,
    ) -> _c.uint ---

    @(link_name="XLookupKeysym")
    lookup_keysym :: proc(
        keyEvent : ^XKeyEvent,
        index : _c.int,
    ) -> _c.uint ---

    @(link_name="XGetKeyboardMapping")
    get_keyboard_mapping :: proc(
        display : ^Display,
        firstKeycode : KeyCode,
        keycodeCount : _c.int,
        keysymsPerKeycodeReturn : ^_c.int,
    ) -> ^_c.uint ---

    @(link_name="XStringToKeysym")
    string_to_keysym :: proc(string : cstring) -> _c.uint ---

    @(link_name="XMaxRequestSize")
    max_request_size :: proc(display : ^Display) -> _c.long ---

    @(link_name="XExtendedMaxRequestSize")
    extended_max_request_size :: proc(display : ^Display) -> _c.long ---

    @(link_name="XResourceManagerString")
    resource_manager_string :: proc(display : ^Display) -> cstring ---

    @(link_name="XScreenResourceString")
    screen_resource_string :: proc(screen : ^Screen) -> cstring ---

    @(link_name="XDisplayMotionBufferSize")
    display_motion_buffer_size :: proc(display : ^Display) -> _c.ulong ---

    @(link_name="XVisualIDFromVisual")
    visual_id_from_visual :: proc(visual : ^Visual) -> VisualId ---

    @(link_name="XInitThreads")
    init_threads :: proc() -> Status ---

    @(link_name="XLockDisplay")
    lock_display :: proc(display : ^Display) ---

    @(link_name="XUnlockDisplay")
    unlock_display :: proc(display : ^Display) ---

    @(link_name="XInitExtension")
    init_extension :: proc(
        display : ^Display,
        name : cstring,
    ) -> ^XExtCodes ---

    @(link_name="XAddExtension")
    add_extension :: proc(display : ^Display) -> ^XExtCodes ---

    @(link_name="XFindOnExtensionList")
    find_on_extension_list :: proc(
        structure : ^^XExtData,
        number : _c.int,
    ) -> ^XExtData ---

    @(link_name="XEHeadOfExtensionList")
    e_head_of_extension_list :: proc(object : XeDataObject) -> ^^XExtData ---

    @(link_name="XRootWindow")
    root_window :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> Window ---

    @(link_name="XDefaultRootWindow")
    default_root_window :: proc(display : ^Display) -> Window ---

    @(link_name="XRootWindowOfScreen")
    root_window_of_screen :: proc(screen : ^Screen) -> Window ---

    @(link_name="XDefaultVisual")
    default_visual :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> ^Visual ---

    @(link_name="XDefaultVisualOfScreen")
    default_visual_of_screen :: proc(screen : ^Screen) -> ^Visual ---

    @(link_name="XDefaultGC")
    default_gc :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> Gc ---

    @(link_name="XDefaultGCOfScreen")
    default_gc_of_screen :: proc(screen : ^Screen) -> Gc ---

    @(link_name="XBlackPixel")
    black_pixel :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.ulong ---

    @(link_name="XWhitePixel")
    white_pixel :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.ulong ---

    @(link_name="XAllPlanes")
    all_planes :: proc() -> _c.ulong ---

    @(link_name="XBlackPixelOfScreen")
    black_pixel_of_screen :: proc(screen : ^Screen) -> _c.ulong ---

    @(link_name="XWhitePixelOfScreen")
    white_pixel_of_screen :: proc(screen : ^Screen) -> _c.ulong ---

    @(link_name="XNextRequest")
    next_request :: proc(display : ^Display) -> _c.ulong ---

    @(link_name="XLastKnownRequestProcessed")
    last_known_request_processed :: proc(display : ^Display) -> _c.ulong ---

    @(link_name="XServerVendor")
    server_vendor :: proc(display : ^Display) -> cstring ---

    @(link_name="XDisplayString")
    display_string :: proc(display : ^Display) -> cstring ---

    @(link_name="XDefaultColormap")
    default_colormap :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> Colormap ---

    @(link_name="XDefaultColormapOfScreen")
    default_colormap_of_screen :: proc(screen : ^Screen) -> Colormap ---

    @(link_name="XDisplayOfScreen")
    display_of_screen :: proc(screen : ^Screen) -> ^Display ---

    @(link_name="XScreenOfDisplay")
    screen_of_display :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> ^Screen ---

    @(link_name="XDefaultScreenOfDisplay")
    default_screen_of_display :: proc(display : ^Display) -> ^Screen ---

    @(link_name="XEventMaskOfScreen")
    event_mask_of_screen :: proc(screen : ^Screen) -> _c.long ---

    @(link_name="XScreenNumberOfScreen")
    screen_number_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XSetErrorHandler")
    set_error_handler :: proc(handler : XErrorHandler) -> XErrorHandler ---

    @(link_name="XSetIOErrorHandler")
    set_io_error_handler :: proc(handler : XioErrorHandler) -> XioErrorHandler ---

    @(link_name="XListPixmapFormats")
    list_pixmap_formats :: proc(
        display : ^Display,
        countReturn : ^_c.int,
    ) -> ^XPixmapFormatValues ---

    @(link_name="XListDepths")
    list_depths :: proc(
        display : ^Display,
        screenNumber : _c.int,
        countReturn : ^_c.int,
    ) -> ^_c.int ---

    @(link_name="XReconfigureWMWindow")
    reconfigure_wm_window :: proc(
        display : ^Display,
        w : Window,
        screenNumber : _c.int,
        mask : _c.uint,
        changes : ^XWindowChanges,
    ) -> Status ---

    @(link_name="XGetWMProtocols")
    get_wm_protocols :: proc(
        display : ^Display,
        w : Window,
        protocolsReturn : ^^Atom,
        countReturn : ^_c.int,
    ) -> Status ---

    @(link_name="XSetWMProtocols")
    set_wm_protocols :: proc(
        display : ^Display,
        w : Window,
        protocols : ^Atom,
        count : _c.int,
    ) -> Status ---

    @(link_name="XIconifyWindow")
    iconify_window :: proc(
        display : ^Display,
        w : Window,
        screenNumber : _c.int,
    ) -> Status ---

    @(link_name="XWithdrawWindow")
    withdraw_window :: proc(
        display : ^Display,
        w : Window,
        screenNumber : _c.int,
    ) -> Status ---

    @(link_name="XGetCommand")
    get_command :: proc(
        display : ^Display,
        w : Window,
        argvReturn : ^^cstring,
        argcReturn : ^_c.int,
    ) -> Status ---

    @(link_name="XGetWMColormapWindows")
    get_wm_colormap_windows :: proc(
        display : ^Display,
        w : Window,
        windowsReturn : ^^Window,
        countReturn : ^_c.int,
    ) -> Status ---

    @(link_name="XSetWMColormapWindows")
    set_wm_colormap_windows :: proc(
        display : ^Display,
        w : Window,
        colormapWindows : ^Window,
        count : _c.int,
    ) -> Status ---

    @(link_name="XFreeStringList")
    free_string_list :: proc(list : ^cstring) ---

    @(link_name="XSetTransientForHint")
    set_transient_for_hint :: proc(
        display : ^Display,
        w : Window,
        propWindow : Window,
    ) -> _c.int ---

    @(link_name="XActivateScreenSaver")
    activate_screen_saver :: proc(display : ^Display) -> _c.int ---

    @(link_name="XAddHost")
    add_host :: proc(
        display : ^Display,
        host : ^XHostAddress,
    ) -> _c.int ---

    @(link_name="XAddHosts")
    add_hosts :: proc(
        display : ^Display,
        hosts : ^XHostAddress,
        numHosts : _c.int,
    ) -> _c.int ---

    @(link_name="XAddToExtensionList")
    add_to_extension_list :: proc(
        structure : ^^Xextdata,
        extData : ^XExtData,
    ) -> _c.int ---

    @(link_name="XAddToSaveSet")
    add_to_save_set :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XAllocColor")
    alloc_color :: proc(
        display : ^Display,
        colormap : Colormap,
        screenInOut : ^XColor,
    ) -> Status ---

    @(link_name="XAllocColorCells")
    alloc_color_cells :: proc(
        display : ^Display,
        colormap : Colormap,
        contig : Bool,
        planeMasksReturn : ^_c.ulong,
        nplanes : _c.uint,
        pixelsReturn : ^_c.ulong,
        npixels : _c.uint,
    ) -> Status ---

    @(link_name="XAllocColorPlanes")
    alloc_color_planes :: proc(
        display : ^Display,
        colormap : Colormap,
        contig : Bool,
        pixelsReturn : ^_c.ulong,
        ncolors : _c.int,
        nreds : _c.int,
        ngreens : _c.int,
        nblues : _c.int,
        rmaskReturn : ^_c.ulong,
        gmaskReturn : ^_c.ulong,
        bmaskReturn : ^_c.ulong,
    ) -> Status ---

    @(link_name="XAllocNamedColor")
    alloc_named_color :: proc(
        display : ^Display,
        colormap : Colormap,
        colorName : cstring,
        screenDefReturn : ^XColor,
        exactDefReturn : ^XColor,
    ) -> Status ---

    @(link_name="XAllowEvents")
    allow_events :: proc(
        display : ^Display,
        eventMode : _c.int,
        time : Time,
    ) -> _c.int ---

    @(link_name="XAutoRepeatOff")
    auto_repeat_off :: proc(display : ^Display) -> _c.int ---

    @(link_name="XAutoRepeatOn")
    auto_repeat_on :: proc(display : ^Display) -> _c.int ---

    @(link_name="XBell")
    bell :: proc(
        display : ^Display,
        percent : _c.int,
    ) -> _c.int ---

    @(link_name="XBitmapBitOrder")
    bitmap_bit_order :: proc(display : ^Display) -> _c.int ---

    @(link_name="XBitmapPad")
    bitmap_pad :: proc(display : ^Display) -> _c.int ---

    @(link_name="XBitmapUnit")
    bitmap_unit :: proc(display : ^Display) -> _c.int ---

    @(link_name="XCellsOfScreen")
    cells_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XChangeActivePointerGrab")
    change_active_pointer_grab :: proc(
        display : ^Display,
        eventMask : _c.uint,
        cursor : Cursor,
        time : Time,
    ) -> _c.int ---

    @(link_name="XChangeGC")
    change_gc :: proc(
        display : ^Display,
        gc : Gc,
        valuemask : _c.ulong,
        values : ^XgcValues,
    ) -> _c.int ---

    @(link_name="XChangeKeyboardControl")
    change_keyboard_control :: proc(
        display : ^Display,
        valueMask : _c.ulong,
        values : ^XKeyboardControl,
    ) -> _c.int ---

    @(link_name="XChangeKeyboardMapping")
    change_keyboard_mapping :: proc(
        display : ^Display,
        firstKeycode : _c.int,
        keysymsPerKeycode : _c.int,
        keysyms : ^_c.uint,
        numCodes : _c.int,
    ) -> _c.int ---

    @(link_name="XChangePointerControl")
    change_pointer_control :: proc(
        display : ^Display,
        doAccel : Bool,
        doThreshold : Bool,
        accelNumerator : _c.int,
        accelDenominator : _c.int,
        threshold : _c.int,
    ) -> _c.int ---

    @(link_name="XChangeProperty")
    change_property :: proc(
        display : ^Display,
        w : Window,
        property : Atom,
        type : Atom,
        format : _c.int,
        mode : _c.int,
        data : ^_c.uchar,
        nelements : _c.int,
    ) -> _c.int ---

    @(link_name="XChangeSaveSet")
    change_save_set :: proc(
        display : ^Display,
        w : Window,
        changeMode : _c.int,
    ) -> _c.int ---

    @(link_name="XChangeWindowAttributes")
    change_window_attributes :: proc(
        display : ^Display,
        w : Window,
        valuemask : _c.ulong,
        attributes : ^XSetWindowAttributes,
    ) -> _c.int ---

    @(link_name="XCheckMaskEvent")
    check_mask_event :: proc(
        display : ^Display,
        eventMask : _c.long,
        eventReturn : ^XEvent,
    ) -> Bool ---

    @(link_name="XCheckTypedEvent")
    check_typed_event :: proc(
        display : ^Display,
        eventType : _c.int,
        eventReturn : ^XEvent,
    ) -> Bool ---

    @(link_name="XCheckTypedWindowEvent")
    check_typed_window_event :: proc(
        display : ^Display,
        w : Window,
        eventType : _c.int,
        eventReturn : ^XEvent,
    ) -> Bool ---

    @(link_name="XCheckWindowEvent")
    check_window_event :: proc(
        display : ^Display,
        w : Window,
        eventMask : _c.long,
        eventReturn : ^XEvent,
    ) -> Bool ---

    @(link_name="XCirculateSubwindows")
    circulate_subwindows :: proc(
        display : ^Display,
        w : Window,
        direction : _c.int,
    ) -> _c.int ---

    @(link_name="XCirculateSubwindowsDown")
    circulate_subwindows_down :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XCirculateSubwindowsUp")
    circulate_subwindows_up :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XClearArea")
    clear_area :: proc(
        display : ^Display,
        w : Window,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        exposures : Bool,
    ) -> _c.int ---

    @(link_name="XClearWindow")
    clear_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XCloseDisplay")
    close_display :: proc(display : ^Display) -> _c.int ---

    @(link_name="XConfigureWindow")
    configure_window :: proc(
        display : ^Display,
        w : Window,
        valueMask : _c.uint,
        values : ^XWindowChanges,
    ) -> _c.int ---

    @(link_name="XConnectionNumber")
    connection_number :: proc(display : ^Display) -> _c.int ---

    @(link_name="XConvertSelection")
    convert_selection :: proc(
        display : ^Display,
        selection : Atom,
        target : Atom,
        property : Atom,
        requestor : Window,
        time : Time,
    ) -> _c.int ---

    @(link_name="XCopyArea")
    copy_area :: proc(
        display : ^Display,
        src : Drawable,
        dest : Drawable,
        gc : Gc,
        srcX : _c.int,
        srcY : _c.int,
        width : _c.uint,
        height : _c.uint,
        destX : _c.int,
        destY : _c.int,
    ) -> _c.int ---

    @(link_name="XCopyGC")
    copy_gc :: proc(
        display : ^Display,
        src : Gc,
        valuemask : _c.ulong,
        dest : Gc,
    ) -> _c.int ---

    @(link_name="XCopyPlane")
    copy_plane :: proc(
        display : ^Display,
        src : Drawable,
        dest : Drawable,
        gc : Gc,
        srcX : _c.int,
        srcY : _c.int,
        width : _c.uint,
        height : _c.uint,
        destX : _c.int,
        destY : _c.int,
        plane : _c.ulong,
    ) -> _c.int ---

    @(link_name="XDefaultDepth")
    default_depth :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDefaultDepthOfScreen")
    default_depth_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XDefaultScreen")
    default_screen :: proc(display : ^Display) -> _c.int ---

    @(link_name="XDefineCursor")
    define_cursor :: proc(
        display : ^Display,
        w : Window,
        cursor : Cursor,
    ) -> _c.int ---

    @(link_name="XDeleteProperty")
    delete_property :: proc(
        display : ^Display,
        w : Window,
        property : Atom,
    ) -> _c.int ---

    @(link_name="XDestroyWindow")
    destroy_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XDestroySubwindows")
    destroy_subwindows :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XDoesBackingStore")
    does_backing_store :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XDoesSaveUnders")
    does_save_unders :: proc(screen : ^Screen) -> Bool ---

    @(link_name="XDisableAccessControl")
    disable_access_control :: proc(display : ^Display) -> _c.int ---

    @(link_name="XDisplayCells")
    display_cells :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDisplayHeight")
    display_height :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDisplayHeightMM")
    display_height_mm :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDisplayKeycodes")
    display_keycodes :: proc(
        display : ^Display,
        minKeycodesReturn : ^_c.int,
        maxKeycodesReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XDisplayPlanes")
    display_planes :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDisplayWidth")
    display_width :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDisplayWidthMM")
    display_width_mm :: proc(
        display : ^Display,
        screenNumber : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawArc")
    draw_arc :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        angle1 : _c.int,
        angle2 : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawArcs")
    draw_arcs :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        arcs : ^XArc,
        narcs : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawImageString")
    draw_image_string :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        string : cstring,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawImageString16")
    draw_image_string16 :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        string : ^XChar2B,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawLine")
    draw_line :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x1 : _c.int,
        y1 : _c.int,
        x2 : _c.int,
        y2 : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawLines")
    draw_lines :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        points : ^XPoint,
        npoints : _c.int,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawPoint")
    draw_point :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawPoints")
    draw_points :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        points : ^XPoint,
        npoints : _c.int,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawRectangle")
    draw_rectangle :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
    ) -> _c.int ---

    @(link_name="XDrawRectangles")
    draw_rectangles :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        rectangles : ^XRectangle,
        nrectangles : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawSegments")
    draw_segments :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        segments : ^XSegment,
        nsegments : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawString")
    draw_string :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        string : cstring,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawString16")
    draw_string16 :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        string : ^XChar2B,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawText")
    draw_text :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        items : ^XTextItem,
        nitems : _c.int,
    ) -> _c.int ---

    @(link_name="XDrawText16")
    draw_text16 :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        items : ^XTextItem16,
        nitems : _c.int,
    ) -> _c.int ---

    @(link_name="XEnableAccessControl")
    enable_access_control :: proc(display : ^Display) -> _c.int ---

    @(link_name="XEventsQueued")
    events_queued :: proc(
        display : ^Display,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XFetchName")
    fetch_name :: proc(
        display : ^Display,
        w : Window,
        windowNameReturn : ^cstring,
    ) -> Status ---

    @(link_name="XFillArc")
    fill_arc :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
        angle1 : _c.int,
        angle2 : _c.int,
    ) -> _c.int ---

    @(link_name="XFillArcs")
    fill_arcs :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        arcs : ^XArc,
        narcs : _c.int,
    ) -> _c.int ---

    @(link_name="XFillPolygon")
    fill_polygon :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        points : ^XPoint,
        npoints : _c.int,
        shape : _c.int,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XFillRectangle")
    fill_rectangle :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
    ) -> _c.int ---

    @(link_name="XFillRectangles")
    fill_rectangles :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        rectangles : ^XRectangle,
        nrectangles : _c.int,
    ) -> _c.int ---

    @(link_name="XFlush")
    flush :: proc(display : ^Display) -> _c.int ---

    @(link_name="XForceScreenSaver")
    force_screen_saver :: proc(
        display : ^Display,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XFree")
    free :: proc(data : rawptr) -> _c.int ---

    @(link_name="XFreeColormap")
    free_colormap :: proc(
        display : ^Display,
        colormap : Colormap,
    ) -> _c.int ---

    @(link_name="XFreeColors")
    free_colors :: proc(
        display : ^Display,
        colormap : Colormap,
        pixels : ^_c.ulong,
        npixels : _c.int,
        planes : _c.ulong,
    ) -> _c.int ---

    @(link_name="XFreeCursor")
    free_cursor :: proc(
        display : ^Display,
        cursor : Cursor,
    ) -> _c.int ---

    @(link_name="XFreeExtensionList")
    free_extension_list :: proc(list : ^cstring) -> _c.int ---

    @(link_name="XFreeFont")
    free_font :: proc(
        display : ^Display,
        fontStruct : ^XFontStruct,
    ) -> _c.int ---

    @(link_name="XFreeFontInfo")
    free_font_info :: proc(
        names : ^cstring,
        freeInfo : ^XFontStruct,
        actualCount : _c.int,
    ) -> _c.int ---

    @(link_name="XFreeFontNames")
    free_font_names :: proc(list : ^cstring) -> _c.int ---

    @(link_name="XFreeFontPath")
    free_font_path :: proc(list : ^cstring) -> _c.int ---

    @(link_name="XFreeGC")
    free_gc :: proc(
        display : ^Display,
        gc : Gc,
    ) -> _c.int ---

    @(link_name="XFreeModifiermap")
    free_modifiermap :: proc(modmap : ^XModifierKeymap) -> _c.int ---

    @(link_name="XFreePixmap")
    free_pixmap :: proc(
        display : ^Display,
        pixmap : Pixmap,
    ) -> _c.int ---

    @(link_name="XGeometry")
    geometry :: proc(
        display : ^Display,
        screen : _c.int,
        position : cstring,
        defaultPosition : cstring,
        bwidth : _c.uint,
        fwidth : _c.uint,
        fheight : _c.uint,
        xadder : _c.int,
        yadder : _c.int,
        x_return : ^_c.int,
        y_return : ^_c.int,
        widthReturn : ^_c.int,
        heightReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XGetErrorDatabaseText")
    get_error_database_text :: proc(
        display : ^Display,
        name : cstring,
        message : cstring,
        defaultString : cstring,
        bufferReturn : cstring,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XGetErrorText")
    get_error_text :: proc(
        display : ^Display,
        code : _c.int,
        bufferReturn : cstring,
        length : _c.int,
    ) -> _c.int ---

    @(link_name="XGetFontProperty")
    get_font_property :: proc(
        fontStruct : ^XFontStruct,
        atom : Atom,
        valueReturn : ^_c.ulong,
    ) -> Bool ---

    @(link_name="XGetGCValues")
    get_gc_values :: proc(
        display : ^Display,
        gc : Gc,
        valuemask : _c.ulong,
        valuesReturn : ^XgcValues,
    ) -> Status ---

    @(link_name="XGetGeometry")
    get_geometry :: proc(
        display : ^Display,
        d : Drawable,
        rootReturn : ^Window,
        x_return : ^_c.int,
        y_return : ^_c.int,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
        borderWidthReturn : ^_c.uint,
        depthReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XGetIconName")
    get_icon_name :: proc(
        display : ^Display,
        w : Window,
        iconNameReturn : ^cstring,
    ) -> Status ---

    @(link_name="XGetInputFocus")
    get_input_focus :: proc(
        display : ^Display,
        focusReturn : ^Window,
        revertToReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XGetKeyboardControl")
    get_keyboard_control :: proc(
        display : ^Display,
        valuesReturn : ^XKeyboardState,
    ) -> _c.int ---

    @(link_name="XGetPointerControl")
    get_pointer_control :: proc(
        display : ^Display,
        accelNumeratorReturn : ^_c.int,
        accelDenominatorReturn : ^_c.int,
        thresholdReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XGetPointerMapping")
    get_pointer_mapping :: proc(
        display : ^Display,
        mapReturn : ^_c.uchar,
        nmap : _c.int,
    ) -> _c.int ---

    @(link_name="XGetScreenSaver")
    get_screen_saver :: proc(
        display : ^Display,
        timeoutReturn : ^_c.int,
        intervalReturn : ^_c.int,
        preferBlankingReturn : ^_c.int,
        allowExposuresReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XGetTransientForHint")
    get_transient_for_hint :: proc(
        display : ^Display,
        w : Window,
        propWindowReturn : ^Window,
    ) -> Status ---

    @(link_name="XGetWindowProperty")
    get_window_property :: proc(
        display : ^Display,
        w : Window,
        property : Atom,
        longOffset : _c.long,
        longLength : _c.long,
        delete : Bool,
        reqType : Atom,
        actualTypeReturn : ^Atom,
        actualFormatReturn : ^_c.int,
        nitemsReturn : ^_c.ulong,
        bytesAfterReturn : ^_c.ulong,
        propReturn : ^^_c.uchar,
    ) -> _c.int ---

    @(link_name="XGetWindowAttributes")
    get_window_attributes :: proc(
        display : ^Display,
        w : Window,
        windowAttributesReturn : ^XWindowAttributes,
    ) -> Status ---

    @(link_name="XGrabButton")
    grab_button :: proc(
        display : ^Display,
        button : _c.uint,
        modifiers : _c.uint,
        grabWindow : Window,
        ownerEvents : Bool,
        eventMask : _c.uint,
        pointerMode : _c.int,
        keyboardMode : _c.int,
        confineTo : Window,
        cursor : Cursor,
    ) -> _c.int ---

    @(link_name="XGrabKey")
    grab_key :: proc(
        display : ^Display,
        keycode : _c.int,
        modifiers : _c.uint,
        grabWindow : Window,
        ownerEvents : Bool,
        pointerMode : _c.int,
        keyboardMode : _c.int,
    ) -> _c.int ---

    @(link_name="XGrabKeyboard")
    grab_keyboard :: proc(
        display : ^Display,
        grabWindow : Window,
        ownerEvents : Bool,
        pointerMode : _c.int,
        keyboardMode : _c.int,
        time : Time,
    ) -> _c.int ---

    @(link_name="XGrabPointer")
    grab_pointer :: proc(
        display : ^Display,
        grabWindow : Window,
        ownerEvents : Bool,
        eventMask : _c.uint,
        pointerMode : _c.int,
        keyboardMode : _c.int,
        confineTo : Window,
        cursor : Cursor,
        time : Time,
    ) -> _c.int ---

    @(link_name="XGrabServer")
    grab_server :: proc(display : ^Display) -> _c.int ---

    @(link_name="XHeightMMOfScreen")
    height_mm_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XHeightOfScreen")
    height_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XImageByteOrder")
    image_byte_order :: proc(display : ^Display) -> _c.int ---

    @(link_name="XInstallColormap")
    install_colormap :: proc(
        display : ^Display,
        colormap : Colormap,
    ) -> _c.int ---

    @(link_name="XKeysymToKeycode")
    keysym_to_keycode :: proc(
        display : ^Display,
        keysym : _c.uint,
    ) -> KeyCode ---

    @(link_name="XKillClient")
    kill_client :: proc(
        display : ^Display,
        resource : Xid,
    ) -> _c.int ---

    @(link_name="XLookupColor")
    lookup_color :: proc(
        display : ^Display,
        colormap : Colormap,
        colorName : cstring,
        exactDefReturn : ^XColor,
        screenDefReturn : ^XColor,
    ) -> Status ---

    @(link_name="XLowerWindow")
    lower_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XMapRaised")
    map_raised :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XMapSubwindows")
    map_subwindows :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XMapWindow")
    map_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XMaskEvent")
    mask_event :: proc(
        display : ^Display,
        eventMask : _c.long,
        eventReturn : ^XEvent,
    ) -> _c.int ---

    @(link_name="XMaxCmapsOfScreen")
    max_cmaps_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XMinCmapsOfScreen")
    min_cmaps_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XMoveResizeWindow")
    move_resize_window :: proc(
        display : ^Display,
        w : Window,
        x : _c.int,
        y : _c.int,
        width : _c.uint,
        height : _c.uint,
    ) -> _c.int ---

    @(link_name="XMoveWindow")
    move_window :: proc(
        display : ^Display,
        w : Window,
        x : _c.int,
        y : _c.int,
    ) -> _c.int ---

    @(link_name="XNextEvent")
    next_event :: proc(
        display : ^Display,
        eventReturn : ^XEvent,
    ) -> _c.int ---

    @(link_name="XNoOp")
    no_op :: proc(display : ^Display) -> _c.int ---

    @(link_name="XParseColor")
    parse_color :: proc(
        display : ^Display,
        colormap : Colormap,
        spec : cstring,
        exactDefReturn : ^XColor,
    ) -> Status ---

    @(link_name="XParseGeometry")
    parse_geometry :: proc(
        parsestring : cstring,
        x_return : ^_c.int,
        y_return : ^_c.int,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
    ) -> _c.int ---

    @(link_name="XPeekEvent")
    peek_event :: proc(
        display : ^Display,
        eventReturn : ^XEvent,
    ) -> _c.int ---

    @(link_name="XPending")
    pending :: proc(display : ^Display) -> _c.int ---

    @(link_name="XPlanesOfScreen")
    planes_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XProtocolRevision")
    protocol_revision :: proc(display : ^Display) -> _c.int ---

    @(link_name="XProtocolVersion")
    protocol_version :: proc(display : ^Display) -> _c.int ---

    @(link_name="XPutBackEvent")
    put_back_event :: proc(
        display : ^Display,
        event : ^XEvent,
    ) -> _c.int ---

    @(link_name="XPutImage")
    put_image :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        image : ^XImage,
        srcX : _c.int,
        srcY : _c.int,
        destX : _c.int,
        destY : _c.int,
        width : _c.uint,
        height : _c.uint,
    ) -> _c.int ---

    @(link_name="XQLength")
    q_length :: proc(display : ^Display) -> _c.int ---

    @(link_name="XQueryBestCursor")
    query_best_cursor :: proc(
        display : ^Display,
        d : Drawable,
        width : _c.uint,
        height : _c.uint,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XQueryBestSize")
    query_best_size :: proc(
        display : ^Display,
        class : _c.int,
        whichScreen : Drawable,
        width : _c.uint,
        height : _c.uint,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XQueryBestStipple")
    query_best_stipple :: proc(
        display : ^Display,
        whichScreen : Drawable,
        width : _c.uint,
        height : _c.uint,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XQueryBestTile")
    query_best_tile :: proc(
        display : ^Display,
        whichScreen : Drawable,
        width : _c.uint,
        height : _c.uint,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XQueryColor")
    query_color :: proc(
        display : ^Display,
        colormap : Colormap,
        defInOut : ^XColor,
    ) -> _c.int ---

    @(link_name="XQueryColors")
    query_colors :: proc(
        display : ^Display,
        colormap : Colormap,
        defsInOut : ^XColor,
        ncolors : _c.int,
    ) -> _c.int ---

    @(link_name="XQueryExtension")
    query_extension :: proc(
        display : ^Display,
        name : cstring,
        majorOpcodeReturn : ^_c.int,
        firstEventReturn : ^_c.int,
        firstErrorReturn : ^_c.int,
    ) -> Bool ---

    @(link_name="XQueryKeymap")
    query_keymap :: proc(
        display : ^Display,
        keysReturn : [32]_c.char,
    ) -> _c.int ---

    @(link_name="XQueryPointer")
    query_pointer :: proc(
        display : ^Display,
        w : Window,
        rootReturn : ^Window,
        childReturn : ^Window,
        rootX_return : ^_c.int,
        rootY_return : ^_c.int,
        winX_return : ^_c.int,
        winY_return : ^_c.int,
        maskReturn : ^_c.uint,
    ) -> Bool ---

    @(link_name="XQueryTextExtents")
    query_text_extents :: proc(
        display : ^Display,
        fontId : Xid,
        string : cstring,
        nchars : _c.int,
        directionReturn : ^_c.int,
        fontAscentReturn : ^_c.int,
        fontDescentReturn : ^_c.int,
        overallReturn : ^XCharStruct,
    ) -> _c.int ---

    @(link_name="XQueryTextExtents16")
    query_text_extents16 :: proc(
        display : ^Display,
        fontId : Xid,
        string : ^XChar2B,
        nchars : _c.int,
        directionReturn : ^_c.int,
        fontAscentReturn : ^_c.int,
        fontDescentReturn : ^_c.int,
        overallReturn : ^XCharStruct,
    ) -> _c.int ---

    @(link_name="XQueryTree")
    query_tree :: proc(
        display : ^Display,
        w : Window,
        rootReturn : ^Window,
        parentReturn : ^Window,
        childrenReturn : ^^Window,
        nchildrenReturn : ^_c.uint,
    ) -> Status ---

    @(link_name="XRaiseWindow")
    raise_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XReadBitmapFile")
    read_bitmap_file :: proc(
        display : ^Display,
        d : Drawable,
        filename : cstring,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
        bitmapReturn : ^Pixmap,
        x_hotReturn : ^_c.int,
        y_hotReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XReadBitmapFileData")
    read_bitmap_file_data :: proc(
        filename : cstring,
        widthReturn : ^_c.uint,
        heightReturn : ^_c.uint,
        dataReturn : ^^_c.uchar,
        x_hotReturn : ^_c.int,
        y_hotReturn : ^_c.int,
    ) -> _c.int ---

    @(link_name="XRebindKeysym")
    rebind_keysym :: proc(
        display : ^Display,
        keysym : _c.uint,
        list : ^_c.uint,
        modCount : _c.int,
        string : ^_c.uchar,
        bytesString : _c.int,
    ) -> _c.int ---

    @(link_name="XRecolorCursor")
    recolor_cursor :: proc(
        display : ^Display,
        cursor : Cursor,
        foregroundColor : ^XColor,
        backgroundColor : ^XColor,
    ) -> _c.int ---

    @(link_name="XRefreshKeyboardMapping")
    refresh_keyboard_mapping :: proc(eventMap : ^XMappingEvent) -> _c.int ---

    @(link_name="XRemoveFromSaveSet")
    remove_from_save_set :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XRemoveHost")
    remove_host :: proc(
        display : ^Display,
        host : ^XHostAddress,
    ) -> _c.int ---

    @(link_name="XRemoveHosts")
    remove_hosts :: proc(
        display : ^Display,
        hosts : ^XHostAddress,
        numHosts : _c.int,
    ) -> _c.int ---

    @(link_name="XReparentWindow")
    reparent_window :: proc(
        display : ^Display,
        w : Window,
        parent : Window,
        x : _c.int,
        y : _c.int,
    ) -> _c.int ---

    @(link_name="XResetScreenSaver")
    reset_screen_saver :: proc(display : ^Display) -> _c.int ---

    @(link_name="XResizeWindow")
    resize_window :: proc(
        display : ^Display,
        w : Window,
        width : _c.uint,
        height : _c.uint,
    ) -> _c.int ---

    @(link_name="XRestackWindows")
    restack_windows :: proc(
        display : ^Display,
        windows : ^Window,
        nwindows : _c.int,
    ) -> _c.int ---

    @(link_name="XRotateBuffers")
    rotate_buffers :: proc(
        display : ^Display,
        rotate : _c.int,
    ) -> _c.int ---

    @(link_name="XRotateWindowProperties")
    rotate_window_properties :: proc(
        display : ^Display,
        w : Window,
        properties : ^Atom,
        numProp : _c.int,
        npositions : _c.int,
    ) -> _c.int ---

    @(link_name="XScreenCount")
    screen_count :: proc(display : ^Display) -> _c.int ---

    @(link_name="XSelectInput")
    select_input :: proc(
        display : ^Display,
        w : Window,
        eventMask : _c.long,
    ) -> _c.int ---

    @(link_name="XSendEvent")
    send_event :: proc(
        display : ^Display,
        w : Window,
        propagate : Bool,
        eventMask : _c.long,
        eventSend : ^XEvent,
    ) -> Status ---

    @(link_name="XSetAccessControl")
    set_access_control :: proc(
        display : ^Display,
        mode : _c.int,
    ) -> _c.int ---

    @(link_name="XSetArcMode")
    set_arc_mode :: proc(
        display : ^Display,
        gc : Gc,
        arcMode : _c.int,
    ) -> _c.int ---

    @(link_name="XSetBackground")
    set_background :: proc(
        display : ^Display,
        gc : Gc,
        background : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetClipMask")
    set_clip_mask :: proc(
        display : ^Display,
        gc : Gc,
        pixmap : Pixmap,
    ) -> _c.int ---

    @(link_name="XSetClipOrigin")
    set_clip_origin :: proc(
        display : ^Display,
        gc : Gc,
        clipX_origin : _c.int,
        clipY_origin : _c.int,
    ) -> _c.int ---

    @(link_name="XSetClipRectangles")
    set_clip_rectangles :: proc(
        display : ^Display,
        gc : Gc,
        clipX_origin : _c.int,
        clipY_origin : _c.int,
        rectangles : ^XRectangle,
        n : _c.int,
        ordering : _c.int,
    ) -> _c.int ---

    @(link_name="XSetCloseDownMode")
    set_close_down_mode :: proc(
        display : ^Display,
        closeMode : _c.int,
    ) -> _c.int ---

    @(link_name="XSetCommand")
    set_command :: proc(
        display : ^Display,
        w : Window,
        argv : ^cstring,
        argc : _c.int,
    ) -> _c.int ---

    @(link_name="XSetDashes")
    set_dashes :: proc(
        display : ^Display,
        gc : Gc,
        dashOffset : _c.int,
        dashList : cstring,
        n : _c.int,
    ) -> _c.int ---

    @(link_name="XSetFillRule")
    set_fill_rule :: proc(
        display : ^Display,
        gc : Gc,
        fillRule : _c.int,
    ) -> _c.int ---

    @(link_name="XSetFillStyle")
    set_fill_style :: proc(
        display : ^Display,
        gc : Gc,
        fillStyle : _c.int,
    ) -> _c.int ---

    @(link_name="XSetFont")
    set_font :: proc(
        display : ^Display,
        gc : Gc,
        font : Font,
    ) -> _c.int ---

    @(link_name="XSetFontPath")
    set_font_path :: proc(
        display : ^Display,
        directories : ^cstring,
        ndirs : _c.int,
    ) -> _c.int ---

    @(link_name="XSetForeground")
    set_foreground :: proc(
        display : ^Display,
        gc : Gc,
        foreground : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetFunction")
    set_function :: proc(
        display : ^Display,
        gc : Gc,
        function : _c.int,
    ) -> _c.int ---

    @(link_name="XSetGraphicsExposures")
    set_graphics_exposures :: proc(
        display : ^Display,
        gc : Gc,
        graphicsExposures : Bool,
    ) -> _c.int ---

    @(link_name="XSetIconName")
    set_icon_name :: proc(
        display : ^Display,
        w : Window,
        iconName : cstring,
    ) -> _c.int ---

    @(link_name="XSetInputFocus")
    set_input_focus :: proc(
        display : ^Display,
        focus : Window,
        revertTo : _c.int,
        time : Time,
    ) -> _c.int ---

    @(link_name="XSetLineAttributes")
    set_line_attributes :: proc(
        display : ^Display,
        gc : Gc,
        lineWidth : _c.uint,
        lineStyle : _c.int,
        capStyle : _c.int,
        joinStyle : _c.int,
    ) -> _c.int ---

    @(link_name="XSetModifierMapping")
    set_modifier_mapping :: proc(
        display : ^Display,
        modmap : ^XModifierKeymap,
    ) -> _c.int ---

    @(link_name="XSetPlaneMask")
    set_plane_mask :: proc(
        display : ^Display,
        gc : Gc,
        planeMask : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetPointerMapping")
    set_pointer_mapping :: proc(
        display : ^Display,
        _map : ^_c.uchar,
        nmap : _c.int,
    ) -> _c.int ---

    @(link_name="XSetScreenSaver")
    set_screen_saver :: proc(
        display : ^Display,
        timeout : _c.int,
        interval : _c.int,
        preferBlanking : _c.int,
        allowExposures : _c.int,
    ) -> _c.int ---

    @(link_name="XSetSelectionOwner")
    set_selection_owner :: proc(
        display : ^Display,
        selection : Atom,
        owner : Window,
        time : Time,
    ) -> _c.int ---

    @(link_name="XSetState")
    set_state :: proc(
        display : ^Display,
        gc : Gc,
        foreground : _c.ulong,
        background : _c.ulong,
        function : _c.int,
        planeMask : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetStipple")
    set_stipple :: proc(
        display : ^Display,
        gc : Gc,
        stipple : Pixmap,
    ) -> _c.int ---

    @(link_name="XSetSubwindowMode")
    set_subwindow_mode :: proc(
        display : ^Display,
        gc : Gc,
        subwindowMode : _c.int,
    ) -> _c.int ---

    @(link_name="XSetTSOrigin")
    set_ts_origin :: proc(
        display : ^Display,
        gc : Gc,
        tsX_origin : _c.int,
        tsY_origin : _c.int,
    ) -> _c.int ---

    @(link_name="XSetTile")
    set_tile :: proc(
        display : ^Display,
        gc : Gc,
        tile : Pixmap,
    ) -> _c.int ---

    @(link_name="XSetWindowBackground")
    set_window_background :: proc(
        display : ^Display,
        w : Window,
        backgroundPixel : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetWindowBackgroundPixmap")
    set_window_background_pixmap :: proc(
        display : ^Display,
        w : Window,
        backgroundPixmap : Pixmap,
    ) -> _c.int ---

    @(link_name="XSetWindowBorder")
    set_window_border :: proc(
        display : ^Display,
        w : Window,
        borderPixel : _c.ulong,
    ) -> _c.int ---

    @(link_name="XSetWindowBorderPixmap")
    set_window_border_pixmap :: proc(
        display : ^Display,
        w : Window,
        borderPixmap : Pixmap,
    ) -> _c.int ---

    @(link_name="XSetWindowBorderWidth")
    set_window_border_width :: proc(
        display : ^Display,
        w : Window,
        width : _c.uint,
    ) -> _c.int ---

    @(link_name="XSetWindowColormap")
    set_window_colormap :: proc(
        display : ^Display,
        w : Window,
        colormap : Colormap,
    ) -> _c.int ---

    @(link_name="XStoreBuffer")
    store_buffer :: proc(
        display : ^Display,
        bytes : cstring,
        nbytes : _c.int,
        buffer : _c.int,
    ) -> _c.int ---

    @(link_name="XStoreBytes")
    store_bytes :: proc(
        display : ^Display,
        bytes : cstring,
        nbytes : _c.int,
    ) -> _c.int ---

    @(link_name="XStoreColor")
    store_color :: proc(
        display : ^Display,
        colormap : Colormap,
        color : ^XColor,
    ) -> _c.int ---

    @(link_name="XStoreColors")
    store_colors :: proc(
        display : ^Display,
        colormap : Colormap,
        color : ^XColor,
        ncolors : _c.int,
    ) -> _c.int ---

    @(link_name="XStoreName")
    store_name :: proc(
        display : ^Display,
        w : Window,
        windowName : cstring,
    ) -> _c.int ---

    @(link_name="XStoreNamedColor")
    store_named_color :: proc(
        display : ^Display,
        colormap : Colormap,
        color : cstring,
        pixel : _c.ulong,
        flags : _c.int,
    ) -> _c.int ---

    @(link_name="XSync")
    sync :: proc(
        display : ^Display,
        discard : Bool,
    ) -> _c.int ---

    @(link_name="XTextExtents")
    text_extents :: proc(
        fontStruct : ^XFontStruct,
        string : cstring,
        nchars : _c.int,
        directionReturn : ^_c.int,
        fontAscentReturn : ^_c.int,
        fontDescentReturn : ^_c.int,
        overallReturn : ^XCharStruct,
    ) -> _c.int ---

    @(link_name="XTextExtents16")
    text_extents16 :: proc(
        fontStruct : ^XFontStruct,
        string : ^XChar2B,
        nchars : _c.int,
        directionReturn : ^_c.int,
        fontAscentReturn : ^_c.int,
        fontDescentReturn : ^_c.int,
        overallReturn : ^XCharStruct,
    ) -> _c.int ---

    @(link_name="XTextWidth")
    text_width :: proc(
        fontStruct : ^XFontStruct,
        string : cstring,
        count : _c.int,
    ) -> _c.int ---

    @(link_name="XTextWidth16")
    text_width16 :: proc(
        fontStruct : ^XFontStruct,
        string : ^XChar2B,
        count : _c.int,
    ) -> _c.int ---

    @(link_name="XTranslateCoordinates")
    translate_coordinates :: proc(
        display : ^Display,
        srcW : Window,
        destW : Window,
        srcX : _c.int,
        srcY : _c.int,
        destX_return : ^_c.int,
        destY_return : ^_c.int,
        childReturn : ^Window,
    ) -> Bool ---

    @(link_name="XUndefineCursor")
    undefine_cursor :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XUngrabButton")
    ungrab_button :: proc(
        display : ^Display,
        button : _c.uint,
        modifiers : _c.uint,
        grabWindow : Window,
    ) -> _c.int ---

    @(link_name="XUngrabKey")
    ungrab_key :: proc(
        display : ^Display,
        keycode : _c.int,
        modifiers : _c.uint,
        grabWindow : Window,
    ) -> _c.int ---

    @(link_name="XUngrabKeyboard")
    ungrab_keyboard :: proc(
        display : ^Display,
        time : Time,
    ) -> _c.int ---

    @(link_name="XUngrabPointer")
    ungrab_pointer :: proc(
        display : ^Display,
        time : Time,
    ) -> _c.int ---

    @(link_name="XUngrabServer")
    ungrab_server :: proc(display : ^Display) -> _c.int ---

    @(link_name="XUninstallColormap")
    uninstall_colormap :: proc(
        display : ^Display,
        colormap : Colormap,
    ) -> _c.int ---

    @(link_name="XUnloadFont")
    unload_font :: proc(
        display : ^Display,
        font : Font,
    ) -> _c.int ---

    @(link_name="XUnmapSubwindows")
    unmap_subwindows :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XUnmapWindow")
    unmap_window :: proc(
        display : ^Display,
        w : Window,
    ) -> _c.int ---

    @(link_name="XVendorRelease")
    vendor_release :: proc(display : ^Display) -> _c.int ---

    @(link_name="XWarpPointer")
    warp_pointer :: proc(
        display : ^Display,
        srcW : Window,
        destW : Window,
        srcX : _c.int,
        srcY : _c.int,
        srcWidth : _c.uint,
        srcHeight : _c.uint,
        destX : _c.int,
        destY : _c.int,
    ) -> _c.int ---

    @(link_name="XWidthMMOfScreen")
    width_mm_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XWidthOfScreen")
    width_of_screen :: proc(screen : ^Screen) -> _c.int ---

    @(link_name="XWindowEvent")
    window_event :: proc(
        display : ^Display,
        w : Window,
        eventMask : _c.long,
        eventReturn : ^XEvent,
    ) -> _c.int ---

    @(link_name="XWriteBitmapFile")
    write_bitmap_file :: proc(
        display : ^Display,
        filename : cstring,
        bitmap : Pixmap,
        width : _c.uint,
        height : _c.uint,
        x_hot : _c.int,
        y_hot : _c.int,
    ) -> _c.int ---

    @(link_name="XSupportsLocale")
    supports_locale :: proc() -> Bool ---

    @(link_name="XSetLocaleModifiers")
    set_locale_modifiers :: proc(modifierList : cstring) -> cstring ---

    @(link_name="XOpenOM")
    open_om :: proc(
        display : ^Display,
        rdb : ^Xrmhashbucketrec,
        resName : cstring,
        resClass : cstring,
    ) -> Xom ---

    @(link_name="XCloseOM")
    close_om :: proc(om : Xom) -> Status ---

    @(link_name="XDisplayOfOM")
    display_of_om :: proc(om : Xom) -> ^Display ---

    @(link_name="XLocaleOfOM")
    locale_of_om :: proc(om : Xom) -> cstring ---

    @(link_name="XDestroyOC")
    destroy_oc :: proc(oc : Xoc) ---

    @(link_name="XOMOfOC")
    om_of_oc :: proc(oc : Xoc) -> Xom ---

    @(link_name="XCreateFontSet")
    create_font_set :: proc(
        display : ^Display,
        baseFontNameList : cstring,
        missingCharsetList : ^^cstring,
        missingCharsetCount : ^_c.int,
        defString : ^cstring,
    ) -> XFontSet ---

    @(link_name="XFreeFontSet")
    free_font_set :: proc(
        display : ^Display,
        fontSet : XFontSet,
    ) ---

    @(link_name="XFontsOfFontSet")
    fonts_of_font_set :: proc(
        fontSet : XFontSet,
        fontStructList : ^^^XFontStruct,
        fontNameList : ^^cstring,
    ) -> _c.int ---

    @(link_name="XBaseFontNameListOfFontSet")
    base_font_name_list_of_font_set :: proc(fontSet : XFontSet) -> cstring ---

    @(link_name="XLocaleOfFontSet")
    locale_of_font_set :: proc(fontSet : XFontSet) -> cstring ---

    @(link_name="XContextDependentDrawing")
    context_dependent_drawing :: proc(fontSet : XFontSet) -> Bool ---

    @(link_name="XDirectionalDependentDrawing")
    directional_dependent_drawing :: proc(fontSet : XFontSet) -> Bool ---

    @(link_name="XContextualDrawing")
    contextual_drawing :: proc(fontSet : XFontSet) -> Bool ---

    @(link_name="XExtentsOfFontSet")
    extents_of_font_set :: proc(fontSet : XFontSet) -> ^XFontSetExtents ---

    @(link_name="XmbTextEscapement")
    mb_text_escapement :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
    ) -> _c.int ---

    @(link_name="XwcTextEscapement")
    wc_text_escapement :: proc(
        fontSet : XFontSet,
        text : ^WcharT,
        numWchars : _c.int,
    ) -> _c.int ---

    @(link_name="Xutf8TextEscapement")
    utf8_text_escapement :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
    ) -> _c.int ---

    @(link_name="XmbTextExtents")
    mb_text_extents :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> _c.int ---

    @(link_name="XwcTextExtents")
    wc_text_extents :: proc(
        fontSet : XFontSet,
        text : ^WcharT,
        numWchars : _c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> _c.int ---

    @(link_name="Xutf8TextExtents")
    utf8_text_extents :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> _c.int ---

    @(link_name="XmbTextPerCharExtents")
    mb_text_per_char_extents :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
        inkExtentsBuffer : ^XRectangle,
        logicalExtentsBuffer : ^XRectangle,
        bufferSize : _c.int,
        numChars : ^_c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> Status ---

    @(link_name="XwcTextPerCharExtents")
    wc_text_per_char_extents :: proc(
        fontSet : XFontSet,
        text : ^WcharT,
        numWchars : _c.int,
        inkExtentsBuffer : ^XRectangle,
        logicalExtentsBuffer : ^XRectangle,
        bufferSize : _c.int,
        numChars : ^_c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> Status ---

    @(link_name="Xutf8TextPerCharExtents")
    utf8_text_per_char_extents :: proc(
        fontSet : XFontSet,
        text : cstring,
        bytesText : _c.int,
        inkExtentsBuffer : ^XRectangle,
        logicalExtentsBuffer : ^XRectangle,
        bufferSize : _c.int,
        numChars : ^_c.int,
        overallInkReturn : ^XRectangle,
        overallLogicalReturn : ^XRectangle,
    ) -> Status ---

    @(link_name="XmbDrawText")
    mb_draw_text :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        textItems : ^XmbTextItem,
        nitems : _c.int,
    ) ---

    @(link_name="XwcDrawText")
    wc_draw_text :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        textItems : ^XwcTextItem,
        nitems : _c.int,
    ) ---

    @(link_name="Xutf8DrawText")
    utf8_draw_text :: proc(
        display : ^Display,
        d : Drawable,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        textItems : ^XmbTextItem,
        nitems : _c.int,
    ) ---

    @(link_name="XmbDrawString")
    mb_draw_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : cstring,
        bytesText : _c.int,
    ) ---

    @(link_name="XwcDrawString")
    wc_draw_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : ^WcharT,
        numWchars : _c.int,
    ) ---

    @(link_name="Xutf8DrawString")
    utf8_draw_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : cstring,
        bytesText : _c.int,
    ) ---

    @(link_name="XmbDrawImageString")
    mb_draw_image_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : cstring,
        bytesText : _c.int,
    ) ---

    @(link_name="XwcDrawImageString")
    wc_draw_image_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : ^WcharT,
        numWchars : _c.int,
    ) ---

    @(link_name="Xutf8DrawImageString")
    utf8_draw_image_string :: proc(
        display : ^Display,
        d : Drawable,
        fontSet : XFontSet,
        gc : Gc,
        x : _c.int,
        y : _c.int,
        text : cstring,
        bytesText : _c.int,
    ) ---

    @(link_name="XOpenIM")
    open_im :: proc(
        dpy : ^Display,
        rdb : ^Xrmhashbucketrec,
        resName : cstring,
        resClass : cstring,
    ) -> Xim ---

    @(link_name="XCloseIM")
    close_im :: proc(im : Xim) -> Status ---

    @(link_name="XDisplayOfIM")
    display_of_im :: proc(im : Xim) -> ^Display ---

    @(link_name="XLocaleOfIM")
    locale_of_im :: proc(im : Xim) -> cstring ---

    @(link_name="XDestroyIC")
    destroy_ic :: proc(ic : Xic) ---

    @(link_name="XSetICFocus")
    set_ic_focus :: proc(ic : Xic) ---

    @(link_name="XUnsetICFocus")
    unset_ic_focus :: proc(ic : Xic) ---

    @(link_name="XwcResetIC")
    wc_reset_ic :: proc(ic : Xic) -> ^WcharT ---

    @(link_name="XmbResetIC")
    mb_reset_ic :: proc(ic : Xic) -> cstring ---

    @(link_name="Xutf8ResetIC")
    utf8_reset_ic :: proc(ic : Xic) -> cstring ---

    @(link_name="XIMOfIC")
    im_of_ic :: proc(ic : Xic) -> Xim ---

    @(link_name="XFilterEvent")
    filter_event :: proc(
        event : ^XEvent,
        window : Window,
    ) -> Bool ---

    @(link_name="XmbLookupString")
    mb_lookup_string :: proc(
        ic : Xic,
        event : ^XKeyPressedEvent,
        bufferReturn : cstring,
        bytesBuffer : _c.int,
        keysymReturn : ^_c.uint,
        statusReturn : ^Status,
    ) -> _c.int ---

    @(link_name="XwcLookupString")
    wc_lookup_string :: proc(
        ic : Xic,
        event : ^XKeyPressedEvent,
        bufferReturn : ^WcharT,
        wcharsBuffer : _c.int,
        keysymReturn : ^_c.uint,
        statusReturn : ^Status,
    ) -> _c.int ---

    @(link_name="Xutf8LookupString")
    utf8_lookup_string :: proc(
        ic : Xic,
        event : ^XKeyPressedEvent,
        bufferReturn : cstring,
        bytesBuffer : _c.int,
        keysymReturn : ^_c.uint,
        statusReturn : ^Status,
    ) -> _c.int ---

    @(link_name="XRegisterIMInstantiateCallback")
    register_im_instantiate_callback :: proc(
        dpy : ^Display,
        rdb : ^Xrmhashbucketrec,
        resName : cstring,
        resClass : cstring,
        callback : XidProc,
        clientData : XPointer,
    ) -> Bool ---

    @(link_name="XUnregisterIMInstantiateCallback")
    unregister_im_instantiate_callback :: proc(
        dpy : ^Display,
        rdb : ^Xrmhashbucketrec,
        resName : cstring,
        resClass : cstring,
        callback : XidProc,
        clientData : XPointer,
    ) -> Bool ---

    @(link_name="XInternalConnectionNumbers")
    internal_connection_numbers :: proc(
        dpy : ^Display,
        fdReturn : ^^_c.int,
        countReturn : ^_c.int,
    ) -> Status ---

    @(link_name="XProcessInternalConnection")
    process_internal_connection :: proc(
        dpy : ^Display,
        fd : _c.int,
    ) ---

    @(link_name="XAddConnectionWatch")
    add_connection_watch :: proc(
        dpy : ^Display,
        callback : XConnectionWatchProc,
        clientData : XPointer,
    ) -> Status ---

    @(link_name="XRemoveConnectionWatch")
    remove_connection_watch :: proc(
        dpy : ^Display,
        callback : XConnectionWatchProc,
        clientData : XPointer,
    ) ---

    @(link_name="XSetAuthorization")
    set_authorization :: proc(
        name : cstring,
        namelen : _c.int,
        data : cstring,
        datalen : _c.int,
    ) ---

    @(link_name="_Xmbtowc")
    xmbtowc :: proc(
        wstr : ^WcharT,
        str : cstring,
        len : _c.int,
    ) -> _c.int ---

    @(link_name="_Xwctomb")
    xwctomb :: proc(
        str : cstring,
        wc : WcharT,
    ) -> _c.int ---

    @(link_name="XGetEventData")
    get_event_data :: proc(
        dpy : ^Display,
        cookie : ^XGenericEventCookie,
    ) -> Bool ---

    @(link_name="XFreeEventData")
    free_event_data :: proc(
        dpy : ^Display,
        cookie : ^XGenericEventCookie,
    ) ---

}
