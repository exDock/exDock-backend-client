// Flutter imports:
import 'package:flutter/material.dart';

class BottomFilterMenu extends StatefulWidget {
  const BottomFilterMenu(
      {super.key, required this.resetFilters, required this.applyFilters});

  final Function resetFilters;
  final Function applyFilters;

  @override
  State<BottomFilterMenu> createState() => _BottomFilterMenuState();
}

class _BottomFilterMenuState extends State<BottomFilterMenu> {
  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () {
                    widget.resetFilters();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF2A9D8F),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Reset all',
                        style: TextStyle(
                          color: Color(0xFF2A9D8F),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.applyFilters();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF2A9D8F),
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF2A9D8F),
                    ),
                    child: const Center(
                      child: Text(
                        'APPLY',
                        style: TextStyle(
                          color: Color(0xFF264653),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
