import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/model/post_model.dart';
import 'package:productbox_flutter_exercise/view/widgets/dashboard_widgets/post_widget.dart';
import 'package:productbox_flutter_exercise/view/widgets/dashboard_widgets/status_widget.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel? postModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(height: 25.h),

        /// Status Widget
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SizedBox(
            height: 80.h,
            width: 1.sw,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postModel!.data.length,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) =>
                  StatusContainer(imageUrl: postModel!.data[index]!.avatar),
            ),
          ),
        ),
        SizedBox(height: 20.h),

        /// Post Widget
        ListView.builder(
          itemCount: postModel!.data.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => PostWidget(
            imageUrl: postModel!.data[index]!.avatar,
            name: postModel!.data[index]!.firstName,
          ),
        ),
      ],
    );
  }
}
