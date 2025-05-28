// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/snackbar/exdock_snackbar.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_button.dart';
import 'package:exdock_backend_client/widgets/input/exdock_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<String> getWebsiteName() async {
    // TODO: retrieve website name
    return "website name";
  }

  Future<int> loginServer(String email, String password) async {
    // TODO: check login credentials
    // return 403 if credentials are incorrect
    // return 500 if there is a server error
    // return 503 if there is a connection error

    authData.setAuthEmail(email);
    authData.setAuthPassword(password);
    // return 200 if login is successful
    return 200;
  }

  void loginButtonFunction() async {
    int statusCode = await loginServer(
      emailController.text,
      passwordController.text,
    );
    if (statusCode == 200) {
      if (mounted) {
        if (context.canPop()) {
          context.pop();
          return;
        }
        context.go("/");
      }
    } else if (statusCode == 403) {
      if (mounted) {
        showExDockSnackBar(
          context: context,
          child: const Text("403 has been thrown | invalid credentials"),
        );
      }
    } else if (statusCode == 500) {
      if (mounted) {
        showExDockSnackBar(
          context: context,
          child:
              const Text("500 has been thrown | server experienced an error"),
        );
      }
    } else if (statusCode == 503) {
      if (mounted) {
        showExDockSnackBar(
          context: context,
          child: const Text("503 has been thrown | connection error"),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 450,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: kBoxShadowList,
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("exDock login"),
              Text(
                "website name",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              ExdockTextField(
                controller: emailController,
                onChanged: (value) {
                  //
                },
                labelText: "Email",
              ),
              const SizedBox(height: 12),
              ExdockTextField(
                controller: passwordController,
                onChanged: (value) {
                  //
                },
                labelText: "Password",
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ExdockButton(
                      label: "FORGOT PASSWORD",
                      onPressed: () {
                        // TODO: navigate to forgot password page
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ExdockButton(
                      label: "LOGIN",
                      onPressed: loginButtonFunction,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
