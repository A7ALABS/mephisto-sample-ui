// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MephistoPersistentThemeAdapter
    extends TypeAdapter<MephistoPersistentTheme> {
  @override
  final int typeId = 0;

  @override
  MephistoPersistentTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MephistoPersistentTheme(
      primaryColor: fields[0] as String?,
      primaryColorString: fields[1] as String?,
      fontFamily: fields[2] as String?,
      borderRadius: fields[3] as double?,
      borderWidth: fields[4] as double?,
      isDarkTheme: fields[5] as bool?,
      showBottomNavbarLabels: fields[6] as bool?,
      enableBottomNavbarFeedbacks: fields[7] as bool?,
      isFilledBgWidgets: fields[8] as bool?,
      darkFillColor: fields[9] as String?,
      lightFillColor: fields[10] as String?,
      darkLineColor: fields[11] as String?,
      lightLineColor: fields[12] as String?,
      captionTextAndIconColor: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MephistoPersistentTheme obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.primaryColor)
      ..writeByte(1)
      ..write(obj.primaryColorString)
      ..writeByte(2)
      ..write(obj.fontFamily)
      ..writeByte(3)
      ..write(obj.borderRadius)
      ..writeByte(4)
      ..write(obj.borderWidth)
      ..writeByte(5)
      ..write(obj.isDarkTheme)
      ..writeByte(6)
      ..write(obj.showBottomNavbarLabels)
      ..writeByte(7)
      ..write(obj.enableBottomNavbarFeedbacks)
      ..writeByte(8)
      ..write(obj.isFilledBgWidgets)
      ..writeByte(9)
      ..write(obj.darkFillColor)
      ..writeByte(10)
      ..write(obj.lightFillColor)
      ..writeByte(11)
      ..write(obj.darkLineColor)
      ..writeByte(12)
      ..write(obj.lightLineColor)
      ..writeByte(13)
      ..write(obj.captionTextAndIconColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MephistoPersistentThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
