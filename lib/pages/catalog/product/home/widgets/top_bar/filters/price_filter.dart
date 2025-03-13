import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter(
      {super.key, this.lowPrice, this.highPrice, required this.setPriceValue});

  final Function setPriceValue;
  final double? lowPrice;
  final double? highPrice;

  @override
  State<PriceFilter> createState() => PriceFilterState();
}

class PriceFilterState extends State<PriceFilter> {
  final lowPriceController = TextEditingController();
  final highPriceController = TextEditingController();

  double? get lowPrice => double.tryParse(lowPriceController.text);
  double? get highPrice => double.tryParse(highPriceController.text);

  @override
  Widget build(BuildContext context) {
    if (widget.highPrice != null) {
      highPriceController.text = widget.highPrice.toString();
    } else {
      highPriceController.clear();
    }

    if (widget.lowPrice != null) {
      lowPriceController.text = widget.lowPrice.toString();
    } else {
      lowPriceController.clear();
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFF264653),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PRICE',
                  style: TextStyle(
                    color: Color(0xFF264653),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      lowPriceController.clear();
                      highPriceController.clear();
                    });
                  },
                  child: const Text(
                    'RESET',
                    style: TextStyle(
                      color: Color(0xFF2A9D8F),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 175,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter min price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  controller: lowPriceController,
                ),
              ),
              const SizedBox(
                width: 50,
                child: Icon(Icons.arrow_forward),
              ),
              SizedBox(
                width: 175,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter max price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  controller: highPriceController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.setPriceValue(
      double.tryParse(lowPriceController.text),
      double.tryParse(highPriceController.text),
    );

    lowPriceController.dispose();
    highPriceController.dispose();

    super.dispose();
  }
}
