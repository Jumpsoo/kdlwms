import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_master_info.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/scan_qr_code.dart';
import 'package:kdlwms/domain/use_case/web_api/get_common_info.dart';

class UseCaseWebApi {

  GetServerVersion getServerVersion;

  UseCaseWebApi({
    required this.getServerVersion,
  });
}
