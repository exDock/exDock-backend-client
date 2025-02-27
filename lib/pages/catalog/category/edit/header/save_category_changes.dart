import 'package:exdock_backend_client/utils/MapNotifier.dart';

Future<void> saveCategoryChanges(
  MapNotifier dataToSave,
  Function(Function()) mainSetState,
) async {
  // TODO: send data to the server

  dataToSave.reset();
  // Refresh the page
  mainSetState(() {});
}
