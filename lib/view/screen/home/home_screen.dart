import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/view/screen/daily_details/daily_details_screen.dart';
import 'package:weather_app/view/screen/search/search_screen.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_text.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/day_type_widget.dart';
import '../../widget/forecast_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.homeScreen, isBackButtonExist: false,),
      body: Column(
        children: [
          Divider(height: 1,color: Colors.black,),
          SizedBox(height: 30.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer(
                          builder: (context, ref, _) {
                            //final name = ref.watch(weatherServiceProvider)?.name;
                            return Text(
                              /*name ??*/ '_____',
                              style: dmSemiBold.copyWith(fontSize: 20.sp),
                            );
                          },
                        ),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.black.withValues(alpha: .7),
                        ),
                      ],
                    ),
                  ),
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
        AppText.fiveDayForecast,
        style: dmSemiBold.copyWith(fontSize: 18.sp),
      ),
                SizedBox(height: 20.h,),

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
