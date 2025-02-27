import 'dart:async';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:exdock_backend_client/globals/globals.dart';

void removeHoverMenuOverlay(SideBarHoverMenuData sideBarHoverMenuData) {
  sideBarHoverMenuData.overlayEntry?.remove();
  sideBarHoverMenuData.overlayEntry = null;
}

void showHoverMenuOverlay(
  SideBarHoverMenuData sideBarHoverMenuData,
  Widget child,
) {
  removeHoverMenuOverlay(
      sideBarHoverMenuData); // Remove any existing overlay first

  sideBarHoverMenuData.overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      left: 100,
      top: 100,
      child: MouseRegion(
        onEnter: (_) {
          sideBarHoverMenuData.isHoveringMenu = true;
        },
        onExit: (_) {
          sideBarHoverMenuData.isHoveringMenu = false;
          startHoverMenuDismissTimer(sideBarHoverMenuData);
        },
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          decoration: BoxDecoration(
            color: darkColour,
          ),
          child: child,
        ),
      ),
    ),
  );

  sideBarHoverMenuData.overlayState.insert(sideBarHoverMenuData.overlayEntry!);
}

void startHoverMenuDismissTimer(SideBarHoverMenuData sideBarHoverMenuData) {
  sideBarHoverMenuData.dismissTimer?.cancel();
  sideBarHoverMenuData.dismissTimer =
      Timer(const Duration(milliseconds: 250), () {
    if (!sideBarHoverMenuData.isHoveringMenu &&
        !sideBarHoverMenuData.isHoveringButton) {
      removeHoverMenuOverlay(sideBarHoverMenuData);
    }
  });
}
