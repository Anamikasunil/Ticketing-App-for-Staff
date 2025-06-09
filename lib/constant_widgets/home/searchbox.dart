import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:flutter/material.dart';

class Searchbox extends StatefulWidget {
  final String? initialQuery;
  final ValueChanged<String>? onSearchChanged;
  final String hintText;
  final Color backgroundColor;
  final Color iconColor;
  final bool showFilterIcon;

  const Searchbox({
    super.key,
    this.initialQuery,
    this.onSearchChanged,
    this.hintText = 'Search for shops',
    this.backgroundColor = lightgrey,
    this.iconColor = Colors.grey,
    this.showFilterIcon = true,
  });

  @override
  State<Searchbox> createState() => _SearchboxState();
}

class _SearchboxState extends State<Searchbox> {
  late final TextEditingController _searchController;
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.initialQuery ?? '';
    _searchController = TextEditingController(text: _searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: widget.backgroundColor,
      ),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Center(
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                    widget.onSearchChanged?.call(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: widget.iconColor),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: widget.iconColor),
                    suffixIcon: widget.showFilterIcon
                        ? Icon(Icons.filter_list, color: widget.iconColor)
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}