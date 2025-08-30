import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_text.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/day_type_widget.dart';

class DailyDetailsScreen extends StatefulWidget {
  const DailyDetailsScreen({super.key});

  @override
  State<DailyDetailsScreen> createState() => _DailyDetailsScreenState();
}

class _DailyDetailsScreenState extends State<DailyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText.dailyDetailsScreen,
        isBackButtonExist: false,
      ),
      body: Column(
        children: [
          Divider(height: 1,color: Colors.black,),
          SizedBox(height: 30.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Today',
                      style: dmSemiBold.copyWith(fontSize: 22.sp),
                    ),
                  ],
                ),

                SizedBox(height: 20.h,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    spacing: 5.h,
                    children: [
                      Consumer(
                        builder: (context, ref, _) {
                          /*final temp =
                              ref.watch(weatherServiceProvider)?.main?.temp;*/
                          return Text(
                            /*Constant.kelvinToFahrenheit(temp)*/'20',
                            style: workBlack.copyWith(height: 1.h),
                          );
                        },
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          // final type = ref.watch(weatherServiceProvider)?.weather?.first.main;
                          return Column(
                            spacing: 10.h,
                            children: [
                              Text(
                                /*type ??*/ '_____',
                                style: dmMedium.copyWith(fontSize: 16.sp),
                              ),
                              /*dayTypeContainer(type: type),*/
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),
                Text(
                  AppText.hourlyForecast,
                  style: dmSemiBold.copyWith(fontSize: 18.sp),
                ),


                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index < 5 ? 10.h : 0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyDetailsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment:  MainAxisAlignment.spaceAround,
                            children: [
                              Text('day', style: dmMedium.copyWith(fontSize: 18.sp)),
                              Text('value', style: workReg),
                              if ('dayType'.isNotEmpty) dayTypeContainer(size: 24, type: 'sunny'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}
