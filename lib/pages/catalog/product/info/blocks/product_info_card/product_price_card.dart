// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

// Project imports:
import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/product_info_card_title.dart';
import 'package:exdock_backend_client/utils/attributes/generate_attribute.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';

class ProductPriceCard extends StatefulWidget {
  const ProductPriceCard({
    super.key,
    required this.block,
    required this.changeAttributeMap,
  });

  final MapEntry<String, dynamic> block;
  final MapNotifier changeAttributeMap;

  @override
  State<ProductPriceCard> createState() => _ProductPriceCardState();
}

class _ProductPriceCardState extends State<ProductPriceCard> {
  DateTime? startDate;
  DateTime? endDate;
  DateTime? originalStartDate;
  DateTime? originalEndDate;

  late final ValueNotifier<bool> unsavedChangesNotifier =
      ValueNotifier<bool>(false);

  List<String> getAttributesList() {
    return List<String>.from(
      widget.block.value['attributes'].map((e) => e["attribute_id"]).toList(),
    );
  }

  checkIfChanged(currentStartDate, currentEndDate) {
    if (currentStartDate != originalStartDate ||
        currentEndDate != originalEndDate) {
      unsavedChangesNotifier.value = true;
    } else {
      unsavedChangesNotifier.value = false;
    }
  }

  @override
  void initState() {
    super.initState();

    widget.changeAttributeMap.addListener(
      () {
        unsavedChangesNotifier.value =
            widget.changeAttributeMap.attributeChanged(
          getAttributesList(),
        );
      },
    );

    if (widget.block.value['product_sale_dates'] != null) {
      List<String> startDateSplit =
          widget.block.value['product_sale_dates'][0].split('-');
      startDate = DateTime.utc(int.parse(startDateSplit[0]),
          int.parse(startDateSplit[1]), int.parse(startDateSplit[2]));
    }
    if (widget.block.value['product_sale_dates'][1] != null) {
      List<String> endDateSplit =
          widget.block.value['product_sale_dates'][1].split('-');
      endDate = DateTime.utc(int.parse(endDateSplit[0]),
          int.parse(endDateSplit[1]), int.parse(endDateSplit[2]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProductInfoCardTitle(
      title: widget.block.key,
      unsavedChangesNotifier: unsavedChangesNotifier,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.block.value['attributes'].length,
            itemBuilder: (context, index) {
              Widget child = GenerateAttribute(
                attribute: widget.block.value['attributes'][index],
                changeAttributeMap: widget.changeAttributeMap,
              );
              if (index != 0) {
                child = Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: child,
                );
              }
              return child;
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, top: 24),
                child: Text("Sale price date range"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: GestureDetector(
              onTap: () async {
                var result = await showCalendarDatePicker2Dialog(
                  context: context,
                  config: CalendarDatePicker2WithActionButtonsConfig(
                    calendarType: CalendarDatePicker2Type.range,
                  ),
                  dialogSize: const Size(325, 400),
                  borderRadius: BorderRadius.circular(15),
                  value: [
                    startDate,
                    endDate,
                  ],
                );

                if (result == null) {
                  checkIfChanged(null, null);
                } else {
                  checkIfChanged(result.first, result.last);
                }

                if (result == null ||
                    result.first == null ||
                    result.last == null) {
                  setState(() {
                    startDate == null;
                    endDate == null;
                  });
                } else {
                  setState(() {
                    startDate = result.first;
                    endDate = result.last;
                  });
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    startDate != null || endDate != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                                '${startDate!.toLocal().toString().split(' ')[0]} - ${endDate!.toLocal().toString().split(' ')[0]}'),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text("No active or planned sales."),
                          ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Icon(Icons.event_note_outlined)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
