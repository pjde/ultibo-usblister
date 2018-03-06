program USBHIDLister;

{$mode objfpc}{$H+}

{ Raspberry Pi 3 Application                                                   }
{  Add your program code below, add additional units to the "uses" section if  }
{  required and create new units by selecting File, New Unit from the menu.    }
{                                                                              }
{  To compile your program select Run, Compile (or Run, Build) from the menu.  }

{$define use_tftp}

uses
  RaspberryPi3,
  GlobalConfig,
  GlobalConst,
  GlobalTypes,
  Platform,
  Threads,
  SysUtils,
  Classes,
  uLog,
  USB,
  Devices,
  uHIDUsage,
  {$ifdef use_tftp}
  uTFTP, Winsock2,
  {$endif}
  Ultibo, Console
  { Add additional units here };

var
  Console1, Console2, Console3 : TWindowHandle;
{$ifdef use_tftp}
  IPAddress : string;
{$endif}
  USBDriver : PUSBDriver;


procedure Log1 (s : string);
begin
  ConsoleWindowWriteLn (Console1, s);
end;

procedure Log2 (s : string);
begin
  ConsoleWindowWriteLn (Console2, s);
end;

procedure Log3 (s : string);
begin
  ConsoleWindowWriteLn (Console3, s);
end;

procedure Msg3 (Sender : TObject; s : string);
begin
  Log3 (s);
end;

{$ifdef use_tftp}
function WaitForIPComplete : string;
var
  TCP : TWinsock2TCPClient;
begin
  TCP := TWinsock2TCPClient.Create;
  Result := TCP.LocalAddress;
  if (Result = '') or (Result = '0.0.0.0') or (Result = '255.255.255.255') then
    begin
      while (Result = '') or (Result = '0.0.0.0') or (Result = '255.255.255.255') do
        begin
          sleep (1000);
          Result := TCP.LocalAddress;
        end;
    end;
  TCP.Free;
end;
{$endif}

procedure WaitForSDDrive;
begin
  while not DirectoryExists ('C:\') do sleep (500);
end;


function USBDriverBind (Device : PUSBDevice; Interrface : PUSBInterface) : LongWord;
var
  j : integer;
  isHID : boolean;
  buff : array [0..255] of byte;
  res : LongWord;
begin
  Result := USB_STATUS_DEVICE_UNSUPPORTED;
  if Device = nil then exit;
  if Interrface <> nil then exit;
  isHID := false;
  if Device^.Descriptor^.bDeviceClass = USB_CLASS_CODE_INTERFACE_SPECIFIC then
    begin
      for j := low (Device^.Configuration^.Interfaces) to high (Device^.Configuration^.Interfaces) do
        if Device^.Configuration^.Interfaces[j]^.Descriptor^.bInterfaceClass = USB_CLASS_CODE_HID then
          isHID := true;
    end;
  ConsoleWindowClear (Console1);
  if not isHID then
    begin
      Log ('Not a HID Device.');
      exit;
    end;
  Log ('VID             : ' + Device^.Descriptor^.idVendor.ToHexString (4));
  Log ('PID             : ' + Device^.Descriptor^.idProduct.ToHexString (4));
  Log ('Product         : ' + Device^.Product);
  Log ('SNo             : ' + Device^.SerialNumber);
  Log ('Configurations  : ' + length (Device^.Configurations).ToString);
  Log ('First Configuration ----');
  Log ('  Interfaces : ' + length (Device^.Configuration^.Interfaces).ToString);
  for j := low (Device^.Configuration^.Interfaces) to high (Device^.Configuration^.Interfaces) do
    begin
      Log ('   ---- Interface ' + j.ToString + ' ---- ');
      if Device^.Configuration^.Interfaces[j]^.Descriptor^.bInterfaceClass <> USB_CLASS_CODE_HID then continue;
      Log ('      SubClass   : ' + Device^.Configuration^.Interfaces[j]^.Descriptor^.bInterfaceSubClass.ToHexString (2));
      Log ('      Protocol   : ' + Device^.Configuration^.Interfaces[j]^.Descriptor^.bInterfaceProtocol.ToHexString (2));
    end;
  Log ('Usage ----');
  FillChar (buff, 256, 0);
  res := USBControlRequestEx (Device, nil,
                              USB_DEVICE_REQUEST_GET_DESCRIPTOR,
                              USB_BMREQUESTTYPE_DIR_IN or
                              USB_BMREQUESTTYPE_TYPE_STANDARD or
                              USB_BMREQUESTTYPE_RECIPIENT_INTERFACE,
                              $22 shl 8, // $22 shl 8, // for Report Descriptor
                              0,
                              @buff[0],
                              255,
                              INFINITE, true);

  if res = USB_STATUS_SUCCESS then PrintHIDUsage (buff)
  else Log ('      Error      : ' + USBStatusToString (res));
end;

function USBDriverUnbind (Device : PUSBDevice; Interrface : PUSBInterface) : LongWord;
begin
  Result := USB_STATUS_DEVICE_UNSUPPORTED;
end;

begin
  Console1 := ConsoleWindowCreate (ConsoleDeviceGetDefault, CONSOLE_POSITION_LEFT, true);
  Console2 := ConsoleWindowCreate (ConsoleDeviceGetDefault, CONSOLE_POSITION_TOPRIGHT, false);
  Console3 := ConsoleWindowCreate (ConsoleDeviceGetDefault, CONSOLE_POSITION_BOTTOMRIGHT, false);
  SetLogProc (@Log1);

  Log2 ('HID USB Lister.');
  Log2 ('Plug in device to list information.');
  Log2 ('');

  {$ifdef use_tftp}
  IPAddress := WaitForIPComplete;
  Log3 ('TFTP Usage : tftp -i ' + IPAddress + ' put kernel7.img');
  SetOnMsg (@Msg3);
  {$endif}

  USBDriver := USBDriverCreate;
  if USBDriver = nil then ThreadHalt (0);
  USBDriver^.Driver.DriverName := 'GENERIC USB';
  USBDriver^.DriverBind := @USBDriverBind;
  USBDriver^.DriverUnbind := @USBDriverUnbind;
  USBDriverRegister (USBDriver);
  ThreadHalt (0);
end.


