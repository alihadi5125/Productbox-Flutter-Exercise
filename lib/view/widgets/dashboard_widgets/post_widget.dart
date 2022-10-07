import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  final String? name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl!),
                            alignment: Alignment.center,
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name!,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF293462),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 250.h,
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  fit: BoxFit.cover),
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
