import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/controller/cubits/documents_progress_bar_cubit.dart';
import 'package:productbox_flutter_exercise/controller/document_check_controller.dart';


class UploadDocumentProgressBar extends StatelessWidget {
  const UploadDocumentProgressBar({Key? key, required this.index})
      : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 10.h,
    //   child: ListView.builder(
    //     itemCount: 4,
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) => Align(
    //       alignment: Alignment.center,
    //       child: BlocBuilder<DocumentsProgressBarCubit, int?>(
    //         builder: (context, state) {
    //           return Container(
    //             height: 9.h,
    //             width: 85.w,
    //             margin: EdgeInsets.only(right: 10.w),
    //             decoration: BoxDecoration(
    //               color: index <= state!  ? Color(0xFF00818A) : Colors.grey,
    //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: BlocBuilder<DocumentsProgressBarCubit, DocumentsProgressBarState>(
        builder: (context, state) {
          print('state $state');
          print("value at index"+DocumentCheckController.list[index!].toString());
          return Container(
            height: 9.h,
            width: 85.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: DocumentCheckController.list[index!] == true ? Color(0xFF00818A) : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          );
        },
      ),
    ));
  }
}
