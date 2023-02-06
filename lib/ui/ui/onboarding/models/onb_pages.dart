import 'package:flutter/material.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_info_model.dart';
import 'package:satefy_cage/ui/ui/onboarding/uikit/onb_page.dart';

abstract class OnboardingPages {
  static List<OnbInfo> onbInfo = [
    const OnbInfo(
      title: null,
      description:
          'Добро пожаловать!\nЭто обучение поможет вам в работе\n со справочником Каркаса безопасности\n(КБ) в мобильном формате',
    ),
    OnbInfo(
      title: 'Паспорт',
      description:
          'Набор барьеров, направленный на определенную область происшествий',
      pathToAsset: Assets.images.onboarding.onb1.path,
    ),
    OnbInfo(
      title: 'Барьер',
      description:
          'Способ управления риском ПБ, снижающий вероятность наступления происшествия или уменьшающий его последствия. Каждый барьер состоит из критериев работоспособности',
      pathToAsset: Assets.images.onboarding.onb2.path,
    ),
    OnbInfo(
      title: 'Место установки барьера (МУБ)',
      description:
          'Человек, объект или операция, где барьер должен выполнить свою защитную функцию',
      pathToAsset: Assets.images.onboarding.onb3.path,
    ),
    OnbInfo(
      title: 'Критерий',
      description:
          'Минимально необходимая измеримая характеристика барьера Критерий состоит из чек-листов с перечнем вопросов ',
      pathToAsset: Assets.images.onboarding.onb4.path,
    ),
    OnbInfo(
      title: 'Вопросы чек-листа',
      description:
          'Инструмент оценки каждого критерия работоспособности барьера в месте его установки',
      pathToAsset: Assets.images.onboarding.onb5.path,
    ),
    OnbInfo(
      title: 'Приложения',
      description:
          'В некоторых чек-листах располагаются  приложения, при нажатии на которые раскриывается страница с необходимыми  указаниями',
      pathToAsset: Assets.images.onboarding.onb6.path,
    ),
    OnbInfo(
      title: 'Избранное',
      description:
          'В разделе избранное хранятся часто используемые барьеры Добавляйте сюда свои барьеры, чтобы не тратить время на их поиски',
      pathToAsset: Assets.images.onboarding.onb7.path,
    ),
    OnbInfo(
      title: 'Видео и иллюстрации',
      description:
          'Некоторые барьеры содержат видео и иллюстрации для визуального восприятия информации',
      pathToAsset: Assets.images.onboarding.onb8.path,
    ),
    OnbInfo(
      title: 'Иллюстрации',
      description:
          'Иллюстрации созданы для ряда барьеров с помощью которых можно увидеть визуальную карту барьеров и ознакомиться со всеми пунктами чек-листа каждого критерия',
      pathToAsset: Assets.images.onboarding.onb9.path,
    ),
    OnbInfo(
      title: 'Видео',
      description:
          'В разделе «Видео» находятся все видеоматериалы для быстрого просмотра необходимого контента',
      pathToAsset: Assets.images.onboarding.onb10.path,
    ),
    OnbInfo(
      title: 'Поиск',
      description:
          'С помощью поиска вы сможете находить нужные паспорта и барьеры',
      pathToAsset: Assets.images.onboarding.onb11.path,
    ),
  ];

  static List<Widget> onbScreens = List<Widget>.generate(
      onbInfo.length,
      (index) => OnbPage(
            info: onbInfo[index],
            center: index == 0 ? true : false,
          ));

  static List<Widget> infoScreens = List<Widget>.generate(
      info.length,
      (index) => OnbPage(
            info: info[index],
            smaller: true,
          ));

  ///Модели данных информации на экране "Информация"
  static List<OnbInfo> info = [
    const OnbInfo(
      title: null,
      description:
          '«Каркас безопасности» (КБ) – процесс\nотбора и внедрения барьеров на пути\nреализации ключевых рисков Компании\nв области производственной безопасности',
    ),
    OnbInfo(
        title: 'Паспорт',
        description:
            'Набор барьеров, направленный\nна определенную область происшествий',
        pathToAsset: Assets.images.onboarding.onb1.path),
    OnbInfo(
      title: 'Барьер',
      description:
          'Способ управления риском ПБ,\nснижающий вероятность наступления\nпроисшествия или уменьшающий\nего последствия. Каждый барьер состоит\nиз критериев работоспособности',
      pathToAsset: Assets.images.onboarding.onb2.path,
    ),
    OnbInfo(
      title: 'Место установки барьера (МУБ)',
      description:
          'Человек, объект или операция, где барьер должен выполнить свою защитную функцию',
      pathToAsset: Assets.images.onboarding.onb3.path,
    ),
    OnbInfo(
      title: 'Критерий',
      description:
          'Минимально необходимая измеримая\nхарактеристика барьера\n\nКритерий состоит из чек-листов\nс перечнем вопросов ',
      pathToAsset: Assets.images.onboarding.onb4.path,
    ),
    OnbInfo(
      title: 'Вопросы чек-листа',
      description:
          'Инструмент оценки каждого критерия\nработоспособности барьера в месте\nего установки',
      pathToAsset: Assets.images.onboarding.onb5.path,
    ),
    OnbInfo(
      title: 'Приложения',
      description:
          'В некоторых чек-листах располагаются\nприложения, при нажатии на которые\nраскрывается страница\nс необходимыми  указаниями',
      pathToAsset: Assets.images.onboarding.onb6.path,
    ),
  ];
}
