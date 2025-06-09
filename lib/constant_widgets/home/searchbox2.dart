import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:flutter/material.dart';

class Searchboxpage2 extends StatefulWidget {

   Searchboxpage2({super.key});

  @override
  State<Searchboxpage2> createState() => _SearchboxState();
}

class _SearchboxState extends State<Searchboxpage2> {
    final ScrollController _scrollController = ScrollController(); 
 // Add ScrollController
  final TextEditingController _searchController = TextEditingController(); 
 // Add this
  String _searchQuery = ''; 
 // Add this
  @override
  Widget build(BuildContext context) {
    return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(borderRadius),
                                  color:lightgrey
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
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search,
                                                  color: Colors.grey),
                                              hintText: 'Search tickets,clients or issues.........',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                                  suffixIcon: Icon(Icons.cancel,color: Colors.grey,)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                   
                                  ],
                                ),
                              ); //
  }
}