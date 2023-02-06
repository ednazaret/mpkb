import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/close_btn.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/illustration_dialog.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/info_btn.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/load_image.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Экран иллюстрации
class IllustrationScreen extends StatefulWidget {
  final String pictureLink;

  const IllustrationScreen({
    super.key,
    required this.pictureLink,
  });

  @override
  State<StatefulWidget> createState() => _IllustrationScreenState();
}

class _IllustrationScreenState extends State<IllustrationScreen> {
  @override
  void initState() {
    final box = Hive.box<bool>('illustrationInstruction');
    box.isEmpty
        ? Future.delayed(Duration.zero).then((value) => showDialog(
              context: context,
              builder: (_) => const IllustrationDialog(),
            ).then((value) => box.put('illustratuinInstruction', true)))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints.expand(),
                child: InteractiveViewer(
                  constrained: true,
                  maxScale: 5.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LoadImage(
                        pictureLink: widget.pictureLink,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 50.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoBtn(
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => const IllustrationDialog(),
                        ),
                      ),
                      CloseBtn(
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
