import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/controller/cubits/documents_progress_bar_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/passport_file_cubit/passport_file_cubit.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/file_picker_bottom_sheet.dart';
import 'package:productbox_flutter_exercise/view/widgets/upload_document_widgets/file_preview_dialog.dart';

class PassportWidget extends StatelessWidget {
  const PassportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bottomSheet(context: context, widgetName: 'Passport'),
      child: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.only(bottom: 25.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Passport',
                  style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocBuilder<PassportFileCubit, PassportFileState>(
                  builder: (context, state) {
                    if (state is ImageSelectState) {
                      context
                          .read<DocumentsProgressBarCubit>()
                          .refreshState(index: 3);
                      return GestureDetector(
                        onTap: () async {
                          print('show dialog');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                FilePreviewDialog(
                              isImage: true,
                              file: state.image,
                            ),
                          );
                        },
                        child: Container(
                          height: 45.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            image: DecorationImage(
                                image: FileImage(state.image!),
                                alignment: Alignment.centerRight,
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else if (state is PdfFileSelectState) {
                      context
                          .read<DocumentsProgressBarCubit>()
                          .refreshState(index: 3);
                      return Container(
                        height: 45.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('show dialog');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  FilePreviewDialog(
                                isImage: false,
                                file: state.image,
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              PDFView(
                                filePath: state.image!.path,
                                enableSwipe: false,
                                swipeHorizontal: false,
                                autoSpacing: false,
                                pageFling: false,
                                onError: (error) {
                                  print(error.toString());
                                },
                                onPageError: (page, error) {
                                  print('$page: ${error.toString()}');
                                },
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 45.h,
                                width: 60.w,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
