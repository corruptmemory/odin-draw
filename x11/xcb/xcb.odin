package xcb

import _c "core:c"

Flags         :: distinct u32

XCB_H__ :: 1
PACKED :: 1
X_PROTOCOL :: 11
X_PROTOCOL_REVISION :: 0
X_TCP_PORT :: 6000
CONN_ERROR :: 1
CONN_CLOSED_EXT_NOTSUPPORTED :: 2
CONN_CLOSED_MEM_INSUFFICIENT :: 3
CONN_CLOSED_REQ_LEN_EXCEED :: 4
CONN_CLOSED_PARSE_ERR :: 5
CONN_CLOSED_INVALID_SCREEN :: 6
CONN_CLOSED_FDPASSING_FAILED :: 7
NONE :: 0
COPY_FROM_PARENT :: 0
CURRENT_TIME :: 0
NO_SYMBOL :: 0
XPROTO_H :: 1
KEY_PRESS :: 2
KEY_RELEASE :: 3
BUTTON_PRESS :: 4
BUTTON_RELEASE :: 5
MOTION_NOTIFY :: 6
ENTER_NOTIFY :: 7
LEAVE_NOTIFY :: 8
FOCUS_IN :: 9
FOCUS_OUT :: 10
KEYMAP_NOTIFY :: 11
EXPOSE :: 12
GRAPHICS_EXPOSURE :: 13
NO_EXPOSURE :: 14
VISIBILITY_NOTIFY :: 15
CREATE_NOTIFY :: 16
DESTROY_NOTIFY :: 17
UNMAP_NOTIFY :: 18
MAP_NOTIFY :: 19
MAP_REQUEST :: 20
REPARENT_NOTIFY :: 21
CONFIGURE_NOTIFY :: 22
CONFIGURE_REQUEST :: 23
GRAVITY_NOTIFY :: 24
RESIZE_REQUEST :: 25
CIRCULATE_NOTIFY :: 26
CIRCULATE_REQUEST :: 27
PROPERTY_NOTIFY :: 28
SELECTION_CLEAR :: 29
SELECTION_REQUEST :: 30
SELECTION_NOTIFY :: 31
COLORMAP_NOTIFY :: 32
CLIENT_MESSAGE :: 33
MAPPING_NOTIFY :: 34
GE_GENERIC :: 35
REQUEST :: 1
VALUE :: 2
WINDOW :: 3
PIXMAP :: 4
ATOM :: 5
CURSOR :: 6
FONT :: 7
MATCH :: 8
DRAWABLE :: 9
ACCESS :: 10
ALLOC :: 11
COLORMAP :: 12
G_CONTEXT :: 13
ID_CHOICE :: 14
NAME :: 15
LENGTH :: 16
IMPLEMENTATION :: 17
CREATE_WINDOW :: 1
CHANGE_WINDOW_ATTRIBUTES :: 2
GET_WINDOW_ATTRIBUTES :: 3
DESTROY_WINDOW :: 4
DESTROY_SUBWINDOWS :: 5
CHANGE_SAVE_SET :: 6
REPARENT_WINDOW :: 7
MAP_WINDOW :: 8
MAP_SUBWINDOWS :: 9
UNMAP_WINDOW :: 10
UNMAP_SUBWINDOWS :: 11
CONFIGURE_WINDOW :: 12
CIRCULATE_WINDOW :: 13
GET_GEOMETRY :: 14
QUERY_TREE :: 15
INTERN_ATOM :: 16
GET_ATOM_NAME :: 17
CHANGE_PROPERTY :: 18
DELETE_PROPERTY :: 19
GET_PROPERTY :: 20
LIST_PROPERTIES :: 21
SET_SELECTION_OWNER :: 22
GET_SELECTION_OWNER :: 23
CONVERT_SELECTION :: 24
SEND_EVENT :: 25
GRAB_POINTER :: 26
UNGRAB_POINTER :: 27
GRAB_BUTTON :: 28
UNGRAB_BUTTON :: 29
CHANGE_ACTIVE_POINTER_GRAB :: 30
GRAB_KEYBOARD :: 31
UNGRAB_KEYBOARD :: 32
GRAB_KEY :: 33
UNGRAB_KEY :: 34
ALLOW_EVENTS :: 35
GRAB_SERVER :: 36
UNGRAB_SERVER :: 37
QUERY_POINTER :: 38
GET_MOTION_EVENTS :: 39
TRANSLATE_COORDINATES :: 40
WARP_POINTER :: 41
SET_INPUT_FOCUS :: 42
GET_INPUT_FOCUS :: 43
QUERY_KEYMAP :: 44
OPEN_FONT :: 45
CLOSE_FONT :: 46
QUERY_FONT :: 47
QUERY_TEXT_EXTENTS :: 48
LIST_FONTS :: 49
LIST_FONTS_WITH_INFO :: 50
SET_FONT_PATH :: 51
GET_FONT_PATH :: 52
CREATE_PIXMAP :: 53
FREE_PIXMAP :: 54
CREATE_GC :: 55
CHANGE_GC :: 56
COPY_GC :: 57
SET_DASHES :: 58
SET_CLIP_RECTANGLES :: 59
FREE_GC :: 60
CLEAR_AREA :: 61
COPY_AREA :: 62
COPY_PLANE :: 63
POLY_POINT :: 64
POLY_LINE :: 65
POLY_SEGMENT :: 66
POLY_RECTANGLE :: 67
POLY_ARC :: 68
FILL_POLY :: 69
POLY_FILL_RECTANGLE :: 70
POLY_FILL_ARC :: 71
PUT_IMAGE :: 72
GET_IMAGE :: 73
POLY_TEXT_8 :: 74
POLY_TEXT_16 :: 75
IMAGE_TEXT_8 :: 76
IMAGE_TEXT_16 :: 77
CREATE_COLORMAP :: 78
FREE_COLORMAP :: 79
COPY_COLORMAP_AND_FREE :: 80
INSTALL_COLORMAP :: 81
UNINSTALL_COLORMAP :: 82
LIST_INSTALLED_COLORMAPS :: 83
ALLOC_COLOR :: 84
ALLOC_NAMED_COLOR :: 85
ALLOC_COLOR_CELLS :: 86
ALLOC_COLOR_PLANES :: 87
FREE_COLORS :: 88
STORE_COLORS :: 89
STORE_NAMED_COLOR :: 90
QUERY_COLORS :: 91
LOOKUP_COLOR :: 92
CREATE_CURSOR :: 93
CREATE_GLYPH_CURSOR :: 94
FREE_CURSOR :: 95
RECOLOR_CURSOR :: 96
QUERY_BEST_SIZE :: 97
QUERY_EXTENSION :: 98
LIST_EXTENSIONS :: 99
CHANGE_KEYBOARD_MAPPING :: 100
GET_KEYBOARD_MAPPING :: 101
CHANGE_KEYBOARD_CONTROL :: 102
GET_KEYBOARD_CONTROL :: 103
BELL :: 104
CHANGE_POINTER_CONTROL :: 105
GET_POINTER_CONTROL :: 106
SET_SCREEN_SAVER :: 107
GET_SCREEN_SAVER :: 108
CHANGE_HOSTS :: 109
LIST_HOSTS :: 110
SET_ACCESS_CONTROL :: 111
SET_CLOSE_DOWN_MODE :: 112
KILL_CLIENT :: 113
ROTATE_PROPERTIES :: 114
FORCE_SCREEN_SAVER :: 115
SET_POINTER_MAPPING :: 116
GET_POINTER_MAPPING :: 117
SET_MODIFIER_MAPPING :: 118
GET_MODIFIER_MAPPING :: 119
NO_OPERATION :: 127

GenericIterator :: AnonymousStruct0
GenericReply :: AnonymousStruct1
GenericEvent :: AnonymousStruct2
RawGenericEvent :: AnonymousStruct3
GeEvent :: AnonymousStruct4
GenericError :: AnonymousStruct5
VoidCookie :: AnonymousStruct6
Window :: u32
Pixmap :: u32
Cursor :: u32
Font :: u32
Gcontext :: u32
Colormap :: u32
Atom :: u32
Drawable :: u32
Fontable :: u32
Bool32 :: u32
Visualid :: u32
Timestamp :: u32
Keysym :: u32
Keycode :: u8
Keycode32 :: u32
Button :: u8
KeyReleaseEvent :: KeyPressEvent
ButtonReleaseEvent :: ButtonPressEvent
LeaveNotifyEvent :: EnterNotifyEvent
FocusOutEvent :: FocusInEvent
CirculateRequestEvent :: CirculateNotifyEvent
WindowError :: ValueError
PixmapError :: ValueError
AtomError :: ValueError
CursorError :: ValueError
FontError :: ValueError
MatchError :: RequestError
DrawableError :: ValueError
AccessError :: RequestError
AllocError :: RequestError
ColormapError :: ValueError
G_contextError :: ValueError
IdChoiceError :: ValueError
NameError :: RequestError
LengthError :: RequestError
ImplementationError :: RequestError

VisualClass :: enum i32 {
    StaticGray = 0,
    GrayScale = 1,
    StaticColor = 2,
    PseudoColor = 3,
    TrueColor = 4,
    DirectColor = 5,
}

EventMaskFlags :: distinct bit_set[EventMask; Flags]
EventMask :: enum {
    KeyPress             = 0,
    KeyRelease           = 1,
    ButtonPress          = 2,
    ButtonRelease        = 3,
    EnterWindow          = 4,
    LeaveWindow          = 5,
    PointerMotion        = 6,
    PointerMotionHint    = 7,
    Button1_motion       = 8,
    Button2_motion       = 9,
    Button3_motion       = 10,
    Button4_motion       = 11,
    Button5_motion       = 12,
    ButtonMotion         = 13,
    KeymapState          = 14,
    Exposure             = 15,
    VisibilityChange     = 16,
    StructureNotify      = 17,
    ResizeRedirect       = 18,
    SubstructureNotify   = 19,
    SubstructureRedirect = 20,
    FocusChange          = 21,
    PropertyChange       = 22,
    ColorMapChange       = 23,
    OwnerGrabButton      = 24,
}

BackingStore :: enum i32 {
    NotUseful = 0,
    WhenMapped = 1,
    Always = 2,
}

ImageOrder :: enum i32 {
    LsbFirst = 0,
    MsbFirst = 1,
}

ModMask :: enum i32 {
    Shift = 1,
    Lock = 2,
    Control = 4,
    _1 = 8,
    _2 = 16,
    _3 = 32,
    _4 = 64,
    _5 = 128,
    Any = 32768,
}

KeyButMask :: enum i32 {
    Shift = 1,
    Lock = 2,
    Control = 4,
    Mod1 = 8,
    Mod2 = 16,
    Mod3 = 32,
    Mod4 = 64,
    Mod5 = 128,
    Button1 = 256,
    Button2 = 512,
    Button3 = 1024,
    Button4 = 2048,
    Button5 = 4096,
}

WindowEnum :: enum i32 {
    WindowNone = 0,
}

ButtonMask :: enum i32 {
    _1 = 256,
    _2 = 512,
    _3 = 1024,
    _4 = 2048,
    _5 = 4096,
    Any = 32768,
}

Motion :: enum i32 {
    Normal = 0,
    Hint = 1,
}

NotifyDetail :: enum i32 {
    Ancestor = 0,
    Virtual = 1,
    Inferior = 2,
    Nonlinear = 3,
    NonlinearVirtual = 4,
    Pointer = 5,
    PointerRoot = 6,
    None = 7,
}

NotifyMode :: enum i32 {
    Normal = 0,
    Grab = 1,
    Ungrab = 2,
    WhileGrabbed = 3,
}

Visibility :: enum i32 {
    Unobscured = 0,
    PartiallyObscured = 1,
    FullyObscured = 2,
}

Place :: enum i32 {
    OnTop = 0,
    OnBottom = 1,
}

Property :: enum i32 {
    NewValue = 0,
    Delete = 1,
}

Time :: enum i32 {
    CurrentTime = 0,
}

AtomEnum :: enum u32 {
    AtomNone = 0,
    AtomAny = 0,
    AtomPrimary = 1,
    AtomSecondary = 2,
    AtomArc = 3,
    AtomAtom = 4,
    AtomBitmap = 5,
    AtomCardinal = 6,
    AtomColormap = 7,
    AtomCursor = 8,
    AtomCutBuffer0 = 9,
    AtomCutBuffer1 = 10,
    AtomCutBuffer2 = 11,
    AtomCutBuffer3 = 12,
    AtomCutBuffer4 = 13,
    AtomCutBuffer5 = 14,
    AtomCutBuffer6 = 15,
    AtomCutBuffer7 = 16,
    AtomDrawable = 17,
    AtomFont = 18,
    AtomInteger = 19,
    AtomPixmap = 20,
    AtomPoint = 21,
    AtomRectangle = 22,
    AtomResourceManager = 23,
    AtomRgbColorMap = 24,
    AtomRgbBestMap = 25,
    AtomRgbBlueMap = 26,
    AtomRgbDefaultMap = 27,
    AtomRgbGrayMap = 28,
    AtomRgbGreenMap = 29,
    AtomRgbRedMap = 30,
    AtomString = 31,
    AtomVisualid = 32,
    AtomWindow = 33,
    AtomWmCommand = 34,
    AtomWmHints = 35,
    AtomWmClientMachine = 36,
    AtomWmIconName = 37,
    AtomWmIconSize = 38,
    AtomWmName = 39,
    AtomWmNormalHints = 40,
    AtomWmSizeHints = 41,
    AtomWmZoomHints = 42,
    AtomMinSpace = 43,
    AtomNormSpace = 44,
    AtomMaxSpace = 45,
    AtomEndSpace = 46,
    AtomSuperscriptX = 47,
    AtomSuperscriptY = 48,
    AtomSubscriptX = 49,
    AtomSubscriptY = 50,
    AtomUnderlinePosition = 51,
    AtomUnderlineThickness = 52,
    AtomStrikeoutAscent = 53,
    AtomStrikeoutDescent = 54,
    AtomItalicAngle = 55,
    AtomX_height = 56,
    AtomQuadWidth = 57,
    AtomWeight = 58,
    AtomPointSize = 59,
    AtomResolution = 60,
    AtomCopyright = 61,
    AtomNotice = 62,
    AtomFontName = 63,
    AtomFamilyName = 64,
    AtomFullName = 65,
    AtomCapHeight = 66,
    AtomWmClass = 67,
    AtomWmTransientFor = 68,
}

ColormapState :: enum i32 {
    Uninstalled = 0,
    Installed = 1,
}

ColormapEnum :: enum i32 {
    ColormapNone = 0,
}

Mapping :: enum i32 {
    Modifier = 0,
    Keyboard = 1,
    Pointer = 2,
}

WindowClass :: enum u16 {
    CopyFromParent = 0,
    InputOutput = 1,
    InputOnly = 2,
}

CwFlags :: distinct bit_set[Cw; Flags]
Cw :: enum {
    BackPixmap       = 0,
    BackPixel        = 1,
    BorderPixmap     = 2,
    BorderPixel      = 3,
    BitGravity       = 4,
    WinGravity       = 5,
    BackingStore     = 6,
    BackingPlanes    = 7,
    BackingPixel     = 8,
    OverrideRedirect = 9,
    SaveUnder        = 10,
    EventMask        = 11,
    DontPropagate    = 12,
    Colormap         = 13,
    Cursor           = 14,
}

BackPixmap :: enum i32 {
    None = 0,
    ParentRelative = 1,
}

Gravity :: enum i32 {
    BitForget = 0,
    WinUnmap = 0,
    NorthWest = 1,
    North = 2,
    NorthEast = 3,
    West = 4,
    Center = 5,
    East = 6,
    SouthWest = 7,
    South = 8,
    SouthEast = 9,
    Static = 10,
}

MapState :: enum i32 {
    Unmapped = 0,
    Unviewable = 1,
    Viewable = 2,
}

SetMode :: enum i32 {
    Insert = 0,
    Delete = 1,
}

ConfigWindow :: enum i32 {
    X = 1,
    Y = 2,
    Width = 4,
    Height = 8,
    BorderWidth = 16,
    Sibling = 32,
    StackMode = 64,
}

StackMode :: enum i32 {
    Above = 0,
    Below = 1,
    TopIf = 2,
    BottomIf = 3,
    Opposite = 4,
}

Circulate :: enum i32 {
    RaiseLowest = 0,
    LowerHighest = 1,
}

PropMode :: enum u8 {
    Replace = 0,
    Prepend = 1,
    Append = 2,
}

GetPropertyType :: enum i32 {
    Any = 0,
}

SendEventDest :: enum i32 {
    PointerWindow = 0,
    ItemFocus = 1,
}

GrabMode :: enum i32 {
    Sync = 0,
    Async = 1,
}

GrabStatus :: enum i32 {
    Success = 0,
    AlreadyGrabbed = 1,
    InvalidTime = 2,
    NotViewable = 3,
    Frozen = 4,
}

CursorEnum :: enum i32 {
    CursorNone = 0,
}

ButtonIndex :: enum i32 {
    Any = 0,
    _1 = 1,
    _2 = 2,
    _3 = 3,
    _4 = 4,
    _5 = 5,
}

Grab :: enum i32 {
    Any = 0,
}

Allow :: enum i32 {
    AsyncPointer = 0,
    SyncPointer = 1,
    ReplayPointer = 2,
    AsyncKeyboard = 3,
    SyncKeyboard = 4,
    ReplayKeyboard = 5,
    AsyncBoth = 6,
    SyncBoth = 7,
}

InputFocus :: enum i32 {
    None = 0,
    PointerRoot = 1,
    Parent = 2,
    FollowKeyboard = 3,
}

FontDraw :: enum i32 {
    LeftToRight = 0,
    RightToLeft = 1,
}

Gc :: enum i32 {
    Function = 1,
    PlaneMask = 2,
    Foreground = 4,
    Background = 8,
    LineWidth = 16,
    LineStyle = 32,
    CapStyle = 64,
    JoinStyle = 128,
    FillStyle = 256,
    FillRule = 512,
    Tile = 1024,
    Stipple = 2048,
    TileStippleOriginX = 4096,
    TileStippleOriginY = 8192,
    Font = 16384,
    SubwindowMode = 32768,
    GraphicsExposures = 65536,
    ClipOriginX = 131072,
    ClipOriginY = 262144,
    ClipMask = 524288,
    DashOffset = 1048576,
    DashList = 2097152,
    ArcMode = 4194304,
}

Gx :: enum i32 {
    Clear = 0,
    And = 1,
    AndReverse = 2,
    Copy = 3,
    AndInverted = 4,
    Noop = 5,
    Xor = 6,
    Or = 7,
    Nor = 8,
    Equiv = 9,
    Invert = 10,
    OrReverse = 11,
    CopyInverted = 12,
    OrInverted = 13,
    Nand = 14,
    Set = 15,
}

LineStyle :: enum i32 {
    Solid = 0,
    OnOffDash = 1,
    DoubleDash = 2,
}

CapStyle :: enum i32 {
    NotLast = 0,
    Butt = 1,
    Round = 2,
    Projecting = 3,
}

JoinStyle :: enum i32 {
    Miter = 0,
    Round = 1,
    Bevel = 2,
}

FillStyle :: enum i32 {
    Solid = 0,
    Tiled = 1,
    Stippled = 2,
    OpaqueStippled = 3,
}

FillRule :: enum i32 {
    EvenOdd = 0,
    Winding = 1,
}

SubwindowMode :: enum i32 {
    ClipByChildren = 0,
    IncludeInferiors = 1,
}

ArcMode :: enum i32 {
    Chord = 0,
    PieSlice = 1,
}

ClipOrdering :: enum i32 {
    Unsorted = 0,
    Y_sorted = 1,
    YxSorted = 2,
    YxBanded = 3,
}

CoordMode :: enum i32 {
    Origin = 0,
    Previous = 1,
}

PolyShape :: enum i32 {
    Complex = 0,
    Nonconvex = 1,
    Convex = 2,
}

ImageFormat :: enum i32 {
    XyBitmap = 0,
    XyPixmap = 1,
    Z_pixmap = 2,
}

ColormapAlloc :: enum i32 {
    None = 0,
    All = 1,
}

ColorFlag :: enum i32 {
    Red = 1,
    Green = 2,
    Blue = 4,
}

PixmapEnum :: enum i32 {
    PixmapNone = 0,
}

FontEnum :: enum i32 {
    FontNone = 0,
}

QueryShapeOf :: enum i32 {
    LargestCursor = 0,
    FastestTile = 1,
    FastestStipple = 2,
}

Kb :: enum i32 {
    KeyClickPercent = 1,
    BellPercent = 2,
    BellPitch = 4,
    BellDuration = 8,
    Led = 16,
    LedMode = 32,
    Key = 64,
    AutoRepeatMode = 128,
}

LedMode :: enum i32 {
    Off = 0,
    On = 1,
}

AutoRepeatMode :: enum i32 {
    Off = 0,
    On = 1,
    Default = 2,
}

Blanking :: enum i32 {
    NotPreferred = 0,
    Preferred = 1,
    Default = 2,
}

Exposures :: enum i32 {
    NotAllowed = 0,
    Allowed = 1,
    Default = 2,
}

HostMode :: enum i32 {
    Insert = 0,
    Delete = 1,
}

Family :: enum i32 {
    Internet = 0,
    Decnet = 1,
    Chaos = 2,
    ServerInterpreted = 5,
    Internet6 = 6,
}

AccessControl :: enum i32 {
    Disable = 0,
    Enable = 1,
}

CloseDown :: enum i32 {
    DestroyAll = 0,
    RetainPermanent = 1,
    RetainTemporary = 2,
}

Kill :: enum i32 {
    AllTemporary = 0,
}

ScreenSaver :: enum i32 {
    Reset = 0,
    Active = 1,
}

MappingStatus :: enum i32 {
    Success = 0,
    Busy = 1,
    Failure = 2,
}

MapIndex :: enum i32 {
    Shift = 0,
    Lock = 1,
    Control = 2,
    _1 = 3,
    _2 = 4,
    _3 = 5,
    _4 = 6,
    _5 = 7,
}

Connection :: struct {}

AnonymousStruct0 :: struct {
    data : rawptr,
    rem : _c.int,
    index : _c.int,
}

AnonymousStruct1 :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
}

AnonymousStruct2 :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    pad : [7]u32,
    fullSequence : u32,
}

AnonymousStruct3 :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    pad : [7]u32,
}

AnonymousStruct4 :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    eventType : u16,
    pad1 : u16,
    pad : [5]u32,
    fullSequence : u32,
}

AnonymousStruct5 :: struct {
    responseType : u8,
    errorCode : u8,
    sequence : u16,
    resourceId : u32,
    minorCode : u16,
    majorCode : u8,
    pad0 : u8,
    pad : [5]u32,
    fullSequence : u32,
}

AnonymousStruct6 :: struct {
    sequence : _c.uint,
}

AuthInfo :: struct {
    namelen : _c.int,
    name : cstring,
    datalen : _c.int,
    data : cstring,
}

SpecialEvent :: struct {}

Extension :: struct {}

QueryExtensionReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    present : u8,
    majorOpcode : u8,
    firstEvent : u8,
    firstError : u8,
}

Setup :: struct {
    status : u8,
    pad0 : u8,
    protocolMajorVersion : u16,
    protocolMinorVersion : u16,
    length : u16,
    releaseNumber : u32,
    resourceIdBase : u32,
    resourceIdMask : u32,
    motionBufferSize : u32,
    vendorLen : u16,
    maximumRequestLength : u16,
    rootsLen : u8,
    pixmapFormatsLen : u8,
    imageByteOrder : u8,
    bitmapFormatBitOrder : u8,
    bitmapFormatScanlineUnit : u8,
    bitmapFormatScanlinePad : u8,
    minKeycode : Keycode,
    maxKeycode : Keycode,
    pad1 : [4]u8,
}

Char2B :: struct {
    byte1 : u8,
    byte2 : u8,
}

Char2BIterator :: struct {
    data : ^Char2B,
    rem : _c.int,
    index : _c.int,
}

WindowIterator :: struct {
    data : ^Window,
    rem : _c.int,
    index : _c.int,
}

PixmapIterator :: struct {
    data : ^Pixmap,
    rem : _c.int,
    index : _c.int,
}

CursorIterator :: struct {
    data : ^Cursor,
    rem : _c.int,
    index : _c.int,
}

FontIterator :: struct {
    data : ^Font,
    rem : _c.int,
    index : _c.int,
}

GcontextIterator :: struct {
    data : ^Gcontext,
    rem : _c.int,
    index : _c.int,
}

ColormapIterator :: struct {
    data : ^Colormap,
    rem : _c.int,
    index : _c.int,
}

AtomIterator :: struct {
    data : ^Atom,
    rem : _c.int,
    index : _c.int,
}

DrawableIterator :: struct {
    data : ^Drawable,
    rem : _c.int,
    index : _c.int,
}

FontableIterator :: struct {
    data : ^Fontable,
    rem : _c.int,
    index : _c.int,
}

Bool32Iterator :: struct {
    data : ^Bool32,
    rem : _c.int,
    index : _c.int,
}

VisualidIterator :: struct {
    data : ^Visualid,
    rem : _c.int,
    index : _c.int,
}

TimestampIterator :: struct {
    data : ^Timestamp,
    rem : _c.int,
    index : _c.int,
}

KeysymIterator :: struct {
    data : ^Keysym,
    rem : _c.int,
    index : _c.int,
}

KeycodeIterator :: struct {
    data : ^Keycode,
    rem : _c.int,
    index : _c.int,
}

Keycode32Iterator :: struct {
    data : ^Keycode32,
    rem : _c.int,
    index : _c.int,
}

ButtonIterator :: struct {
    data : ^Button,
    rem : _c.int,
    index : _c.int,
}

Point :: struct {
    x : i16,
    y : i16,
}

PointIterator :: struct {
    data : ^Point,
    rem : _c.int,
    index : _c.int,
}

Rectangle :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
}

RectangleIterator :: struct {
    data : ^Rectangle,
    rem : _c.int,
    index : _c.int,
}

Arc :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    angle1 : i16,
    angle2 : i16,
}

ArcIterator :: struct {
    data : ^Arc,
    rem : _c.int,
    index : _c.int,
}

Format :: struct {
    depth : u8,
    bitsPerPixel : u8,
    scanlinePad : u8,
    pad0 : [5]u8,
}

FormatIterator :: struct {
    data : ^Format,
    rem : _c.int,
    index : _c.int,
}

Visualtype :: struct {
    visualId : Visualid,
    class : u8,
    bitsPerRgbValue : u8,
    colormapEntries : u16,
    redMask : u32,
    greenMask : u32,
    blueMask : u32,
    pad0 : [4]u8,
}

VisualtypeIterator :: struct {
    data : ^Visualtype,
    rem : _c.int,
    index : _c.int,
}

Depth :: struct {
    depth : u8,
    pad0 : u8,
    visualsLen : u16,
    pad1 : [4]u8,
}

DepthIterator :: struct {
    data : ^Depth,
    rem : _c.int,
    index : _c.int,
}

Screen :: struct {
    root : Window,
    defaultColormap : Colormap,
    whitePixel : u32,
    blackPixel : u32,
    currentInputMasks : u32,
    widthInPixels : u16,
    heightInPixels : u16,
    widthInMillimeters : u16,
    heightInMillimeters : u16,
    minInstalledMaps : u16,
    maxInstalledMaps : u16,
    rootVisual : Visualid,
    backingStores : u8,
    saveUnders : u8,
    rootDepth : u8,
    allowedDepthsLen : u8,
}

ScreenIterator :: struct {
    data : ^Screen,
    rem : _c.int,
    index : _c.int,
}

SetupRequest :: struct {
    byteOrder : u8,
    pad0 : u8,
    protocolMajorVersion : u16,
    protocolMinorVersion : u16,
    authorizationProtocolNameLen : u16,
    authorizationProtocolDataLen : u16,
    pad1 : [2]u8,
}

SetupRequestIterator :: struct {
    data : ^SetupRequest,
    rem : _c.int,
    index : _c.int,
}

SetupFailed :: struct {
    status : u8,
    reasonLen : u8,
    protocolMajorVersion : u16,
    protocolMinorVersion : u16,
    length : u16,
}

SetupFailedIterator :: struct {
    data : ^SetupFailed,
    rem : _c.int,
    index : _c.int,
}

SetupAuthenticate :: struct {
    status : u8,
    pad0 : [5]u8,
    length : u16,
}

SetupAuthenticateIterator :: struct {
    data : ^SetupAuthenticate,
    rem : _c.int,
    index : _c.int,
}

SetupIterator :: struct {
    data : ^Setup,
    rem : _c.int,
    index : _c.int,
}

KeyPressEvent :: struct {
    responseType : u8,
    detail : Keycode,
    sequence : u16,
    time : Timestamp,
    root : Window,
    event : Window,
    child : Window,
    rootX : i16,
    rootY : i16,
    eventX : i16,
    eventY : i16,
    state : u16,
    sameScreen : u8,
    pad0 : u8,
}

ButtonPressEvent :: struct {
    responseType : u8,
    detail : Button,
    sequence : u16,
    time : Timestamp,
    root : Window,
    event : Window,
    child : Window,
    rootX : i16,
    rootY : i16,
    eventX : i16,
    eventY : i16,
    state : u16,
    sameScreen : u8,
    pad0 : u8,
}

MotionNotifyEvent :: struct {
    responseType : u8,
    detail : u8,
    sequence : u16,
    time : Timestamp,
    root : Window,
    event : Window,
    child : Window,
    rootX : i16,
    rootY : i16,
    eventX : i16,
    eventY : i16,
    state : u16,
    sameScreen : u8,
    pad0 : u8,
}

EnterNotifyEvent :: struct {
    responseType : u8,
    detail : u8,
    sequence : u16,
    time : Timestamp,
    root : Window,
    event : Window,
    child : Window,
    rootX : i16,
    rootY : i16,
    eventX : i16,
    eventY : i16,
    state : u16,
    mode : u8,
    sameScreenFocus : u8,
}

FocusInEvent :: struct {
    responseType : u8,
    detail : u8,
    sequence : u16,
    event : Window,
    mode : u8,
    pad0 : [3]u8,
}

KeymapNotifyEvent :: struct {
    responseType : u8,
    keys : [31]u8,
}

ExposeEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    window : Window,
    x : u16,
    y : u16,
    width : u16,
    height : u16,
    count : u16,
    pad1 : [2]u8,
}

GraphicsExposureEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    drawable : Drawable,
    x : u16,
    y : u16,
    width : u16,
    height : u16,
    minorOpcode : u16,
    count : u16,
    majorOpcode : u8,
    pad1 : [3]u8,
}

NoExposureEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    drawable : Drawable,
    minorOpcode : u16,
    majorOpcode : u8,
    pad1 : u8,
}

VisibilityNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    window : Window,
    state : u8,
    pad1 : [3]u8,
}

CreateNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    parent : Window,
    window : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    borderWidth : u16,
    overrideRedirect : u8,
    pad1 : u8,
}

DestroyNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
}

UnmapNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    fromConfigure : u8,
    pad1 : [3]u8,
}

MapNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    overrideRedirect : u8,
    pad1 : [3]u8,
}

MapRequestEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    parent : Window,
    window : Window,
}

ReparentNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    parent : Window,
    x : i16,
    y : i16,
    overrideRedirect : u8,
    pad1 : [3]u8,
}

ConfigureNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    aboveSibling : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    borderWidth : u16,
    overrideRedirect : u8,
    pad1 : u8,
}

ConfigureRequestEvent :: struct {
    responseType : u8,
    stackMode : u8,
    sequence : u16,
    parent : Window,
    window : Window,
    sibling : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    borderWidth : u16,
    valueMask : u16,
}

GravityNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    x : i16,
    y : i16,
}

ResizeRequestEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    window : Window,
    width : u16,
    height : u16,
}

CirculateNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    event : Window,
    window : Window,
    pad1 : [4]u8,
    place : u8,
    pad2 : [3]u8,
}

PropertyNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    window : Window,
    atom : Atom,
    time : Timestamp,
    state : u8,
    pad1 : [3]u8,
}

SelectionClearEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    time : Timestamp,
    owner : Window,
    selection : Atom,
}

SelectionRequestEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    time : Timestamp,
    owner : Window,
    requestor : Window,
    selection : Atom,
    target : Atom,
    property : Atom,
}

SelectionNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    time : Timestamp,
    requestor : Window,
    selection : Atom,
    target : Atom,
    property : Atom,
}

ColormapNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    window : Window,
    colormap : Colormap,
    new : u8,
    state : u8,
    pad1 : [2]u8,
}

ClientMessageDataIterator :: struct {
    data : ^ClientMessageData,
    rem : _c.int,
    index : _c.int,
}

ClientMessageEvent :: struct {
    responseType : u8,
    format : u8,
    sequence : u16,
    window : Window,
    type : Atom,
    data : ClientMessageData,
}

MappingNotifyEvent :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    request : u8,
    firstKeycode : Keycode,
    count : u8,
    pad1 : u8,
}

GeGenericEvent :: struct {
    responseType : u8,
    extension : u8,
    sequence : u16,
    length : u32,
    eventType : u16,
    pad0 : [22]u8,
    fullSequence : u32,
}

RequestError :: struct {
    responseType : u8,
    errorCode : u8,
    sequence : u16,
    badValue : u32,
    minorOpcode : u16,
    majorOpcode : u8,
    pad0 : u8,
}

ValueError :: struct {
    responseType : u8,
    errorCode : u8,
    sequence : u16,
    badValue : u32,
    minorOpcode : u16,
    majorOpcode : u8,
    pad0 : u8,
}

CreateWindowValueList :: struct {
    backgroundPixmap : Pixmap,
    backgroundPixel : u32,
    borderPixmap : Pixmap,
    borderPixel : u32,
    bitGravity : u32,
    winGravity : u32,
    backingStore : u32,
    backingPlanes : u32,
    backingPixel : u32,
    overrideRedirect : Bool32,
    saveUnder : Bool32,
    eventMask : u32,
    doNotPropogateMask : u32,
    colormap : Colormap,
    cursor : Cursor,
}

CreateWindowRequest :: struct {
    majorOpcode : u8,
    depth : u8,
    length : u16,
    wid : Window,
    parent : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    borderWidth : u16,
    class : u16,
    visual : Visualid,
    valueMask : u32,
}

ChangeWindowAttributesValueList :: struct {
    backgroundPixmap : Pixmap,
    backgroundPixel : u32,
    borderPixmap : Pixmap,
    borderPixel : u32,
    bitGravity : u32,
    winGravity : u32,
    backingStore : u32,
    backingPlanes : u32,
    backingPixel : u32,
    overrideRedirect : Bool32,
    saveUnder : Bool32,
    eventMask : u32,
    doNotPropogateMask : u32,
    colormap : Colormap,
    cursor : Cursor,
}

ChangeWindowAttributesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    valueMask : u32,
}

GetWindowAttributesCookie :: struct {
    sequence : _c.uint,
}

GetWindowAttributesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

GetWindowAttributesReply :: struct {
    responseType : u8,
    backingStore : u8,
    sequence : u16,
    length : u32,
    visual : Visualid,
    class : u16,
    bitGravity : u8,
    winGravity : u8,
    backingPlanes : u32,
    backingPixel : u32,
    saveUnder : u8,
    mapIsInstalled : u8,
    mapState : u8,
    overrideRedirect : u8,
    colormap : Colormap,
    allEventMasks : u32,
    yourEventMask : u32,
    doNotPropagateMask : u16,
    pad0 : [2]u8,
}

DestroyWindowRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

DestroySubwindowsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

ChangeSaveSetRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
    window : Window,
}

ReparentWindowRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    parent : Window,
    x : i16,
    y : i16,
}

MapWindowRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

MapSubwindowsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

UnmapWindowRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

UnmapSubwindowsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

ConfigureWindowValueList :: struct {
    x : i32,
    y : i32,
    width : u32,
    height : u32,
    borderWidth : u32,
    sibling : Window,
    stackMode : u32,
}

ConfigureWindowRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    valueMask : u16,
    pad1 : [2]u8,
}

CirculateWindowRequest :: struct {
    majorOpcode : u8,
    direction : u8,
    length : u16,
    window : Window,
}

GetGeometryCookie :: struct {
    sequence : _c.uint,
}

GetGeometryRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
}

GetGeometryReply :: struct {
    responseType : u8,
    depth : u8,
    sequence : u16,
    length : u32,
    root : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    borderWidth : u16,
    pad0 : [2]u8,
}

QueryTreeCookie :: struct {
    sequence : _c.uint,
}

QueryTreeRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

QueryTreeReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    root : Window,
    parent : Window,
    childrenLen : u16,
    pad1 : [14]u8,
}

InternAtomCookie :: struct {
    sequence : _c.uint,
}

InternAtomRequest :: struct {
    majorOpcode : u8,
    onlyIfExists : u8,
    length : u16,
    nameLen : u16,
    pad0 : [2]u8,
}

InternAtomReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    atom : Atom,
}

GetAtomNameCookie :: struct {
    sequence : _c.uint,
}

GetAtomNameRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    atom : Atom,
}

GetAtomNameReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    nameLen : u16,
    pad1 : [22]u8,
}

ChangePropertyRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
    window : Window,
    property : Atom,
    type : Atom,
    format : u8,
    pad0 : [3]u8,
    dataLen : u32,
}

DeletePropertyRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    property : Atom,
}

GetPropertyCookie :: struct {
    sequence : _c.uint,
}

GetPropertyRequest :: struct {
    majorOpcode : u8,
    delete : u8,
    length : u16,
    window : Window,
    property : Atom,
    type : Atom,
    longOffset : u32,
    longLength : u32,
}

GetPropertyReply :: struct {
    responseType : u8,
    format : u8,
    sequence : u16,
    length : u32,
    type : Atom,
    bytesAfter : u32,
    valueLen : u32,
    pad0 : [12]u8,
}

ListPropertiesCookie :: struct {
    sequence : _c.uint,
}

ListPropertiesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

ListPropertiesReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    atomsLen : u16,
    pad1 : [22]u8,
}

SetSelectionOwnerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    owner : Window,
    selection : Atom,
    time : Timestamp,
}

GetSelectionOwnerCookie :: struct {
    sequence : _c.uint,
}

GetSelectionOwnerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    selection : Atom,
}

GetSelectionOwnerReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    owner : Window,
}

ConvertSelectionRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    requestor : Window,
    selection : Atom,
    target : Atom,
    property : Atom,
    time : Timestamp,
}

SendEventRequest :: struct {
    majorOpcode : u8,
    propagate : u8,
    length : u16,
    destination : Window,
    eventMask : u32,
    event : [32]_c.char,
}

GrabPointerCookie :: struct {
    sequence : _c.uint,
}

GrabPointerRequest :: struct {
    majorOpcode : u8,
    ownerEvents : u8,
    length : u16,
    grabWindow : Window,
    eventMask : u16,
    pointerMode : u8,
    keyboardMode : u8,
    confineTo : Window,
    cursor : Cursor,
    time : Timestamp,
}

GrabPointerReply :: struct {
    responseType : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

UngrabPointerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    time : Timestamp,
}

GrabButtonRequest :: struct {
    majorOpcode : u8,
    ownerEvents : u8,
    length : u16,
    grabWindow : Window,
    eventMask : u16,
    pointerMode : u8,
    keyboardMode : u8,
    confineTo : Window,
    cursor : Cursor,
    button : u8,
    pad0 : u8,
    modifiers : u16,
}

UngrabButtonRequest :: struct {
    majorOpcode : u8,
    button : u8,
    length : u16,
    grabWindow : Window,
    modifiers : u16,
    pad0 : [2]u8,
}

ChangeActivePointerGrabRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cursor : Cursor,
    time : Timestamp,
    eventMask : u16,
    pad1 : [2]u8,
}

GrabKeyboardCookie :: struct {
    sequence : _c.uint,
}

GrabKeyboardRequest :: struct {
    majorOpcode : u8,
    ownerEvents : u8,
    length : u16,
    grabWindow : Window,
    time : Timestamp,
    pointerMode : u8,
    keyboardMode : u8,
    pad0 : [2]u8,
}

GrabKeyboardReply :: struct {
    responseType : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

UngrabKeyboardRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    time : Timestamp,
}

GrabKeyRequest :: struct {
    majorOpcode : u8,
    ownerEvents : u8,
    length : u16,
    grabWindow : Window,
    modifiers : u16,
    key : Keycode,
    pointerMode : u8,
    keyboardMode : u8,
    pad0 : [3]u8,
}

UngrabKeyRequest :: struct {
    majorOpcode : u8,
    key : Keycode,
    length : u16,
    grabWindow : Window,
    modifiers : u16,
    pad0 : [2]u8,
}

AllowEventsRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
    time : Timestamp,
}

GrabServerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

UngrabServerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

QueryPointerCookie :: struct {
    sequence : _c.uint,
}

QueryPointerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

QueryPointerReply :: struct {
    responseType : u8,
    sameScreen : u8,
    sequence : u16,
    length : u32,
    root : Window,
    child : Window,
    rootX : i16,
    rootY : i16,
    winX : i16,
    winY : i16,
    mask : u16,
    pad0 : [2]u8,
}

Timecoord :: struct {
    time : Timestamp,
    x : i16,
    y : i16,
}

TimecoordIterator :: struct {
    data : ^Timecoord,
    rem : _c.int,
    index : _c.int,
}

GetMotionEventsCookie :: struct {
    sequence : _c.uint,
}

GetMotionEventsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    start : Timestamp,
    stop : Timestamp,
}

GetMotionEventsReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    eventsLen : u32,
    pad1 : [20]u8,
}

TranslateCoordinatesCookie :: struct {
    sequence : _c.uint,
}

TranslateCoordinatesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    srcWindow : Window,
    dstWindow : Window,
    srcX : i16,
    srcY : i16,
}

TranslateCoordinatesReply :: struct {
    responseType : u8,
    sameScreen : u8,
    sequence : u16,
    length : u32,
    child : Window,
    dstX : i16,
    dstY : i16,
}

WarpPointerRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    srcWindow : Window,
    dstWindow : Window,
    srcX : i16,
    srcY : i16,
    srcWidth : u16,
    srcHeight : u16,
    dstX : i16,
    dstY : i16,
}

SetInputFocusRequest :: struct {
    majorOpcode : u8,
    revertTo : u8,
    length : u16,
    focus : Window,
    time : Timestamp,
}

GetInputFocusCookie :: struct {
    sequence : _c.uint,
}

GetInputFocusRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetInputFocusReply :: struct {
    responseType : u8,
    revertTo : u8,
    sequence : u16,
    length : u32,
    focus : Window,
}

QueryKeymapCookie :: struct {
    sequence : _c.uint,
}

QueryKeymapRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

QueryKeymapReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    keys : [32]u8,
}

OpenFontRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    fid : Font,
    nameLen : u16,
    pad1 : [2]u8,
}

CloseFontRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    font : Font,
}

Fontprop :: struct {
    name : Atom,
    value : u32,
}

FontpropIterator :: struct {
    data : ^Fontprop,
    rem : _c.int,
    index : _c.int,
}

Charinfo :: struct {
    leftSideBearing : i16,
    rightSideBearing : i16,
    characterWidth : i16,
    ascent : i16,
    descent : i16,
    attributes : u16,
}

CharinfoIterator :: struct {
    data : ^Charinfo,
    rem : _c.int,
    index : _c.int,
}

QueryFontCookie :: struct {
    sequence : _c.uint,
}

QueryFontRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    font : Fontable,
}

QueryFontReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    minBounds : Charinfo,
    pad1 : [4]u8,
    maxBounds : Charinfo,
    pad2 : [4]u8,
    minCharOrByte2 : u16,
    maxCharOrByte2 : u16,
    defaultChar : u16,
    propertiesLen : u16,
    drawDirection : u8,
    minByte1 : u8,
    maxByte1 : u8,
    allCharsExist : u8,
    fontAscent : i16,
    fontDescent : i16,
    charInfosLen : u32,
}

QueryTextExtentsCookie :: struct {
    sequence : _c.uint,
}

QueryTextExtentsRequest :: struct {
    majorOpcode : u8,
    oddLength : u8,
    length : u16,
    font : Fontable,
}

QueryTextExtentsReply :: struct {
    responseType : u8,
    drawDirection : u8,
    sequence : u16,
    length : u32,
    fontAscent : i16,
    fontDescent : i16,
    overallAscent : i16,
    overallDescent : i16,
    overallWidth : i32,
    overallLeft : i32,
    overallRight : i32,
}

Str :: struct {
    nameLen : u8,
}

StrIterator :: struct {
    data : ^Str,
    rem : _c.int,
    index : _c.int,
}

ListFontsCookie :: struct {
    sequence : _c.uint,
}

ListFontsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    maxNames : u16,
    patternLen : u16,
}

ListFontsReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    namesLen : u16,
    pad1 : [22]u8,
}

ListFontsWithInfoCookie :: struct {
    sequence : _c.uint,
}

ListFontsWithInfoRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    maxNames : u16,
    patternLen : u16,
}

ListFontsWithInfoReply :: struct {
    responseType : u8,
    nameLen : u8,
    sequence : u16,
    length : u32,
    minBounds : Charinfo,
    pad0 : [4]u8,
    maxBounds : Charinfo,
    pad1 : [4]u8,
    minCharOrByte2 : u16,
    maxCharOrByte2 : u16,
    defaultChar : u16,
    propertiesLen : u16,
    drawDirection : u8,
    minByte1 : u8,
    maxByte1 : u8,
    allCharsExist : u8,
    fontAscent : i16,
    fontDescent : i16,
    repliesHint : u32,
}

SetFontPathRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    fontQty : u16,
    pad1 : [2]u8,
}

GetFontPathCookie :: struct {
    sequence : _c.uint,
}

GetFontPathRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetFontPathReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pathLen : u16,
    pad1 : [22]u8,
}

CreatePixmapRequest :: struct {
    majorOpcode : u8,
    depth : u8,
    length : u16,
    pid : Pixmap,
    drawable : Drawable,
    width : u16,
    height : u16,
}

FreePixmapRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    pixmap : Pixmap,
}

CreateGcValueList :: struct {
    function : u32,
    planeMask : u32,
    foreground : u32,
    background : u32,
    lineWidth : u32,
    lineStyle : u32,
    capStyle : u32,
    joinStyle : u32,
    fillStyle : u32,
    fillRule : u32,
    tile : Pixmap,
    stipple : Pixmap,
    tileStippleX_origin : i32,
    tileStippleY_origin : i32,
    font : Font,
    subwindowMode : u32,
    graphicsExposures : Bool32,
    clipX_origin : i32,
    clipY_origin : i32,
    clipMask : Pixmap,
    dashOffset : u32,
    dashes : u32,
    arcMode : u32,
}

CreateGcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cid : Gcontext,
    drawable : Drawable,
    valueMask : u32,
}

ChangeGcValueList :: struct {
    function : u32,
    planeMask : u32,
    foreground : u32,
    background : u32,
    lineWidth : u32,
    lineStyle : u32,
    capStyle : u32,
    joinStyle : u32,
    fillStyle : u32,
    fillRule : u32,
    tile : Pixmap,
    stipple : Pixmap,
    tileStippleX_origin : i32,
    tileStippleY_origin : i32,
    font : Font,
    subwindowMode : u32,
    graphicsExposures : Bool32,
    clipX_origin : i32,
    clipY_origin : i32,
    clipMask : Pixmap,
    dashOffset : u32,
    dashes : u32,
    arcMode : u32,
}

ChangeGcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    gc : Gcontext,
    valueMask : u32,
}

CopyGcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    srcGc : Gcontext,
    dstGc : Gcontext,
    valueMask : u32,
}

SetDashesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    gc : Gcontext,
    dashOffset : u16,
    dashesLen : u16,
}

SetClipRectanglesRequest :: struct {
    majorOpcode : u8,
    ordering : u8,
    length : u16,
    gc : Gcontext,
    clipX_origin : i16,
    clipY_origin : i16,
}

FreeGcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    gc : Gcontext,
}

ClearAreaRequest :: struct {
    majorOpcode : u8,
    exposures : u8,
    length : u16,
    window : Window,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
}

CopyAreaRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    srcDrawable : Drawable,
    dstDrawable : Drawable,
    gc : Gcontext,
    srcX : i16,
    srcY : i16,
    dstX : i16,
    dstY : i16,
    width : u16,
    height : u16,
}

CopyPlaneRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    srcDrawable : Drawable,
    dstDrawable : Drawable,
    gc : Gcontext,
    srcX : i16,
    srcY : i16,
    dstX : i16,
    dstY : i16,
    width : u16,
    height : u16,
    bitPlane : u32,
}

PolyPointRequest :: struct {
    majorOpcode : u8,
    coordinateMode : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

PolyLineRequest :: struct {
    majorOpcode : u8,
    coordinateMode : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

Segment :: struct {
    x1 : i16,
    y1 : i16,
    x2 : i16,
    y2 : i16,
}

SegmentIterator :: struct {
    data : ^Segment,
    rem : _c.int,
    index : _c.int,
}

PolySegmentRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

PolyRectangleRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

PolyArcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

FillPolyRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    shape : u8,
    coordinateMode : u8,
    pad1 : [2]u8,
}

PolyFillRectangleRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

PolyFillArcRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
}

PutImageRequest :: struct {
    majorOpcode : u8,
    format : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    width : u16,
    height : u16,
    dstX : i16,
    dstY : i16,
    leftPad : u8,
    depth : u8,
    pad0 : [2]u8,
}

GetImageCookie :: struct {
    sequence : _c.uint,
}

GetImageRequest :: struct {
    majorOpcode : u8,
    format : u8,
    length : u16,
    drawable : Drawable,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    planeMask : u32,
}

GetImageReply :: struct {
    responseType : u8,
    depth : u8,
    sequence : u16,
    length : u32,
    visual : Visualid,
    pad0 : [20]u8,
}

PolyText8_request :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    x : i16,
    y : i16,
}

PolyText16Request :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    x : i16,
    y : i16,
}

ImageText8_request :: struct {
    majorOpcode : u8,
    stringLen : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    x : i16,
    y : i16,
}

ImageText16Request :: struct {
    majorOpcode : u8,
    stringLen : u8,
    length : u16,
    drawable : Drawable,
    gc : Gcontext,
    x : i16,
    y : i16,
}

CreateColormapRequest :: struct {
    majorOpcode : u8,
    alloc : u8,
    length : u16,
    mid : Colormap,
    window : Window,
    visual : Visualid,
}

FreeColormapRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
}

CopyColormapAndFreeRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    mid : Colormap,
    srcCmap : Colormap,
}

InstallColormapRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
}

UninstallColormapRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
}

ListInstalledColormapsCookie :: struct {
    sequence : _c.uint,
}

ListInstalledColormapsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
}

ListInstalledColormapsReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    cmapsLen : u16,
    pad1 : [22]u8,
}

AllocColorCookie :: struct {
    sequence : _c.uint,
}

AllocColorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
    red : u16,
    green : u16,
    blue : u16,
    pad1 : [2]u8,
}

AllocColorReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    red : u16,
    green : u16,
    blue : u16,
    pad1 : [2]u8,
    pixel : u32,
}

AllocNamedColorCookie :: struct {
    sequence : _c.uint,
}

AllocNamedColorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
    nameLen : u16,
    pad1 : [2]u8,
}

AllocNamedColorReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixel : u32,
    exactRed : u16,
    exactGreen : u16,
    exactBlue : u16,
    visualRed : u16,
    visualGreen : u16,
    visualBlue : u16,
}

AllocColorCellsCookie :: struct {
    sequence : _c.uint,
}

AllocColorCellsRequest :: struct {
    majorOpcode : u8,
    contiguous : u8,
    length : u16,
    cmap : Colormap,
    colors : u16,
    planes : u16,
}

AllocColorCellsReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixelsLen : u16,
    masksLen : u16,
    pad1 : [20]u8,
}

AllocColorPlanesCookie :: struct {
    sequence : _c.uint,
}

AllocColorPlanesRequest :: struct {
    majorOpcode : u8,
    contiguous : u8,
    length : u16,
    cmap : Colormap,
    colors : u16,
    reds : u16,
    greens : u16,
    blues : u16,
}

AllocColorPlanesReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixelsLen : u16,
    pad1 : [2]u8,
    redMask : u32,
    greenMask : u32,
    blueMask : u32,
    pad2 : [8]u8,
}

FreeColorsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
    planeMask : u32,
}

Coloritem :: struct {
    pixel : u32,
    red : u16,
    green : u16,
    blue : u16,
    flags : u8,
    pad0 : u8,
}

ColoritemIterator :: struct {
    data : ^Coloritem,
    rem : _c.int,
    index : _c.int,
}

StoreColorsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
}

StoreNamedColorRequest :: struct {
    majorOpcode : u8,
    flags : u8,
    length : u16,
    cmap : Colormap,
    pixel : u32,
    nameLen : u16,
    pad0 : [2]u8,
}

Rgb :: struct {
    red : u16,
    green : u16,
    blue : u16,
    pad0 : [2]u8,
}

RgbIterator :: struct {
    data : ^Rgb,
    rem : _c.int,
    index : _c.int,
}

QueryColorsCookie :: struct {
    sequence : _c.uint,
}

QueryColorsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
}

QueryColorsReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    colorsLen : u16,
    pad1 : [22]u8,
}

LookupColorCookie :: struct {
    sequence : _c.uint,
}

LookupColorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cmap : Colormap,
    nameLen : u16,
    pad1 : [2]u8,
}

LookupColorReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    exactRed : u16,
    exactGreen : u16,
    exactBlue : u16,
    visualRed : u16,
    visualGreen : u16,
    visualBlue : u16,
}

CreateCursorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cid : Cursor,
    source : Pixmap,
    mask : Pixmap,
    foreRed : u16,
    foreGreen : u16,
    foreBlue : u16,
    backRed : u16,
    backGreen : u16,
    backBlue : u16,
    x : u16,
    y : u16,
}

CreateGlyphCursorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cid : Cursor,
    sourceFont : Font,
    maskFont : Font,
    sourceChar : u16,
    maskChar : u16,
    foreRed : u16,
    foreGreen : u16,
    foreBlue : u16,
    backRed : u16,
    backGreen : u16,
    backBlue : u16,
}

FreeCursorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cursor : Cursor,
}

RecolorCursorRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    cursor : Cursor,
    foreRed : u16,
    foreGreen : u16,
    foreBlue : u16,
    backRed : u16,
    backGreen : u16,
    backBlue : u16,
}

QueryBestSizeCookie :: struct {
    sequence : _c.uint,
}

QueryBestSizeRequest :: struct {
    majorOpcode : u8,
    class : u8,
    length : u16,
    drawable : Drawable,
    width : u16,
    height : u16,
}

QueryBestSizeReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    width : u16,
    height : u16,
}

QueryExtensionCookie :: struct {
    sequence : _c.uint,
}

QueryExtensionRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    nameLen : u16,
    pad1 : [2]u8,
}

ListExtensionsCookie :: struct {
    sequence : _c.uint,
}

ListExtensionsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

ListExtensionsReply :: struct {
    responseType : u8,
    namesLen : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

ChangeKeyboardMappingRequest :: struct {
    majorOpcode : u8,
    keycodeCount : u8,
    length : u16,
    firstKeycode : Keycode,
    keysymsPerKeycode : u8,
    pad0 : [2]u8,
}

GetKeyboardMappingCookie :: struct {
    sequence : _c.uint,
}

GetKeyboardMappingRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    firstKeycode : Keycode,
    count : u8,
}

GetKeyboardMappingReply :: struct {
    responseType : u8,
    keysymsPerKeycode : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

ChangeKeyboardControlValueList :: struct {
    keyClickPercent : i32,
    bellPercent : i32,
    bellPitch : i32,
    bellDuration : i32,
    led : u32,
    ledMode : u32,
    key : Keycode32,
    autoRepeatMode : u32,
}

ChangeKeyboardControlRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    valueMask : u32,
}

GetKeyboardControlCookie :: struct {
    sequence : _c.uint,
}

GetKeyboardControlRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetKeyboardControlReply :: struct {
    responseType : u8,
    globalAutoRepeat : u8,
    sequence : u16,
    length : u32,
    ledMask : u32,
    keyClickPercent : u8,
    bellPercent : u8,
    bellPitch : u16,
    bellDuration : u16,
    pad0 : [2]u8,
    autoRepeats : [32]u8,
}

BellRequest :: struct {
    majorOpcode : u8,
    percent : i8,
    length : u16,
}

ChangePointerControlRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    accelerationNumerator : i16,
    accelerationDenominator : i16,
    threshold : i16,
    doAcceleration : u8,
    doThreshold : u8,
}

GetPointerControlCookie :: struct {
    sequence : _c.uint,
}

GetPointerControlRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetPointerControlReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    accelerationNumerator : u16,
    accelerationDenominator : u16,
    threshold : u16,
    pad1 : [18]u8,
}

SetScreenSaverRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    timeout : i16,
    interval : i16,
    preferBlanking : u8,
    allowExposures : u8,
}

GetScreenSaverCookie :: struct {
    sequence : _c.uint,
}

GetScreenSaverRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetScreenSaverReply :: struct {
    responseType : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    timeout : u16,
    interval : u16,
    preferBlanking : u8,
    allowExposures : u8,
    pad1 : [18]u8,
}

ChangeHostsRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
    family : u8,
    pad0 : u8,
    addressLen : u16,
}

Host :: struct {
    family : u8,
    pad0 : u8,
    addressLen : u16,
}

HostIterator :: struct {
    data : ^Host,
    rem : _c.int,
    index : _c.int,
}

ListHostsCookie :: struct {
    sequence : _c.uint,
}

ListHostsRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

ListHostsReply :: struct {
    responseType : u8,
    mode : u8,
    sequence : u16,
    length : u32,
    hostsLen : u16,
    pad0 : [22]u8,
}

SetAccessControlRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
}

SetCloseDownModeRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
}

KillClientRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    resource : u32,
}

RotatePropertiesRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
    window : Window,
    atomsLen : u16,
    delta : i16,
}

ForceScreenSaverRequest :: struct {
    majorOpcode : u8,
    mode : u8,
    length : u16,
}

SetPointerMappingCookie :: struct {
    sequence : _c.uint,
}

SetPointerMappingRequest :: struct {
    majorOpcode : u8,
    mapLen : u8,
    length : u16,
}

SetPointerMappingReply :: struct {
    responseType : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

GetPointerMappingCookie :: struct {
    sequence : _c.uint,
}

GetPointerMappingRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetPointerMappingReply :: struct {
    responseType : u8,
    mapLen : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

SetModifierMappingCookie :: struct {
    sequence : _c.uint,
}

SetModifierMappingRequest :: struct {
    majorOpcode : u8,
    keycodesPerModifier : u8,
    length : u16,
}

SetModifierMappingReply :: struct {
    responseType : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

GetModifierMappingCookie :: struct {
    sequence : _c.uint,
}

GetModifierMappingRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

GetModifierMappingReply :: struct {
    responseType : u8,
    keycodesPerModifier : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

NoOperationRequest :: struct {
    majorOpcode : u8,
    pad0 : u8,
    length : u16,
}

ClientMessageData :: struct #raw_union {
    data8 : [20]u8,
    data16 : [10]u16,
    data32 : [5]u32,
}

foreign import x11_xcb "system:xcb"

@(default_calling_convention="c")
foreign x11_xcb {

    @(link_name="xcb_flush")
    flush :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_get_maximum_request_length")
    get_maximum_request_length :: proc(c : ^Connection) -> u32 ---

    @(link_name="xcb_prefetch_maximum_request_length")
    prefetch_maximum_request_length :: proc(c : ^Connection) ---

    @(link_name="xcb_wait_for_event")
    wait_for_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_poll_for_event")
    poll_for_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_poll_for_queued_event")
    poll_for_queued_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_poll_for_special_event")
    poll_for_special_event :: proc(
        c : ^Connection,
        se : ^SpecialEvent,
    ) -> ^GenericEvent ---

    @(link_name="xcb_wait_for_special_event")
    wait_for_special_event :: proc(
        c : ^Connection,
        se : ^SpecialEvent,
    ) -> ^GenericEvent ---

    @(link_name="xcb_register_for_special_xge")
    register_for_special_xge :: proc(
        c : ^Connection,
        ext : ^Extension,
        eid : u32,
        stamp : ^u32,
    ) -> ^SpecialEvent ---

    @(link_name="xcb_unregister_for_special_event")
    unregister_for_special_event :: proc(
        c : ^Connection,
        se : ^SpecialEvent,
    ) ---

    @(link_name="xcb_request_check")
    request_check :: proc(
        c : ^Connection,
        cookie : VoidCookie,
    ) -> ^GenericError ---

    @(link_name="xcb_discard_reply")
    discard_reply :: proc(
        c : ^Connection,
        sequence : _c.uint,
    ) ---

    @(link_name="xcb_discard_reply64")
    discard_reply64 :: proc(
        c : ^Connection,
        sequence : u64,
    ) ---

    @(link_name="xcb_get_extension_data")
    get_extension_data :: proc(
        c : ^Connection,
        ext : ^Extension,
    ) -> ^QueryExtensionReply ---

    @(link_name="xcb_prefetch_extension_data")
    prefetch_extension_data :: proc(
        c : ^Connection,
        ext : ^Extension,
    ) ---

    @(link_name="xcb_get_setup")
    get_setup :: proc(c : ^Connection) -> ^Setup ---

    @(link_name="xcb_get_file_descriptor")
    get_file_descriptor :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_connection_has_error")
    connection_has_error :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_connect_to_fd")
    connect_to_fd :: proc(
        fd : _c.int,
        authInfo : ^AuthInfo,
    ) -> ^Connection ---

    @(link_name="xcb_disconnect")
    disconnect :: proc(c : ^Connection) ---

    @(link_name="xcb_parse_display")
    parse_display :: proc(
        name : cstring,
        host : ^cstring,
        display : ^_c.int,
        screen : ^_c.int,
    ) -> _c.int ---

    @(link_name="xcb_connect")
    connect :: proc(
        displayname : cstring,
        screenp : ^_c.int,
    ) -> ^Connection ---

    @(link_name="xcb_connect_to_display_with_auth_info")
    connect_to_display_with_auth_info :: proc(
        display : cstring,
        auth : ^AuthInfo,
        screen : ^_c.int,
    ) -> ^Connection ---

    @(link_name="xcb_generate_id")
    generate_id :: proc(c : ^Connection) -> u32 ---

    @(link_name="xcb_total_read")
    total_read :: proc(c : ^Connection) -> u64 ---

    @(link_name="xcb_total_written")
    total_written :: proc(c : ^Connection) -> u64 ---

    @(link_name="xcb_char2b_next")
    char2b_next :: proc(i : ^Char2BIterator) ---

    @(link_name="xcb_char2b_end")
    char2b_end :: proc(i : Char2BIterator) -> GenericIterator ---

    @(link_name="xcb_window_next")
    window_next :: proc(i : ^WindowIterator) ---

    @(link_name="xcb_window_end")
    window_end :: proc(i : WindowIterator) -> GenericIterator ---

    @(link_name="xcb_pixmap_next")
    pixmap_next :: proc(i : ^PixmapIterator) ---

    @(link_name="xcb_pixmap_end")
    pixmap_end :: proc(i : PixmapIterator) -> GenericIterator ---

    @(link_name="xcb_cursor_next")
    cursor_next :: proc(i : ^CursorIterator) ---

    @(link_name="xcb_cursor_end")
    cursor_end :: proc(i : CursorIterator) -> GenericIterator ---

    @(link_name="xcb_font_next")
    font_next :: proc(i : ^FontIterator) ---

    @(link_name="xcb_font_end")
    font_end :: proc(i : FontIterator) -> GenericIterator ---

    @(link_name="xcb_gcontext_next")
    gcontext_next :: proc(i : ^GcontextIterator) ---

    @(link_name="xcb_gcontext_end")
    gcontext_end :: proc(i : GcontextIterator) -> GenericIterator ---

    @(link_name="xcb_colormap_next")
    colormap_next :: proc(i : ^ColormapIterator) ---

    @(link_name="xcb_colormap_end")
    colormap_end :: proc(i : ColormapIterator) -> GenericIterator ---

    @(link_name="xcb_atom_next")
    atom_next :: proc(i : ^AtomIterator) ---

    @(link_name="xcb_atom_end")
    atom_end :: proc(i : AtomIterator) -> GenericIterator ---

    @(link_name="xcb_drawable_next")
    drawable_next :: proc(i : ^DrawableIterator) ---

    @(link_name="xcb_drawable_end")
    drawable_end :: proc(i : DrawableIterator) -> GenericIterator ---

    @(link_name="xcb_fontable_next")
    fontable_next :: proc(i : ^FontableIterator) ---

    @(link_name="xcb_fontable_end")
    fontable_end :: proc(i : FontableIterator) -> GenericIterator ---

    @(link_name="xcb_bool32_next")
    bool32_next :: proc(i : ^Bool32Iterator) ---

    @(link_name="xcb_bool32_end")
    bool32_end :: proc(i : Bool32Iterator) -> GenericIterator ---

    @(link_name="xcb_visualid_next")
    visualid_next :: proc(i : ^VisualidIterator) ---

    @(link_name="xcb_visualid_end")
    visualid_end :: proc(i : VisualidIterator) -> GenericIterator ---

    @(link_name="xcb_timestamp_next")
    timestamp_next :: proc(i : ^TimestampIterator) ---

    @(link_name="xcb_timestamp_end")
    timestamp_end :: proc(i : TimestampIterator) -> GenericIterator ---

    @(link_name="xcb_keysym_next")
    keysym_next :: proc(i : ^KeysymIterator) ---

    @(link_name="xcb_keysym_end")
    keysym_end :: proc(i : KeysymIterator) -> GenericIterator ---

    @(link_name="xcb_keycode_next")
    keycode_next :: proc(i : ^KeycodeIterator) ---

    @(link_name="xcb_keycode_end")
    keycode_end :: proc(i : KeycodeIterator) -> GenericIterator ---

    @(link_name="xcb_keycode32_next")
    keycode32_next :: proc(i : ^Keycode32Iterator) ---

    @(link_name="xcb_keycode32_end")
    keycode32_end :: proc(i : Keycode32Iterator) -> GenericIterator ---

    @(link_name="xcb_button_next")
    button_next :: proc(i : ^ButtonIterator) ---

    @(link_name="xcb_button_end")
    button_end :: proc(i : ButtonIterator) -> GenericIterator ---

    @(link_name="xcb_point_next")
    point_next :: proc(i : ^PointIterator) ---

    @(link_name="xcb_point_end")
    point_end :: proc(i : PointIterator) -> GenericIterator ---

    @(link_name="xcb_rectangle_next")
    rectangle_next :: proc(i : ^RectangleIterator) ---

    @(link_name="xcb_rectangle_end")
    rectangle_end :: proc(i : RectangleIterator) -> GenericIterator ---

    @(link_name="xcb_arc_next")
    arc_next :: proc(i : ^ArcIterator) ---

    @(link_name="xcb_arc_end")
    arc_end :: proc(i : ArcIterator) -> GenericIterator ---

    @(link_name="xcb_format_next")
    format_next :: proc(i : ^FormatIterator) ---

    @(link_name="xcb_format_end")
    format_end :: proc(i : FormatIterator) -> GenericIterator ---

    @(link_name="xcb_visualtype_next")
    visualtype_next :: proc(i : ^VisualtypeIterator) ---

    @(link_name="xcb_visualtype_end")
    visualtype_end :: proc(i : VisualtypeIterator) -> GenericIterator ---

    @(link_name="xcb_depth_sizeof")
    depth_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_depth_visuals")
    depth_visuals :: proc(r : ^Depth) -> ^Visualtype ---

    @(link_name="xcb_depth_visuals_length")
    depth_visuals_length :: proc(r : ^Depth) -> _c.int ---

    @(link_name="xcb_depth_visuals_iterator")
    depth_visuals_iterator :: proc(r : ^Depth) -> VisualtypeIterator ---

    @(link_name="xcb_depth_next")
    depth_next :: proc(i : ^DepthIterator) ---

    @(link_name="xcb_depth_end")
    depth_end :: proc(i : DepthIterator) -> GenericIterator ---

    @(link_name="xcb_screen_sizeof")
    screen_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_screen_allowed_depths_length")
    screen_allowed_depths_length :: proc(r : ^Screen) -> _c.int ---

    @(link_name="xcb_screen_allowed_depths_iterator")
    screen_allowed_depths_iterator :: proc(r : ^Screen) -> DepthIterator ---

    @(link_name="xcb_screen_next")
    screen_next :: proc(i : ^ScreenIterator) ---

    @(link_name="xcb_screen_end")
    screen_end :: proc(i : ScreenIterator) -> GenericIterator ---

    @(link_name="xcb_setup_request_sizeof")
    setup_request_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_name")
    setup_request_authorization_protocol_name :: proc(r : ^SetupRequest) -> cstring ---

    @(link_name="xcb_setup_request_authorization_protocol_name_length")
    setup_request_authorization_protocol_name_length :: proc(r : ^SetupRequest) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_name_end")
    setup_request_authorization_protocol_name_end :: proc(r : ^SetupRequest) -> GenericIterator ---

    @(link_name="xcb_setup_request_authorization_protocol_data")
    setup_request_authorization_protocol_data :: proc(r : ^SetupRequest) -> cstring ---

    @(link_name="xcb_setup_request_authorization_protocol_data_length")
    setup_request_authorization_protocol_data_length :: proc(r : ^SetupRequest) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_data_end")
    setup_request_authorization_protocol_data_end :: proc(r : ^SetupRequest) -> GenericIterator ---

    @(link_name="xcb_setup_request_next")
    setup_request_next :: proc(i : ^SetupRequestIterator) ---

    @(link_name="xcb_setup_request_end")
    setup_request_end :: proc(i : SetupRequestIterator) -> GenericIterator ---

    @(link_name="xcb_setup_failed_sizeof")
    setup_failed_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_failed_reason")
    setup_failed_reason :: proc(r : ^SetupFailed) -> cstring ---

    @(link_name="xcb_setup_failed_reason_length")
    setup_failed_reason_length :: proc(r : ^SetupFailed) -> _c.int ---

    @(link_name="xcb_setup_failed_reason_end")
    setup_failed_reason_end :: proc(r : ^SetupFailed) -> GenericIterator ---

    @(link_name="xcb_setup_failed_next")
    setup_failed_next :: proc(i : ^SetupFailedIterator) ---

    @(link_name="xcb_setup_failed_end")
    setup_failed_end :: proc(i : SetupFailedIterator) -> GenericIterator ---

    @(link_name="xcb_setup_authenticate_sizeof")
    setup_authenticate_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_authenticate_reason")
    setup_authenticate_reason :: proc(r : ^SetupAuthenticate) -> cstring ---

    @(link_name="xcb_setup_authenticate_reason_length")
    setup_authenticate_reason_length :: proc(r : ^SetupAuthenticate) -> _c.int ---

    @(link_name="xcb_setup_authenticate_reason_end")
    setup_authenticate_reason_end :: proc(r : ^SetupAuthenticate) -> GenericIterator ---

    @(link_name="xcb_setup_authenticate_next")
    setup_authenticate_next :: proc(i : ^SetupAuthenticateIterator) ---

    @(link_name="xcb_setup_authenticate_end")
    setup_authenticate_end :: proc(i : SetupAuthenticateIterator) -> GenericIterator ---

    @(link_name="xcb_setup_sizeof")
    setup_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_vendor")
    setup_vendor :: proc(r : ^Setup) -> cstring ---

    @(link_name="xcb_setup_vendor_length")
    setup_vendor_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_vendor_end")
    setup_vendor_end :: proc(r : ^Setup) -> GenericIterator ---

    @(link_name="xcb_setup_pixmap_formats")
    setup_pixmap_formats :: proc(r : ^Setup) -> ^Format ---

    @(link_name="xcb_setup_pixmap_formats_length")
    setup_pixmap_formats_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_pixmap_formats_iterator")
    setup_pixmap_formats_iterator :: proc(r : ^Setup) -> FormatIterator ---

    @(link_name="xcb_setup_roots_length")
    setup_roots_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_roots_iterator")
    setup_roots_iterator :: proc(r : ^Setup) -> ScreenIterator ---

    @(link_name="xcb_setup_next")
    setup_next :: proc(i : ^SetupIterator) ---

    @(link_name="xcb_setup_end")
    setup_end :: proc(i : SetupIterator) -> GenericIterator ---

    @(link_name="xcb_client_message_data_next")
    client_message_data_next :: proc(i : ^ClientMessageDataIterator) ---

    @(link_name="xcb_client_message_data_end")
    client_message_data_end :: proc(i : ClientMessageDataIterator) -> GenericIterator ---

    @(link_name="xcb_create_window_value_list_serialize")
    create_window_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u32,
        aux : ^CreateWindowValueList,
    ) -> _c.int ---

    @(link_name="xcb_create_window_value_list_unpack")
    create_window_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u32,
        aux : ^CreateWindowValueList,
    ) -> _c.int ---

    @(link_name="xcb_create_window_value_list_sizeof")
    create_window_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u32,
    ) -> _c.int ---

    @(link_name="xcb_create_window_sizeof")
    create_window_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_create_window_checked")
    create_window_checked :: proc(
        c : ^Connection,
        depth : u8,
        wid : Window,
        parent : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        borderWidth : u16,
        class : u16,
        visual : Visualid,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_create_window")
    create_window :: proc(
        c : ^Connection,
        depth : u8,
        wid : Window,
        parent : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        borderWidth : u16,
        class : WindowClass,
        visual : Visualid,
        valueMask : CwFlags,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_create_window_aux_checked")
    create_window_aux_checked :: proc(
        c : ^Connection,
        depth : u8,
        wid : Window,
        parent : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        borderWidth : u16,
        class : u16,
        visual : Visualid,
        valueMask : u32,
        valueList : ^CreateWindowValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_create_window_aux")
    create_window_aux :: proc(
        c : ^Connection,
        depth : u8,
        wid : Window,
        parent : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        borderWidth : u16,
        class : u16,
        visual : Visualid,
        valueMask : u32,
        valueList : ^CreateWindowValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_create_window_value_list")
    create_window_value_list :: proc(r : ^CreateWindowRequest) -> rawptr ---

    @(link_name="xcb_change_window_attributes_value_list_serialize")
    change_window_attributes_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u32,
        aux : ^ChangeWindowAttributesValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_window_attributes_value_list_unpack")
    change_window_attributes_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u32,
        aux : ^ChangeWindowAttributesValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_window_attributes_value_list_sizeof")
    change_window_attributes_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u32,
    ) -> _c.int ---

    @(link_name="xcb_change_window_attributes_sizeof")
    change_window_attributes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_window_attributes_checked")
    change_window_attributes_checked :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes")
    change_window_attributes :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_aux_checked")
    change_window_attributes_aux_checked :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u32,
        valueList : ^ChangeWindowAttributesValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_aux")
    change_window_attributes_aux :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u32,
        valueList : ^ChangeWindowAttributesValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_value_list")
    change_window_attributes_value_list :: proc(r : ^ChangeWindowAttributesRequest) -> rawptr ---

    @(link_name="xcb_get_window_attributes")
    get_window_attributes :: proc(
        c : ^Connection,
        window : Window,
    ) -> GetWindowAttributesCookie ---

    @(link_name="xcb_get_window_attributes_unchecked")
    get_window_attributes_unchecked :: proc(
        c : ^Connection,
        window : Window,
    ) -> GetWindowAttributesCookie ---

    @(link_name="xcb_get_window_attributes_reply")
    get_window_attributes_reply :: proc(
        c : ^Connection,
        cookie : GetWindowAttributesCookie,
        e : ^^GenericError,
    ) -> ^GetWindowAttributesReply ---

    @(link_name="xcb_destroy_window_checked")
    destroy_window_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_destroy_window")
    destroy_window :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_destroy_subwindows_checked")
    destroy_subwindows_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_destroy_subwindows")
    destroy_subwindows :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_change_save_set_checked")
    change_save_set_checked :: proc(
        c : ^Connection,
        mode : u8,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_change_save_set")
    change_save_set :: proc(
        c : ^Connection,
        mode : u8,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_reparent_window_checked")
    reparent_window_checked :: proc(
        c : ^Connection,
        window : Window,
        parent : Window,
        x : i16,
        y : i16,
    ) -> VoidCookie ---

    @(link_name="xcb_reparent_window")
    reparent_window :: proc(
        c : ^Connection,
        window : Window,
        parent : Window,
        x : i16,
        y : i16,
    ) -> VoidCookie ---

    @(link_name="xcb_map_window_checked")
    map_window_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_map_window")
    map_window :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_map_subwindows_checked")
    map_subwindows_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_map_subwindows")
    map_subwindows :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_unmap_window_checked")
    unmap_window_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_unmap_window")
    unmap_window :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_unmap_subwindows_checked")
    unmap_subwindows_checked :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_unmap_subwindows")
    unmap_subwindows :: proc(
        c : ^Connection,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_configure_window_value_list_serialize")
    configure_window_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u16,
        aux : ^ConfigureWindowValueList,
    ) -> _c.int ---

    @(link_name="xcb_configure_window_value_list_unpack")
    configure_window_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u16,
        aux : ^ConfigureWindowValueList,
    ) -> _c.int ---

    @(link_name="xcb_configure_window_value_list_sizeof")
    configure_window_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u16,
    ) -> _c.int ---

    @(link_name="xcb_configure_window_sizeof")
    configure_window_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_configure_window_checked")
    configure_window_checked :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u16,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_configure_window")
    configure_window :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u16,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_configure_window_aux_checked")
    configure_window_aux_checked :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u16,
        valueList : ^ConfigureWindowValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_configure_window_aux")
    configure_window_aux :: proc(
        c : ^Connection,
        window : Window,
        valueMask : u16,
        valueList : ^ConfigureWindowValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_configure_window_value_list")
    configure_window_value_list :: proc(r : ^ConfigureWindowRequest) -> rawptr ---

    @(link_name="xcb_circulate_window_checked")
    circulate_window_checked :: proc(
        c : ^Connection,
        direction : u8,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_circulate_window")
    circulate_window :: proc(
        c : ^Connection,
        direction : u8,
        window : Window,
    ) -> VoidCookie ---

    @(link_name="xcb_get_geometry")
    get_geometry :: proc(
        c : ^Connection,
        drawable : Drawable,
    ) -> GetGeometryCookie ---

    @(link_name="xcb_get_geometry_unchecked")
    get_geometry_unchecked :: proc(
        c : ^Connection,
        drawable : Drawable,
    ) -> GetGeometryCookie ---

    @(link_name="xcb_get_geometry_reply")
    get_geometry_reply :: proc(
        c : ^Connection,
        cookie : GetGeometryCookie,
        e : ^^GenericError,
    ) -> ^GetGeometryReply ---

    @(link_name="xcb_query_tree_sizeof")
    query_tree_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_tree")
    query_tree :: proc(
        c : ^Connection,
        window : Window,
    ) -> QueryTreeCookie ---

    @(link_name="xcb_query_tree_unchecked")
    query_tree_unchecked :: proc(
        c : ^Connection,
        window : Window,
    ) -> QueryTreeCookie ---

    @(link_name="xcb_query_tree_children")
    query_tree_children :: proc(r : ^QueryTreeReply) -> ^Window ---

    @(link_name="xcb_query_tree_children_length")
    query_tree_children_length :: proc(r : ^QueryTreeReply) -> _c.int ---

    @(link_name="xcb_query_tree_children_end")
    query_tree_children_end :: proc(r : ^QueryTreeReply) -> GenericIterator ---

    @(link_name="xcb_query_tree_reply")
    query_tree_reply :: proc(
        c : ^Connection,
        cookie : QueryTreeCookie,
        e : ^^GenericError,
    ) -> ^QueryTreeReply ---

    @(link_name="xcb_intern_atom_sizeof")
    intern_atom_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_intern_atom")
    intern_atom :: proc(
        c : ^Connection,
        onlyIfExists : u8,
        nameLen : u16,
        name : cstring,
    ) -> InternAtomCookie ---

    @(link_name="xcb_intern_atom_unchecked")
    intern_atom_unchecked :: proc(
        c : ^Connection,
        onlyIfExists : u8,
        nameLen : u16,
        name : cstring,
    ) -> InternAtomCookie ---

    @(link_name="xcb_intern_atom_reply")
    intern_atom_reply :: proc(
        c : ^Connection,
        cookie : InternAtomCookie,
        e : ^^GenericError,
    ) -> ^InternAtomReply ---

    @(link_name="xcb_get_atom_name_sizeof")
    get_atom_name_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_atom_name")
    get_atom_name :: proc(
        c : ^Connection,
        atom : Atom,
    ) -> GetAtomNameCookie ---

    @(link_name="xcb_get_atom_name_unchecked")
    get_atom_name_unchecked :: proc(
        c : ^Connection,
        atom : Atom,
    ) -> GetAtomNameCookie ---

    @(link_name="xcb_get_atom_name_name")
    get_atom_name_name :: proc(r : ^GetAtomNameReply) -> cstring ---

    @(link_name="xcb_get_atom_name_name_length")
    get_atom_name_name_length :: proc(r : ^GetAtomNameReply) -> _c.int ---

    @(link_name="xcb_get_atom_name_name_end")
    get_atom_name_name_end :: proc(r : ^GetAtomNameReply) -> GenericIterator ---

    @(link_name="xcb_get_atom_name_reply")
    get_atom_name_reply :: proc(
        c : ^Connection,
        cookie : GetAtomNameCookie,
        e : ^^GenericError,
    ) -> ^GetAtomNameReply ---

    @(link_name="xcb_change_property_sizeof")
    change_property_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_property_checked")
    change_property_checked :: proc(
        c : ^Connection,
        mode : u8,
        window : Window,
        property : Atom,
        type : Atom,
        format : u8,
        dataLen : u32,
        data : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_property")
    change_property :: proc(
        c : ^Connection,
        mode : u8,
        window : Window,
        property : Atom,
        type : Atom,
        format : u8,
        dataLen : u32,
        data : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_property_data")
    change_property_data :: proc(r : ^ChangePropertyRequest) -> rawptr ---

    @(link_name="xcb_change_property_data_length")
    change_property_data_length :: proc(r : ^ChangePropertyRequest) -> _c.int ---

    @(link_name="xcb_change_property_data_end")
    change_property_data_end :: proc(r : ^ChangePropertyRequest) -> GenericIterator ---

    @(link_name="xcb_delete_property_checked")
    delete_property_checked :: proc(
        c : ^Connection,
        window : Window,
        property : Atom,
    ) -> VoidCookie ---

    @(link_name="xcb_delete_property")
    delete_property :: proc(
        c : ^Connection,
        window : Window,
        property : Atom,
    ) -> VoidCookie ---

    @(link_name="xcb_get_property_sizeof")
    get_property_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_property")
    get_property :: proc(
        c : ^Connection,
        delete : u8,
        window : Window,
        property : Atom,
        type : Atom,
        longOffset : u32,
        longLength : u32,
    ) -> GetPropertyCookie ---

    @(link_name="xcb_get_property_unchecked")
    get_property_unchecked :: proc(
        c : ^Connection,
        delete : u8,
        window : Window,
        property : Atom,
        type : Atom,
        longOffset : u32,
        longLength : u32,
    ) -> GetPropertyCookie ---

    @(link_name="xcb_get_property_value")
    get_property_value :: proc(r : ^GetPropertyReply) -> rawptr ---

    @(link_name="xcb_get_property_value_length")
    get_property_value_length :: proc(r : ^GetPropertyReply) -> _c.int ---

    @(link_name="xcb_get_property_value_end")
    get_property_value_end :: proc(r : ^GetPropertyReply) -> GenericIterator ---

    @(link_name="xcb_get_property_reply")
    get_property_reply :: proc(
        c : ^Connection,
        cookie : GetPropertyCookie,
        e : ^^GenericError,
    ) -> ^GetPropertyReply ---

    @(link_name="xcb_list_properties_sizeof")
    list_properties_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_properties")
    list_properties :: proc(
        c : ^Connection,
        window : Window,
    ) -> ListPropertiesCookie ---

    @(link_name="xcb_list_properties_unchecked")
    list_properties_unchecked :: proc(
        c : ^Connection,
        window : Window,
    ) -> ListPropertiesCookie ---

    @(link_name="xcb_list_properties_atoms")
    list_properties_atoms :: proc(r : ^ListPropertiesReply) -> ^Atom ---

    @(link_name="xcb_list_properties_atoms_length")
    list_properties_atoms_length :: proc(r : ^ListPropertiesReply) -> _c.int ---

    @(link_name="xcb_list_properties_atoms_end")
    list_properties_atoms_end :: proc(r : ^ListPropertiesReply) -> GenericIterator ---

    @(link_name="xcb_list_properties_reply")
    list_properties_reply :: proc(
        c : ^Connection,
        cookie : ListPropertiesCookie,
        e : ^^GenericError,
    ) -> ^ListPropertiesReply ---

    @(link_name="xcb_set_selection_owner_checked")
    set_selection_owner_checked :: proc(
        c : ^Connection,
        owner : Window,
        selection : Atom,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_set_selection_owner")
    set_selection_owner :: proc(
        c : ^Connection,
        owner : Window,
        selection : Atom,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_get_selection_owner")
    get_selection_owner :: proc(
        c : ^Connection,
        selection : Atom,
    ) -> GetSelectionOwnerCookie ---

    @(link_name="xcb_get_selection_owner_unchecked")
    get_selection_owner_unchecked :: proc(
        c : ^Connection,
        selection : Atom,
    ) -> GetSelectionOwnerCookie ---

    @(link_name="xcb_get_selection_owner_reply")
    get_selection_owner_reply :: proc(
        c : ^Connection,
        cookie : GetSelectionOwnerCookie,
        e : ^^GenericError,
    ) -> ^GetSelectionOwnerReply ---

    @(link_name="xcb_convert_selection_checked")
    convert_selection_checked :: proc(
        c : ^Connection,
        requestor : Window,
        selection : Atom,
        target : Atom,
        property : Atom,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_convert_selection")
    convert_selection :: proc(
        c : ^Connection,
        requestor : Window,
        selection : Atom,
        target : Atom,
        property : Atom,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_send_event_checked")
    send_event_checked :: proc(
        c : ^Connection,
        propagate : u8,
        destination : Window,
        eventMask : u32,
        event : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_send_event")
    send_event :: proc(
        c : ^Connection,
        propagate : u8,
        destination : Window,
        eventMask : u32,
        event : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_pointer")
    grab_pointer :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        eventMask : u16,
        pointerMode : u8,
        keyboardMode : u8,
        confineTo : Window,
        cursor : Cursor,
        time : Timestamp,
    ) -> GrabPointerCookie ---

    @(link_name="xcb_grab_pointer_unchecked")
    grab_pointer_unchecked :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        eventMask : u16,
        pointerMode : u8,
        keyboardMode : u8,
        confineTo : Window,
        cursor : Cursor,
        time : Timestamp,
    ) -> GrabPointerCookie ---

    @(link_name="xcb_grab_pointer_reply")
    grab_pointer_reply :: proc(
        c : ^Connection,
        cookie : GrabPointerCookie,
        e : ^^GenericError,
    ) -> ^GrabPointerReply ---

    @(link_name="xcb_ungrab_pointer_checked")
    ungrab_pointer_checked :: proc(
        c : ^Connection,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_pointer")
    ungrab_pointer :: proc(
        c : ^Connection,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_button_checked")
    grab_button_checked :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        eventMask : u16,
        pointerMode : u8,
        keyboardMode : u8,
        confineTo : Window,
        cursor : Cursor,
        button : u8,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_button")
    grab_button :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        eventMask : u16,
        pointerMode : u8,
        keyboardMode : u8,
        confineTo : Window,
        cursor : Cursor,
        button : u8,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_button_checked")
    ungrab_button_checked :: proc(
        c : ^Connection,
        button : u8,
        grabWindow : Window,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_button")
    ungrab_button :: proc(
        c : ^Connection,
        button : u8,
        grabWindow : Window,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_change_active_pointer_grab_checked")
    change_active_pointer_grab_checked :: proc(
        c : ^Connection,
        cursor : Cursor,
        time : Timestamp,
        eventMask : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_change_active_pointer_grab")
    change_active_pointer_grab :: proc(
        c : ^Connection,
        cursor : Cursor,
        time : Timestamp,
        eventMask : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_keyboard")
    grab_keyboard :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        time : Timestamp,
        pointerMode : u8,
        keyboardMode : u8,
    ) -> GrabKeyboardCookie ---

    @(link_name="xcb_grab_keyboard_unchecked")
    grab_keyboard_unchecked :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        time : Timestamp,
        pointerMode : u8,
        keyboardMode : u8,
    ) -> GrabKeyboardCookie ---

    @(link_name="xcb_grab_keyboard_reply")
    grab_keyboard_reply :: proc(
        c : ^Connection,
        cookie : GrabKeyboardCookie,
        e : ^^GenericError,
    ) -> ^GrabKeyboardReply ---

    @(link_name="xcb_ungrab_keyboard_checked")
    ungrab_keyboard_checked :: proc(
        c : ^Connection,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_keyboard")
    ungrab_keyboard :: proc(
        c : ^Connection,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_key_checked")
    grab_key_checked :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        modifiers : u16,
        key : Keycode,
        pointerMode : u8,
        keyboardMode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_key")
    grab_key :: proc(
        c : ^Connection,
        ownerEvents : u8,
        grabWindow : Window,
        modifiers : u16,
        key : Keycode,
        pointerMode : u8,
        keyboardMode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_key_checked")
    ungrab_key_checked :: proc(
        c : ^Connection,
        key : Keycode,
        grabWindow : Window,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_ungrab_key")
    ungrab_key :: proc(
        c : ^Connection,
        key : Keycode,
        grabWindow : Window,
        modifiers : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_allow_events_checked")
    allow_events_checked :: proc(
        c : ^Connection,
        mode : u8,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_allow_events")
    allow_events :: proc(
        c : ^Connection,
        mode : u8,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_grab_server_checked")
    grab_server_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_grab_server")
    grab_server :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_ungrab_server_checked")
    ungrab_server_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_ungrab_server")
    ungrab_server :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_query_pointer")
    query_pointer :: proc(
        c : ^Connection,
        window : Window,
    ) -> QueryPointerCookie ---

    @(link_name="xcb_query_pointer_unchecked")
    query_pointer_unchecked :: proc(
        c : ^Connection,
        window : Window,
    ) -> QueryPointerCookie ---

    @(link_name="xcb_query_pointer_reply")
    query_pointer_reply :: proc(
        c : ^Connection,
        cookie : QueryPointerCookie,
        e : ^^GenericError,
    ) -> ^QueryPointerReply ---

    @(link_name="xcb_timecoord_next")
    timecoord_next :: proc(i : ^TimecoordIterator) ---

    @(link_name="xcb_timecoord_end")
    timecoord_end :: proc(i : TimecoordIterator) -> GenericIterator ---

    @(link_name="xcb_get_motion_events_sizeof")
    get_motion_events_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_motion_events")
    get_motion_events :: proc(
        c : ^Connection,
        window : Window,
        start : Timestamp,
        stop : Timestamp,
    ) -> GetMotionEventsCookie ---

    @(link_name="xcb_get_motion_events_unchecked")
    get_motion_events_unchecked :: proc(
        c : ^Connection,
        window : Window,
        start : Timestamp,
        stop : Timestamp,
    ) -> GetMotionEventsCookie ---

    @(link_name="xcb_get_motion_events_events")
    get_motion_events_events :: proc(r : ^GetMotionEventsReply) -> ^Timecoord ---

    @(link_name="xcb_get_motion_events_events_length")
    get_motion_events_events_length :: proc(r : ^GetMotionEventsReply) -> _c.int ---

    @(link_name="xcb_get_motion_events_events_iterator")
    get_motion_events_events_iterator :: proc(r : ^GetMotionEventsReply) -> TimecoordIterator ---

    @(link_name="xcb_get_motion_events_reply")
    get_motion_events_reply :: proc(
        c : ^Connection,
        cookie : GetMotionEventsCookie,
        e : ^^GenericError,
    ) -> ^GetMotionEventsReply ---

    @(link_name="xcb_translate_coordinates")
    translate_coordinates :: proc(
        c : ^Connection,
        srcWindow : Window,
        dstWindow : Window,
        srcX : i16,
        srcY : i16,
    ) -> TranslateCoordinatesCookie ---

    @(link_name="xcb_translate_coordinates_unchecked")
    translate_coordinates_unchecked :: proc(
        c : ^Connection,
        srcWindow : Window,
        dstWindow : Window,
        srcX : i16,
        srcY : i16,
    ) -> TranslateCoordinatesCookie ---

    @(link_name="xcb_translate_coordinates_reply")
    translate_coordinates_reply :: proc(
        c : ^Connection,
        cookie : TranslateCoordinatesCookie,
        e : ^^GenericError,
    ) -> ^TranslateCoordinatesReply ---

    @(link_name="xcb_warp_pointer_checked")
    warp_pointer_checked :: proc(
        c : ^Connection,
        srcWindow : Window,
        dstWindow : Window,
        srcX : i16,
        srcY : i16,
        srcWidth : u16,
        srcHeight : u16,
        dstX : i16,
        dstY : i16,
    ) -> VoidCookie ---

    @(link_name="xcb_warp_pointer")
    warp_pointer :: proc(
        c : ^Connection,
        srcWindow : Window,
        dstWindow : Window,
        srcX : i16,
        srcY : i16,
        srcWidth : u16,
        srcHeight : u16,
        dstX : i16,
        dstY : i16,
    ) -> VoidCookie ---

    @(link_name="xcb_set_input_focus_checked")
    set_input_focus_checked :: proc(
        c : ^Connection,
        revertTo : u8,
        focus : Window,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_set_input_focus")
    set_input_focus :: proc(
        c : ^Connection,
        revertTo : u8,
        focus : Window,
        time : Timestamp,
    ) -> VoidCookie ---

    @(link_name="xcb_get_input_focus")
    get_input_focus :: proc(c : ^Connection) -> GetInputFocusCookie ---

    @(link_name="xcb_get_input_focus_unchecked")
    get_input_focus_unchecked :: proc(c : ^Connection) -> GetInputFocusCookie ---

    @(link_name="xcb_get_input_focus_reply")
    get_input_focus_reply :: proc(
        c : ^Connection,
        cookie : GetInputFocusCookie,
        e : ^^GenericError,
    ) -> ^GetInputFocusReply ---

    @(link_name="xcb_query_keymap")
    query_keymap :: proc(c : ^Connection) -> QueryKeymapCookie ---

    @(link_name="xcb_query_keymap_unchecked")
    query_keymap_unchecked :: proc(c : ^Connection) -> QueryKeymapCookie ---

    @(link_name="xcb_query_keymap_reply")
    query_keymap_reply :: proc(
        c : ^Connection,
        cookie : QueryKeymapCookie,
        e : ^^GenericError,
    ) -> ^QueryKeymapReply ---

    @(link_name="xcb_open_font_sizeof")
    open_font_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_open_font_checked")
    open_font_checked :: proc(
        c : ^Connection,
        fid : Font,
        nameLen : u16,
        name : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_open_font")
    open_font :: proc(
        c : ^Connection,
        fid : Font,
        nameLen : u16,
        name : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_open_font_name")
    open_font_name :: proc(r : ^OpenFontRequest) -> cstring ---

    @(link_name="xcb_open_font_name_length")
    open_font_name_length :: proc(r : ^OpenFontRequest) -> _c.int ---

    @(link_name="xcb_open_font_name_end")
    open_font_name_end :: proc(r : ^OpenFontRequest) -> GenericIterator ---

    @(link_name="xcb_close_font_checked")
    close_font_checked :: proc(
        c : ^Connection,
        font : Font,
    ) -> VoidCookie ---

    @(link_name="xcb_close_font")
    close_font :: proc(
        c : ^Connection,
        font : Font,
    ) -> VoidCookie ---

    @(link_name="xcb_fontprop_next")
    fontprop_next :: proc(i : ^FontpropIterator) ---

    @(link_name="xcb_fontprop_end")
    fontprop_end :: proc(i : FontpropIterator) -> GenericIterator ---

    @(link_name="xcb_charinfo_next")
    charinfo_next :: proc(i : ^CharinfoIterator) ---

    @(link_name="xcb_charinfo_end")
    charinfo_end :: proc(i : CharinfoIterator) -> GenericIterator ---

    @(link_name="xcb_query_font_sizeof")
    query_font_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_font")
    query_font :: proc(
        c : ^Connection,
        font : Fontable,
    ) -> QueryFontCookie ---

    @(link_name="xcb_query_font_unchecked")
    query_font_unchecked :: proc(
        c : ^Connection,
        font : Fontable,
    ) -> QueryFontCookie ---

    @(link_name="xcb_query_font_properties")
    query_font_properties :: proc(r : ^QueryFontReply) -> ^Fontprop ---

    @(link_name="xcb_query_font_properties_length")
    query_font_properties_length :: proc(r : ^QueryFontReply) -> _c.int ---

    @(link_name="xcb_query_font_properties_iterator")
    query_font_properties_iterator :: proc(r : ^QueryFontReply) -> FontpropIterator ---

    @(link_name="xcb_query_font_char_infos")
    query_font_char_infos :: proc(r : ^QueryFontReply) -> ^Charinfo ---

    @(link_name="xcb_query_font_char_infos_length")
    query_font_char_infos_length :: proc(r : ^QueryFontReply) -> _c.int ---

    @(link_name="xcb_query_font_char_infos_iterator")
    query_font_char_infos_iterator :: proc(r : ^QueryFontReply) -> CharinfoIterator ---

    @(link_name="xcb_query_font_reply")
    query_font_reply :: proc(
        c : ^Connection,
        cookie : QueryFontCookie,
        e : ^^GenericError,
    ) -> ^QueryFontReply ---

    @(link_name="xcb_query_text_extents_sizeof")
    query_text_extents_sizeof :: proc(
        buffer : rawptr,
        stringLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_query_text_extents")
    query_text_extents :: proc(
        c : ^Connection,
        font : Fontable,
        stringLen : u32,
        string : ^Char2B,
    ) -> QueryTextExtentsCookie ---

    @(link_name="xcb_query_text_extents_unchecked")
    query_text_extents_unchecked :: proc(
        c : ^Connection,
        font : Fontable,
        stringLen : u32,
        string : ^Char2B,
    ) -> QueryTextExtentsCookie ---

    @(link_name="xcb_query_text_extents_reply")
    query_text_extents_reply :: proc(
        c : ^Connection,
        cookie : QueryTextExtentsCookie,
        e : ^^GenericError,
    ) -> ^QueryTextExtentsReply ---

    @(link_name="xcb_str_sizeof")
    str_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_str_name")
    str_name :: proc(r : ^Str) -> cstring ---

    @(link_name="xcb_str_name_length")
    str_name_length :: proc(r : ^Str) -> _c.int ---

    @(link_name="xcb_str_name_end")
    str_name_end :: proc(r : ^Str) -> GenericIterator ---

    @(link_name="xcb_str_next")
    str_next :: proc(i : ^StrIterator) ---

    @(link_name="xcb_str_end")
    str_end :: proc(i : StrIterator) -> GenericIterator ---

    @(link_name="xcb_list_fonts_sizeof")
    list_fonts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_fonts")
    list_fonts :: proc(
        c : ^Connection,
        maxNames : u16,
        patternLen : u16,
        pattern : cstring,
    ) -> ListFontsCookie ---

    @(link_name="xcb_list_fonts_unchecked")
    list_fonts_unchecked :: proc(
        c : ^Connection,
        maxNames : u16,
        patternLen : u16,
        pattern : cstring,
    ) -> ListFontsCookie ---

    @(link_name="xcb_list_fonts_names_length")
    list_fonts_names_length :: proc(r : ^ListFontsReply) -> _c.int ---

    @(link_name="xcb_list_fonts_names_iterator")
    list_fonts_names_iterator :: proc(r : ^ListFontsReply) -> StrIterator ---

    @(link_name="xcb_list_fonts_reply")
    list_fonts_reply :: proc(
        c : ^Connection,
        cookie : ListFontsCookie,
        e : ^^GenericError,
    ) -> ^ListFontsReply ---

    @(link_name="xcb_list_fonts_with_info_sizeof")
    list_fonts_with_info_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info")
    list_fonts_with_info :: proc(
        c : ^Connection,
        maxNames : u16,
        patternLen : u16,
        pattern : cstring,
    ) -> ListFontsWithInfoCookie ---

    @(link_name="xcb_list_fonts_with_info_unchecked")
    list_fonts_with_info_unchecked :: proc(
        c : ^Connection,
        maxNames : u16,
        patternLen : u16,
        pattern : cstring,
    ) -> ListFontsWithInfoCookie ---

    @(link_name="xcb_list_fonts_with_info_properties")
    list_fonts_with_info_properties :: proc(r : ^ListFontsWithInfoReply) -> ^Fontprop ---

    @(link_name="xcb_list_fonts_with_info_properties_length")
    list_fonts_with_info_properties_length :: proc(r : ^ListFontsWithInfoReply) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info_properties_iterator")
    list_fonts_with_info_properties_iterator :: proc(r : ^ListFontsWithInfoReply) -> FontpropIterator ---

    @(link_name="xcb_list_fonts_with_info_name")
    list_fonts_with_info_name :: proc(r : ^ListFontsWithInfoReply) -> cstring ---

    @(link_name="xcb_list_fonts_with_info_name_length")
    list_fonts_with_info_name_length :: proc(r : ^ListFontsWithInfoReply) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info_name_end")
    list_fonts_with_info_name_end :: proc(r : ^ListFontsWithInfoReply) -> GenericIterator ---

    @(link_name="xcb_list_fonts_with_info_reply")
    list_fonts_with_info_reply :: proc(
        c : ^Connection,
        cookie : ListFontsWithInfoCookie,
        e : ^^GenericError,
    ) -> ^ListFontsWithInfoReply ---

    @(link_name="xcb_set_font_path_sizeof")
    set_font_path_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_font_path_checked")
    set_font_path_checked :: proc(
        c : ^Connection,
        fontQty : u16,
        font : ^Str,
    ) -> VoidCookie ---

    @(link_name="xcb_set_font_path")
    set_font_path :: proc(
        c : ^Connection,
        fontQty : u16,
        font : ^Str,
    ) -> VoidCookie ---

    @(link_name="xcb_set_font_path_font_length")
    set_font_path_font_length :: proc(r : ^SetFontPathRequest) -> _c.int ---

    @(link_name="xcb_set_font_path_font_iterator")
    set_font_path_font_iterator :: proc(r : ^SetFontPathRequest) -> StrIterator ---

    @(link_name="xcb_get_font_path_sizeof")
    get_font_path_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_font_path")
    get_font_path :: proc(c : ^Connection) -> GetFontPathCookie ---

    @(link_name="xcb_get_font_path_unchecked")
    get_font_path_unchecked :: proc(c : ^Connection) -> GetFontPathCookie ---

    @(link_name="xcb_get_font_path_path_length")
    get_font_path_path_length :: proc(r : ^GetFontPathReply) -> _c.int ---

    @(link_name="xcb_get_font_path_path_iterator")
    get_font_path_path_iterator :: proc(r : ^GetFontPathReply) -> StrIterator ---

    @(link_name="xcb_get_font_path_reply")
    get_font_path_reply :: proc(
        c : ^Connection,
        cookie : GetFontPathCookie,
        e : ^^GenericError,
    ) -> ^GetFontPathReply ---

    @(link_name="xcb_create_pixmap_checked")
    create_pixmap_checked :: proc(
        c : ^Connection,
        depth : u8,
        pid : Pixmap,
        drawable : Drawable,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_create_pixmap")
    create_pixmap :: proc(
        c : ^Connection,
        depth : u8,
        pid : Pixmap,
        drawable : Drawable,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_free_pixmap_checked")
    free_pixmap_checked :: proc(
        c : ^Connection,
        pixmap : Pixmap,
    ) -> VoidCookie ---

    @(link_name="xcb_free_pixmap")
    free_pixmap :: proc(
        c : ^Connection,
        pixmap : Pixmap,
    ) -> VoidCookie ---

    @(link_name="xcb_create_gc_value_list_serialize")
    create_gc_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u32,
        aux : ^CreateGcValueList,
    ) -> _c.int ---

    @(link_name="xcb_create_gc_value_list_unpack")
    create_gc_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u32,
        aux : ^CreateGcValueList,
    ) -> _c.int ---

    @(link_name="xcb_create_gc_value_list_sizeof")
    create_gc_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u32,
    ) -> _c.int ---

    @(link_name="xcb_create_gc_sizeof")
    create_gc_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_create_gc_checked")
    create_gc_checked :: proc(
        c : ^Connection,
        cid : Gcontext,
        drawable : Drawable,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_create_gc")
    create_gc :: proc(
        c : ^Connection,
        cid : Gcontext,
        drawable : Drawable,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_create_gc_aux_checked")
    create_gc_aux_checked :: proc(
        c : ^Connection,
        cid : Gcontext,
        drawable : Drawable,
        valueMask : u32,
        valueList : ^CreateGcValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_create_gc_aux")
    create_gc_aux :: proc(
        c : ^Connection,
        cid : Gcontext,
        drawable : Drawable,
        valueMask : u32,
        valueList : ^CreateGcValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_create_gc_value_list")
    create_gc_value_list :: proc(r : ^CreateGcRequest) -> rawptr ---

    @(link_name="xcb_change_gc_value_list_serialize")
    change_gc_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u32,
        aux : ^ChangeGcValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_gc_value_list_unpack")
    change_gc_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u32,
        aux : ^ChangeGcValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_gc_value_list_sizeof")
    change_gc_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u32,
    ) -> _c.int ---

    @(link_name="xcb_change_gc_sizeof")
    change_gc_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_gc_checked")
    change_gc_checked :: proc(
        c : ^Connection,
        gc : Gcontext,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_gc")
    change_gc :: proc(
        c : ^Connection,
        gc : Gcontext,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_gc_aux_checked")
    change_gc_aux_checked :: proc(
        c : ^Connection,
        gc : Gcontext,
        valueMask : u32,
        valueList : ^ChangeGcValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_gc_aux")
    change_gc_aux :: proc(
        c : ^Connection,
        gc : Gcontext,
        valueMask : u32,
        valueList : ^ChangeGcValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_gc_value_list")
    change_gc_value_list :: proc(r : ^ChangeGcRequest) -> rawptr ---

    @(link_name="xcb_copy_gc_checked")
    copy_gc_checked :: proc(
        c : ^Connection,
        srcGc : Gcontext,
        dstGc : Gcontext,
        valueMask : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_gc")
    copy_gc :: proc(
        c : ^Connection,
        srcGc : Gcontext,
        dstGc : Gcontext,
        valueMask : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_set_dashes_sizeof")
    set_dashes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_dashes_checked")
    set_dashes_checked :: proc(
        c : ^Connection,
        gc : Gcontext,
        dashOffset : u16,
        dashesLen : u16,
        dashes : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_dashes")
    set_dashes :: proc(
        c : ^Connection,
        gc : Gcontext,
        dashOffset : u16,
        dashesLen : u16,
        dashes : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_dashes_dashes")
    set_dashes_dashes :: proc(r : ^SetDashesRequest) -> ^u8 ---

    @(link_name="xcb_set_dashes_dashes_length")
    set_dashes_dashes_length :: proc(r : ^SetDashesRequest) -> _c.int ---

    @(link_name="xcb_set_dashes_dashes_end")
    set_dashes_dashes_end :: proc(r : ^SetDashesRequest) -> GenericIterator ---

    @(link_name="xcb_set_clip_rectangles_sizeof")
    set_clip_rectangles_sizeof :: proc(
        buffer : rawptr,
        rectanglesLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_set_clip_rectangles_checked")
    set_clip_rectangles_checked :: proc(
        c : ^Connection,
        ordering : u8,
        gc : Gcontext,
        clipX_origin : i16,
        clipY_origin : i16,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_set_clip_rectangles")
    set_clip_rectangles :: proc(
        c : ^Connection,
        ordering : u8,
        gc : Gcontext,
        clipX_origin : i16,
        clipY_origin : i16,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_set_clip_rectangles_rectangles")
    set_clip_rectangles_rectangles :: proc(r : ^SetClipRectanglesRequest) -> ^Rectangle ---

    @(link_name="xcb_set_clip_rectangles_rectangles_length")
    set_clip_rectangles_rectangles_length :: proc(r : ^SetClipRectanglesRequest) -> _c.int ---

    @(link_name="xcb_set_clip_rectangles_rectangles_iterator")
    set_clip_rectangles_rectangles_iterator :: proc(r : ^SetClipRectanglesRequest) -> RectangleIterator ---

    @(link_name="xcb_free_gc_checked")
    free_gc_checked :: proc(
        c : ^Connection,
        gc : Gcontext,
    ) -> VoidCookie ---

    @(link_name="xcb_free_gc")
    free_gc :: proc(
        c : ^Connection,
        gc : Gcontext,
    ) -> VoidCookie ---

    @(link_name="xcb_clear_area_checked")
    clear_area_checked :: proc(
        c : ^Connection,
        exposures : u8,
        window : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_clear_area")
    clear_area :: proc(
        c : ^Connection,
        exposures : u8,
        window : Window,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_area_checked")
    copy_area_checked :: proc(
        c : ^Connection,
        srcDrawable : Drawable,
        dstDrawable : Drawable,
        gc : Gcontext,
        srcX : i16,
        srcY : i16,
        dstX : i16,
        dstY : i16,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_area")
    copy_area :: proc(
        c : ^Connection,
        srcDrawable : Drawable,
        dstDrawable : Drawable,
        gc : Gcontext,
        srcX : i16,
        srcY : i16,
        dstX : i16,
        dstY : i16,
        width : u16,
        height : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_plane_checked")
    copy_plane_checked :: proc(
        c : ^Connection,
        srcDrawable : Drawable,
        dstDrawable : Drawable,
        gc : Gcontext,
        srcX : i16,
        srcY : i16,
        dstX : i16,
        dstY : i16,
        width : u16,
        height : u16,
        bitPlane : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_plane")
    copy_plane :: proc(
        c : ^Connection,
        srcDrawable : Drawable,
        dstDrawable : Drawable,
        gc : Gcontext,
        srcX : i16,
        srcY : i16,
        dstX : i16,
        dstY : i16,
        width : u16,
        height : u16,
        bitPlane : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_point_sizeof")
    poly_point_sizeof :: proc(
        buffer : rawptr,
        pointsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_point_checked")
    poly_point_checked :: proc(
        c : ^Connection,
        coordinateMode : u8,
        drawable : Drawable,
        gc : Gcontext,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_point")
    poly_point :: proc(
        c : ^Connection,
        coordinateMode : u8,
        drawable : Drawable,
        gc : Gcontext,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_point_points")
    poly_point_points :: proc(r : ^PolyPointRequest) -> ^Point ---

    @(link_name="xcb_poly_point_points_length")
    poly_point_points_length :: proc(r : ^PolyPointRequest) -> _c.int ---

    @(link_name="xcb_poly_point_points_iterator")
    poly_point_points_iterator :: proc(r : ^PolyPointRequest) -> PointIterator ---

    @(link_name="xcb_poly_line_sizeof")
    poly_line_sizeof :: proc(
        buffer : rawptr,
        pointsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_line_checked")
    poly_line_checked :: proc(
        c : ^Connection,
        coordinateMode : u8,
        drawable : Drawable,
        gc : Gcontext,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_line")
    poly_line :: proc(
        c : ^Connection,
        coordinateMode : u8,
        drawable : Drawable,
        gc : Gcontext,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_line_points")
    poly_line_points :: proc(r : ^PolyLineRequest) -> ^Point ---

    @(link_name="xcb_poly_line_points_length")
    poly_line_points_length :: proc(r : ^PolyLineRequest) -> _c.int ---

    @(link_name="xcb_poly_line_points_iterator")
    poly_line_points_iterator :: proc(r : ^PolyLineRequest) -> PointIterator ---

    @(link_name="xcb_segment_next")
    segment_next :: proc(i : ^SegmentIterator) ---

    @(link_name="xcb_segment_end")
    segment_end :: proc(i : SegmentIterator) -> GenericIterator ---

    @(link_name="xcb_poly_segment_sizeof")
    poly_segment_sizeof :: proc(
        buffer : rawptr,
        segmentsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_segment_checked")
    poly_segment_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        segmentsLen : u32,
        segments : ^Segment,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_segment")
    poly_segment :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        segmentsLen : u32,
        segments : ^Segment,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_segment_segments")
    poly_segment_segments :: proc(r : ^PolySegmentRequest) -> ^Segment ---

    @(link_name="xcb_poly_segment_segments_length")
    poly_segment_segments_length :: proc(r : ^PolySegmentRequest) -> _c.int ---

    @(link_name="xcb_poly_segment_segments_iterator")
    poly_segment_segments_iterator :: proc(r : ^PolySegmentRequest) -> SegmentIterator ---

    @(link_name="xcb_poly_rectangle_sizeof")
    poly_rectangle_sizeof :: proc(
        buffer : rawptr,
        rectanglesLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_rectangle_checked")
    poly_rectangle_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_rectangle")
    poly_rectangle :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_rectangle_rectangles")
    poly_rectangle_rectangles :: proc(r : ^PolyRectangleRequest) -> ^Rectangle ---

    @(link_name="xcb_poly_rectangle_rectangles_length")
    poly_rectangle_rectangles_length :: proc(r : ^PolyRectangleRequest) -> _c.int ---

    @(link_name="xcb_poly_rectangle_rectangles_iterator")
    poly_rectangle_rectangles_iterator :: proc(r : ^PolyRectangleRequest) -> RectangleIterator ---

    @(link_name="xcb_poly_arc_sizeof")
    poly_arc_sizeof :: proc(
        buffer : rawptr,
        arcsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_arc_checked")
    poly_arc_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        arcsLen : u32,
        arcs : ^Arc,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_arc")
    poly_arc :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        arcsLen : u32,
        arcs : ^Arc,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_arc_arcs")
    poly_arc_arcs :: proc(r : ^PolyArcRequest) -> ^Arc ---

    @(link_name="xcb_poly_arc_arcs_length")
    poly_arc_arcs_length :: proc(r : ^PolyArcRequest) -> _c.int ---

    @(link_name="xcb_poly_arc_arcs_iterator")
    poly_arc_arcs_iterator :: proc(r : ^PolyArcRequest) -> ArcIterator ---

    @(link_name="xcb_fill_poly_sizeof")
    fill_poly_sizeof :: proc(
        buffer : rawptr,
        pointsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_fill_poly_checked")
    fill_poly_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        shape : u8,
        coordinateMode : u8,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_fill_poly")
    fill_poly :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        shape : u8,
        coordinateMode : u8,
        pointsLen : u32,
        points : ^Point,
    ) -> VoidCookie ---

    @(link_name="xcb_fill_poly_points")
    fill_poly_points :: proc(r : ^FillPolyRequest) -> ^Point ---

    @(link_name="xcb_fill_poly_points_length")
    fill_poly_points_length :: proc(r : ^FillPolyRequest) -> _c.int ---

    @(link_name="xcb_fill_poly_points_iterator")
    fill_poly_points_iterator :: proc(r : ^FillPolyRequest) -> PointIterator ---

    @(link_name="xcb_poly_fill_rectangle_sizeof")
    poly_fill_rectangle_sizeof :: proc(
        buffer : rawptr,
        rectanglesLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_fill_rectangle_checked")
    poly_fill_rectangle_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_fill_rectangle")
    poly_fill_rectangle :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        rectanglesLen : u32,
        rectangles : ^Rectangle,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_fill_rectangle_rectangles")
    poly_fill_rectangle_rectangles :: proc(r : ^PolyFillRectangleRequest) -> ^Rectangle ---

    @(link_name="xcb_poly_fill_rectangle_rectangles_length")
    poly_fill_rectangle_rectangles_length :: proc(r : ^PolyFillRectangleRequest) -> _c.int ---

    @(link_name="xcb_poly_fill_rectangle_rectangles_iterator")
    poly_fill_rectangle_rectangles_iterator :: proc(r : ^PolyFillRectangleRequest) -> RectangleIterator ---

    @(link_name="xcb_poly_fill_arc_sizeof")
    poly_fill_arc_sizeof :: proc(
        buffer : rawptr,
        arcsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_fill_arc_checked")
    poly_fill_arc_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        arcsLen : u32,
        arcs : ^Arc,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_fill_arc")
    poly_fill_arc :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        arcsLen : u32,
        arcs : ^Arc,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_fill_arc_arcs")
    poly_fill_arc_arcs :: proc(r : ^PolyFillArcRequest) -> ^Arc ---

    @(link_name="xcb_poly_fill_arc_arcs_length")
    poly_fill_arc_arcs_length :: proc(r : ^PolyFillArcRequest) -> _c.int ---

    @(link_name="xcb_poly_fill_arc_arcs_iterator")
    poly_fill_arc_arcs_iterator :: proc(r : ^PolyFillArcRequest) -> ArcIterator ---

    @(link_name="xcb_put_image_sizeof")
    put_image_sizeof :: proc(
        buffer : rawptr,
        dataLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_put_image_checked")
    put_image_checked :: proc(
        c : ^Connection,
        format : u8,
        drawable : Drawable,
        gc : Gcontext,
        width : u16,
        height : u16,
        dstX : i16,
        dstY : i16,
        leftPad : u8,
        depth : u8,
        dataLen : u32,
        data : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_put_image")
    put_image :: proc(
        c : ^Connection,
        format : u8,
        drawable : Drawable,
        gc : Gcontext,
        width : u16,
        height : u16,
        dstX : i16,
        dstY : i16,
        leftPad : u8,
        depth : u8,
        dataLen : u32,
        data : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_put_image_data")
    put_image_data :: proc(r : ^PutImageRequest) -> ^u8 ---

    @(link_name="xcb_put_image_data_length")
    put_image_data_length :: proc(r : ^PutImageRequest) -> _c.int ---

    @(link_name="xcb_put_image_data_end")
    put_image_data_end :: proc(r : ^PutImageRequest) -> GenericIterator ---

    @(link_name="xcb_get_image_sizeof")
    get_image_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_image")
    get_image :: proc(
        c : ^Connection,
        format : u8,
        drawable : Drawable,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        planeMask : u32,
    ) -> GetImageCookie ---

    @(link_name="xcb_get_image_unchecked")
    get_image_unchecked :: proc(
        c : ^Connection,
        format : u8,
        drawable : Drawable,
        x : i16,
        y : i16,
        width : u16,
        height : u16,
        planeMask : u32,
    ) -> GetImageCookie ---

    @(link_name="xcb_get_image_data")
    get_image_data :: proc(r : ^GetImageReply) -> ^u8 ---

    @(link_name="xcb_get_image_data_length")
    get_image_data_length :: proc(r : ^GetImageReply) -> _c.int ---

    @(link_name="xcb_get_image_data_end")
    get_image_data_end :: proc(r : ^GetImageReply) -> GenericIterator ---

    @(link_name="xcb_get_image_reply")
    get_image_reply :: proc(
        c : ^Connection,
        cookie : GetImageCookie,
        e : ^^GenericError,
    ) -> ^GetImageReply ---

    @(link_name="xcb_poly_text_8_sizeof")
    poly_text_8_sizeof :: proc(
        buffer : rawptr,
        itemsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_text_8_checked")
    poly_text_8_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        itemsLen : u32,
        items : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_text_8")
    poly_text_8 :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        itemsLen : u32,
        items : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_text_8_items")
    poly_text_8_items :: proc(r : ^PolyText8_request) -> ^u8 ---

    @(link_name="xcb_poly_text_8_items_length")
    poly_text_8_items_length :: proc(r : ^PolyText8_request) -> _c.int ---

    @(link_name="xcb_poly_text_8_items_end")
    poly_text_8_items_end :: proc(r : ^PolyText8_request) -> GenericIterator ---

    @(link_name="xcb_poly_text_16_sizeof")
    poly_text_16_sizeof :: proc(
        buffer : rawptr,
        itemsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_poly_text_16_checked")
    poly_text_16_checked :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        itemsLen : u32,
        items : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_text_16")
    poly_text_16 :: proc(
        c : ^Connection,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        itemsLen : u32,
        items : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_poly_text_16_items")
    poly_text_16_items :: proc(r : ^PolyText16Request) -> ^u8 ---

    @(link_name="xcb_poly_text_16_items_length")
    poly_text_16_items_length :: proc(r : ^PolyText16Request) -> _c.int ---

    @(link_name="xcb_poly_text_16_items_end")
    poly_text_16_items_end :: proc(r : ^PolyText16Request) -> GenericIterator ---

    @(link_name="xcb_image_text_8_sizeof")
    image_text_8_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_image_text_8_checked")
    image_text_8_checked :: proc(
        c : ^Connection,
        stringLen : u8,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        string : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_image_text_8")
    image_text_8 :: proc(
        c : ^Connection,
        stringLen : u8,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        string : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_image_text_8_string")
    image_text_8_string :: proc(r : ^ImageText8_request) -> cstring ---

    @(link_name="xcb_image_text_8_string_length")
    image_text_8_string_length :: proc(r : ^ImageText8_request) -> _c.int ---

    @(link_name="xcb_image_text_8_string_end")
    image_text_8_string_end :: proc(r : ^ImageText8_request) -> GenericIterator ---

    @(link_name="xcb_image_text_16_sizeof")
    image_text_16_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_image_text_16_checked")
    image_text_16_checked :: proc(
        c : ^Connection,
        stringLen : u8,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        string : ^Char2B,
    ) -> VoidCookie ---

    @(link_name="xcb_image_text_16")
    image_text_16 :: proc(
        c : ^Connection,
        stringLen : u8,
        drawable : Drawable,
        gc : Gcontext,
        x : i16,
        y : i16,
        string : ^Char2B,
    ) -> VoidCookie ---

    @(link_name="xcb_image_text_16_string")
    image_text_16_string :: proc(r : ^ImageText16Request) -> ^Char2B ---

    @(link_name="xcb_image_text_16_string_length")
    image_text_16_string_length :: proc(r : ^ImageText16Request) -> _c.int ---

    @(link_name="xcb_image_text_16_string_iterator")
    image_text_16_string_iterator :: proc(r : ^ImageText16Request) -> Char2BIterator ---

    @(link_name="xcb_create_colormap_checked")
    create_colormap_checked :: proc(
        c : ^Connection,
        alloc : u8,
        mid : Colormap,
        window : Window,
        visual : Visualid,
    ) -> VoidCookie ---

    @(link_name="xcb_create_colormap")
    create_colormap :: proc(
        c : ^Connection,
        alloc : u8,
        mid : Colormap,
        window : Window,
        visual : Visualid,
    ) -> VoidCookie ---

    @(link_name="xcb_free_colormap_checked")
    free_colormap_checked :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_free_colormap")
    free_colormap :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_colormap_and_free_checked")
    copy_colormap_and_free_checked :: proc(
        c : ^Connection,
        mid : Colormap,
        srcCmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_copy_colormap_and_free")
    copy_colormap_and_free :: proc(
        c : ^Connection,
        mid : Colormap,
        srcCmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_install_colormap_checked")
    install_colormap_checked :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_install_colormap")
    install_colormap :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_uninstall_colormap_checked")
    uninstall_colormap_checked :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_uninstall_colormap")
    uninstall_colormap :: proc(
        c : ^Connection,
        cmap : Colormap,
    ) -> VoidCookie ---

    @(link_name="xcb_list_installed_colormaps_sizeof")
    list_installed_colormaps_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_installed_colormaps")
    list_installed_colormaps :: proc(
        c : ^Connection,
        window : Window,
    ) -> ListInstalledColormapsCookie ---

    @(link_name="xcb_list_installed_colormaps_unchecked")
    list_installed_colormaps_unchecked :: proc(
        c : ^Connection,
        window : Window,
    ) -> ListInstalledColormapsCookie ---

    @(link_name="xcb_list_installed_colormaps_cmaps")
    list_installed_colormaps_cmaps :: proc(r : ^ListInstalledColormapsReply) -> ^Colormap ---

    @(link_name="xcb_list_installed_colormaps_cmaps_length")
    list_installed_colormaps_cmaps_length :: proc(r : ^ListInstalledColormapsReply) -> _c.int ---

    @(link_name="xcb_list_installed_colormaps_cmaps_end")
    list_installed_colormaps_cmaps_end :: proc(r : ^ListInstalledColormapsReply) -> GenericIterator ---

    @(link_name="xcb_list_installed_colormaps_reply")
    list_installed_colormaps_reply :: proc(
        c : ^Connection,
        cookie : ListInstalledColormapsCookie,
        e : ^^GenericError,
    ) -> ^ListInstalledColormapsReply ---

    @(link_name="xcb_alloc_color")
    alloc_color :: proc(
        c : ^Connection,
        cmap : Colormap,
        red : u16,
        green : u16,
        blue : u16,
    ) -> AllocColorCookie ---

    @(link_name="xcb_alloc_color_unchecked")
    alloc_color_unchecked :: proc(
        c : ^Connection,
        cmap : Colormap,
        red : u16,
        green : u16,
        blue : u16,
    ) -> AllocColorCookie ---

    @(link_name="xcb_alloc_color_reply")
    alloc_color_reply :: proc(
        c : ^Connection,
        cookie : AllocColorCookie,
        e : ^^GenericError,
    ) -> ^AllocColorReply ---

    @(link_name="xcb_alloc_named_color_sizeof")
    alloc_named_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_named_color")
    alloc_named_color :: proc(
        c : ^Connection,
        cmap : Colormap,
        nameLen : u16,
        name : cstring,
    ) -> AllocNamedColorCookie ---

    @(link_name="xcb_alloc_named_color_unchecked")
    alloc_named_color_unchecked :: proc(
        c : ^Connection,
        cmap : Colormap,
        nameLen : u16,
        name : cstring,
    ) -> AllocNamedColorCookie ---

    @(link_name="xcb_alloc_named_color_reply")
    alloc_named_color_reply :: proc(
        c : ^Connection,
        cookie : AllocNamedColorCookie,
        e : ^^GenericError,
    ) -> ^AllocNamedColorReply ---

    @(link_name="xcb_alloc_color_cells_sizeof")
    alloc_color_cells_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_color_cells")
    alloc_color_cells :: proc(
        c : ^Connection,
        contiguous : u8,
        cmap : Colormap,
        colors : u16,
        planes : u16,
    ) -> AllocColorCellsCookie ---

    @(link_name="xcb_alloc_color_cells_unchecked")
    alloc_color_cells_unchecked :: proc(
        c : ^Connection,
        contiguous : u8,
        cmap : Colormap,
        colors : u16,
        planes : u16,
    ) -> AllocColorCellsCookie ---

    @(link_name="xcb_alloc_color_cells_pixels")
    alloc_color_cells_pixels :: proc(r : ^AllocColorCellsReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_cells_pixels_length")
    alloc_color_cells_pixels_length :: proc(r : ^AllocColorCellsReply) -> _c.int ---

    @(link_name="xcb_alloc_color_cells_pixels_end")
    alloc_color_cells_pixels_end :: proc(r : ^AllocColorCellsReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_cells_masks")
    alloc_color_cells_masks :: proc(r : ^AllocColorCellsReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_cells_masks_length")
    alloc_color_cells_masks_length :: proc(r : ^AllocColorCellsReply) -> _c.int ---

    @(link_name="xcb_alloc_color_cells_masks_end")
    alloc_color_cells_masks_end :: proc(r : ^AllocColorCellsReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_cells_reply")
    alloc_color_cells_reply :: proc(
        c : ^Connection,
        cookie : AllocColorCellsCookie,
        e : ^^GenericError,
    ) -> ^AllocColorCellsReply ---

    @(link_name="xcb_alloc_color_planes_sizeof")
    alloc_color_planes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_color_planes")
    alloc_color_planes :: proc(
        c : ^Connection,
        contiguous : u8,
        cmap : Colormap,
        colors : u16,
        reds : u16,
        greens : u16,
        blues : u16,
    ) -> AllocColorPlanesCookie ---

    @(link_name="xcb_alloc_color_planes_unchecked")
    alloc_color_planes_unchecked :: proc(
        c : ^Connection,
        contiguous : u8,
        cmap : Colormap,
        colors : u16,
        reds : u16,
        greens : u16,
        blues : u16,
    ) -> AllocColorPlanesCookie ---

    @(link_name="xcb_alloc_color_planes_pixels")
    alloc_color_planes_pixels :: proc(r : ^AllocColorPlanesReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_planes_pixels_length")
    alloc_color_planes_pixels_length :: proc(r : ^AllocColorPlanesReply) -> _c.int ---

    @(link_name="xcb_alloc_color_planes_pixels_end")
    alloc_color_planes_pixels_end :: proc(r : ^AllocColorPlanesReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_planes_reply")
    alloc_color_planes_reply :: proc(
        c : ^Connection,
        cookie : AllocColorPlanesCookie,
        e : ^^GenericError,
    ) -> ^AllocColorPlanesReply ---

    @(link_name="xcb_free_colors_sizeof")
    free_colors_sizeof :: proc(
        buffer : rawptr,
        pixelsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_free_colors_checked")
    free_colors_checked :: proc(
        c : ^Connection,
        cmap : Colormap,
        planeMask : u32,
        pixelsLen : u32,
        pixels : ^u32,
    ) -> VoidCookie ---

    @(link_name="xcb_free_colors")
    free_colors :: proc(
        c : ^Connection,
        cmap : Colormap,
        planeMask : u32,
        pixelsLen : u32,
        pixels : ^u32,
    ) -> VoidCookie ---

    @(link_name="xcb_free_colors_pixels")
    free_colors_pixels :: proc(r : ^FreeColorsRequest) -> ^u32 ---

    @(link_name="xcb_free_colors_pixels_length")
    free_colors_pixels_length :: proc(r : ^FreeColorsRequest) -> _c.int ---

    @(link_name="xcb_free_colors_pixels_end")
    free_colors_pixels_end :: proc(r : ^FreeColorsRequest) -> GenericIterator ---

    @(link_name="xcb_coloritem_next")
    coloritem_next :: proc(i : ^ColoritemIterator) ---

    @(link_name="xcb_coloritem_end")
    coloritem_end :: proc(i : ColoritemIterator) -> GenericIterator ---

    @(link_name="xcb_store_colors_sizeof")
    store_colors_sizeof :: proc(
        buffer : rawptr,
        itemsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_store_colors_checked")
    store_colors_checked :: proc(
        c : ^Connection,
        cmap : Colormap,
        itemsLen : u32,
        items : ^Coloritem,
    ) -> VoidCookie ---

    @(link_name="xcb_store_colors")
    store_colors :: proc(
        c : ^Connection,
        cmap : Colormap,
        itemsLen : u32,
        items : ^Coloritem,
    ) -> VoidCookie ---

    @(link_name="xcb_store_colors_items")
    store_colors_items :: proc(r : ^StoreColorsRequest) -> ^Coloritem ---

    @(link_name="xcb_store_colors_items_length")
    store_colors_items_length :: proc(r : ^StoreColorsRequest) -> _c.int ---

    @(link_name="xcb_store_colors_items_iterator")
    store_colors_items_iterator :: proc(r : ^StoreColorsRequest) -> ColoritemIterator ---

    @(link_name="xcb_store_named_color_sizeof")
    store_named_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_store_named_color_checked")
    store_named_color_checked :: proc(
        c : ^Connection,
        flags : u8,
        cmap : Colormap,
        pixel : u32,
        nameLen : u16,
        name : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_store_named_color")
    store_named_color :: proc(
        c : ^Connection,
        flags : u8,
        cmap : Colormap,
        pixel : u32,
        nameLen : u16,
        name : cstring,
    ) -> VoidCookie ---

    @(link_name="xcb_store_named_color_name")
    store_named_color_name :: proc(r : ^StoreNamedColorRequest) -> cstring ---

    @(link_name="xcb_store_named_color_name_length")
    store_named_color_name_length :: proc(r : ^StoreNamedColorRequest) -> _c.int ---

    @(link_name="xcb_store_named_color_name_end")
    store_named_color_name_end :: proc(r : ^StoreNamedColorRequest) -> GenericIterator ---

    @(link_name="xcb_rgb_next")
    rgb_next :: proc(i : ^RgbIterator) ---

    @(link_name="xcb_rgb_end")
    rgb_end :: proc(i : RgbIterator) -> GenericIterator ---

    @(link_name="xcb_query_colors_sizeof")
    query_colors_sizeof :: proc(
        buffer : rawptr,
        pixelsLen : u32,
    ) -> _c.int ---

    @(link_name="xcb_query_colors")
    query_colors :: proc(
        c : ^Connection,
        cmap : Colormap,
        pixelsLen : u32,
        pixels : ^u32,
    ) -> QueryColorsCookie ---

    @(link_name="xcb_query_colors_unchecked")
    query_colors_unchecked :: proc(
        c : ^Connection,
        cmap : Colormap,
        pixelsLen : u32,
        pixels : ^u32,
    ) -> QueryColorsCookie ---

    @(link_name="xcb_query_colors_colors")
    query_colors_colors :: proc(r : ^QueryColorsReply) -> ^Rgb ---

    @(link_name="xcb_query_colors_colors_length")
    query_colors_colors_length :: proc(r : ^QueryColorsReply) -> _c.int ---

    @(link_name="xcb_query_colors_colors_iterator")
    query_colors_colors_iterator :: proc(r : ^QueryColorsReply) -> RgbIterator ---

    @(link_name="xcb_query_colors_reply")
    query_colors_reply :: proc(
        c : ^Connection,
        cookie : QueryColorsCookie,
        e : ^^GenericError,
    ) -> ^QueryColorsReply ---

    @(link_name="xcb_lookup_color_sizeof")
    lookup_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_lookup_color")
    lookup_color :: proc(
        c : ^Connection,
        cmap : Colormap,
        nameLen : u16,
        name : cstring,
    ) -> LookupColorCookie ---

    @(link_name="xcb_lookup_color_unchecked")
    lookup_color_unchecked :: proc(
        c : ^Connection,
        cmap : Colormap,
        nameLen : u16,
        name : cstring,
    ) -> LookupColorCookie ---

    @(link_name="xcb_lookup_color_reply")
    lookup_color_reply :: proc(
        c : ^Connection,
        cookie : LookupColorCookie,
        e : ^^GenericError,
    ) -> ^LookupColorReply ---

    @(link_name="xcb_create_cursor_checked")
    create_cursor_checked :: proc(
        c : ^Connection,
        cid : Cursor,
        source : Pixmap,
        mask : Pixmap,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
        x : u16,
        y : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_create_cursor")
    create_cursor :: proc(
        c : ^Connection,
        cid : Cursor,
        source : Pixmap,
        mask : Pixmap,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
        x : u16,
        y : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_create_glyph_cursor_checked")
    create_glyph_cursor_checked :: proc(
        c : ^Connection,
        cid : Cursor,
        sourceFont : Font,
        maskFont : Font,
        sourceChar : u16,
        maskChar : u16,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_create_glyph_cursor")
    create_glyph_cursor :: proc(
        c : ^Connection,
        cid : Cursor,
        sourceFont : Font,
        maskFont : Font,
        sourceChar : u16,
        maskChar : u16,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_free_cursor_checked")
    free_cursor_checked :: proc(
        c : ^Connection,
        cursor : Cursor,
    ) -> VoidCookie ---

    @(link_name="xcb_free_cursor")
    free_cursor :: proc(
        c : ^Connection,
        cursor : Cursor,
    ) -> VoidCookie ---

    @(link_name="xcb_recolor_cursor_checked")
    recolor_cursor_checked :: proc(
        c : ^Connection,
        cursor : Cursor,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_recolor_cursor")
    recolor_cursor :: proc(
        c : ^Connection,
        cursor : Cursor,
        foreRed : u16,
        foreGreen : u16,
        foreBlue : u16,
        backRed : u16,
        backGreen : u16,
        backBlue : u16,
    ) -> VoidCookie ---

    @(link_name="xcb_query_best_size")
    query_best_size :: proc(
        c : ^Connection,
        class : u8,
        drawable : Drawable,
        width : u16,
        height : u16,
    ) -> QueryBestSizeCookie ---

    @(link_name="xcb_query_best_size_unchecked")
    query_best_size_unchecked :: proc(
        c : ^Connection,
        class : u8,
        drawable : Drawable,
        width : u16,
        height : u16,
    ) -> QueryBestSizeCookie ---

    @(link_name="xcb_query_best_size_reply")
    query_best_size_reply :: proc(
        c : ^Connection,
        cookie : QueryBestSizeCookie,
        e : ^^GenericError,
    ) -> ^QueryBestSizeReply ---

    @(link_name="xcb_query_extension_sizeof")
    query_extension_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_extension")
    query_extension :: proc(
        c : ^Connection,
        nameLen : u16,
        name : cstring,
    ) -> QueryExtensionCookie ---

    @(link_name="xcb_query_extension_unchecked")
    query_extension_unchecked :: proc(
        c : ^Connection,
        nameLen : u16,
        name : cstring,
    ) -> QueryExtensionCookie ---

    @(link_name="xcb_query_extension_reply")
    query_extension_reply :: proc(
        c : ^Connection,
        cookie : QueryExtensionCookie,
        e : ^^GenericError,
    ) -> ^QueryExtensionReply ---

    @(link_name="xcb_list_extensions_sizeof")
    list_extensions_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_extensions")
    list_extensions :: proc(c : ^Connection) -> ListExtensionsCookie ---

    @(link_name="xcb_list_extensions_unchecked")
    list_extensions_unchecked :: proc(c : ^Connection) -> ListExtensionsCookie ---

    @(link_name="xcb_list_extensions_names_length")
    list_extensions_names_length :: proc(r : ^ListExtensionsReply) -> _c.int ---

    @(link_name="xcb_list_extensions_names_iterator")
    list_extensions_names_iterator :: proc(r : ^ListExtensionsReply) -> StrIterator ---

    @(link_name="xcb_list_extensions_reply")
    list_extensions_reply :: proc(
        c : ^Connection,
        cookie : ListExtensionsCookie,
        e : ^^GenericError,
    ) -> ^ListExtensionsReply ---

    @(link_name="xcb_change_keyboard_mapping_sizeof")
    change_keyboard_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_keyboard_mapping_checked")
    change_keyboard_mapping_checked :: proc(
        c : ^Connection,
        keycodeCount : u8,
        firstKeycode : Keycode,
        keysymsPerKeycode : u8,
        keysyms : ^Keysym,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_mapping")
    change_keyboard_mapping :: proc(
        c : ^Connection,
        keycodeCount : u8,
        firstKeycode : Keycode,
        keysymsPerKeycode : u8,
        keysyms : ^Keysym,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_mapping_keysyms")
    change_keyboard_mapping_keysyms :: proc(r : ^ChangeKeyboardMappingRequest) -> ^Keysym ---

    @(link_name="xcb_change_keyboard_mapping_keysyms_length")
    change_keyboard_mapping_keysyms_length :: proc(r : ^ChangeKeyboardMappingRequest) -> _c.int ---

    @(link_name="xcb_change_keyboard_mapping_keysyms_end")
    change_keyboard_mapping_keysyms_end :: proc(r : ^ChangeKeyboardMappingRequest) -> GenericIterator ---

    @(link_name="xcb_get_keyboard_mapping_sizeof")
    get_keyboard_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_keyboard_mapping")
    get_keyboard_mapping :: proc(
        c : ^Connection,
        firstKeycode : Keycode,
        count : u8,
    ) -> GetKeyboardMappingCookie ---

    @(link_name="xcb_get_keyboard_mapping_unchecked")
    get_keyboard_mapping_unchecked :: proc(
        c : ^Connection,
        firstKeycode : Keycode,
        count : u8,
    ) -> GetKeyboardMappingCookie ---

    @(link_name="xcb_get_keyboard_mapping_keysyms")
    get_keyboard_mapping_keysyms :: proc(r : ^GetKeyboardMappingReply) -> ^Keysym ---

    @(link_name="xcb_get_keyboard_mapping_keysyms_length")
    get_keyboard_mapping_keysyms_length :: proc(r : ^GetKeyboardMappingReply) -> _c.int ---

    @(link_name="xcb_get_keyboard_mapping_keysyms_end")
    get_keyboard_mapping_keysyms_end :: proc(r : ^GetKeyboardMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_keyboard_mapping_reply")
    get_keyboard_mapping_reply :: proc(
        c : ^Connection,
        cookie : GetKeyboardMappingCookie,
        e : ^^GenericError,
    ) -> ^GetKeyboardMappingReply ---

    @(link_name="xcb_change_keyboard_control_value_list_serialize")
    change_keyboard_control_value_list_serialize :: proc(
        buffer : ^rawptr,
        valueMask : u32,
        aux : ^ChangeKeyboardControlValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_value_list_unpack")
    change_keyboard_control_value_list_unpack :: proc(
        buffer : rawptr,
        valueMask : u32,
        aux : ^ChangeKeyboardControlValueList,
    ) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_value_list_sizeof")
    change_keyboard_control_value_list_sizeof :: proc(
        buffer : rawptr,
        valueMask : u32,
    ) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_sizeof")
    change_keyboard_control_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_checked")
    change_keyboard_control_checked :: proc(
        c : ^Connection,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control")
    change_keyboard_control :: proc(
        c : ^Connection,
        valueMask : u32,
        valueList : rawptr,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_aux_checked")
    change_keyboard_control_aux_checked :: proc(
        c : ^Connection,
        valueMask : u32,
        valueList : ^ChangeKeyboardControlValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_aux")
    change_keyboard_control_aux :: proc(
        c : ^Connection,
        valueMask : u32,
        valueList : ^ChangeKeyboardControlValueList,
    ) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_value_list")
    change_keyboard_control_value_list :: proc(r : ^ChangeKeyboardControlRequest) -> rawptr ---

    @(link_name="xcb_get_keyboard_control")
    get_keyboard_control :: proc(c : ^Connection) -> GetKeyboardControlCookie ---

    @(link_name="xcb_get_keyboard_control_unchecked")
    get_keyboard_control_unchecked :: proc(c : ^Connection) -> GetKeyboardControlCookie ---

    @(link_name="xcb_get_keyboard_control_reply")
    get_keyboard_control_reply :: proc(
        c : ^Connection,
        cookie : GetKeyboardControlCookie,
        e : ^^GenericError,
    ) -> ^GetKeyboardControlReply ---

    @(link_name="xcb_bell_checked")
    bell_checked :: proc(
        c : ^Connection,
        percent : i8,
    ) -> VoidCookie ---

    @(link_name="xcb_bell")
    bell :: proc(
        c : ^Connection,
        percent : i8,
    ) -> VoidCookie ---

    @(link_name="xcb_change_pointer_control_checked")
    change_pointer_control_checked :: proc(
        c : ^Connection,
        accelerationNumerator : i16,
        accelerationDenominator : i16,
        threshold : i16,
        doAcceleration : u8,
        doThreshold : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_change_pointer_control")
    change_pointer_control :: proc(
        c : ^Connection,
        accelerationNumerator : i16,
        accelerationDenominator : i16,
        threshold : i16,
        doAcceleration : u8,
        doThreshold : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_get_pointer_control")
    get_pointer_control :: proc(c : ^Connection) -> GetPointerControlCookie ---

    @(link_name="xcb_get_pointer_control_unchecked")
    get_pointer_control_unchecked :: proc(c : ^Connection) -> GetPointerControlCookie ---

    @(link_name="xcb_get_pointer_control_reply")
    get_pointer_control_reply :: proc(
        c : ^Connection,
        cookie : GetPointerControlCookie,
        e : ^^GenericError,
    ) -> ^GetPointerControlReply ---

    @(link_name="xcb_set_screen_saver_checked")
    set_screen_saver_checked :: proc(
        c : ^Connection,
        timeout : i16,
        interval : i16,
        preferBlanking : u8,
        allowExposures : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_screen_saver")
    set_screen_saver :: proc(
        c : ^Connection,
        timeout : i16,
        interval : i16,
        preferBlanking : u8,
        allowExposures : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_get_screen_saver")
    get_screen_saver :: proc(c : ^Connection) -> GetScreenSaverCookie ---

    @(link_name="xcb_get_screen_saver_unchecked")
    get_screen_saver_unchecked :: proc(c : ^Connection) -> GetScreenSaverCookie ---

    @(link_name="xcb_get_screen_saver_reply")
    get_screen_saver_reply :: proc(
        c : ^Connection,
        cookie : GetScreenSaverCookie,
        e : ^^GenericError,
    ) -> ^GetScreenSaverReply ---

    @(link_name="xcb_change_hosts_sizeof")
    change_hosts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_hosts_checked")
    change_hosts_checked :: proc(
        c : ^Connection,
        mode : u8,
        family : u8,
        addressLen : u16,
        address : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_change_hosts")
    change_hosts :: proc(
        c : ^Connection,
        mode : u8,
        family : u8,
        addressLen : u16,
        address : ^u8,
    ) -> VoidCookie ---

    @(link_name="xcb_change_hosts_address")
    change_hosts_address :: proc(r : ^ChangeHostsRequest) -> ^u8 ---

    @(link_name="xcb_change_hosts_address_length")
    change_hosts_address_length :: proc(r : ^ChangeHostsRequest) -> _c.int ---

    @(link_name="xcb_change_hosts_address_end")
    change_hosts_address_end :: proc(r : ^ChangeHostsRequest) -> GenericIterator ---

    @(link_name="xcb_host_sizeof")
    host_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_host_address")
    host_address :: proc(r : ^Host) -> ^u8 ---

    @(link_name="xcb_host_address_length")
    host_address_length :: proc(r : ^Host) -> _c.int ---

    @(link_name="xcb_host_address_end")
    host_address_end :: proc(r : ^Host) -> GenericIterator ---

    @(link_name="xcb_host_next")
    host_next :: proc(i : ^HostIterator) ---

    @(link_name="xcb_host_end")
    host_end :: proc(i : HostIterator) -> GenericIterator ---

    @(link_name="xcb_list_hosts_sizeof")
    list_hosts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_hosts")
    list_hosts :: proc(c : ^Connection) -> ListHostsCookie ---

    @(link_name="xcb_list_hosts_unchecked")
    list_hosts_unchecked :: proc(c : ^Connection) -> ListHostsCookie ---

    @(link_name="xcb_list_hosts_hosts_length")
    list_hosts_hosts_length :: proc(r : ^ListHostsReply) -> _c.int ---

    @(link_name="xcb_list_hosts_hosts_iterator")
    list_hosts_hosts_iterator :: proc(r : ^ListHostsReply) -> HostIterator ---

    @(link_name="xcb_list_hosts_reply")
    list_hosts_reply :: proc(
        c : ^Connection,
        cookie : ListHostsCookie,
        e : ^^GenericError,
    ) -> ^ListHostsReply ---

    @(link_name="xcb_set_access_control_checked")
    set_access_control_checked :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_access_control")
    set_access_control :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_close_down_mode_checked")
    set_close_down_mode_checked :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_close_down_mode")
    set_close_down_mode :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_kill_client_checked")
    kill_client_checked :: proc(
        c : ^Connection,
        resource : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_kill_client")
    kill_client :: proc(
        c : ^Connection,
        resource : u32,
    ) -> VoidCookie ---

    @(link_name="xcb_rotate_properties_sizeof")
    rotate_properties_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_rotate_properties_checked")
    rotate_properties_checked :: proc(
        c : ^Connection,
        window : Window,
        atomsLen : u16,
        delta : i16,
        atoms : ^Atom,
    ) -> VoidCookie ---

    @(link_name="xcb_rotate_properties")
    rotate_properties :: proc(
        c : ^Connection,
        window : Window,
        atomsLen : u16,
        delta : i16,
        atoms : ^Atom,
    ) -> VoidCookie ---

    @(link_name="xcb_rotate_properties_atoms")
    rotate_properties_atoms :: proc(r : ^RotatePropertiesRequest) -> ^Atom ---

    @(link_name="xcb_rotate_properties_atoms_length")
    rotate_properties_atoms_length :: proc(r : ^RotatePropertiesRequest) -> _c.int ---

    @(link_name="xcb_rotate_properties_atoms_end")
    rotate_properties_atoms_end :: proc(r : ^RotatePropertiesRequest) -> GenericIterator ---

    @(link_name="xcb_force_screen_saver_checked")
    force_screen_saver_checked :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_force_screen_saver")
    force_screen_saver :: proc(
        c : ^Connection,
        mode : u8,
    ) -> VoidCookie ---

    @(link_name="xcb_set_pointer_mapping_sizeof")
    set_pointer_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_pointer_mapping")
    set_pointer_mapping :: proc(
        c : ^Connection,
        mapLen : u8,
        _map : ^u8,
    ) -> SetPointerMappingCookie ---

    @(link_name="xcb_set_pointer_mapping_unchecked")
    set_pointer_mapping_unchecked :: proc(
        c : ^Connection,
        mapLen : u8,
        _map : ^u8,
    ) -> SetPointerMappingCookie ---

    @(link_name="xcb_set_pointer_mapping_reply")
    set_pointer_mapping_reply :: proc(
        c : ^Connection,
        cookie : SetPointerMappingCookie,
        e : ^^GenericError,
    ) -> ^SetPointerMappingReply ---

    @(link_name="xcb_get_pointer_mapping_sizeof")
    get_pointer_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_pointer_mapping")
    get_pointer_mapping :: proc(c : ^Connection) -> GetPointerMappingCookie ---

    @(link_name="xcb_get_pointer_mapping_unchecked")
    get_pointer_mapping_unchecked :: proc(c : ^Connection) -> GetPointerMappingCookie ---

    @(link_name="xcb_get_pointer_mapping_map")
    get_pointer_mapping_map :: proc(r : ^GetPointerMappingReply) -> ^u8 ---

    @(link_name="xcb_get_pointer_mapping_map_length")
    get_pointer_mapping_map_length :: proc(r : ^GetPointerMappingReply) -> _c.int ---

    @(link_name="xcb_get_pointer_mapping_map_end")
    get_pointer_mapping_map_end :: proc(r : ^GetPointerMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_pointer_mapping_reply")
    get_pointer_mapping_reply :: proc(
        c : ^Connection,
        cookie : GetPointerMappingCookie,
        e : ^^GenericError,
    ) -> ^GetPointerMappingReply ---

    @(link_name="xcb_set_modifier_mapping_sizeof")
    set_modifier_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_modifier_mapping")
    set_modifier_mapping :: proc(
        c : ^Connection,
        keycodesPerModifier : u8,
        keycodes : ^Keycode,
    ) -> SetModifierMappingCookie ---

    @(link_name="xcb_set_modifier_mapping_unchecked")
    set_modifier_mapping_unchecked :: proc(
        c : ^Connection,
        keycodesPerModifier : u8,
        keycodes : ^Keycode,
    ) -> SetModifierMappingCookie ---

    @(link_name="xcb_set_modifier_mapping_reply")
    set_modifier_mapping_reply :: proc(
        c : ^Connection,
        cookie : SetModifierMappingCookie,
        e : ^^GenericError,
    ) -> ^SetModifierMappingReply ---

    @(link_name="xcb_get_modifier_mapping_sizeof")
    get_modifier_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_modifier_mapping")
    get_modifier_mapping :: proc(c : ^Connection) -> GetModifierMappingCookie ---

    @(link_name="xcb_get_modifier_mapping_unchecked")
    get_modifier_mapping_unchecked :: proc(c : ^Connection) -> GetModifierMappingCookie ---

    @(link_name="xcb_get_modifier_mapping_keycodes")
    get_modifier_mapping_keycodes :: proc(r : ^GetModifierMappingReply) -> ^Keycode ---

    @(link_name="xcb_get_modifier_mapping_keycodes_length")
    get_modifier_mapping_keycodes_length :: proc(r : ^GetModifierMappingReply) -> _c.int ---

    @(link_name="xcb_get_modifier_mapping_keycodes_end")
    get_modifier_mapping_keycodes_end :: proc(r : ^GetModifierMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_modifier_mapping_reply")
    get_modifier_mapping_reply :: proc(
        c : ^Connection,
        cookie : GetModifierMappingCookie,
        e : ^^GenericError,
    ) -> ^GetModifierMappingReply ---

    @(link_name="xcb_no_operation_checked")
    no_operation_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_no_operation")
    no_operation :: proc(c : ^Connection) -> VoidCookie ---

}
