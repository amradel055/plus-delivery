import 'package:easy_hotel/app/data/model/base_request.dart';

class DelayOrdersRequestDto extends BaseRequest {
  DelayOrdersRequestDto({
    this.branchId,
  });

  int? branchId;

  @override
  Map<String, dynamic> toJson() => {
    "branchId": branchId,
  };
}
