import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class ScanQrCode {

  // 값조회 -> 있으면 삭제 -> 등록
  Future<TbWhPallet?> call(String sQrCode) async {
    TbWhPallet pallet;
    final convertedData = sQrCode.split('\t');
    if (convertedData.isEmpty) {
      return null;
    }
    try{
      pallet = TbWhPallet(
        PALLET_SEQ: int.parse(convertedData[0]),
        WORKSHOP: convertedData[1],
        LOCATION: convertedData[2],
        ITEM_NO: convertedData[3],
        ITEM_LOT: convertedData[4],
        STATE: int.parse(convertedData[5]),
        QUANTITY: int.parse(convertedData[6]),
        BARCODE: sQrCode,
        SCAN_DATE: DateTime.now(),
        SCAN_USERNM: gDeviceName,
        BOX_NO: int.parse(convertedData[7]),
      );
    }catch(e){
      return null;
    }
    return pallet;
  }
}
