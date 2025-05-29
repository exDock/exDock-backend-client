import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_button.dart';
import 'package:exdock_backend_client/widgets/input/exdock_text_field.dart';
import 'package:exdock_backend_client/widgets/popup/exdock_big_popup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class LoginSettings extends StatelessWidget {
  const LoginSettings({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);
    controller.text = baseUrl;

    void handleCheckValues() async {
      try {
        String base = controller.text;
        Uri uri = Uri.parse("$base/api/v1/ping");
        if (uri.scheme.isEmpty || uri.host.isEmpty) {
          throw const FormatException("Invalid URL format");
        }

        var response = await get(uri);

        if (response.statusCode != 200) {
          throw Exception("Server not reachable");
        }

        baseUrl = controller.text;
        errorNotifier.value = null;
      } catch (e) {
        if (e is FormatException) {
          errorNotifier.value = "Invalid URL format";
        } else {
          errorNotifier.value = "Server not reachable";
        }
        return;
      }
    }

    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: 'Login Settings',
      onPressed: () {
        showPopupWindow(
          context,
          childFun: (pop) {
            return ExdockBigPopup(
              key: GlobalKey(),
              pop: pop,
              title: "Login Settings",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ValueListenableBuilder(
                      valueListenable: errorNotifier,
                      builder: (context, errorText, child) {
                        return ExdockTextField(
                          controller: controller,
                          onChanged: (text) {},
                          labelText: "Server URL",
                          errorText: errorText,
                        );
                      }),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ExdockButton(
                      label: "Check values",
                      onPressed: handleCheckValues,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
