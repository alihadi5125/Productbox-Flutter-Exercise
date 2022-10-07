import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) => Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl!), alignment: Alignment.center),
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xFF216583),
            width: 3,
          ),
        ),
      );
}
