import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/active_orders_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/delayed_orders_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/request/deliver_request.dart';
import 'package:easy_hotel/app/data/model/delivery/homePage/dto/response/order_response.dart';
import 'package:easy_hotel/app/data/repository/delivery/delivery_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/values/app_strings.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  RxInt serviceIndex = 0.obs;
  RxInt selectedType = 1.obs;
  final isLoading = false.obs;
  var activeOrders = <Sales>[].obs;
  var allActiveOrders = <Sales>[].obs;
  final deliverdOrders = <Sales>[].obs;
  final allOrders = <Sales>[].obs;
  var delayedOrders = <Sales>[].obs;
  var allDelayedOrders = <Sales>[].obs;
  final user = UserManager();
  @override
  void onInit() {
    super.onInit();
    getActiveOrders();
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.subscribeToTopic("${AppConstants.delivery}_${user.user!.id}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
    });
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                importance: Importance.max,
                priority: Priority.max,
                playSound: true,
              ),
            ));

        FirebaseMessaging.onMessageOpenedApp.listen((event) {
          print("sdsd");
        });
      }
    });
  }

  getActiveOrders() async {
    isLoading(true);
    final request = ActiveOrdersRequestDto(
        branchId: UserManager().user!.branchId,
        deliveryInfId: UserManager().user!.id);
    DeliveryRepository().getActiveOrders(request,
        onSuccess: (data) {
          activeOrders.assignAll(data.data);
          allActiveOrders = activeOrders;
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

  getDeliveredOrders() async {
    isLoading(true);
    final request = ActiveOrdersRequestDto(
        branchId: UserManager().user!.branchId,
        deliveryInfId: UserManager().user!.id);
    DeliveryRepository().getDeliveredOrders(request,
        onSuccess: (data) {
          deliverdOrders.assignAll(data.data);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

  getAllOrders() async {
    isLoading(true);
    final request = ActiveOrdersRequestDto(
        branchId: UserManager().user!.branchId,
        deliveryInfId: UserManager().user!.id);
    DeliveryRepository().getAllOrders(request,
        onSuccess: (data) {
          allOrders.assignAll(data.data);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

  getDelyedOrders() async {
    isLoading(true);
    final request = DelayOrdersRequestDto(
      branchId: UserManager().user!.branchId,
    );
    DeliveryRepository().getDelayedOrders(request,
        onSuccess: (data) {
          delayedOrders.assignAll(data.data);
          allDelayedOrders = delayedOrders;
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

  filter(String num) {
    delayedOrders.value = List<Sales>.from(allDelayedOrders
        .where((element) => element.invoiceNumber!.contains(num))
        .toList());
  }

  getDeliver(int id, int deliverId, int customerId) async {
    isLoading(true);
    final request = DeliverRequestDto(id: id, deliverBy: deliverId);
    DeliveryRepository().getdeliver(request,
        onSuccess: (data) {
          getActiveOrders();
          UserManager().sendNewOrderNotification(
              "${AppConstants.customer}_$customerId", AppStrings.orderStarted);
          showPopupText(AppStrings.orderStarted);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }
}
