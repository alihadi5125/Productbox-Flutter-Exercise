import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/certificate_cubit/certificate_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/driving_license_cubit/driving_license_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/passport_file_cubit/passport_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/profile_picture_cubit/profile_picture_cubit.dart';

Future<void> bottomSheet(
    {required BuildContext context, required String? widgetName}) async {
  print('Bottom Sheet Widget: $widgetName');
  showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF293462),
      builder: (context) {
        return SizedBox(
          height: 160.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.camera_alt_outlined, color: Colors.white),
                  title: Text(
                    'Camera',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    if (widgetName == 'Profile') {
                      context
                          .read<ProfilePictureCubit>()
                          .selectProfileImageCamera();
                    } else if (widgetName == 'Driving License') {
                      context
                          .read<DrivingLicenseFileCubit>()
                          .selectProfileImageCamera();
                    } else if (widgetName == 'Certificate') {
                      context
                          .read<CertificateFileCubit>()
                          .selectProfileImageCamera();
                    } else if (widgetName == 'Passport') {
                      context
                          .read<PassportFileCubit>()
                          .selectProfileImageCamera();
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
              Divider(color: Colors.white, indent: 20.w, endIndent: 20.w),
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.file_copy_sharp, color: Colors.white),
                  title: Text(
                    'Files',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    if (widgetName == 'Profile') {
                      context
                          .read<ProfilePictureCubit>()
                          .selectProfileImageFiles();
                    } else if (widgetName == 'Driving License') {
                      context
                          .read<DrivingLicenseFileCubit>()
                          .selectProfileImageFiles();
                    } else if (widgetName == 'Certificate') {
                      context
                          .read<CertificateFileCubit>()
                          .selectProfileImageFiles();
                    } else if (widgetName == 'Passport') {
                      context
                          .read<PassportFileCubit>()
                          .selectProfileImageFiles();
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      });
}
