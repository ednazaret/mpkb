import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/passports/uikit/pass_widget.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Тело экрана "Паспорта"
class PassportsBody extends StatelessWidget {
  final VoidCallback onTapSearch;

  const PassportsBody({Key? key, required this.onTapSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.milkWhite,
        child: ListView.separated(
          itemCount:
              Hive.box<Passports>('passports').values.first.passports?.length ??
                  0,
          itemBuilder: (_, index) => PassportWidget(
            passport:
                Hive.box<Passports>('passports').values.first.passports![index],
            onTapSearch: onTapSearch,
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 4,
          ),
        ),
      ),
    );
  }
}
