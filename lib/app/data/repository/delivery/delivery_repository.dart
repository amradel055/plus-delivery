import 'package:easy_hotel/app/data/model/auth/login/dto/request/login_request.dart';
import 'package:easy_hotel/app/data/model/auth/login/dto/response/login_response.dart';

import 'package:easy_hotel/app/data/model/base_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/active_orders_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/delayed_orders_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/deliver_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/response/order_response.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

class DeliveryRepository {


  getActiveOrders(
      ActiveOrdersRequestDto activeOrdersRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<Sales>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<Sales>>('delivery/beforeDeliveryList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: activeOrdersRequestDto.toJson(),
        onError: onError,
        convertor: Sales.fromList,
      );

  getDeliveredOrders(
      ActiveOrdersRequestDto activeOrdersRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<Sales>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<Sales>>('delivery/afterDeliveryList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: activeOrdersRequestDto.toJson(),
        onError: onError,
        convertor: Sales.fromList,
      );

  getAllOrders(
      ActiveOrdersRequestDto activeOrdersRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<Sales>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<Sales>>('delivery/allDeliveryList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: activeOrdersRequestDto.toJson(),
        onError: onError,
        convertor: Sales.fromList,
      );
  getDelayedOrders(
      DelayOrdersRequestDto delayOrdersRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<Sales>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<Sales>>('delivery/AllLateOrderForDelivery',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: delayOrdersRequestDto.toJson(),
        onError: onError,
        convertor: Sales.fromList,
      );
  getdeliver(
      DeliverRequestDto deliverRequestDto, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'delivery/goCustomer',
        onSuccess: onSuccess,
        data: deliverRequestDto.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }

}
