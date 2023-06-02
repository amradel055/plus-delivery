
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class OrderContainer extends GetView<HomeController> {
  const OrderContainer(this.showDetails, this.num, this.clientNum,
      this.time, this.name, this.address, this.id, this.deliveryBy, this.clientId , {Key? key}) : super(key: key);
  final bool showDetails;
  final String num;
  final int clientNum;
  final int clientId;
  final int id;
  final int deliveryBy;
  final String time;
  final String name;
  final String address;




  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

      return  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                  width: size.width*.95 ,
                  height: size.height*.15,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.appGreyDark,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          child:
                          TextWidget(num.toString(),textColor: Colors.white,weight: FontWeight.bold,size: 18,)
                          ,radius: size.width*.07,
                          backgroundColor: AppColors.appBlue,
                        ),
                      ),
                      SizedBox(
                        width: showDetails ?  size.width*.55:size.width*.68,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextWidget(name,textColor: AppColors.appBlue,weight: FontWeight.bold,size: 13,)

                              ],
                            ),
                            Row(
                              children: [
                        TextWidget(clientNum.toString(),textColor: AppColors.appBlue,weight: FontWeight.bold,size: 13,)

                              ],
                            ),
                            Row(
                              children: [
                         TextWidget(address, maxLines: 1,textColor: AppColors.appBlue,weight: FontWeight.bold,size: 13,)

                              ],
                            ),
                            Row(
                              children: [
                           TextWidget(address, maxLines: 1,textColor: AppColors.appBlue,weight: FontWeight.bold,size: 13,)

                              ],
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        width: showDetails ?  size.width*.1:size.width*.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                            TextWidget(time.toString(),textColor: AppColors.appBlue,weight: FontWeight.bold,size: 18,)

                              ],
                            ),

                          ],
                        ),
                      ),

                      showDetails ?   GestureDetector(
                        onTap: (){
                          controller.getDeliver(id, deliveryBy , clientId);
                        },
                        child: Container(

                          height: size.height * .06,
                          width: size.width * .13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50.00)), color:Colors.red,
                          ),
                          child:
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.delivery_dining_outlined,color: Colors.white ),
                            ],
                          ),

                        ),
                      ):SizedBox()





                    ],
                  )


              ),
            ),
          ),

        ],
      );




  }

}
