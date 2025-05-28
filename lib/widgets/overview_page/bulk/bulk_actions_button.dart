import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_button.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';
import 'package:flutter/material.dart';

class BulkActionsButton extends StatelessWidget {
  const BulkActionsButton({super.key, required this.bulkActions});

  final List<BulkAction> bulkActions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 171,
      child: Card(
        margin: EdgeInsets.zero,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            onChanged: (value) {
              // TODO: bulk action popup
            },
            customButton: const ExdockButton(
              label: "bulk actions",
              icon: Icons.bolt_rounded,
            ),
            buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            )),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            isExpanded: true,
            isDense: true,
            items: List<DropdownMenuItem<BulkAction>>.generate(
              bulkActions.length,
              (index) => DropdownMenuItem(
                value: bulkActions[index],
                child: Text(bulkActions[index].name),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
