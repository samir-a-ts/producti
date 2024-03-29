// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_cell.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupTableCellAdapter extends TypeAdapter<GroupTableCell> {
  @override
  final int typeId = 1;

  @override
  GroupTableCell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupTableCell(
      title: fields[1] as String,
      children: (fields[0] as List).cast<TableCell>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupTableCell obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.children)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupTableCellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteTableCellAdapter extends TypeAdapter<NoteTableCell> {
  @override
  final int typeId = 2;

  @override
  NoteTableCell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteTableCell(
      description: fields[0] as String,
      links: (fields[1] as List).cast<String>(),
      title: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteTableCell obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.links)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteTableCellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationTableCellAdapter extends TypeAdapter<NotificationTableCell> {
  @override
  final int typeId = 3;

  @override
  NotificationTableCell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationTableCell(
      time: fields[0] as DateTime,
      description: fields[1] as String,
      links: (fields[2] as List).cast<String>(),
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationTableCell obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.links)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationTableCellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckListTableCellAdapter extends TypeAdapter<CheckListTableCell> {
  @override
  final int typeId = 4;

  @override
  CheckListTableCell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckListTableCell(
      checkList: (fields[1] as List).cast<CheckTileTableCell>(),
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CheckListTableCell obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.checkList)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckListTableCellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckTileTableCellAdapter extends TypeAdapter<CheckTileTableCell> {
  @override
  final int typeId = 5;

  @override
  CheckTileTableCell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckTileTableCell(
      value: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CheckTileTableCell obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckTileTableCellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
