part of 'anonymous_table_bloc.dart';

abstract class AnonymousTableEvent extends Equatable {
  const AnonymousTableEvent();

  @override
  List<Object> get props => [];
}

class AnonymousTableLoad extends AnonymousTableEvent {}

class AnonymousTableCreate extends AnonymousTableEvent {
  final String name;

  const AnonymousTableCreate(this.name);

  @override
  List<Object> get props => [name];
}

class AnonymousTableCellCreate extends AnonymousTableEvent {
  final t.TableCell cell;
  final TableLink path;
  final int tableIndex;

  const AnonymousTableCellCreate(this.cell, this.path, this.tableIndex);

  @override
  List<Object> get props => [cell, path, tableIndex];
}

class AnonymousTableSave extends AnonymousTableEvent {}

class AnonymousTableReorderCells extends AnonymousTableEvent {
  final int oldIndex;
  final int newIndex;
  final int tableIndex;
  final TableLink path;

  const AnonymousTableReorderCells(
    this.oldIndex,
    this.newIndex,
    this.tableIndex,
    this.path,
  );

  @override
  List<Object> get props => [oldIndex, newIndex, path, tableIndex];
}

class AnonymousTableRenameTable extends AnonymousTableEvent {
  final int tableIndex;
  final String tableName;

  const AnonymousTableRenameTable(this.tableIndex, this.tableName);

  @override
  List<Object> get props => [tableName, tableIndex];
}

class AnonymousTableRenameCell extends AnonymousTableEvent {
  final TableLink path;
  final int tableIndex;
  final String name;

  const AnonymousTableRenameCell(this.path, this.name, this.tableIndex);

  @override
  List<Object> get props => [
        path,
        name,
        tableIndex,
      ];
}

class AnonymousTableChangeCell extends AnonymousTableEvent {
  final int tableIndex;
  final TableLink pathToNote;
  final t.TableCell newCell;

  const AnonymousTableChangeCell({
    required this.tableIndex,
    required this.pathToNote,
    required this.newCell,
  });

  @override
  List<Object> get props => [
        pathToNote,
        newCell,
        tableIndex,
      ];
}

class AnonymousTableDeleteCell extends AnonymousTableEvent {
  final int tableIndex;
  final TableLink pathToCell;

  const AnonymousTableDeleteCell(
    this.tableIndex,
    this.pathToCell,
  );

  @override
  List<Object> get props => [
        pathToCell,
        tableIndex,
      ];
}

class AnonymousTableDeleteTable extends AnonymousTableEvent {
  final int tableIndex;

  const AnonymousTableDeleteTable(this.tableIndex);

  @override
  List<Object> get props => [
        tableIndex,
      ];
}
