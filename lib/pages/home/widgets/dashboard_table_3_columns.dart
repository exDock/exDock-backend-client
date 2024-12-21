import 'package:flutter/material.dart';

class DashboardTable3Columns extends StatelessWidget {
  const DashboardTable3Columns({
    super.key,
    required this.title,
    required this.column0Name,
    required this.column1Name,
    required this.column2Name,
    required this.values,
  });

  final String title;
  final String column0Name;
  final String column1Name;
  final String column2Name;
  final List<List<String>> values;

  final double widthTotal = 72;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(column0Name),
                  ),
                  Text(
                    column1Name,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: widthTotal,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(column2Name),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.25),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(values[index][0]),
                        ),
                        Text(
                          values[index][1].toString(),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          width: widthTotal,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              values[index][2],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
