import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/home/views/widgets/all_orders_widget.dart';
import 'package:easy_hotel/app/modules/home/views/widgets/delayed_order_widget.dart';
import 'package:easy_hotel/app/modules/home/views/widgets/delivered_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widgets/filter_bar.dart';
import 'widgets/active_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: TextWidget(
            "Delivery +",
            size: 30.h,
            textColor: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black87,
              Colors.black87,
              Colors.black.withOpacity(.7),
              Colors.black.withOpacity(.6),
              Colors.transparent
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://images.unsplash.com/photo-1617347454431-f49d7ff5c3b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGVsaXZlcnl8ZW58MHx8MHx8&w=1000&q=80"),
                      fit: BoxFit.fitWidth)),
              padding: EdgeInsets.fromLTRB(0, 75.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: TextWidget(
                    "Search For Order",
                    textColor: Colors.white,
                    size: 20.h,
                    weight: FontWeight.bold,
                  )),
                  Center(
                    child: SizedBox(
                        width: size.width * .8,
                        child: TextFieldWidget(
                          label: AppStrings.search,
                          suffixIcon: Icons.search,
                          onChange: (value) {
                            controller.filter(value);
                          },
                          ltr: true,
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FilterBarWidgets(
                  title: AppStrings.active,
                  index: 0,
                ),
                FilterBarWidgets(
                  title: AppStrings.delayed,
                  index: 1,
                ),
                FilterBarWidgets(
                  title: AppStrings.done,
                  index: 2,
                ),
                FilterBarWidgets(
                  title: AppStrings.allorders,
                  index: 3,
                )
              ],
            ),
            Container(
              height: size.height * .002,
              color: AppColors.appBlue,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: Common.getSpin(),
                );
              }
              return SizedBox(
                height: 550.h,
                child: [
                  const ActiveOrdersWidget(),
                  const DelayedOrdersWidget(),
                  const DeliveredOrdersWidget(),
                  const AllOrdersWidget(),
                ][controller.index.value],
              );
            })
          ],
        ));
  }
}
