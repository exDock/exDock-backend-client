import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_setup/filter_setup.dart';
import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class FiltersPopup extends StatefulWidget {
  const FiltersPopup({
    super.key,
    required this.filterNotifier,
    required this.pop,
    required this.getFilters,
  });

  final FilterNotifier filterNotifier;
  final KumiPopupWindow pop;
  final Future<List<FilterSetupData>> Function() getFilters;

  @override
  State<FiltersPopup> createState() => _FiltersPopupState();
}

class _FiltersPopupState extends State<FiltersPopup> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getFilters(),
      builder: (context, snapshot) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filters",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
