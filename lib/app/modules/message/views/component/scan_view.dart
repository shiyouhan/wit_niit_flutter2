
import 'package:barcode_scan2/barcode_scan2.dart';

Future<void> openScan() async{
  var options = ScanOptions(
      android: AndroidOptions(aspectTolerance: 0.5,useAutoFocus: true),
      autoEnableFlash: false,
      strings: {
        'flash_on': '打开闪光灯',
        'flash_off': '关闭闪光灯'
      }
  );
  var result = await BarcodeScanner.scan(options: options);
  String qrcode = result.rawContent;
  print("条形码或二维码为: " + qrcode);
}
