import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constant/style.dart';
import 'widgets/money_balance.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    List<SalesData> data = [
      SalesData(DateTime(2021, 1), 200),
      SalesData(DateTime(2021, 2), 400),
      SalesData(DateTime(2021, 3), 300),
      SalesData(DateTime(2021, 4), 500),
      SalesData(DateTime(2021, 5), 250),
      SalesData(DateTime(2021, 6), 700),
      SalesData(DateTime(2021, 7), 600),
      SalesData(DateTime(2021, 8), 500),
      SalesData(DateTime(2021, 9), 350),
      SalesData(DateTime(2021, 10), 400),
      SalesData(DateTime(2021, 11), 250),
      SalesData(DateTime(2021, 12), 200),
    ];

    return Scaffold(
        body: Stack(
          children: [
            //BACKGROUND
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [yellowSoftColor, Colors.white])),
            ),
            //PAGE VIEW
            SafeArea(
              child: Column(
                children: [
                  //UNSCROLLER VIEW
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(),
                        Row(
                          children: [
                            Icon(Icons.keyboard_arrow_down),
                            Text(
                              "Oktober",
                              style: textPrimary,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.notifications,
                          color: violetColor,
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Account Balance',
                    style: textPrimary.copyWith(color: greyColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$9400",
                    style: textBold.copyWith(fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MoneyBalance(
                          color: greenColor,
                          image: "assets/income.png",
                          title: "Income",
                          monney: 5000),
                      MoneyBalance(
                          color: redColor,
                          image: "assets/expense.png",
                          title: "Expenses",
                          monney: 1200)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //SCROLLER VIEW
                  Expanded(
                      child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Spend Frequency",
                          style: textBold.copyWith(fontSize: 16),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        //chart flutter
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 200,
                          width: data.length * 100,
                          child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
                              series: <ChartSeries>[
                                // Renders line chart
                                SplineAreaSeries<SalesData, DateTime>(
                                    opacity: 0.7,
                                    borderColor: violetColor,
                                    borderWidth: 5,
                                    gradient: LinearGradient(
                                        colors: gradientColors,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    dataSource: data,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales),
                                SplineSeries<SalesData, DateTime>(
                                    width: 2,
                                    color: redColor,
                                    dataSource: data,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) => 400)
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: yellowSoftColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Today",
                                style: textPrimary.copyWith(
                                    color: yellowColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                              ),
                            ),
                            Text(
                              "Week",
                              style: textPrimary.copyWith(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                            Text(
                              "Month",
                              style: textPrimary.copyWith(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                            Text(
                              "Year",
                              style: textPrimary.copyWith(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: textBold.copyWith(fontSize: 16),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: violetSoftColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "See All",
                                style: textPrimary.copyWith(
                                    color: violetColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 40),
                              title: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(right: 15),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: yellowSoftColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image(
                                      image:
                                          AssetImage("assets/shopping-bag.png"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Shopping",
                                              style: textPrimary.copyWith(
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "- \$120",
                                              style: textBold.copyWith(
                                                  fontSize: 16,
                                                  color: redColor),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Buy some grocery",
                                              style: textPrimary.copyWith(
                                                  color: greyColor),
                                            ),
                                            Text(
                                              "10:00 AM",
                                              style: textPrimary.copyWith(
                                                  color: greyColor),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: 3)
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: whiteColor,
          color: violetColor,
          activeColor: violetColor,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.send, title: 'Transaction'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Budget'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          //optional, default as 0
          onTap: (int i) => print('click index=$i'),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final double sales;
}
