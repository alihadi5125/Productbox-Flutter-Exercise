import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FilePreviewDialog extends StatefulWidget {
  const FilePreviewDialog({Key? key, required this.isImage, required this.file})
      : super(key: key);
  final bool? isImage;
  final File? file;

  @override
  State<FilePreviewDialog> createState() => _FilePreviewDialogState();
}

class _FilePreviewDialogState extends State<FilePreviewDialog> {
  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          height: 600.sp,
        //  height: 1.sh,
          width: 1.sw,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(18.sp),
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'File Preview',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFF293462),
                indent: 10.w,
                endIndent: 10.w,
              ),
              widget.isImage!
                  ? Image.file(
                      widget.file!,
                      fit: BoxFit.contain,
                      height: 500.sp,
                      width: 1.sw,
                    )
                  : SizedBox(
                      height: 500.sp,
                      width: 1.sw,
                      child: PDFView(
                        filePath: widget.file!.path,
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
                    ),
            ],
          ),
        ),
      );
}
