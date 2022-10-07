import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/controller/cubits/post_cubit/fetch_posts_cubit.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Icon(
            Icons.error,
            size: 80.sp,
            color: Colors.red,
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'An error occurred while fetching post!',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => context.read<FetchPostsCubit>().fetchPost(),
              child: Text(
                'Refresh',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 18.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
