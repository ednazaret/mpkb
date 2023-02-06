import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/close_btn.dart';

class PdfScreen extends StatelessWidget {
  final String applicationPath;
  final PDFDocument document;

  const PdfScreen(
      {Key? key, required this.applicationPath,
        required this.document
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PDFViewer(document: document),
          Padding(
            padding: EdgeInsets.only(right: 22.w, top: 40.h),
            child: Align(
              alignment: Alignment.topRight,
              child: CloseBtn(
                onTap: () => Navigator.pop(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
