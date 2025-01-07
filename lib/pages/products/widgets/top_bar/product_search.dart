import 'package:exdock_backend_client/globals/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch(
      {super.key, required this.width, required this.searchCallback});

  final double width;
  final Function searchCallback;

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  bool _isHoveredOrFocused = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isHoveredOrFocused = _focusNode.hasFocus || _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _isHoveredOrFocused = true),
        onExit: (_) => setState(() => _isHoveredOrFocused =
            _focusNode.hasFocus || _controller.text.isNotEmpty),
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              widget.searchCallback(_controller.text);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: widget.width,
            height: 56,
            decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kBoxShadowList),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
