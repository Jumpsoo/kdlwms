import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';

part 'pallet_events.freezed.dart';

@freezed
abstract class PalletEvent with _$PalletEvent {

  const factory PalletEvent.listPallets(String sWorkShop, String sLocation, int nState) = ListPallets;
  const factory PalletEvent.selectCheckValue(TbWhPallet tbWhPallet) = SelectDupleCheck;

  const factory PalletEvent.addPallet(TbWhPallet? tbWhPallet) = AddPallet;
  const factory PalletEvent.updatePallet(List<TbWhPallet> pallets) = UpdatePallet;
  const factory PalletEvent.updatePalletLoadState(List<TbWhPalletPrint> pallets, String sState) = UpdatePalletLoadState;

  const factory PalletEvent.deletePallet(List<TbWhPallet> pallets) = DeletePallet;
  const factory PalletEvent.deletePalletAll() = DeletePalletAll;

  const factory PalletEvent.getPalletCountInDevice()= GetPalletCountInDevice;

  const factory PalletEvent.scanQRData(String sQRData) = ScanQRData;

}
