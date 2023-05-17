import 'package:easy_hotel/app/data/model/base_request.dart';

class DeliverRequestDto extends BaseRequest {
  DeliverRequestDto({
    this.id,
    this.deliverBy,
  });

  int? id;
  int? deliverBy;

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "deliverBy": deliverBy,
  };
}
