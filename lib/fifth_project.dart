import 'package:flutter/material.dart';

class ViewsClass extends StatefulWidget {
  const ViewsClass({super.key});

  @override
  State<ViewsClass> createState() => _ViewsClassState();
}

List<Color> colorss = [
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.indigo,
  Colors.pink,
  Colors.black,
];

class _ViewsClassState extends State<ViewsClass>
    with SingleTickerProviderStateMixin {
  //  TabController controller =  TabController(length: colorss.length, vsync: this); // WRONG
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: colorss.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: controller,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                ...colorss.map(
                  (color) => SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        'Tab ${colorss.indexOf(color) + 1}',
                        style: TextStyle(color: color, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 500,
              height: 700,
              child: TabBarView(
                viewportFraction: 1,
                controller: controller,
                children: [
                  ...colorss.map(
                    (firstElement) => Center(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: firstElement,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              controller.animateTo(
                                (controller.index) == colorss.length - 1
                                    ? 0
                                    : controller.index + 1,

                                // (controller.index + 1) % colorss.length, // 1 % 6
                              );
                            },
                            child: Text(
                              'Tab ${colorss.indexOf(firstElement) + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ]
                  ),
                ],
              ),
            ),

            // SingleChildScrollView(
            //   child: DefaultTabController(
            //     initialIndex: 0,
            //     length: colorss.length,
            //     child:

            //      Column(
            //       children: [...colorss.map((e) => CustomContainer(colorr: e))],
            //     ),
            //   ),
            // ),
          ],
        ),

        // GridView(
        //   padding: EdgeInsets.all(10),
        //   scrollDirection: Axis.horizontal,
        //   // crossAxisCount: 2,
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 190,
        //     crossAxisSpacing: 30,
        //     mainAxisSpacing: 30,
        //   ),

        //   //  SliverGridDelegateWithFixedCrossAxisCount(
        //   //   crossAxisCount: 6,
        //   //   mainAxisExtent: 500,
        //   //   childAspectRatio: 5,
        //   //   crossAxisSpacing: 20,
        //   // ),
        //   children: [
        //     ...colorss.map((e) => CustomContainer(colorr: e)),
        //     // CustomContainer(colorr: Colors.amber),
        //     // CustomContainer(colorr: Colors.yellow),
        //     // CustomContainer(colorr: Colors.blue),
        //     // CustomContainer(colorr: Colors.indigo),
        //     // CustomContainer(colorr: Colors.pink),
        //     // CustomContainer(colorr: Colors.black),
        //   ],
        // ),
        //  ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     ...colorss.map((e) => CustomContainer(colorr: e)),
        //
        //   ],
        // ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Color? colorr;
  const CustomContainer({super.key, this.colorr = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 500,
      // height: 500,
      // margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: colorr,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
