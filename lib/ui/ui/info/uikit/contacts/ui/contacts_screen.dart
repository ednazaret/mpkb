import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/info/uikit/contacts/bloc/contacts_cubit.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Экран Контаков
class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  final cubit = ContactsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
        bloc: cubit,
        builder: (context, state) => Scaffold(
              backgroundColor: AppColors.mainBlue,
              body: ListView(
                children: [
                  SafeArea(
                    bottom: false,
                    minimum: const EdgeInsets.only(
                      left: 22,
                      right: 22,
                      top: 32,
                    ),
                    child: Column(
                      children: [
                        Text(
                          ContactsData.mainInfo,
                          textAlign: TextAlign.start,
                          style: AppTypography.regularStyle.copyWith(
                            fontSize: 15.w,
                            color: AppColors.paleBlueLight,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19, bottom: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Assets.images.mail.svg(
                                width: 23.w,
                                height: 23.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    ContactsData.email,
                                    style: AppTypography.regularStyle.copyWith(
                                      fontSize: 17.w,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.paleBlueLight,
                                      // decoration: TextDecoration.underline,
                                      // decorationColor: AppColors.orange,
                                      // decorationThickness: 1.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    color: AppColors.orange,
                                    height: 1.h,
                                    width: 176.w,
                                  )
                                ],
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(4.r),
                                onTap: state.copied == true
                                    ? null
                                    : () async => await cubit.copyData(),
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 7.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(233, 233, 233, 1),
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                        color: const Color(0xFFD9D9D9),
                                        width: 1.w),
                                  ),
                                  child: Center(
                                    child: state.copied == true
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Assets.images.check.svg(
                                                  width: 10.w, height: 8.h),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'Готово',
                                                style: AppTypography.mediumStyle
                                                    .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.w,
                                                  letterSpacing: -0.1,
                                                  color: AppColors.mainText,
                                                ),
                                              )
                                            ],
                                          )
                                        : Text(
                                            'Скопировать',
                                            style: AppTypography.mediumStyle
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.w,
                                              letterSpacing: -0.1,
                                              color: AppColors.mainText,
                                            ),
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        DottedBorder(
                          radius: Radius.circular(8.r),
                          color: AppColors.paleBlue,
                          dashPattern: [5.w, 5.h],
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          strokeWidth: 1.w,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r)),
                            padding: EdgeInsets.symmetric(vertical: 18.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: Column(
                                    children: [
                                      Text(
                                        ContactsData.haveAQuestion,
                                        style:
                                            AppTypography.regularStyle.copyWith(
                                          color: AppColors.paleBlueLight,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        ContactsData.nowThisRequest,
                                        style:
                                            AppTypography.regularStyle.copyWith(
                                          color: AppColors.paleBlueLight,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 18.h,
                                  ),
                                  child: Container(
                                    width: 331.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 12.h,
                                    ),
                                    color: AppColors.milkWhite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ContactsData.servicePlace,
                                          style: AppTypography.regularStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.sp,
                                            color: AppColors.mainBlue,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 4.5.h),
                                              child: Assets
                                                  .images.arrowsToCircle
                                                  .svg(
                                                      width: 9.w, height: 85.h),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              ContactsData.adress,
                                              style: AppTypography.regularStyle
                                                  .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.w,
                                                height: 1.3.h,
                                                color: AppColors.mainBlue,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Text(
                                    ContactsData.youLeaveQuestion,
                                    style: AppTypography.regularStyle.copyWith(
                                      color: AppColors.paleBlueLight,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}

abstract class ContactsData {
  static const email = 'drskb@gazprom-neft.ru';
  static const mainInfo =
      "По вопросам, связанным с барьерами «Каркаса безопасности» (КБ), обращайтесь в Департамент развития системы «Каркас безопасности» (Дирекции производственной безопасности Компании)";
  static const haveAQuestion =
      "У вас есть вопрос по «Каркасу безопасности», который вы не можете решить на уровне ДО и не знаете, кто им занимается в КЦ?";
  static const nowThisRequest =
      "Теперь для таких запросов на портале создано единое окно – Система обращений по вопросам «Каркаса безопасности».";
  static const servicePlace =
      "Сервис находится во внутреннем\nресурсе по адресу:";
  static const adress =
      "Корпоративный портал\nБезопасность\nКаркас безопасности\nСистема обращений по КБ";
  static const youLeaveQuestion =
      "Вы оставляете вопрос на портале и получаете ответ в течение трех рабочих дней.";
}
