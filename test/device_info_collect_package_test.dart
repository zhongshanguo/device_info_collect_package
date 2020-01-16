import 'package:flutter_test/flutter_test.dart';

import 'package:device_info_collect_package/device_info_collect_package.dart';

void main() async {
  var b = await DeviceInfoCollect.execute(
      'AccessibilityGuideline', 'b', 'http://39.97.230.177:30002');
  print(b);
//  test('adds one to input values', () async {
//    expect(
//        ,
//        true);

//    final calculator = Calculator();
//    expect(calculator.addOne(2), 3);
//    expect(calculator.addOne(-7), -6);
//    expect(calculator.addOne(0), 1);
//    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
//});
}
