import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:frontend/controller/dashboard_controller.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/percent_indicator.dart';
// import 'package:frontend/widgets/layout.dart' ;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

//

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex = -1;
  final List<String> campaigns = ['Cmp1', 'CMP2', 'CMP3', 'CMP4'];
  final List<String> users = [
    'Nati',
    'belay',
    'sol',
    'roler',
    'alemu',
    'zeleke'
  ];

  final List<Employee> employees = [
    Employee(
        1001,
        'https://i.insider.com/592f4169b74af41b008b5977?width=1000&format=jpeg&auto=webp',
        'James',
        'Developer'),
    Employee(
        1002,
        'https://i.insider.com/592f4169b74af41b008b5977?width=1000&format=jpeg&auto=webp',
        'Kathryn',
        'Designer'),
    Employee(
        1003,
        'https://i.insider.com/592f4169b74af41b008b5977?width=1000&format=jpeg&auto=webp',
        'Lara',
        'Manager'),
    Employee(
        1003,
        'https://i.insider.com/592f4169b74af41b008b5977?width=1000&format=jpeg&auto=webp',
        'Lara',
        'Manager'),
  ];

  final List<double> revenues = [2000, 3000, 1000, 1000];
  final List<double> numberOfTicket = [10, 20, 5, 9, 10, 2];
  final double value = 100;

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard  ",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Previous Campaigns",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  VerticalSpace(10),
                  // SizedBox(
                  //   height: size.height * 0.38,
                  //   width: size.width * 0.92,
                  //   child: ListView.builder(
                  //       itemCount: 3,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(4.0),
                  //           child: Container(
                  //             height: 90,
                  //             // width: 400,
                  //             child: Card(
                  //               child: ListTile(
                  //                 isThreeLine: true,
                  //                 trailing: Image.asset(
                  //                   'assets/check.png',
                  //                   height: 30,
                  //                   width: 40,
                  //                 ),
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 tileColor: Color.fromRGBO(245, 245, 245, 1),
                  //                 title: Text(
                  //                   'I phone promax 12',
                  //                   style: TextStyle(fontSize: 16),
                  //                 ),
                  //                 leading: Image.asset(
                  //                   'assets/car2.jpg',
                  //                   height: 100,
                  //                   width: 100,
                  //                 ),
                  //                 // leading: CircleAvatar(
                  //                 //     radius: 20,
                  //                 //     backgroundImage: AssetImage(
                  //                 //       'assets/car1.jpg',
                  //                 //     )),
                  //                 subtitle: Text(
                  //                   '32 birr',
                  //                   style: TextStyle(
                  //                       fontSize: 12, color: Colors.purple),
                  //                 ),
                  //               ),

                  //               // trailing: Image.asset(
                  //               //   'assets/soldout.png',
                  //               //   width: 35,
                  //               //   height: 35,
                  //               // ),
                  //               // trailing: Text('Trailing'),
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  SizedBox(
                    height: size.height * 0.27,
                    width: size.width * 2,
                    child: SfDataGrid(
                      // rowHeight: 10,
                      defaultColumnWidth: 100,
                      headerRowHeight: 40,
                      source: EmployeeDataSource(employees),
                      columns: [
                        GridColumn(
                          columnName: 'image',
                          label: Container(
                            color: Color.fromRGBO(51, 102, 204, 1.0),
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Image',
                                style: TextStyle(color: whiteColor)),
                          ),
                        ),
                        GridColumn(
                          columnName: 'id',
                          label: Container(
                            color: Color.fromRGBO(51, 102, 204, 1.0),
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child:
                                Text('ID', style: TextStyle(color: whiteColor)),
                          ),
                        ),
                        GridColumn(
                          columnName: 'category',
                          label: Container(
                            color: Color.fromRGBO(51, 102, 204, 1.0),
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Category',
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'Winner',
                          label: Container(
                            color: Color.fromRGBO(51, 102, 204, 1.0),
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Winner',
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    'Analytics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  VerticalSpace(5),
                  Container(
                    height: 1,
                    width: 400,
                    color: Color.fromRGBO(184, 184, 184, 1),
                  ),
                  Container(
                    // color: Color.fromRGBO(255, 240, 240, 1),
                    decoration: BoxDecoration(
                        // color: Color.fromRGBO(245, 240, 240, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: PieChart(
                              PieChartData(
                                sections: showingSections(),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50.0, 0, 0, 10),
                              child: Text(
                                'Key',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      color: Color.fromRGBO(153, 85, 153, 1.0),
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                  Text('Electronics')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      color: Color.fromRGBO(96, 165, 188, 1.0),
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                  Text('Car')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      color: Color.fromRGBO(51, 102, 204, 1.0),
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                  Text('House')
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  VerticalSpace(30),
                  Text(
                    'Revenu per campaign',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  VerticalSpace(5),
                  Container(
                    height: 1,
                    width: 400,
                    color: Color.fromRGBO(184, 184, 184, 1),
                  ),
                  VerticalSpace(10),
                  Container(
                    // color: Color.fromRGBO(245, 240, 240, 1),
                    width: size.width,
                    height: size.height * 0.41,
                    child: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          // tooltipBgColor: Colors.blueGrey,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String campaign = campaigns[group.x.toInt()];
                            String revenue =
                                '\$${revenues[group.x.toInt()].toString()}';
                            return BarTooltipItem(
                              '$campaign\nRevenue: $revenue',
                              TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                      gridData: FlGridData(
                        show: false, // Hide the grid lines
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Transform.rotate(
                                        angle: -0.3,
                                        child: Text(
                                          campaigns[value.toInt()],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  reservedSize: 32))),
                      barGroups: List.generate(
                        campaigns.length,
                        (index) => BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: revenues[index],
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    )),
                  )
                ],
              ),
              VerticalSpace(20),
              Text(
                'Frequent ticket buyers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              VerticalSpace(5),
              Container(
                height: 1,
                width: 400,
                color: Color.fromRGBO(184, 184, 184, 1),
              ),
              VerticalSpace(20),
              Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Container(
                    // color: Color.fromRGBO(245, 240, 240, 1),
                    width: size.width,
                    height: size.height * 0.41,
                    child: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          // tooltipBgColor: Colors.blueGrey,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String campaign = campaigns[group.x.toInt()];
                            String revenue =
                                '\$${revenues[group.x.toInt()].toString()}';
                            return BarTooltipItem(
                              '$campaign\nRevenue: $revenue',
                              TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                      gridData: FlGridData(
                        show: false, // Hide the grid lines
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Transform.rotate(
                                        angle: -0.3,
                                        child: Text(
                                          users[value.toInt()],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  reservedSize: 32))),
                      barGroups: List.generate(
                        users.length,
                        (index) => BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: numberOfTicket[index],
                              color: Color.fromRGBO(153, 85, 153, 1.0),
                            ),
                          ],
                        ),
                      ),
                    )),
                  )),
              VerticalSpace(20),
              Text(
                'Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              VerticalSpace(5),
              Container(
                height: 1,
                width: 400,
                color: Color.fromRGBO(184, 184, 184, 1),
              ),
              VerticalSpace(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,/
                  children: [
                    new CircularPercentIndicator(
                      // backgroundColor: Color.fromRGBO(126, 176, 213, 1.0), // #7eb0d5
                      // backgroundColor:
                      // Color.fromRGBO(139, 211, 199, 1.0), // #7eb0d5

                      // progressColor: Color.fromRGBO(253, 127, 111, 1.0),
                      // progressColor: Color.fromRGBO(189, 126, 190, 1.0),
                      progressColor: Color.fromRGBO(228, 188, 173, 1.0),
                      circularStrokeCap: CircularStrokeCap.square,
                      animationDuration: 1200,
                      animation: true,
                      radius: 50.0,
                      lineWidth: 8.0,
                      percent: 0.9,
                      center: new Text(
                        "699 BIRR",
                        style: TextStyle(fontSize: 12),
                      ),
                      footer: Text(
                        'Total Revenue',
                        style: TextStyle(fontSize: 12),
                      ),

                      // progressColor: Colors.green,
                    ),
                    new CircularPercentIndicator(
                      // backgroundColor:
                      //     Color.fromRGBO(126, 176, 213, 1.0), // #7eb0d5
                      // backgroundColor:
                      //     Color.fromRGBO(200, 0, 100, 1.0), // #7eb0d5

                      // progressColor: Color.fromRGBO(253, 127, 111, 1.0),
                      progressColor: Color.fromRGBO(223, 151, 158, 1.0),
                      // progressColor: Color.fromRGBO(190, 185, 219, 1.0),
                      circularStrokeCap: CircularStrokeCap.square,
                      animationDuration: 1200,
                      animation: true,
                      radius: 50.0,
                      lineWidth: 8.0,
                      percent: 0.9,
                      center: new Text(
                        "9 Campaign",
                        style: TextStyle(fontSize: 12),
                      ),
                      footer: Text(
                        'Total Campaign',
                        style: TextStyle(fontSize: 12),
                      ),
                      // progressColor: Colors.green,
                    ),
                    new CircularPercentIndicator(
                      // backgroundColor: Color.fromRGBO(126, 176, 213, 1.0), // #7eb0d5
                      // backgroundColor: Color.fromRGBO(189, 126, 190, 1.0),

                      // backgroundColor:
                      //     Color.fromRGBO(139, 211, 199, 1.0), // #7eb0d5

                      // progressColor: Color.fromRGBO(253, 127, 111, 1.0),
                      // progressColor: Color.fromRGBO(189, 126, 190, 1.0),
                      progressColor: Color.fromRGBO(223, 151, 158, 1.0),
                      circularStrokeCap: CircularStrokeCap.square,
                      animationDuration: 1500,
                      animation: true,
                      radius: 50.0,
                      lineWidth: 8.0,
                      percent: 0.90,
                      center: new Text(
                        "228 tickets",
                        style: TextStyle(fontSize: 12),
                      ),
                      footer: Text(
                        'Total Tickets',
                        style: TextStyle(fontSize: 12),
                      ),
                      // progressColor: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // final List<String> users = ['John', 'Jack', 'Rodrigo'];
  final List<double> ticketsBought = [40, 100, 10];

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final categoryPercentage = controller.categoryPercentages[i];

      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            // #e60049", "#0bb4ff", "#50e991"
            // color: Color.fromRGBO(230, 0, 73, 1.0),
            // color: Color.fromRGBO(255, 85, 85, 1.0),

            value: categoryPercentage.percentage.round().toDouble(),
            title: '${categoryPercentage.percentage.round().toDouble()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            // color: Color.fromRGBO(11, 180, 255, 1.0),
            // color: Color.fromRGBO(255, 221, 51, 1.0),
            color: Color.fromRGBO(153, 85, 153, 1.0),
            value: categoryPercentage.percentage.round().toDouble(),
            title: '${categoryPercentage.percentage.round().toDouble()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Color.fromRGBO(51, 102, 204, 1.0),
            // color: Color.fromRGBO(96, 165, 188, 1.0),
            value: categoryPercentage.percentage.round().toDouble(),
            title: '${categoryPercentage.percentage.round().toDouble()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}

enum PainterType {
  circle,
  square,
  cross,
}

class Employee {
  Employee(
    this.id,
    this.image,
    this.name,
    this.designation,
  );
  final int id;
  final String image;
  final String name;
  final String designation;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employees) {
    buildDataGridRow();
  }

  void buildDataGridRow() {
    dataGridRows = employees
        .map<DataGridRow>((employee) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'image', value: employee.image),
              DataGridCell<int>(columnName: 'id', value: employee.id),
              DataGridCell<String>(columnName: 'name', value: employee.name),
              DataGridCell<String>(
                  columnName: 'designation', value: employee.designation),
            ]))
        .toList();
  }

  List<Employee> employees = [];
  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'image') {
        return Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: CircleAvatar(
            // radius: 100,
            backgroundImage: NetworkImage(dataGridCell.value),
          ),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(dataGridCell.value.toString()),
        );
      }
    }).toList());
  }
}
