library device_info_collect_package;

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';

class DeviceInfoCollect {
  static getStringValue(String obj, [String defautValue = '']) {
    if (obj == null) {
      return defautValue;
    }
    return obj;
  }

  static Future<bool> execute(
      String appId, String userId, String serverHost) async {
    DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    IosDeviceInfo iosDeviceInfo;
    AndroidDeviceInfo androidDeviceInfo;

    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }

    var deviceId = androidDeviceInfo == null
        ? (iosDeviceInfo == null ? "" : iosDeviceInfo.identifierForVendor)
        : androidDeviceInfo.androidId;
    var deviceType = androidDeviceInfo == null
        ? (iosDeviceInfo == null ? '' : 'ios')
        : 'android';
    bool isPhysicalDevice = androidDeviceInfo == null
        ? (iosDeviceInfo == null ? null : iosDeviceInfo.isPhysicalDevice)
        : androidDeviceInfo.isPhysicalDevice;
    String intPhysicalDevice =
        isPhysicalDevice == null ? '' : isPhysicalDevice ? '1' : '0';
    final url = '$serverHost/device/collect';
    var body = {
      "app_id": appId,
      "user_id": userId,
      "device_id": deviceId,
      "device_type": deviceType,
      "is_physical_device": intPhysicalDevice,
      "ios_name": getStringValue(iosDeviceInfo?.name),
      "ios_system_name": getStringValue(iosDeviceInfo?.systemName),
      "ios_system_version": getStringValue(iosDeviceInfo?.systemVersion),
      "ios_model": getStringValue(iosDeviceInfo?.model),
      "ios_localized_model": getStringValue(iosDeviceInfo?.localizedModel),
      "android_version": getStringValue(androidDeviceInfo?.version.toString()),
      "android_board": getStringValue(androidDeviceInfo?.board),
      "android_bootloader": getStringValue(androidDeviceInfo?.bootloader),
      "android_brand": getStringValue(androidDeviceInfo?.brand),
      "android_device": getStringValue(androidDeviceInfo?.device),
      "android_display": getStringValue(androidDeviceInfo?.display),
      "android_fingerprint": getStringValue(androidDeviceInfo?.fingerprint),
      "android_hardware": getStringValue(androidDeviceInfo?.hardware),
      "android_host": getStringValue(androidDeviceInfo?.host),
      "android_id": getStringValue(androidDeviceInfo?.androidId),
      "android_manufacturer": getStringValue(androidDeviceInfo?.manufacturer),
      "android_model": getStringValue(androidDeviceInfo?.model),
      "android_product": getStringValue(androidDeviceInfo?.product),
      "android_tags": getStringValue(androidDeviceInfo?.tags),
      "android_type": getStringValue(androidDeviceInfo?.type),
    };

    final response = await http.post(url, body: body);
    return response.statusCode == 200;
  }
}
