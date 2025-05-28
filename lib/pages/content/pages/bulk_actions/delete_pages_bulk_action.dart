import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';

class DeletePagesBulkAction extends BulkAction {
  DeletePagesBulkAction({
    required super.selectedIds,
    required super.userParameterCollection,
  }) : super(name: "Delete Pages");

  @override
  void execute({required Function() onSuccess, required Function() onFailure}) {
    // TODO: implement execute
    throw UnimplementedError(
        "TODO: implement the delete pages bulk actions server request");
  }
}
