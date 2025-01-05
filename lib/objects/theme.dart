import 'package:hive/hive.dart';

part 'theme.g.dart';

@HiveType(typeId: 0)
class MephistoPersistentTheme extends HiveObject {
  @HiveField(0)
  String? primaryColor;
  @HiveField(1)
  String? primaryColorString;
  @HiveField(2)
  String? fontFamily;
  @HiveField(3)
  double? borderRadius;
  @HiveField(4)
  double? borderWidth;
  @HiveField(5)
  bool? isDarkTheme;
  @HiveField(6)
  bool? showBottomNavbarLabels;
  @HiveField(7)
  bool? enableBottomNavbarFeedbacks;
  @HiveField(8)
  bool? isFilledBgWidgets;
  @HiveField(9)
  String? darkFillColor;
  @HiveField(10)
  String? lightFillColor;
  @HiveField(11)
  String? darkLineColor;
  @HiveField(12)
  String? lightLineColor;
  @HiveField(13)
  String? captionTextAndIconColor;

  MephistoPersistentTheme(
      {this.primaryColor,
      this.primaryColorString,
      this.fontFamily,
      this.borderRadius,
      this.borderWidth,
      this.isDarkTheme,
      this.showBottomNavbarLabels,
      this.enableBottomNavbarFeedbacks,
      this.isFilledBgWidgets,
      this.darkFillColor,
      this.lightFillColor,
      this.darkLineColor,
      this.lightLineColor,
      this.captionTextAndIconColor});

  factory MephistoPersistentTheme.fromJson(Map<String, dynamic> json) =>
      MephistoPersistentTheme(
        primaryColor: json['primaryColor'] as String,
        primaryColorString: json['primaryColorString'] as String,
        fontFamily: json['fontFamily'] as String,
        borderRadius: json['borderRadius'] as double,
        borderWidth: json['borderWidth'] as double,
        isDarkTheme: json['isDarkTheme'] as bool,
        showBottomNavbarLabels: json['showBottomNavbarLabels'] as bool,
        enableBottomNavbarFeedbacks:
            json['enableBottomNavbarFeedbacks'] as bool,
        isFilledBgWidgets: json['isFilledBgWidgets'] as bool,
        darkFillColor: json['darkFillColor'] as String,
        lightFillColor: json['lightFillColor'] as String,
        darkLineColor: json['darkLineColor'] as String,
        lightLineColor: json['lightLineColor'] as String,
        captionTextAndIconColor: json['captionTextAndIconColor'] as String,
      );

  Map<String, dynamic> toJson() => {
        'primaryColor': primaryColor,
        'primaryColorString': primaryColorString,
        'fontFamily': fontFamily,
        'borderRadius': borderRadius,
        'borderWidth': borderWidth,
        'isDarkTheme': isDarkTheme,
        'showBottomNavbarLabels': showBottomNavbarLabels,
        'enableBottomNavbarFeedbacks': enableBottomNavbarFeedbacks,
        'isFilledBgWidgets': isFilledBgWidgets,
        'darkFillColor': darkFillColor,
        'lightFillColor': lightFillColor,
        'darkLineColor': darkLineColor,
        'lightLineColor': lightLineColor,
        'captionTextAndIconColor': captionTextAndIconColor
      };
}
