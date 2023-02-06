///Модель данных для точки на иллюстрациях
///top - отступ от верхнего края картинки
///bottom - отступ от нижнего края картинки
///left - отступ от левого края картинки
///right - отступ от правого края картинки
///criteria_id - id критерия (необходимо для открытия bottomsheet  c выбранным критерием)
// ignore_for_file: non_constant_identifier_names

class PointModel {
  PointModel({
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.criteria_id,
  });

  int? top;
  int? bottom;
  int? left;
  int? right;
  String? criteria_id;
}

///Модель данных для точек на иллюстрациях определенной  иллюстрации
class PointsModel {
  PointsModel({
    required this.points,
    required this.illustration,
  });

  List<PointModel> points;
  String illustration;
}

abstract class IllustrationsPoints {
  IllustrationsPoints._();

  static List<PointsModel> points = [
    ///РВ.01
    PointsModel(
      points: [
        PointModel(
          top: 35,
          left: 60,
          criteria_id: 'РВ.01.1.',
        ),
        PointModel(
          top: 140,
          left: 110,
          criteria_id: 'РВ.01.3.',
        ),
        PointModel(
          bottom: 150,
          top: 150,
          right: 70,
          criteria_id: 'РВ.01.2.',
        ),
      ],
      illustration: 'РВ.01.jpg',
    ),

    ///РВ.02
    PointsModel(
      points: [
        PointModel(
          top: 45,
          left: 70,
          criteria_id: 'РВ.02.1.',
        ),
        PointModel(
          top: 145,
          left: 70,
          criteria_id: 'РВ.02.2.',
        ),
        PointModel(
          bottom: 175,
          right: 65,
          criteria_id: 'РВ.02.3.',
        ),
      ],
      illustration: 'РВ.02.jpg',
    ),

    ///РВ.03
    PointsModel(
      points: [
        PointModel(
          top: 30,
          left: 60,
          criteria_id: 'РВ.03.1.',
        ),
        PointModel(
          bottom: 115,
          left: 37,
          criteria_id: 'РВ.03.2.',
        ),
        PointModel(
          bottom: 175,
          right: 135,
          criteria_id: 'РВ.03.3.',
        ),
      ],
      illustration: 'РВ.03.jpg',
    ),

    ///РВ.05
    PointsModel(
      points: [
        PointModel(
          right: 50,
          criteria_id: 'РВ.05.1.',
        ),
        PointModel(
          bottom: 183,
          left: 132,
          criteria_id: 'РВ.05.2.',
        ),
      ],
      illustration: 'РВ.05.jpg',
    ),

    ///РВ.06
    PointsModel(
      points: [
        PointModel(
          left: 32,
          top: 50,
          criteria_id: 'РВ.06.1.',
        ),
        PointModel(
          bottom: 178,
          left: 132,
          criteria_id: 'РВ.06.2.',
        ),
      ],
      illustration: 'РВ.06.jpg',
    ),

    ///РВ.09
    PointsModel(
      points: [
        PointModel(
          bottom: 30,
          left: 90,
          criteria_id: 'РВ.09.3.',
        ),
        PointModel(
          bottom: 195,
          left: 102,
          criteria_id: 'РВ.09.4.',
        ),
        PointModel(
          bottom: 115,
          left: 160,
          criteria_id: 'РВ.09.1.',
        ),
        PointModel(
          bottom: 100,
          left: 190,
          criteria_id: 'РВ.09.2.',
        ),
      ],
      illustration: 'РВ.09.jpg',
    ),

    ///ЭЛБ.01
    PointsModel(
      points: [
        PointModel(
          bottom: 155,
          left: 175,
          criteria_id: 'ЭЛБ.01.1.',
        ),
        PointModel(
          bottom: 190,
          left: 175,
          criteria_id: 'ЭЛБ.01.2.',
        ),
      ],
      illustration: 'ЭЛБ.01.jpg',
    ),

    ///ЭЛБ.02
    PointsModel(
      points: [
        PointModel(
          bottom: 220,
          left: 30,
          criteria_id: 'ЭЛБ.02.2.',
        ),
        PointModel(
          top: 30,
          left: 90,
          criteria_id: 'ЭЛБ.02.1.',
        ),
        PointModel(
          bottom: 60,
          right: 170,
          criteria_id: 'ЭЛБ.02.3.',
        ),
      ],
      illustration: 'ЭЛБ.02.jpg',
    ),

    ///ЭЛБ.09
    PointsModel(
      points: [
        PointModel(
          bottom: 55,
          left: 130,
          criteria_id: 'ЭЛБ.09.1.',
        ),
        PointModel(
          top: 110,
          right: 110,
          criteria_id: 'ЭЛБ.09.1.',
        ),
        PointModel(
          top: 50,
          left: 110,
          criteria_id: 'ЭЛБ.09.1.',
        ),
        PointModel(
          top: 40,
          left: 150,
          criteria_id: 'ЭЛБ.09.1.',
        ),
      ],
      illustration: 'ЭЛБ.09.jpg',
    ),

    ///ЭЛБ.10
    PointsModel(
      points: [
        PointModel(
          top: 40,
          left: 120,
          criteria_id: 'ЭЛБ.10.2.',
        ),
        PointModel(
          top: 40,
          left: 60,
          criteria_id: 'ЭЛБ.10.1.',
        ),
      ],
      illustration: 'ЭЛБ.10.jpg',
    ),

    ///ЭЛБ.11
    PointsModel(
      points: [
        PointModel(
          bottom: 60,
          left: 35,
          criteria_id: 'ЭЛБ.11.1.',
        ),
        PointModel(
          bottom: 100,
          right: 45,
          criteria_id: 'ЭЛБ.11.2.',
        ),
        PointModel(
          bottom: 60,
          right: 30,
          criteria_id: 'ЭЛБ.11.3.',
        ),
      ],
      illustration: 'ЭЛБ.11.jpg',
    ),

    ///ГАЗ.01
    PointsModel(
      points: [
        PointModel(
          top: 15,
          left: 110,
          criteria_id: 'ГАЗ.01.1.',
        ),
        PointModel(
          top: 65,
          left: 110,
          criteria_id: 'ГАЗ.01.2.',
        ),
        PointModel(
          top: 115,
          left: 110,
          criteria_id: 'ГАЗ.01.3.',
        ),
        PointModel(
          bottom: 180,
          right: 150,
          criteria_id: 'ГАЗ.01.6.',
        ),
        PointModel(
          bottom: 135,
          right: 125,
          criteria_id: 'ГАЗ.01.4.',
        ),
        PointModel(
          left: 57,
          top: 155,
          criteria_id: 'ГАЗ.01.5.',
        ),
      ],
      illustration: 'ГАЗ.01.jpg',
    ),

    ///ГАЗ.03
    PointsModel(
      points: [
        PointModel(
          top: 65,
          left: 70,
          criteria_id: 'ГАЗ.03.1.',
        ),
        PointModel(
          top: 65,
          left: 170,
          criteria_id: 'ГАЗ.03.2.',
        ),
        PointModel(
          bottom: 115,
          left: 110,
          criteria_id: 'ГАЗ.03.3.',
        ),
        PointModel(
          bottom: 115,
          right: 155,
          criteria_id: 'ГАЗ.03.4.',
        ),
      ],
      illustration: 'ГАЗ.03.jpg',
    ),

    ///ГАЗ.04
    PointsModel(
      points: [
        PointModel(
          top: 62,
          left: 130,
          criteria_id: 'ГАЗ.04.1.',
        ),
      ],
      illustration: 'ГАЗ.04.jpg',
    ),

    ///ГАЗ.07
    PointsModel(
      points: [
        PointModel(
          top: 65,
          left: 80,
          criteria_id: 'ГАЗ.07.1.',
        ),
        PointModel(
          top: 70,
          right: 125,
          criteria_id: 'ГАЗ.07.2.',
        ),
        PointModel(
          top: 70,
          right: 45,
          criteria_id: 'ГАЗ.07.4.',
        ),
        PointModel(
          bottom: 100,
          left: 140,
          criteria_id: 'ГАЗ.07.3.',
        ),
      ],
      illustration: 'ГАЗ.07.jpg',
    ),

    ///ГАЗ.10
    PointsModel(
      points: [
        PointModel(
          top: 40,
          left: 60,
          criteria_id: 'ГАЗ.10.1.',
        ),
        PointModel(
          top: 110,
          right: 125,
          criteria_id: 'ГАЗ.07.5.',
        ),
        PointModel(
          top: 110,
          right: 180,
          criteria_id: 'ГАЗ.07.2.',
        ),
        PointModel(
          bottom: 70,
          left: 130,
          criteria_id: 'ГАЗ.07.3.',
        ),
        PointModel(
          bottom: 70,
          right: 140,
          criteria_id: 'ГАЗ.07.4.',
        ),
      ],
      illustration: 'ГАЗ.10.jpg',
    ),

    ///ГРУЗ.01
    PointsModel(
      points: [
        PointModel(
          top: 150,
          left: 160,
          criteria_id: 'ГРУЗ.01.3.',
        ),
        PointModel(
          top: 90,
          left: 80,
          criteria_id: 'ГРУЗ.01.1.',
        ),
        PointModel(
          top: 90,
          left: 140,
          criteria_id: 'ГРУЗ.01.2.',
        ),
        PointModel(
          bottom: 115,
          right: 0,
          criteria_id: 'ГРУЗ.01.5.',
        ),
        PointModel(
          bottom: 115,
          right: 80,
          criteria_id: 'ГРУЗ.01.4.',
        ),
      ],
      illustration: 'ГРУЗ.01.jpg',
    ),

    ///ГРУЗ.02
    PointsModel(
      points: [
        PointModel(
          top: 65,
          right: 35,
          criteria_id: 'ГРУЗ.02.4.',
        ),
        PointModel(
          top: 15,
          right: 60,
          criteria_id: 'ГРУЗ.02.3.',
        ),
        PointModel(
          top: 110,
          left: 155,
          criteria_id: 'ГРУЗ.02.5.',
        ),
        PointModel(
          bottom: 110,
          left: 40,
          criteria_id: 'ГРУЗ.02.6.',
        ),
        PointModel(
          bottom: 60,
          left: 170,
          criteria_id: 'ГРУЗ.02.1.',
        ),
        PointModel(
          bottom: 130,
          left: 220,
          criteria_id: 'ГРУЗ.02.2.',
        ),
      ],
      illustration: 'ГРУЗ.02.jpg',
    ),

    ///ДВИЖ.01
    PointsModel(
      points: [
        PointModel(
          top: 5,
          right: 145,
          criteria_id: 'ДВИЖ.01.1.',
        ),
        PointModel(
          top: 110,
          left: 50,
          criteria_id: 'ДВИЖ.01.2.',
        ),
        PointModel(
          top: 195,
          right: 100,
          criteria_id: 'ДВИЖ.01.3.',
        ),
        PointModel(
          bottom: 200,
          left: 165,
          criteria_id: 'ДВИЖ.01.1.',
        ),
        PointModel(
          bottom: 160,
          left: 165,
          criteria_id: 'ДВИЖ.01.2.',
        ),
        PointModel(
          bottom: 60,
          left: 60,
          criteria_id: 'ДВИЖ.01.3.',
        ),
      ],
      illustration: 'ДВИЖ.01.jpg',
    ),

    ///ДТП.05
    PointsModel(
      points: [
        PointModel(top: 90, right: 95, criteria_id: "ДТП.05.1."),
      ],
      illustration: 'ДТП.05.jpg',
    ),

    ///ЗЕМЛ.01
    PointsModel(
      points: [
        PointModel(
          top: 40,
          right: 95,
          criteria_id: 'ЗЕМЛ.01.2.',
        ),
        PointModel(
          top: 40,
          left: 90,
          criteria_id: 'ЗЕМЛ.01.1.',
        ),
        PointModel(
          bottom: 150,
          left: 140,
          criteria_id: 'ЗЕМЛ.01.3.',
        ),
        PointModel(
          bottom: 60,
          right: 70,
          criteria_id: 'ЗЕМЛ.01.4.',
        ),
      ],
      illustration: 'ЗЕМЛ.01.jpg',
    ),

    ///ЗЕМЛ.04
    PointsModel(
      points: [
        PointModel(
          top: 5,
          right: 90,
          criteria_id: 'ЗЕМЛ.04.2.',
        ),
        PointModel(
          top: 5,
          left: 130,
          criteria_id: 'ЗЕМЛ.04.1.',
        ),
        PointModel(
          bottom: 30,
          right: 110,
          criteria_id: 'ЗЕМЛ.04.4.',
        ),
        PointModel(
          bottom: 30,
          left: 100,
          criteria_id: 'ЗЕМЛ.04.3.',
        ),
      ],
      illustration: 'ЗЕМЛ.04.jpg',
    ),

    ///ЗЕМЛ.06
    PointsModel(
      points: [
        PointModel(
          top: 0,
          left: 120,
          criteria_id: 'ЗЕМЛ.06.1.',
        ),
        PointModel(
          top: 0,
          left: 160,
          criteria_id: 'ЗЕМЛ.06.2.',
        ),
        PointModel(
          top: 0,
          left: 200,
          criteria_id: 'ЗЕМЛ.06.3.',
        ),
        PointModel(
          bottom: 75,
          left: 30,
          criteria_id: 'ЗЕМЛ.06.4.',
        ),
        PointModel(
          bottom: 75,
          left: 80,
          criteria_id: 'ЗЕМЛ.06.5.',
        ),
        PointModel(
          bottom: 75,
          left: 125,
          criteria_id: 'ЗЕМЛ.06.6.',
        ),
      ],
      illustration: 'ЗЕМЛ.06.jpg',
    ),
  ];
}
