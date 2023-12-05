import 'package:flutter/material.dart';

import 'pie_chart.dart';

class ChartView extends StatelessWidget {
  const ChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 10,
                    offset: Offset(-5, -5),
                    color: Colors.white),
                BoxShadow(
                  spreadRadius: -1,
                  blurRadius: 10,
                  offset: Offset(3, 3),
                  color: Color.fromRGBO(194, 198, 201, 1),
                )
              ]),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: w * 0.11,
                  child: CustomPaint(
                    foregroundPainter: PieChart(
                      width: w * 0.5,
                      categories: categories,
                    ),
                    child: const Center(),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: w * 0.14,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(193, 214, 233, 1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 1,
                        offset: Offset(-1, -1),
                        color: Colors.white,
                      ),
                      BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 5,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
