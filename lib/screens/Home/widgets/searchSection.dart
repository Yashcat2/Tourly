import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  // Sample data
  final List<String> items = [
    'Mountains',
    'Forests',
    'Sea',
    'Deserts',
    'Lakes',
    'Caves',
  ];

  List<String> filteredItems = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredItems = items; // Initialize with all items
  }

  // Search function to filter data based on query
  void _search(String query) {
    final filtered = items.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      this.query = query;
      filteredItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(100),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged:
                          _search, // Call the search function when typing
                      decoration: const InputDecoration(
                        hintText: "Search your Destination",
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue, // Your primary color
                    child: Icon(
                      Icons.sort_by_alpha_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Show results or "No results found" message
        if (filteredItems.isEmpty && query.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'No results found',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
          ),
      ],
    );
  }
}
