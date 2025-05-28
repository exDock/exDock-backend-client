import 'package:exdock_backend_client/widgets/overview_page/filters/filter_setup/filter_setup.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_setup/filter_setup_type_data.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_setup/widget_generator/filter_setup_string.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_staging_ground.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterSetupWidgetGenerator extends StatelessWidget {
  const FilterSetupWidgetGenerator({
    super.key,
    required this.filterSetupData,
    required this.filterStagingGround,
  });

  final FilterSetupData filterSetupData;
  final FilterStagingGround filterStagingGround;

  @override
  Widget build(BuildContext context) {
    if (filterSetupData.type == FilterSetupTypeData.string) {
      return FilterSetupString(
        filterStagingGround: filterStagingGround,
        filterSetupData: filterSetupData,
      );
    }

    if (filterSetupData.type == FilterSetupTypeData.range) {
      //
    }

    if (kDebugMode) {
      print(
          "This filter type (${filterSetupData.type.name}) has not yet been added to the FilterSetupWidgetGenerator()");
    }
    return Text(
        "This filter type (${filterSetupData.type.name}) has not yet been added to the FilterSetupWidgetGenerator()");
  }
}
