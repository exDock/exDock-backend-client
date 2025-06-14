// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backoffice/globals/globals.dart';
import 'package:exdock_backoffice/pages/catalog/product/home/product_home_synchronous.dart';
import 'package:exdock_backoffice/pages/catalog/product/home/widgets/top_bar/filters/bottom_filter_menu.dart';
import 'package:exdock_backoffice/pages/catalog/product/home/widgets/top_bar/filters/id_filter.dart';
import 'package:exdock_backoffice/pages/catalog/product/home/widgets/top_bar/filters/price_filter.dart';

class DropdownButtonFilters extends StatefulWidget {
  const DropdownButtonFilters(
      {super.key,
      required this.icon,
      required this.isIconAtStart,
      required this.title,
      required this.width,
      required this.filterCallback});

  final Icon icon;
  final bool isIconAtStart;
  final String title;
  final double width;
  final Function filterCallback;

  @override
  State<DropdownButtonFilters> createState() => _DropdownButtonFiltersState();
}

class _DropdownButtonFiltersState extends State<DropdownButtonFilters> {
  bool isExpanded = false; // Check if the list is expended

  ValueNotifier<int?> selectedId = ValueNotifier(null);
  ValueNotifier<PriceFilterValues> selectedPrice =
      ValueNotifier(PriceFilterValues());

  final GlobalKey<IdFilterState> idFilterKey = GlobalKey<IdFilterState>();
  final GlobalKey<PriceFilterState> priceFilterKey =
      GlobalKey<PriceFilterState>();

  // Sets the value of the id filter
  void setIdValue(int? id) {
    selectedId.value = id;
  }

  // Sets the value of the price filter
  void setPriceValue(double? lowPrice, double? highPrice) {
    final PriceFilterValues temp =
        PriceFilterValues(lowPrice: lowPrice, highPrice: highPrice);
    selectedPrice.value = temp;
  }

  // Resets the filters
  void resetFilters() {
    final PriceFilterValues temp = PriceFilterValues();
    selectedId.value = null;
    selectedPrice.value = temp;
  }

  // Applies the filters
  void applyFilters() {
    final Filters filters = Filters(
        searchInput: "",
        id: idFilterKey.currentState?.idValue,
        lowPrice: priceFilterKey.currentState?.lowPrice,
        highPrice: priceFilterKey.currentState?.highPrice);
    widget.filterCallback(filters);
  }

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(const Offset(-100.0, -100.0));

    return OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy + renderBox.size.height + 8,
        left: position.dx,
        width: renderBox.size.width * 3.525,
        height: renderBox.size.height * 7,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TapRegion(
              onTapOutside: (tap) {
                _toggleOverlay();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(color: Colors.black),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: _toggleOverlay,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ValueListenableBuilder(
                        valueListenable: selectedId,
                        builder: (context, val, child) {
                          return IdFilter(
                            setIdValue: setIdValue,
                            idValue: val,
                            key: idFilterKey,
                          );
                        },
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ValueListenableBuilder(
                        valueListenable: selectedPrice,
                        builder: (context, val, child) {
                          return PriceFilter(
                            key: priceFilterKey,
                            lowPrice: val.lowPrice,
                            highPrice: val.highPrice,
                            setPriceValue: setPriceValue,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: BottomFilterMenu(
                        resetFilters: resetFilters,
                        applyFilters: () {
                          applyFilters();
                          _toggleOverlay();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleOverlay() {
    setState(() {
      if (isExpanded) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      } else {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      }

      Timer(const Duration(milliseconds: 100), () => isExpanded = !isExpanded);
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        onTap: () {
          if (!isExpanded) {
            _toggleOverlay();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kBoxShadowList,
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.isIconAtStart) widget.icon,
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "FILTERS",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              if (!widget.isIconAtStart) widget.icon,
            ],
          ),
        ),
      ),
    );
  }
}

class PriceFilterValues {
  double? lowPrice;
  double? highPrice;

  PriceFilterValues({this.lowPrice, this.highPrice});
}
