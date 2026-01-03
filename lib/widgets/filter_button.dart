import 'dart:ui';

import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final String n;
  final bool decider;
  final void Function() onTap;
  const FilterButton({
    super.key,
    required this.n,
    required this.decider,
    required this.onTap,
  });

  @override
  State<FilterButton> createState() {
    return _FilterButtonState();
  }
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.decider ? Color(0xFF137FEC) : Color(0xFF233648),
        foregroundColor: Colors.white,
      ),
      child: Text(widget.n),
    );
  }
}
