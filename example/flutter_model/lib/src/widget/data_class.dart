import 'package:collection/collection.dart';
import 'package:easy_onvif/probe.dart';
import 'package:flutter/material.dart';

class DataClass extends StatelessWidget {
  const DataClass({
    super.key,
    required this.dataList,
    required this.selected,
    required this.onSelectChanged,
  });

  final List<ProbeMatch> dataList;

  final int selected;

  final void Function(int) onSelectChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // Using scrollView for scrolling and formatting
        scrollDirection: Axis.vertical,
        // using FittedBox for fitting complete table in screen horizontally.
        child: FittedBox(
            child: DataTable(
                sortColumnIndex: 1,
                showCheckboxColumn: false,
                border: TableBorder.all(width: 1.0),
                headingTextStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) => Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08)),
                headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => Colors.grey.shade400),
                // Data columns as required by APIs data.
                columns: const [
                  DataColumn(label: Text('Device Name')),
                  DataColumn(label: Text('Device IP')),
                  DataColumn(label: Text('Hardware')),
                ],
                // Main logic and code for getting data and showing it in table rows.
                rows: dataList
                    .mapIndexed((index, device) => DataRow(
                          color: selected == index
                              ? WidgetStateProperty.resolveWith(
                                  (states) => Colors.orange.shade400)
                              : null,
                          selected: selected == index,
                          onSelectChanged: (bool? isSelected) {
                            onSelectChanged(index);
                          },
                          cells: [
                            DataCell(Text(device.name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500))),
                            DataCell(Text(Uri.parse(device.xAddr).host,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500))),
                            DataCell(Text(device.hardware,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500))),
                          ],
                        ))
                    .toList())));
  }
}
