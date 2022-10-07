import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/constants/strings.dart';
import 'package:productbox_flutter_exercise/controller/cubits/documents_progress_bar_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/certificate_cubit/certificate_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/driving_license_cubit/driving_license_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/passport_file_cubit/passport_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/profile_picture_cubit/profile_picture_cubit.dart';
import 'package:productbox_flutter_exercise/controller/document_check_controller.dart';
import 'package:productbox_flutter_exercise/view/widgets/snack_bar.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/certificate_widget.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/driving_license.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/passport_widget.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/profile_picture.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/upload_document_progress_bar.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({Key? key}) : super(key: key);

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  clearStates() {
    context.read<ProfilePictureCubit>().clearState();
    context.read<DrivingLicenseFileCubit>().clearState();
    context.read<CertificateFileCubit>().clearState();
    context.read<PassportFileCubit>().clearState();
    context.read<DocumentsProgressBarCubit>().clearState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293462),
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Upload Documents',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 40.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 30.h),

            /// Progressbar
            Row(
              children: [
                UploadDocumentProgressBar(index: 0),
                UploadDocumentProgressBar(index: 1),
                UploadDocumentProgressBar(index: 2),
                UploadDocumentProgressBar(index: 3),
              ],
            ),
            //UploadDocumentProgressBar(index: 0),
            SizedBox(height: 100.h),

            ProfilePicture(),
            DrivingLicense(),
            CertificateWidget(),
            PassportWidget(),
            SizedBox(height: 100.h),

            BlocBuilder<DocumentsProgressBarCubit, DocumentsProgressBarState>(
              builder: (context, progressIndex) {
                return GestureDetector(
                  onTap: () {
                    print('Navigate to dashboard');
                    if (!DocumentCheckController.list.contains(false)) {
                      clearStates();
                      Navigator.pushNamed(context, Strings.dashboardScreen);
                    } else {
                      snackBar(
                          context: context, message: 'Select all the files.');
                    }
                  },
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    margin: EdgeInsets.only(bottom: 25.h),
                    decoration: BoxDecoration(
                      color: !DocumentCheckController.list.contains(false)
                          ? Color(0xFF216583)
                          : Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'DONE',
                        style: GoogleFonts.poppins(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
