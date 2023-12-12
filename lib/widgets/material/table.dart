part of '../index.dart';

class CustomTable extends StatelessWidget {
  final int? sortColumnIndex;
  final bool sortAscending;
  final ValueSetter<bool?>? onSelectAll;
  final Decoration? decoration;
  final MaterialStateProperty<Color?>? dataRowColor;
  final double? dataRowMinHeight;
  final double? dataRowMaxHeight;
  final TextStyle? dataTextStyle;
  final MaterialStateProperty<Color?>? headingRowColor;
  final double? headingRowHeight;
  final TextStyle? headingTextStyle;
  final double? horizontalMargin;
  final double? columnSpacing;
  final bool showCheckboxColumn;
  final bool showBottomBorder;
  final double? dividerThickness;
  final double? checkboxHorizontalMargin;
  final TableBorder? border;
  final Clip clipBehavior;
  // -------------------------------------------------------------------------------------------- > Custom
  final List<double>? columnWidth;
  final List<String> columns;
  final List rows;
  final Alignment? cellAlign;

  const CustomTable(
      {super.key,
      this.sortColumnIndex,
      this.sortAscending = true,
      this.onSelectAll,
      this.decoration,
      this.dataRowColor,
      this.dataRowMinHeight,
      this.dataRowMaxHeight,
      this.dataTextStyle,
      this.headingRowColor,
      this.headingRowHeight,
      this.headingTextStyle,
      this.horizontalMargin,
      this.showCheckboxColumn = true,
      this.showBottomBorder = false,
      this.columnSpacing,
      this.dividerThickness,
      this.checkboxHorizontalMargin,
      this.border,
      this.clipBehavior = Clip.none,
      // -------------------------------------------------------------------------------------------- > Custom
      required this.columns,
      required this.rows,
      this.columnWidth,
      this.cellAlign});

  @override
  Widget build(BuildContext context) {
    List<DataColumn> dataColumns = [];
    List<DataRow> dataRow = [];
    for (int i = 0; i < columns.length; i++) {
      dataColumns.add(
        DataColumn(
          label: Container(
            width: columnWidth?[i],
            alignment: Alignment.center,
            child: Text(columns[i]),
          ),
        ),
      );
    }
    for (int i = 0; i < rows.length; i++) {
      dataRow.add(
        DataRow(
          cells: rows[i]
              .asMap()
              .entries
              .map<DataCell>(
                (payload) => DataCell(
                  Container(
                    width: columnWidth?[payload.key],
                    child: payload.value,
                    alignment: cellAlign,
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
    return DataTable(
      columns: dataColumns,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      horizontalMargin: horizontalMargin,
      onSelectAll: onSelectAll,
      decoration: decoration,
      dataRowColor: dataRowColor,
      columnSpacing: columnSpacing,
      rows: dataRow,
      dataRowMinHeight: dataRowMinHeight,
      dataRowMaxHeight: dataRowMaxHeight,
      dataTextStyle: dataTextStyle,
      headingRowColor: headingRowColor,
      headingRowHeight: headingRowHeight,
      headingTextStyle: headingTextStyle,
      showCheckboxColumn: showCheckboxColumn,
      showBottomBorder: showBottomBorder,
      dividerThickness: dividerThickness,
      checkboxHorizontalMargin: checkboxHorizontalMargin,
      border: border,
      clipBehavior: clipBehavior,
    );
  }
}
