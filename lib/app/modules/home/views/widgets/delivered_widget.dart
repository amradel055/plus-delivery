import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/themes/app_text_theme.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/home/controllers/home_controller.dart';
import 'package:easy_hotel/app/modules/home/views/widgets/order_container.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../components/app_refresh_indecetor.dart';

class DeliveredOrdersWidget extends GetView<HomeController> {
  const DeliveredOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: Common.getSpin(),
        );
      }
      return SizedBox(
          width: size.width,
          child: AppRefreshIndicator(
            onRefresh: () async => await controller.getDeliveredOrders(),
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.deliverdOrders.length,
                padding: const EdgeInsets.all(4),
                dragStartBehavior: DragStartBehavior.start,
                itemBuilder: (context, i) {
                  final order = controller.deliverdOrders[i];
                  return OrderContainer(
                    true,
                    order.invoiceNumber ?? 0,
                    order.customerId ?? 0,
                    order.invoiceNumber ?? 0,
                    order.customerName ?? "",
                    order.address ?? "",
                    order.id!,
                    1,
                    order.customerId ?? -1,
                  );
                },
              );
            }),
          )); SizedBox(
          height: size.height,
          width: size.width,
          child: AppRefreshIndicator(
            onRefresh: () async => await controller.getDeliveredOrders(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (int i = 0; i < controller.deliverdOrders.length; i++)
                    OrderContainer(
                      false,
                      controller.deliverdOrders[i].invoiceNumber ?? 0,
                      controller.deliverdOrders[i].customerId ?? 0,
                      controller.deliverdOrders[i].invoiceNumber ?? 0,
                      controller.deliverdOrders[i].customerName ?? "",
                      controller.deliverdOrders[i].address,
                      0,
                      0,
                      controller.activeOrders[i].customerId ?? -1,
                    ),
                ],
              ),
            ),
          ));
    });
  }
}
