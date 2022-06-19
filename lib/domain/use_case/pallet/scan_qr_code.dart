import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class ScanQrCode {
  // 값조회 -> 있으면 삭제 -> 등록
  //분할한 값 0번은 팔레트번호로 사용하지 않음
  Future<TbWhPallet?> call(
      String sQrCode, String sWorkShop, String sLocation) async {

    TbWhPallet pallet;
    String qrCode = sQrCode;

    String sItemNo = '';
    int nQty = 0;
    String sLotNo = '';
    int nBoxNo = 0;

    // 공백이 여러건일 경우가 있기 때문에 치환한다.
    while (qrCode.indexOf('  ') > 0) {
      qrCode = qrCode.replaceAll('  ', ' ');
    }
    final convertedData = qrCode.split(' ');
    if (convertedData.isEmpty) {
      return null;
    }
    try {
      //품번은 두번째값부터
      sItemNo = convertedData[1];
      //수량은 분할된 세번째 값에서 0~7 값만 취함
      nQty = int.parse(convertedData[2].substring(0, 7));
      //박스 순번은 세번째값에서 뒤에서 세번째
      nBoxNo = int.parse(convertedData[2].substring(8));
      //lot no는 네번째(작업지시번호) 에서 뒤에서 세번째값만 취함
      sLotNo = convertedData[3].substring(convertedData[3].length - 7);

      pallet = TbWhPallet(
        comps: gComps,
        palletSeq: 0,
        workshop: sWorkShop,
        location: sLocation,
        itemNo: sItemNo,
        itemLot: sLotNo,
        state: 1,
        quantity: nQty,
        barcode: sQrCode,
        scanDate: DateTime.now(),
        scanUsernm: gDeviceName,
        boxNo: nBoxNo,
      );
    } catch (e) {
      return null;
    }
    return pallet;
  }
}
