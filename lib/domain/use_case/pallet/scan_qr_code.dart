import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class ScanQrCode {
  // 값조회 -> 있으면 삭제 -> 등록
  //분할한 값 0번은 팔레트번호로 사용하지 않음
  Future<TbWhPallet?> call(String sQrCode, String sWorkShop,
      String sLocation) async {
    TbWhPallet pallet;
    String qrCode = sQrCode.replaceAll(' ', '@');

    String sItemNo = '';
    String sLotNo = '';
    String sResultDate = '';

    int nQty = 0;

    int nBoxNo = 0;
    int nPalletSeq = 0;

    // 공백이 여러건일 경우가 있기 때문에 치환한다.
    
    try {
      //품번은 두번째값부터
      //91
      sItemNo = qrCode.substring(91,106);
      String sQty = qrCode.substring(107,113);
      //수량은 분할된 세번째 값에서 0~7 값만 취함
      nQty = int.parse(sQty);
      //박스 순번은 세번째값에서 뒤에서 세번째
      sResultDate = qrCode.substring(118, 126);
      //lot no는 네번째(작업지시번호) 에서 뒤에서 세번째값만 취함
      sLotNo = convertLotToNumber(sResultDate.substring(4,8));

      String sBoxNo = qrCode.substring(143,150);

      nBoxNo = int.parse(sBoxNo);

      pallet = TbWhPallet(
        comps: gComps,
        workshop: sWorkShop,
        location: sLocation,
        itemNo: sItemNo,
        itemLot: sLotNo,
        state: '01',
        quantity: nQty,
        barcode: sQrCode,
        scanDate: DateTime.now(),
        scanUsernm: gDeviceId,
        boxNo: nBoxNo,
      );
    } catch (e) {
      return null;
    }
    return pallet;
  }

  //생산일자를 알파벳순서로변환한다.
  //1,2,3,4,~12
  //1,2,3,4,~31
  //ABCDEFGHIJKLMNOPQRSTUVWXYZ123456
  String convertLotToNumber(String sResultDate) {
    try {
      String sConvertedVal = '';
      String sMonth = sResultDate.substring(0, 2);
      String sDate = sResultDate.substring(2);

      sConvertedVal = convertNumberToLotChar(sMonth);
      sConvertedVal = sConvertedVal + convertNumberToLotChar(sDate);

      return sConvertedVal;
    } catch (e) {
      return 'error';
    }
    return '';
  }

  String convertNumberToLotChar(String charVal) {
    switch (int.parse(charVal)) {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
      case 5:
        return 'E';
      case 6:
        return 'F';
      case 7:
        return 'G';
      case 8:
        return 'H';
      case 9:
        return 'I';
      case 10:
        return 'J';
      case 11:
        return 'K';
      case 12:
        return 'L';
      case 13:
        return 'M';
      case 14:
        return 'N';
      case 15:
        return 'O';
      case 16:
        return 'P';
      case 17:
        return 'Q';
      case 18:
        return 'R';
      case 19:
        return 'S';
      case 20:
        return 'T';
      case 21:
        return 'U';
      case 22:
        return 'V';
      case 23:
        return 'W';
      case 24:
        return 'X';
      case 25:
        return 'Y';
      case 26:
        return 'Z';
      case 27:
        return '1';
      case 28:
        return '2';
      case 29:
        return '3';
      case 30:
        return '4';
      case 31:
        return '5';
    }

    return '';
  }
}
