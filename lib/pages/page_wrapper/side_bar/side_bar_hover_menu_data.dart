// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

class SideBarHoverMenuData {
  SideBarHoverMenuData(
    this.isHoveringMenu,
    this.isHoveringButton,
    this.overlayState,
    this.overlayEntry,
    this.dismissTimer,
    this.hoveredIndex,
  );

  bool isHoveringMenu = false;
  bool isHoveringButton = false;
  OverlayState overlayState;
  OverlayEntry? overlayEntry;
  Timer? dismissTimer;
  int? hoveredIndex;
}
