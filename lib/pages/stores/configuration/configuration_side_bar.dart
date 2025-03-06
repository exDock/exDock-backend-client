import 'package:exdock_backend_client/pages/stores/configuration/configuration_menu_sub_type.dart';
import 'package:flutter/material.dart';

class ConfigurationSidebar extends StatefulWidget {
  final Map<String, List<ConfigurationMenuSubType>> menuItems;
  final Color backgroundColor;
  final Color textColor;
  final Color expandedSectionColor;

  const ConfigurationSidebar({
    super.key,
    required this.menuItems,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
    this.expandedSectionColor = Colors.white,
  });

  @override
  State<ConfigurationSidebar> createState() => _ConfigurationSidebarState();
}

class _ConfigurationSidebarState extends State<ConfigurationSidebar> {
  // Track expanded sections
  Set<String> expandedSections = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: widget.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: _buildMenuSections(),
      ),
    );
  }

  List<Widget> _buildMenuSections() {
    List<Widget> sections = [];

    const Widget divider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: Colors.grey,
        child: SizedBox(
          height: 1,
        ),
      ),
    );

    widget.menuItems.forEach((sectionTitle, subItems) {
      bool isExpanded = expandedSections.contains(sectionTitle);

      // Add section header
      sections.add(
        InkWell(
          onTap: () {
            setState(() {
              if (isExpanded) {
                expandedSections.remove(sectionTitle);
              } else {
                expandedSections.add(sectionTitle);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitle.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: widget.textColor,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: widget.textColor,
                ),
              ],
            ),
          ),
        ),
      );

      // Add sub-items if section is expanded
      if (isExpanded) {
        for (var item in subItems) {
          sections.add(
            Container(
              color: widget.expandedSectionColor,
              child: InkWell(
                onTap: item.onPressed,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }

      sections.add(divider);
    });

    return sections;
  }
}
