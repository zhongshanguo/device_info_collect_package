# device_info_collect_package

一个用于收集硬件信息的包，可以将收集到的信息发送到后端接口上。

有关后端接口，对应相关项目：[https://github.com/zhongshanguo/device-info-collector](https://github.com/zhongshanguo/device-info-collector)

## Getting Started

- 引入包
    <pre>
    dependencies:
      flutter:
        sdk: flutter
      ...
      device_info_collect_package:
        git:
          url: git@github.com:zhongshanguo/device_info_collect_package.git
    </pre>

- 使用
    <pre>
    var b = await DeviceInfoCollect.execute('APP_NAME', 'USER_INFO', 'http://IP:30002');
    print(b);
    </b>