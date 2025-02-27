import 'dart:async';

import 'package:flutter/material.dart';

class SideBarHoverMenuData {
  SideBarHoverMenuData(
    this.isHoveringMenu,
    this.isHoveringButton,
    this.overlayState,
    this.overlayEntry,
    this.dismissTimer,
  );

  bool isHoveringMenu = false;
  bool isHoveringButton = false;
  OverlayState overlayState;
  OverlayEntry? overlayEntry;
  Timer? dismissTimer;
}
