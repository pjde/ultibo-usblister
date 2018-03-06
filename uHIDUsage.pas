unit uHIDUsage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GlobalTypes;

const
// global usage
  HID_USAGE_UNDEFINED             = $00;
  HID_USAGE_DESKTOP               = $01;
  HID_USAGE_SIMULATION_CONTROL    = $02;
  HID_USAGE_VR_CONTROL            = $03;
  HID_USAGE_SPORT_CONTROL         = $04;
  HID_USAGE_GAME_CONTROL          = $05;
  HID_USAGE_GENERIC_CONTROL       = $06;
  HID_USAGE_KEYBOARD              = $07;
  HID_USAGE_LEDS                  = $08;
  HID_USAGE_BUTTON                = $09;
  HID_USAGE_ORDINAL               = $0A;
  HID_USAGE_TELEPHONY             = $0B;
  HID_USAGE_CUSTOMER              = $0C;
  HID_USAGE_DIGITISER             = $0D;
  HID_USAGE_PID_PAGE              = $0F;
  HID_USAGE_UNICODE               = $10;
  HID_USAGE_ALPHA_DISPLAY         = $14;
  HID_USAGE_MEDICAL               = $40;
  HID_USAGE_BAR_CODE              = $8C;
  HID_USAGE_SCALE                 = $8D;
  HID_USAGE_MSR                   = $8E;  // magnetic strip readers
  HID_USAGE_POS                   = $8F;  // point of sale
  HID_USAGE_CAMERA                = $90;
  HID_USAGE_ARCADE                = $91;
  HID_USAGE_VENDOR                = $FF;

  // desktop local usage
  DESkTOP_USAGE_UNDEFINED         = $00;
  DESkTOP_USAGE_POINTER           = $01;
  DESkTOP_USAGE_MOUSE             = $02;
  DESkTOP_USAGE_JOYSTICK          = $04;
  DESkTOP_USAGE_GAME_PAD          = $05;
  DESkTOP_USAGE_KEYBOARD          = $06;
  DESkTOP_USAGE_KEYPAD            = $07;
  DESkTOP_USAGE_MULTI_AXIS        = $08;
  DESkTOP_USAGE_TABLET            = $09;
  DESkTOP_USAGE_X                 = $30;
  DESkTOP_USAGE_Y                 = $31;
  DESkTOP_USAGE_Z                 = $32;
  DESkTOP_USAGE_RX                = $33;
  DESkTOP_USAGE_RY                = $34;
  DESkTOP_USAGE_RZ                = $35;
  DESkTOP_USAGE_SLIDER            = $36;
  DESkTOP_USAGE_DIAL              = $37;
  DESkTOP_USAGE_WHEEL             = $38;
  DESkTOP_USAGE_HAT               = $39;
  DESkTOP_USAGE_COUNTED           = $3A;
  DESkTOP_USAGE_BYTE_COUNT        = $3B;
  DESkTOP_USAGE_MOTION_WAKEUP     = $3C;
  DESkTOP_USAGE_START             = $3D;
  DESkTOP_USAGE_SELECT            = $3E;
  DESkTOP_USAGE_VX                = $40;
  DESkTOP_USAGE_VY                = $41;
  DESkTOP_USAGE_VZ                = $42;
  DESkTOP_USAGE_VBRX              = $43;
  DESkTOP_USAGE_VBRY              = $44;
  DESkTOP_USAGE_VBRZ              = $45;
  DESkTOP_USAGE_VNO               = $46;
  DESkTOP_USAGE_FEATURE_NOTIFY    = $47;
  DESkTOP_USAGE_RES_MULTI         = $48;
  DESkTOP_USAGE_SYS_CONTROL       = $80;
  DESkTOP_USAGE_SYS_POWER_DOWN    = $81;
  DESkTOP_USAGE_SYS_SLEEP         = $82;
  DESkTOP_USAGE_SYS_WAKE_UP       = $83;
  DESkTOP_USAGE_SYS_CONTEXT_MENU  = $84;
  DESkTOP_USAGE_SYS_MAIN_MENU     = $85;
  DESkTOP_USAGE_SYS_APP_MENU      = $86;
  DESkTOP_USAGE_SYS_MENU_HELP     = $87;
  DESkTOP_USAGE_SYS_MENU_EXIT     = $88;
  DESkTOP_USAGE_SYS_MENU_SELECT   = $89;
  DESkTOP_USAGE_SYS_MENU_RIGHT    = $8A;
  DESkTOP_USAGE_SYS_MENU_LEFT     = $8B;
  DESkTOP_USAGE_SYS_MENU_UP       = $8C;
  DESkTOP_USAGE_SYS_MENU_DOWN     = $8D;
  DESkTOP_USAGE_SYS_COLD_RESTART  = $8E;
  DESkTOP_USAGE_SYS_WARM_RESTART  = $8F;
  DESkTOP_USAGE_DPAD_UP           = $90;
  DESkTOP_USAGE_DPAD_DOWN         = $91;
  DESkTOP_USAGE_DPAD_RIGHT        = $92;
  DESkTOP_USAGE_DPAD_LEFT         = $93;
  DESkTOP_USAGE_SYS_DOCK          = $A0;
  DESkTOP_USAGE_SYS_UNDOCK        = $A1;
  DESkTOP_USAGE_SYS_SETUP         = $A2;
  DESkTOP_USAGE_SYS_BREAK         = $A3;
  DESkTOP_USAGE_SYS_DEBUG_BREAK   = $A4;
  DESkTOP_USAGE_APP_BREAK         = $A5;
  DESkTOP_USAGE_APP_DEBUG_BREAK   = $A6;
  DESkTOP_USAGE_SYS_SPEAKER_MUTE  = $A7;
  DESkTOP_USAGE_SYS_HIBERNATE     = $A8;
  DESkTOP_USAGE_SYS_DISPLAY_INVERT  = $B0;
  DESkTOP_USAGE_SYS_DISPLAY_INTERNAL = $B1;
  DESkTOP_USAGE_SYS_DISPLAY_EXTERNAL = $B2;
  DESkTOP_USAGE_SYS_DISPLAY_BOTH  = $B3;
  DESkTOP_USAGE_SYS_DISPLAY_DUAL  = $B4;
  DESkTOP_USAGE_SYS_DISPLAY_TOGGLE = $B5;
  DESkTOP_USAGE_SYS_DISPLAY_SWAP  = $B6;
  DESkTOP_USAGE_SYS_DISPLAY_AUTOSCALE = $B7;

  // simulation local usage
  SIM_USAGE_UNDEFINED             = $00;
  SIM_USAGE_FLIGHT                = $01;
  SIM_USAGE_AUTOMOBILE            = $02;
  SIM_USAGE_TANK                  = $03;
  SIM_USAGE_SPACESHIP             = $04;
  SIM_USAGE_SUBMARINE             = $05;
  SIM_USAGE_SAILING               = $06;
  SIM_USAGE_MOTORCYCLE            = $07;
  SIM_USAGE_SPORTS                = $08;
  SIM_USAGE_AIRPLANE              = $09;
  SIM_USAGE_HELICOPTER            = $0A;
  SIM_USAGE_MAGIC_CARPET          = $0B;
  SIM_USAGE_BICYCLE               = $0C;
  SIM_USAGE_FLIGHT_CONTROL_STICK  = $20;
  SIM_USAGE_FLIGHT_STICK          = $21;
  SIM_USAGE_CYCLIC                = $22;
  SIM_USAGE_CYCLIC_TRIM           = $23;
  SIM_USAGE_FLIGHT_YOKE           = $24;
  SIM_USAGE_TRACK_CONTROL         = $25;
  SIM_USAGE_AILERON               = $B0;
  SIM_USAGE_AILERON_TRIM          = $B1;
  SIM_USAGE_ANTI_TORGUE           = $B2;
  SIM_USAGE_AUTOPILOT             = $B3;
  SIM_USAGE_CHAFF                 = $B4;
  SIM_USAGE_COLLECTIVE            = $B5;
  SIM_USAGE_DIVE_BRAKE            = $B6;
  SIM_USAGE_COUNTERMEASURES       = $B7;
  SIM_USAGE_ELEVATOR              = $B8;
  SIM_USAGE_ELEVATOR_TRIM         = $B9;
  SIM_USAGE_RUDDER                = $BA;
  SIM_USAGE_THROTTLE              = $BB;
  SIM_USAGE_FLIGHT_COMMS          = $BC;
  SIM_USAGE_FLARE                 = $BD;
  SIM_USAGE_LANDING_GEAR          = $BE;
  SIM_USAGE_TOE_BRAKE             = $BF;
  SIM_USAGE_TRIGGER               = $C0;
  SIM_USAGE_WEAPONS_ARM           = $C1;
  SIM_USAGE_WEAPONS_SELECT        = $C2;
  SIM_USAGE_WING_FLAPS            = $C3;
  SIM_USAGE_ACCELERATOR           = $C4;
  SIM_USAGE_BRAKE                 = $C5;
  SIM_USAGE_CLUTCH                = $C6;
  SIM_USAGE_SHIFTER               = $C7;
  SIM_USAGE_STEERING              = $C8;
  SIM_USAGE_TURRET_DIRECTION      = $C9;
  SIM_USAGE_BARREL_ELEVATION      = $CA;
  SIM_USAGE_DIVE_PLANE            = $CB;
  SIM_USAGE_BALLAST               = $CC;
  SIM_USAGE_BICYCLE_CRANK         = $CD;
  SIM_USAGE_HANDLE_BARS           = $CE;
  SIM_USAGE_FRONT_BRAKE           = $CF;
  SIM_USAGE_REAR_BRAKE            = $D0;

  // vr local usage
  VR_UASGE_UNIDENTIFIED           = $00;
  VR_UASGE_BELT                   = $01;
  VR_UASGE_BODY_SUIT              = $02;
  VR_UASGE_FLEXOR                 = $03;
  VR_UASGE_GOVE                   = $04;
  VR_UASGE_HEAD_TRACKER           = $05;
  VR_UASGE_HEAD_MOUNTED_DISPLAY   = $06;
  VR_UASGE_HAND_TRACKER           = $07;
  VR_UASGE_OCULOLEMETR            = $08;
  VR_UASGE_VEST                   = $09;
  VR_UASGE_ANIMATRONIC            = $0A;
  VR_UASGE_STEREO_ENABLE          = $20;
  VR_UASGE_DISPLAY_ENABLE         = $21;

  // sports local usage
  SPORTS_USAGE_UNIDENTIFIED       = $00;
  SPORTS_USAGE_BASEBALL_BAT       = $01;
  SPORTS_USAGE_GOLF_CLUB          = $02;
  SPORTS_USAGE_ROWING_MACHINE     = $03;
  SPORTS_USAGE_TREADMILL          = $04;
  SPORTS_USAGE_OAR                = $30;
  SPORTS_USAGE_SLOPE              = $31;
  SPORTS_USAGE_RATE               = $32;
  SPORTS_USAGE_STICK_SPEED        = $33;
  SPORTS_USAGE_STICK_FACE_ANGLE   = $34;
  SPORTS_USAGE_STICK_HEEL         = $35;
  SPORTS_USAGE_STICK_FOLLOW_THROUGH = $36;
  SPORTS_USAGE_STICK_TEMPO        = $37;
  SPORTS_USAGE_STICK_TYPE         = $38;
  SPORTS_USAGE_STICK_HEIGHT       = $39;
  SPORTS_USAGE_PUTTER             = $50;
  SPORTS_USAGE_1IRON              = $51;
  SPORTS_USAGE_2IRON              = $52;
  SPORTS_USAGE_3IRON              = $53;
  SPORTS_USAGE_4IRON              = $54;
  SPORTS_USAGE_5IRON              = $55;
  SPORTS_USAGE_6IRON              = $56;
  SPORTS_USAGE_7IRON              = $57;
  SPORTS_USAGE_8IRON              = $58;
  SPORTS_USAGE_9IRON              = $59;
  SPORTS_USAGE_10IRON             = $5A;
  SPORTS_USAGE_11IRON             = $5B;
  SPORTS_USAGE_SAND_WEDGE         = $5C;
  SPORTS_USAGE_LOFT_WEDGE         = $5D;
  SPORTS_USAGE_POWER_WEDGE        = $5E;
  SPORTS_USAGE_1WOOD              = $5F;
  SPORTS_USAGE_3WOOD              = $60;
  SPORTS_USAGE_5WOOD              = $61;
  SPORTS_USAGE_7WOOD              = $62;
  SPORTS_USAGE_9WOOD              = $63;

  // games local uaage
  GAMES_USAGE_UNDEFINED           = $00;
  GAMES_USAGE_3D_CONTROLLER       = $01;
  GAMES_USAGE_PINBALL             = $02;
  GAMES_USAGE_GUN                 = $03;
  GAMES_USAGE_POV                 = $20;
  GAMES_USAGE_TURN                = $21;
  GAMES_USAGE_PITCH               = $22;
  GAMES_USAGE_ROLL                = $23;
  GAMES_USAGE_MOVE_LEFT_RIGHT     = $24;
  GAMES_USAGE_MOVE_FORWARD_BACKWARD = $25;
  GAMES_USAGE_MOVE_UP_DOWN        = $26;
  GAMES_USAGE_LEAN_LEFT_RIGHT     = $27;
  GAMES_USAGE_LEAN_FORWARD_BACKWORD = $28;
  GAMES_USAGE_POV_HEIGHT          = $29;
  GAMES_USAGE_FLIPPER             = $2A;
  GAMES_USAGE_SECONDAY_FLIFFER    = $2B;
  GAMES_USAGE_BUMP                = $2C;
  GAMES_USAGE_NEW_GAME            = $2D;
  GAMES_USAGE_SHOOT_BALL          = $2E;
  GAMES_USAGE_PLAYER              = $2F;
  GAMES_USAGE_GUN_BOLT            = $30;
  GAMES_USAGE_GUN_CLIP            = $31;
  GAMES_USAGE_GUN_SELECTOR        = $32;
  GAMES_USAGE_GUN_SINGLE_SHOT     = $33;
  GAMES_USAGE_GUN_BURST           = $34;
  GAMES_USAGE_GUN_AUTOMATIC       = $35;
  GAMES_USAGE_GUN_SAFETY          = $36;
  GAMES_USAGE_GAMEPAD_FIRE        = $37;
  GAMES_USAGE_GAMEPAD_TRIGGER     = $39;

  // generic local usage
  GENERIC_USAGE_UNIDENTIFIED      = $00;
  GENERIC_USAGE_BATTERY_STRENGTH  = $20;
  GENERIC_USAGE_WIRELESS_CHANNEL  = $21;
  GENERIC_USAGE_WIRELESS_ID       = $22;
  GENERIC_USAGE_DISCOVER_WIRELESS = $23;
  GENERIC_USAGE_CODE_CHAR_ENTERED = $24;
  GENERIC_USAGE_CODE_CHAR_ERASED  = $25;
  GENERIC_USAGE_CODE_CLEARED      = $26;

  // telphony local usage

  // consumer local usage

  // digitiser local usage
  DIGITISER_USAGE_UNDEFINED       = $00;
  DIGITISER_USAGE_DIGITISER       = $01;
  DIGITISER_USAGE_PEN             = $02;
  DIGITISER_USAGE_LIGHT_PEN       = $03;
  DIGITISER_USAGE_TOUCH_SCREEN    = $04;
  DIGITISER_USAGE_TOOUCH_PAD      = $05;
  DIGITISER_USAGE_WHITE_BOARD     = $06;
  DIGITISER_USAGE_COORD_MEASURING = $07;
  DIGITISER_USAGE_3D_DIGITISER    = $08;
  DIGITISER_USAGE_STEREO_PLOTTER  = $09;
  DIGITISER_USAGE_ARTICULATED_ARM = $0A;
  DIGITISER_USAGE_ARMATURE        = $0B;
  DIGITISER_USAGE_MULTI_POINT_DIGITISER = $0C;
  DIGITISER_USAGE_FREE_SPACE_WAND = $0D;
  DIGITISER_USAGE_STYLUS          = $20;
  DIGITISER_USAGE_PUCK            = $21;
  DIGITISER_USAGE_FINGER          = $22;
  DIGITISER_USAGE_TIP_PRESSURE    = $30;
  DIGITISER_USAGE_BARREL_PRESSURE = $31;
  DIGITISER_USAGE_IN_RANGE        = $32;
  DIGITISER_USAGE_TOUCH           = $33;
  DIGITISER_USAGE_UNTOUCH         = $34;
  DIGITISER_USAGE_TAP             = $35;
  DIGITISER_USAGE_QUALITY         = $36;
  DIGITISER_USAGE_DATA_VALID      = $37;
  DIGITISER_USAGE_TRANSDUCER_INDEX = $38;
  DIGITISER_USAGE_TABLET_FUNCTION_KEYS = $39;
  DIGITISER_USAGE_PROGRAM_CHANGE_KEYS = $3A;
  DIGITISER_USAGE_BATTERY_STRENGTH = $3B;
  DIGITISER_USAGE_INVERT          = $3C;
  DIGITISER_USAGE_X_TILT          = $3D;
  DIGITISER_USAGE_Y_TILT          = $3E;
  DIGITISER_USAGE_AZIMUTH         = $3F;
  DIGITISER_USAGE_ALTITUDE        = $40;
  DIGITISER_USAGE_TWIST           = $41;
  DIGITISER_USAGE_TIP_SWITCH      = $42;
  DIGITISER_USAGE_SECONDARY_TIP_SWITCH = $43;
  DIGITISER_USAGE_BARREL_SWITCH   = $44;
  DIGITISER_USAGE_ERASER          = $45;
  DIGITISER_USAGE_TABLET_PICK     = $46;

function HIDUsageToStr (Usage : byte) : string;
function LocalUsageToStr (Page, Usage : byte) : string;
function DesktopLocalUsageToStr (Usage : byte) : string;
function SportsLocalUsageToStr (Usage : byte) : string;
function GamesLocalUsageToStr (Usage : byte) : string;
function SimLocalUsageToStr (Usage : byte) : string;
function DigitiserLocalUsageToStr (Usage : byte) : string;
function GenericLocalUsageToStr (Usage : byte) : string;
function VRLocalUsageToStr (Usage : byte) : string;
function InputToStr (ip : byte) : string;

procedure PrintHIDUsage (b : array of byte);

implementation

uses uLog;

function LocalUsageToStr (Page, Usage : byte) : string;
begin
  case Page of
    HID_USAGE_DESKTOP            : Result := DesktopLocalUsageToStr (Usage);
    HID_USAGE_SIMULATION_CONTROL : Result := SimLocalUsageToStr (Usage);
    HID_USAGE_SPORT_CONTROL      : Result := SportsLocalUsageToStr (Usage);
    HID_USAGE_GAME_CONTROL       : Result := GamesLocalUsageToStr (Usage);
    HID_USAGE_VR_CONTROL         : Result := VRLocalUsageToStr (Usage);
    HID_USAGE_DIGITISER          : Result := DigitiserLocalUsageToStr (Usage);
    HID_USAGE_GENERIC_CONTROL    : Result := GenericLocalUsageToStr (Usage);
    else                           Result := Usage.ToHexString (2);
    end;
end;

function HIDUsageToStr (Usage : byte) : string;
begin
  case Usage of
    HID_USAGE_UNDEFINED          : Result := 'Undefined';
    HID_USAGE_DESKTOP            : Result := 'Desktop';
    HID_USAGE_SIMULATION_CONTROL : Result := 'Simulation';
    HID_USAGE_VR_CONTROL         : Result := 'VR';
    HID_USAGE_SPORT_CONTROL      : Result := 'Sport';
    HID_USAGE_GAME_CONTROL       : Result := 'Game';
    HID_USAGE_GENERIC_CONTROL    : Result := 'Generic';
    HID_USAGE_KEYBOARD           : Result := 'Keyboard';
    HID_USAGE_LEDS               : Result := 'LEDS';
    HID_USAGE_BUTTON             : Result := 'Button';
    HID_USAGE_ORDINAL            : Result := 'Ordinal';
    HID_USAGE_TELEPHONY          : Result := 'Telphony';
    HID_USAGE_CUSTOMER           : Result := 'Customer';
    HID_USAGE_DIGITISER          : Result := 'Digitiser';
    HID_USAGE_PID_PAGE           : Result := 'PID Page';
    HID_USAGE_UNICODE            : Result := 'Unicode';
    HID_USAGE_ALPHA_DISPLAY      : Result := 'Aplhanumeric Display';
    HID_USAGE_MEDICAL            : Result := 'Medical';
    HID_USAGE_BAR_CODE           : Result := 'Bar Code Scanner';
    HID_USAGE_SCALE              : Result := 'Scale';
    HID_USAGE_MSR                : Result := 'Magnetic Strip Reader';
    HID_USAGE_POS                : Result := 'Point of Sale';
    HID_USAGE_CAMERA             : Result := 'Camera';
    HID_USAGE_ARCADE             : Result := 'Arcade';
    HID_USAGE_VENDOR             : Result := 'Vendor Specific';
    else                           Result := Usage.ToHexString (4);
    end;
end;

function DesktopLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    DESkTOP_USAGE_UNDEFINED             : Result := 'Undefined';
    DESkTOP_USAGE_POINTER               : Result := 'Pointer';
    DESkTOP_USAGE_MOUSE                 : Result := 'Mouse';
    DESkTOP_USAGE_JOYSTICK              : Result := 'Joystick';
    DESkTOP_USAGE_GAME_PAD              : Result := 'Game Pad';
    DESkTOP_USAGE_KEYBOARD              : Result := 'Keyboard';
    DESkTOP_USAGE_KEYPAD                : Result := 'Keypad';
    DESkTOP_USAGE_MULTI_AXIS            : Result := 'Multi Axis Controller';
    DESkTOP_USAGE_TABLET                : Result := 'Tablet';
    DESkTOP_USAGE_X                     : Result := 'X';
    DESkTOP_USAGE_Y                     : Result := 'Y';
    DESkTOP_USAGE_Z                     : Result := 'Z';
    DESkTOP_USAGE_RX                    : Result := 'RX';
    DESkTOP_USAGE_RY                    : Result := 'RY';
    DESkTOP_USAGE_RZ                    : Result := 'RZ';
    DESkTOP_USAGE_SLIDER                : Result := 'Slider';
    DESkTOP_USAGE_DIAL                  : Result := 'Dial';
    DESkTOP_USAGE_WHEEL                 : Result := 'Wheel';
    DESkTOP_USAGE_HAT                   : Result := 'Hat';
    DESkTOP_USAGE_COUNTED               : Result := 'Conted Buffer';
    DESkTOP_USAGE_BYTE_COUNT            : Result := 'Byte Count';
    DESkTOP_USAGE_MOTION_WAKEUP         : Result := 'Motion Wakeup';
    DESkTOP_USAGE_START                 : Result := 'Start';
    DESkTOP_USAGE_SELECT                : Result := 'Select';
    DESkTOP_USAGE_VX                    : Result := 'VX';
    DESkTOP_USAGE_VY                    : Result := 'VY';
    DESkTOP_USAGE_VZ                    : Result := 'VZ';
    DESkTOP_USAGE_VBRX                  : Result := 'VBRX';
    DESkTOP_USAGE_VBRY                  : Result := 'VBRY';
    DESkTOP_USAGE_VBRZ                  : Result := 'VBRZ';
    DESkTOP_USAGE_VNO                   : Result := 'V No';
    DESkTOP_USAGE_FEATURE_NOTIFY        : Result := 'Feature Notification';
    DESkTOP_USAGE_RES_MULTI             : Result := 'Multi Resolution';
    DESkTOP_USAGE_SYS_CONTROL           : Result := 'System Control';
    DESkTOP_USAGE_SYS_POWER_DOWN        : Result := 'System Power Down';
    DESkTOP_USAGE_SYS_SLEEP             : Result := 'System Sleep';
    DESkTOP_USAGE_SYS_WAKE_UP           : Result := 'System Wakeup';
    DESkTOP_USAGE_SYS_CONTEXT_MENU      : Result := 'Context Menu';
    DESkTOP_USAGE_SYS_MAIN_MENU         : Result := 'Main Menu';
    DESkTOP_USAGE_SYS_APP_MENU          : Result := 'App Menu';
    DESkTOP_USAGE_SYS_MENU_HELP         : Result := 'Menu Help';
    DESkTOP_USAGE_SYS_MENU_EXIT         : Result := 'Menu Exit';
    DESkTOP_USAGE_SYS_MENU_SELECT       : Result := 'Menu Select';
    DESkTOP_USAGE_SYS_MENU_RIGHT        : Result := 'Menu Right';
    DESkTOP_USAGE_SYS_MENU_LEFT         : Result := 'Menu Left';
    DESkTOP_USAGE_SYS_MENU_UP           : Result := 'Menu Up';
    DESkTOP_USAGE_SYS_MENU_DOWN         : Result := 'Menu Down';
    DESkTOP_USAGE_SYS_COLD_RESTART      : Result := 'Cold Restart';
    DESkTOP_USAGE_SYS_WARM_RESTART      : Result := 'Warn Restart';
    DESkTOP_USAGE_DPAD_UP               : Result := 'DPAD Up';
    DESkTOP_USAGE_DPAD_DOWN             : Result := 'DPAD Down';
    DESkTOP_USAGE_DPAD_RIGHT            : Result := 'DPAD Right';
    DESkTOP_USAGE_DPAD_LEFT             : Result := 'DPAD Left';
    DESkTOP_USAGE_SYS_DOCK              : Result := 'Dock';
    DESkTOP_USAGE_SYS_UNDOCK            : Result := 'Undock';
    DESkTOP_USAGE_SYS_SETUP             : Result := 'Setup';
    DESkTOP_USAGE_SYS_BREAK             : Result := 'Break';
    DESkTOP_USAGE_SYS_DEBUG_BREAK       : Result := 'Debugger Break';
    DESkTOP_USAGE_APP_BREAK             : Result := 'App Break';
    DESkTOP_USAGE_APP_DEBUG_BREAK       : Result := 'App Debugger Break';
    DESkTOP_USAGE_SYS_SPEAKER_MUTE      : Result := 'Speaker Mute';
    DESkTOP_USAGE_SYS_HIBERNATE         : Result := 'Hibernate';
    DESkTOP_USAGE_SYS_DISPLAY_INVERT    : Result := 'Display Invert';
    DESkTOP_USAGE_SYS_DISPLAY_INTERNAL  : Result := 'Display Internal';
    DESkTOP_USAGE_SYS_DISPLAY_EXTERNAL  : Result := 'Display External';
    DESkTOP_USAGE_SYS_DISPLAY_BOTH      : Result := 'Display Both';
    DESkTOP_USAGE_SYS_DISPLAY_DUAL      : Result := 'Display Dual';
    DESkTOP_USAGE_SYS_DISPLAY_TOGGLE    : Result := 'Display Toggle';
    DESkTOP_USAGE_SYS_DISPLAY_SWAP      : Result := 'Display Swap';
    DESkTOP_USAGE_SYS_DISPLAY_AUTOSCALE : Result := 'Display Autoscale';
    else                                  Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function SimLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    SIM_USAGE_UNDEFINED            : Result := 'Undefined';
    SIM_USAGE_FLIGHT               : Result := 'Flight';
    SIM_USAGE_AUTOMOBILE           : Result := 'Automobile';
    SIM_USAGE_TANK                 : Result := 'Tank';
    SIM_USAGE_SPACESHIP            : Result := 'Space Ship';
    SIM_USAGE_SUBMARINE            : Result := 'Submarine';
    SIM_USAGE_SAILING              : Result := 'Sailing';
    SIM_USAGE_MOTORCYCLE           : Result := 'Motor Cycle';
    SIM_USAGE_SPORTS               : Result := 'Sports';
    SIM_USAGE_AIRPLANE             : Result := 'Airplane';
    SIM_USAGE_HELICOPTER           : Result := 'Helicopter';
    SIM_USAGE_MAGIC_CARPET         : Result := 'Magic Carpet';
    SIM_USAGE_BICYCLE              : Result := 'Bicycle';
    SIM_USAGE_FLIGHT_CONTROL_STICK : Result := 'Flight Control Stick';
    SIM_USAGE_FLIGHT_STICK         : Result := 'Flight stick';
    SIM_USAGE_CYCLIC               : Result := 'Cyclic';
    SIM_USAGE_CYCLIC_TRIM          : Result := 'Cyclic Trim';
    SIM_USAGE_FLIGHT_YOKE          : Result := 'Flight Yoke';
    SIM_USAGE_TRACK_CONTROL        : Result := 'Track Control';
    SIM_USAGE_AILERON              : Result := 'Aileron';
    SIM_USAGE_AILERON_TRIM         : Result := 'Aileron Trim';
    SIM_USAGE_ANTI_TORGUE          : Result := 'Anti Torgue';
    SIM_USAGE_AUTOPILOT            : Result := 'Auto Pilot';
    SIM_USAGE_CHAFF                : Result := 'Chaff';
    SIM_USAGE_COLLECTIVE           : Result := 'Collective';
    SIM_USAGE_DIVE_BRAKE           : Result := 'Dive Brake';
    SIM_USAGE_COUNTERMEASURES      : Result := 'Counter Measures';
    SIM_USAGE_ELEVATOR             : Result := 'Elevator';
    SIM_USAGE_ELEVATOR_TRIM        : Result := 'Elevator Trim';
    SIM_USAGE_RUDDER               : Result := 'Rudder';
    SIM_USAGE_THROTTLE             : Result := 'Throttle';
    SIM_USAGE_FLIGHT_COMMS         : Result := 'Flight Comms';
    SIM_USAGE_FLARE                : Result := 'Flare';
    SIM_USAGE_LANDING_GEAR         : Result := 'Landing Gear';
    SIM_USAGE_TOE_BRAKE            : Result := 'Toe Brake';
    SIM_USAGE_TRIGGER              : Result := 'Trigger';
    SIM_USAGE_WEAPONS_ARM          : Result := 'Weapons Arm';
    SIM_USAGE_WEAPONS_SELECT       : Result := 'Weapoms Select';
    SIM_USAGE_WING_FLAPS           : Result := 'Wing Flaps';
    SIM_USAGE_ACCELERATOR          : Result := 'Accelerator';
    SIM_USAGE_BRAKE                : Result := 'Brake';
    SIM_USAGE_CLUTCH               : Result := 'Clutch';
    SIM_USAGE_SHIFTER              : Result := 'Shifter';
    SIM_USAGE_STEERING             : Result := 'Steering';
    SIM_USAGE_TURRET_DIRECTION     : Result := 'Turret Direction';
    SIM_USAGE_BARREL_ELEVATION     : Result := 'Barrel Elevation';
    SIM_USAGE_DIVE_PLANE           : Result := 'Dive Plane';
    SIM_USAGE_BALLAST              : Result := 'Ballast';
    SIM_USAGE_BICYCLE_CRANK        : Result := 'Bicycle Crank';
    SIM_USAGE_HANDLE_BARS          : Result := 'Handle Bars';
    SIM_USAGE_FRONT_BRAKE          : Result := 'Fromt Brake';
    SIM_USAGE_REAR_BRAKE           : Result := 'Read Brake';
    else                             Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function SportsLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    SPORTS_USAGE_UNIDENTIFIED         : Result := 'Undefined';
    SPORTS_USAGE_BASEBALL_BAT         : Result := 'Baseball Bat';
    SPORTS_USAGE_GOLF_CLUB            : Result := 'Golf Club';
    SPORTS_USAGE_ROWING_MACHINE       : Result := 'Rowing Machine';
    SPORTS_USAGE_TREADMILL            : Result := 'Tradmill';
    SPORTS_USAGE_OAR                  : Result := 'Oar';
    SPORTS_USAGE_SLOPE                : Result := 'Slope';
    SPORTS_USAGE_RATE                 : Result := 'Rate';
    SPORTS_USAGE_STICK_SPEED          : Result := 'Stick Speed';
    SPORTS_USAGE_STICK_FACE_ANGLE     : Result := 'Stick face Angle';
    SPORTS_USAGE_STICK_HEEL           : Result := 'Stick Heel';
    SPORTS_USAGE_STICK_FOLLOW_THROUGH : Result := 'Stick Follow Through';
    SPORTS_USAGE_STICK_TEMPO          : Result := 'Stick Tempo';
    SPORTS_USAGE_STICK_TYPE           : Result := 'stick Type';
    SPORTS_USAGE_STICK_HEIGHT         : Result := 'Stick Height';
    SPORTS_USAGE_PUTTER               : Result := 'Putter';
    SPORTS_USAGE_1IRON                : Result := '1 Iron';
    SPORTS_USAGE_2IRON                : Result := '2 Iron';
    SPORTS_USAGE_3IRON                : Result := '3 Iron';
    SPORTS_USAGE_4IRON                : Result := '4 Iron';
    SPORTS_USAGE_5IRON                : Result := '5 Iron';
    SPORTS_USAGE_6IRON                : Result := '6 Iron';
    SPORTS_USAGE_7IRON                : Result := '7 Iron';
    SPORTS_USAGE_8IRON                : Result := '8 Iron';
    SPORTS_USAGE_9IRON                : Result := '9 Iron';
    SPORTS_USAGE_10IRON               : Result := '10 Iron';
    SPORTS_USAGE_11IRON               : Result := '11 Iron';
    SPORTS_USAGE_SAND_WEDGE           : Result := 'Sand Wedge';
    SPORTS_USAGE_LOFT_WEDGE           : Result := 'Loft Wedge';
    SPORTS_USAGE_POWER_WEDGE          : Result := 'Power Wwedge';
    SPORTS_USAGE_1WOOD                : Result := '1 Wood';
    SPORTS_USAGE_3WOOD                : Result := '3 Wood';
    SPORTS_USAGE_5WOOD                : Result := '5 Wood';
    SPORTS_USAGE_7WOOD                : Result := '7 Wood';
    SPORTS_USAGE_9WOOD                : Result := '9 Wood';
    else                                Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function GamesLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    GAMES_USAGE_UNDEFINED             : Result := 'Undefined';
    GAMES_USAGE_3D_CONTROLLER         : Result := '3D Controller';
    GAMES_USAGE_PINBALL               : Result := 'Pinball';
    GAMES_USAGE_GUN                   : Result := 'Gun';
    GAMES_USAGE_POV                   : Result := 'Point of View';
    GAMES_USAGE_TURN                  : Result := 'Turn';
    GAMES_USAGE_PITCH                 : Result := 'Pitch';
    GAMES_USAGE_ROLL                  : Result := 'Roll';
    GAMES_USAGE_MOVE_LEFT_RIGHT       : Result := 'Move Left/Right';
    GAMES_USAGE_MOVE_FORWARD_BACKWARD : Result := 'Move Forward/Backward';
    GAMES_USAGE_MOVE_UP_DOWN          : Result := 'Move Up/Down';
    GAMES_USAGE_LEAN_LEFT_RIGHT       : Result := 'Lean Left/Right';
    GAMES_USAGE_LEAN_FORWARD_BACKWORD : Result := 'Lean Forward/Backward';
    GAMES_USAGE_POV_HEIGHT            : Result := 'POV Height';
    GAMES_USAGE_FLIPPER               : Result := 'Flipper';
    GAMES_USAGE_SECONDAY_FLIFFER      : Result := 'scondary Flipper';
    GAMES_USAGE_BUMP                  : Result := 'Bump';
    GAMES_USAGE_NEW_GAME              : Result := 'New Game';
    GAMES_USAGE_SHOOT_BALL            : Result := 'Shoot Ball';
    GAMES_USAGE_PLAYER                : Result := 'Player';
    GAMES_USAGE_GUN_BOLT              : Result := 'Gun Bolt';
    GAMES_USAGE_GUN_CLIP              : Result := 'Gun Clip';
    GAMES_USAGE_GUN_SELECTOR          : Result := 'Gun Selector';
    GAMES_USAGE_GUN_SINGLE_SHOT       : Result := 'Gun Single Shot';
    GAMES_USAGE_GUN_BURST             : Result := 'Gun Burst';
    GAMES_USAGE_GUN_AUTOMATIC         : Result := 'Gun Automatic';
    GAMES_USAGE_GUN_SAFETY            : Result := 'Gun Safety';
    GAMES_USAGE_GAMEPAD_FIRE          : Result := 'Gamepad Fire';
    GAMES_USAGE_GAMEPAD_TRIGGER       : Result := 'FGmepad Trigger';
    else                                Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function DigitiserLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    DIGITISER_USAGE_UNDEFINED             : Result := 'Undefined';
    DIGITISER_USAGE_DIGITISER             : Result := 'Digitiser';
    DIGITISER_USAGE_PEN                   : Result := 'Pen';
    DIGITISER_USAGE_LIGHT_PEN             : Result := 'Light Pen';
    DIGITISER_USAGE_TOUCH_SCREEN          : Result := 'Touch Screen';
    DIGITISER_USAGE_TOOUCH_PAD            : Result := 'Touch Pad';
    DIGITISER_USAGE_WHITE_BOARD           : Result := 'White Board';
    DIGITISER_USAGE_COORD_MEASURING       : Result := 'Coordinate Measuring';
    DIGITISER_USAGE_3D_DIGITISER          : Result := '3D Digitiser';
    DIGITISER_USAGE_STEREO_PLOTTER        : Result := 'Stereo Plotter';
    DIGITISER_USAGE_ARTICULATED_ARM       : Result := 'Articulated Arm';
    DIGITISER_USAGE_ARMATURE              : Result := 'Armature';
    DIGITISER_USAGE_MULTI_POINT_DIGITISER : Result := 'Multi Point Digitiser';
    DIGITISER_USAGE_FREE_SPACE_WAND       : Result := 'Free Space Wand';
    DIGITISER_USAGE_STYLUS                : Result := 'Stylus';
    DIGITISER_USAGE_PUCK                  : Result := 'Puck';
    DIGITISER_USAGE_FINGER                : Result := 'Finger';
    DIGITISER_USAGE_TIP_PRESSURE          : Result := 'Tip Pressure';
    DIGITISER_USAGE_BARREL_PRESSURE       : Result := 'Barrel Pressure';
    DIGITISER_USAGE_IN_RANGE              : Result := 'In Range';
    DIGITISER_USAGE_TOUCH                 : Result := 'Touch';
    DIGITISER_USAGE_UNTOUCH               : Result := 'Untouch';
    DIGITISER_USAGE_TAP                   : Result := 'Tap';
    DIGITISER_USAGE_QUALITY               : Result := 'Quality';
    DIGITISER_USAGE_DATA_VALID            : Result := 'Data Valid';
    DIGITISER_USAGE_TRANSDUCER_INDEX      : Result := 'Transducer Index';
    DIGITISER_USAGE_TABLET_FUNCTION_KEYS  : Result := 'Tablet Function Keys';
    DIGITISER_USAGE_PROGRAM_CHANGE_KEYS   : Result := 'Program Change Keys';
    DIGITISER_USAGE_BATTERY_STRENGTH      : Result := 'Battery Strength';
    DIGITISER_USAGE_INVERT                : Result := 'Invert';
    DIGITISER_USAGE_X_TILT                : Result := 'X Tilt';
    DIGITISER_USAGE_Y_TILT                : Result := 'Y Tilt';
    DIGITISER_USAGE_AZIMUTH               : Result := 'Azimuth';
    DIGITISER_USAGE_ALTITUDE              : Result := 'Altitude';
    DIGITISER_USAGE_TWIST                 : Result := 'Twist';
    DIGITISER_USAGE_TIP_SWITCH            : Result := 'Tip Switch';
    DIGITISER_USAGE_SECONDARY_TIP_SWITCH  : Result := 'Secondary Tip Switch';
    DIGITISER_USAGE_BARREL_SWITCH         : Result := 'Barrel Switch';
    DIGITISER_USAGE_ERASER                : Result := 'Eraser';
    DIGITISER_USAGE_TABLET_PICK           : Result := 'Tablet Pick';
    else                                    Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function GenericLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    GENERIC_USAGE_UNIDENTIFIED      : Result := 'Unidentified';
    GENERIC_USAGE_BATTERY_STRENGTH  : Result := 'Battery Strength';
    GENERIC_USAGE_WIRELESS_CHANNEL  : Result := 'Wireless Channel';
    GENERIC_USAGE_WIRELESS_ID       : Result := 'Wireless ID';
    GENERIC_USAGE_DISCOVER_WIRELESS : Result := 'Discover Wireless';
    GENERIC_USAGE_CODE_CHAR_ENTERED : Result := 'Security Code Char Entered';
    GENERIC_USAGE_CODE_CHAR_ERASED  : Result := 'Security Code Char Erased';
    GENERIC_USAGE_CODE_CLEARED      : Result := 'Security Code Cleared';
    else                              Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function VRLocalUsageToStr (Usage : byte) : string;
begin
  case Usage of
    VR_UASGE_UNIDENTIFIED         : Result := 'Unidentified';
    VR_UASGE_BELT                 : Result := 'Belt';
    VR_UASGE_BODY_SUIT            : Result := 'Body Suit';
    VR_UASGE_FLEXOR               : Result := 'Flexor';
    VR_UASGE_GOVE                 : Result := 'Glove';
    VR_UASGE_HEAD_TRACKER         : Result := 'Head Tracker';
    VR_UASGE_HEAD_MOUNTED_DISPLAY : Result := 'Head Mounted Display';
    VR_UASGE_HAND_TRACKER         : Result := 'Hand Tracker';
    VR_UASGE_OCULOLEMETR          : Result := 'Oculolemeter';
    VR_UASGE_VEST                 : Result := 'Vest';
    VR_UASGE_ANIMATRONIC          : Result := 'animatronic';
    VR_UASGE_STEREO_ENABLE        : Result := 'Stereo Enable';
    VR_UASGE_DISPLAY_ENABLE       : Result := 'Display Enable';
    else                            Result := 'Reserved (' + Usage.ToHexString (4) + ')';
    end;
end;

function InputToStr (ip : byte) : string;
begin
  if ip and $01 = 0 then Result := 'Data,' else Result := 'Const,';
  if ip and $02 = 0 then Result := Result + 'Array,' else Result := Result + 'Var,';
  if ip and $04 = 0 then Result := Result + 'Abs' else Result := Result + 'Rel';
end;


procedure PrintHIDUsage (b : array of byte);
var
  i, x : integer;
  done : boolean;
  cc : integer;
  s : string;
  page : byte;
  item_size, item_type, item_tag : byte;

  function indent : string;
  var
    id : integer;
  begin
    Result := '';
    for id := 1 to cc do Result := Result + '  ';
  end;

  function ValueOf (index, size : integer) : integer;
  begin
    Result := 0;
    case size of
      1 :
        begin
          Result := b[index];
          if Result > $7f then Result := Result - $100;
        end;
      2 :
        begin
          Result := b[index] + (b[index + 1] shl 8);
          if Result > $7fff then Result := Result - $10000;
        end;
      end; // case
  end;

begin
  i := 0;
  done := false;
  cc := 0;
  page := 0;
  while not done do
    begin
      if i > high (b) then
         done := true
      else
        begin
          x := b[i];
          if x = 0 then done := true
          else
            begin
              item_size := x and $03;  // extra bytes
              if item_size = 3 then item_size := 4;  // values are 0,1,2 and 4
              item_type := (x shr 2) and $03;
              item_tag := (x shr 4) and $0f;
              s := '';
              case item_type of
                0 : // main
                  begin
                    case item_tag of
                      8 : // input
                        s := 'INPUT (' + InputToStr (b[i + 1]) + ')';
                      9 : // output
                        s := 'OUTPUT (' + InputToStr (b[i + 1]) + ')';
                      10 : // start collection;
                        begin
                          case b[i + 1] of
                            $00 : s := 'Physical';
                            $01 : s := 'Application';
                            $03 : s := 'Logical';
                            $04..$7f : s := 'Reserved'
                            else s := 'Vendor Defined';
                            end;
                          s := 'COLLECTION (' + s + ')';
                        end;
                      11 : // feature
                        s := 'FEATURE (' + InputToStr (b[i + 1]) + ')';
                      12 : // end collection
                        s := 'END_COLLECTION';
                      end; // case
                  end; // main
                1 : // global
                  begin
                    case item_tag of
                      0 : // usage page
                        begin
                          s := 'USAGE_PAGE (' + HIDUsageToStr (b[i + 1]) + ')';
                          page := b[i + 1];
                        end;
                      1 : // logical minimum
                        s := 'LOGICAL_MINIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      2 : // logical maximum
                        s := 'LOGICAL_MAXIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      3 : // physical minimum
                        s := 'PHYSICAL MINIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      4 : // physical maximum
                        s := 'PHYSICAL MAXIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      5 : // unit exponent
                        s := 'UNIT_EXPONENT (' + ValueOf (i + 1, item_size).ToString + ')';
                      6 : // unit
                        s := 'UNIT (' + ValueOf (i + 1, item_size).ToString + ')';
                      7 : // report size
                        s := 'REPORT_SIZE (' + ValueOf (i + 1, item_size).ToString + ')';
                      8 : // report id
                        s := 'REPORT_ID (' + ValueOf (i + 1, item_size).ToString + ')';
                      9 : // report count
                        s := 'REPORT_COUNT (' + ValueOf (i + 1, item_size).ToString + ')';
                      10 : // push
                        s := 'PUSH';
                      11 : // pop
                        s := 'POP';
                      end;   // case
                  end; // global
                $02 : // local
                  begin
                    case item_tag of
                      0 : // usage
                        s := 'USAGE (' + LocalUsageToStr (page, b[i + 1]) + ')';
                      1 : // usage minimum
                        s := 'USAGE_MINIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      2 : // usage maximum
                        s := 'USAGE_MAXIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      3 : // designator index
                        s := 'DESIGNATOR_INDEX (' + ValueOf (i + 1, item_size).ToString + ')';
                      4 : // designator minimum
                        s := 'DESIGNATOR_MINIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      5 : // designator maximum
                        s := 'DESIGNATOR_MAXIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      7 : // string index
                        s := 'STRING_INDEX (' + ValueOf (i + 1, item_size).ToString + ')';
                      8 : // string minimum
                        s := 'STRING_MINIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      9 : // string maximum
                        s := 'STRING_MAXIMUM (' + ValueOf (i + 1, item_size).ToString + ')';
                      10 : // delimiter
                        s := 'DELIMITER (' + ValueOf (i + 1, item_size).ToString + ')';
                      end; // case
                  end;   // local
                end;  // case
              if b[i] = $c0 then cc := cc - 1;
              if s <> '' then Log (indent + s);
//              sleep (1000);
              if b[i] = $a1 then cc := cc + 1;
              i := i + 1 + item_size;
            end;
        end;
    end;
end;



end.

