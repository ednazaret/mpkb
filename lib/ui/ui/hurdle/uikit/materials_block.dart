import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/illustration/ui/illustration_screen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';
import 'package:url_launcher/url_launcher.dart';

///Блок вложений к критерию
class MaterialsBlock extends StatelessWidget {
  final String? pictureLink;
  final String? videoLink;

  const MaterialsBlock({
    Key? key,
    this.pictureLink,
    this.videoLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 28,
      ),
      child: Row(
        mainAxisAlignment: videoLink == null || pictureLink == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (pictureLink != null && pictureLink != 'None')
            IconMaterial(
              onTap: () => pushNewScreen(context,
                  withNavBar: false,
                  screen: IllustrationScreen(pictureLink: pictureLink!)),
              path: Assets.images.imageFilled.path,
              link: pictureLink!,
              text: 'Открыть${videoLink != null ? '\n' : ' '}изображение',
            ),
          if ((videoLink != null && videoLink != 'None') && pictureLink != null)
            const SizedBox(
              width: 15,
            ),
          if (videoLink != null && videoLink != 'None')
            IconMaterial(
              onTap: () async {
                try {
                  launchUrl(Uri.parse(videoLink!));
                } on Exception catch (_) {
                  // print('Error internet');
                }
              },
              link: videoLink!,
              path: Assets.images.playFilled.path,
              text: 'Смотреть${pictureLink != null ? '\n' : ' '}видео',
            ),
        ],
      ),
    );
  }
}

class IconMaterial extends StatelessWidget {
  final String path;
  final String text;
  final String link;
  final VoidCallback onTap;

  const IconMaterial(
      {Key? key,
      required this.path,
      required this.text,
      required this.link,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: AppColors.paleBlueLight,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                path,
                width: 38.w,
                height: 38.w,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                text,
                textAlign: TextAlign.left,
                style: AppTypography.mediumStyle.copyWith(
                  fontSize: 14.w,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
