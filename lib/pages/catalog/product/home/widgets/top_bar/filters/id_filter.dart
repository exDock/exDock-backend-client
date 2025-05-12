// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdFilter extends StatefulWidget {
  const IdFilter({super.key, required this.setIdValue, this.idValue});

  final Function setIdValue;
  final int? idValue;

  @override
  State<IdFilter> createState() => IdFilterState();
}

class IdFilterState extends State<IdFilter> {
  final idController = TextEditingController();

  int? get idValue => int.tryParse(idController.text);

  @override
  Widget build(BuildContext context) {
    if (widget.idValue != null) {
      idController.text = widget.idValue.toString();
    } else {
      idController.clear();
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
                  'ID',
                  style: TextStyle(
                    color: Color(0xFF264653),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      idController.clear();
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
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter ID',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: idController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.setIdValue(int.tryParse(idController.text));
    idController.dispose();

    super.dispose();
  }
}
