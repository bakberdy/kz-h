import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    return '${androidInfo.model} / ${androidInfo.version.sdkInt} MOBILE APPLICATION';
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return '${iosInfo.name} / ${iosInfo.systemVersion} IOS MOBILE APPLICATION';
  } else if(Platform.isWindows){
    WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;
    return
        'Windows ${windowsInfo.majorVersion}, '
        'Mobile test by: ${windowsInfo.computerName}';
  }else {
    return 'Unsupported platform';
  }
}
