import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExdockCopyButton extends StatefulWidget {
  const ExdockCopyButton({
    super.key,
    required this.textToCopy,
    this.width,
    this.height,
    this.iconSize,
    this.displaySnackBar = true,
    this.customSnackBarText,
    this.displayToolTip = true,
    this.customToolTipText,
  });

  final String textToCopy;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool displaySnackBar;
  final String? customSnackBarText;
  final bool displayToolTip;
  final String? customToolTipText;

  @override
  State<ExdockCopyButton> createState() => _ExdockCopyButtonState();
}

class _ExdockCopyButtonState extends State<ExdockCopyButton> {
  final Widget copyIcon = Icon(Icons.copy);
  final Widget copiedIcon = Icon(Icons.check, color: mainColour);
  late Widget activeIcon = copyIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: IconButton(
        iconSize: widget.iconSize,
        padding: const EdgeInsets.all(0),
        onPressed: () async {
          Clipboard.setData(ClipboardData(text: widget.textToCopy));
          setState(() {
            activeIcon = copiedIcon;
          });
          if (widget.displaySnackBar) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  widget.customSnackBarText ??
                      '"${widget.textToCopy}" copied to clipboard',
                ),
              ),
            );
          }
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            activeIcon = copyIcon;
          });
        },
        icon: activeIcon,
        tooltip: widget.displayToolTip
            ? widget.customToolTipText ?? 'Copy "${widget.textToCopy}"'
            : null,
      ),
    );
  }
}
