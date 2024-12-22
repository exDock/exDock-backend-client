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

  static const TextStyle standardTextStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      column0Name,
                      style: standardTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    column1Name,
                    style: standardTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: widthTotal,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        column2Name,
                        style: standardTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              values[index][0],
                              style: standardTextStyle,
                            ),
                          ),
                          Text(
                            values[index][1],
                            style: standardTextStyle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: widthTotal,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                values[index][2],
                                style: standardTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
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
