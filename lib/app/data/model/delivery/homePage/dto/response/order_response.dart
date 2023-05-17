// To parse this JSON data, do
//
//     final sales = salesFromJson(jsonString);

import 'dart:convert';

List<Sales> salesFromJson(String str) => List<Sales>.from(json.decode(str).map((x) => Sales.fromJson(x)));

String salesToJson(List<Sales> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sales {
  Sales({
    this.id,
    this.markEdit,
    this.msg,
    this.msgType,
    this.markDisable,
    this.createdBy,
    this.createdDate,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.deletedDate,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.userCode,
    this.customerName,
    this.customerMobile,
    this.gallaryName,
    this.invoiceDate,
    this.takeDate,
    this.status,
    this.invoiceNumber,
    this.remarks,
    this.customerId,
    this.deliveryPlace,
    this.tableNumber,
    this.address,
    this.offerId,
    this.type,
    this.tax,
    this.deliveryInfId,
    this.salesDetialList,
    this.salesDetialListDeleted,
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  dynamic createdBy;
  DateTime? createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  int? branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? customerName;
  dynamic customerMobile;
  dynamic gallaryName;
  DateTime? invoiceDate;
  dynamic takeDate;
  dynamic status;
  dynamic invoiceNumber;
  dynamic remarks;
  int? customerId;
  int? deliveryPlace;
  dynamic tableNumber;
  dynamic address;
  dynamic offerId;
  int? type;
  dynamic tax;
  int? deliveryInfId;
  List<SalesDetialList>? salesDetialList;
  dynamic salesDetialListDeleted;

  static List<Sales> fromList(dynamic json) => List.from(json.map((e) => Sales.fromJson(e)));


  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"],
    createdByName: json["createdByName"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    companyCode: json["companyCode"],
    branchSerial: json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"],
    userCode: json["userCode"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    customerMobile: json["customerMobile"],
    gallaryName: json["gallaryName"],
    invoiceDate: json["invoiceDate"] == null ? null : DateTime.parse(json["invoiceDate"]),
    takeDate: json["takeDate"],
    status: json["status"],
    invoiceNumber: json["invoiceNumber"],
    remarks: json["remarks"],
    customerId: json["customerId"] == null ? null : json["customerId"],
    deliveryPlace: json["deliveryPlace"] == null ? null : json["deliveryPlace"],
    tableNumber: json["tableNumber"],
    address: json["address"],
    offerId: json["offerId"],
    type: json["type"] == null ? null : json["type"],
    tax: json["tax"],
    deliveryInfId: json["deliveryInfId"] == null ? null : json["deliveryInfId"],
    salesDetialList: json["salesDetialList"] == null ? null : List<SalesDetialList>.from(json["salesDetialList"].map((x) => SalesDetialList.fromJson(x))),
    salesDetialListDeleted: json["salesDetialListDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy,
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId == null ? null : branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "customerName": customerName == null ? null : customerName,
    "customerMobile": customerMobile,
    "gallaryName": gallaryName,
    "invoiceDate": invoiceDate == null ? null : invoiceDate!.toIso8601String(),
    "takeDate": takeDate,
    "status": status,
    "invoiceNumber": invoiceNumber,
    "remarks": remarks,
    "customerId": customerId == null ? null : customerId,
    "deliveryPlace": deliveryPlace == null ? null : deliveryPlace,
    "tableNumber": tableNumber,
    "address": address,
    "offerId": offerId,
    "type": type == null ? null : type,
    "tax": tax,
    "deliveryInfId": deliveryInfId == null ? null : deliveryInfId,
    "salesDetialList": salesDetialList == null ? null : List<dynamic>.from(salesDetialList!.map((x) => x.toJson())),
    "salesDetialListDeleted": salesDetialListDeleted,
  };
}

class SalesDetialList {
  SalesDetialList({
    this.id,
    this.markEdit,
    this.msg,
    this.msgType,
    this.markDisable,
    this.createdBy,
    this.createdDate,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.deletedDate,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.userCode,
    this.name,
    this.code,
    this.price,
    this.image,
    this.groupId,
    this.itemId,
    this.net,
    this.quantity,
    this.number,
    this.tax,
    this.currencySerial,
    this.rate,
    this.remark,
    this.appId,
    this.resOfferId,
    this.resItemVariation,
    this.salesCode,
    this.deliveryBy,
    this.deliveryDate,
    this.packingBy,
    this.packingDate,
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  dynamic createdBy;
  DateTime? createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? name;
  dynamic code;
  dynamic price;
  dynamic image;
  dynamic groupId;
  int? itemId;
  dynamic net;
  dynamic quantity;
  dynamic number;
  dynamic tax;
  dynamic currencySerial;
  dynamic rate;
  dynamic remark;
  dynamic appId;
  dynamic resOfferId;
  int? resItemVariation;
  String? salesCode;
  String?deliveryBy;
  DateTime?deliveryDate;
  String?packingBy;
  DateTime?packingDate;

  factory SalesDetialList.fromJson(Map<String, dynamic> json) => SalesDetialList(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"],
    createdByName: json["createdByName"],
    branchId: json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    companyCode: json["companyCode"],
    branchSerial: json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"],
    userCode: json["userCode"],
    name: json["name"] == null ? null : json["name"],
    code: json["code"],
    price: json["price"] == null ? null : json["price"],
    image: json["image"],
    groupId: json["groupId"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    net: json["net"] == null ? null : json["net"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    number: json["number"],
    tax: json["tax"],
    currencySerial: json["currencySerial"],
    rate: json["rate"],
    remark: json["remark"],
    appId: json["appId"],
    resOfferId: json["resOfferId"],
    resItemVariation: json["resItemVariation"] == null ? null : json["resItemVariation"],
    salesCode: json["salesCode"] == null ? null : json["salesCode"],
    deliveryBy: json["deliveryBy"] == null ? null : json["deliveryBy"],
    deliveryDate: json["deliveryDate"] == null ? null : DateTime.parse(json["deliveryDate"]),
    packingBy: json["packingBy"] == null ? null : json["packingBy"],
    packingDate: json["packingDate"] == null ? null : DateTime.parse(json["packingDate"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy,
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "name": name == null ? null : name,
    "code": code,
    "price": price == null ? null : price,
    "image": image,
    "groupId": groupId,
    "itemId": itemId == null ? null : itemId,
    "net": net == null ? null : net,
    "quantity": quantity == null ? null : quantity,
    "number": number,
    "tax": tax,
    "currencySerial": currencySerial,
    "rate": rate,
    "remark": remark,
    "appId": appId,
    "resOfferId": resOfferId,
    "resItemVariation": resItemVariation == null ? null : resItemVariation,
    "salesCode": salesCode == null ? null : salesCode,
    "deliveryBy": deliveryBy == null ? null : deliveryBy,
    "deliveryDate": deliveryDate == null ? null : deliveryDate!.toIso8601String(),
    "packingBy": packingBy == null ? null : packingBy,
    "packingDate": packingDate == null ? null : packingDate!.toIso8601String(),

  };
}
