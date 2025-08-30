import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/view/widget/custom_app_bar.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode fSearchController = FocusNode();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText.searchScreen,
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
                TextFormField(
                  controller: searchController,
                  focusNode: fSearchController,
                  onEditingComplete: () {
                    /*onSearch();*/
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search locations...',
                    filled: true,
                    fillColor: Colors.grey[100],
                    suffixIcon: InkWell(
                        onTap: (){
                          /*onSearch();*/
                        },
                        child: Icon(Icons.search_rounded)
                    ),
                    hintStyle: dmMedium.copyWith(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h,),
                Text(
                  AppText.recentSearch,
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
                           // if ('dayType'.isNotEmpty) dayTypeContainer(size: 24, type: 'sunny'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
