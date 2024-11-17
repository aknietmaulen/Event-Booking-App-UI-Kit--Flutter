import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/event_model.dart';
import '../../providers/event_provider.dart';
import '../screens/event_detail.dart';

class SearchPage extends StatefulWidget {
  final String? category;

  const SearchPage({Key? key, this.category}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = "";
  List<EventModel> searchResults = [];

  void searchEvents(String query, EventsProvider provider) {
    setState(() {
      searchQuery = query;
      searchResults = provider.searchEvents(query);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.category != null) {
        final provider = Provider.of<EventsProvider>(context, listen: false);
        setState(() {
          searchResults = provider.events
              .where((event) => event.category == widget.category)
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (query) => searchEvents(query, eventsProvider),
          decoration: InputDecoration(
            hintText: "Search events...",
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                searchQuery = "";
                searchResults = [];
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Categories Filter
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryChip("Sports", eventsProvider),
                _buildCategoryChip("Nature", eventsProvider),
                _buildCategoryChip("Entertainment", eventsProvider),
                _buildCategoryChip("Emergency", eventsProvider),
                _buildCategoryChip("Formal", eventsProvider),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (ctx, index) {
                final event = searchResults[index];
                return ListTile(
                  title: Text(event.name),
                  subtitle: Text(event.category),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailsPage(event: event),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category, EventsProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        label: Text(category),
        selected: widget.category == category,
        onSelected: (_) {
          setState(() {
            searchResults = provider.events
                .where((event) => event.category == category)
                .toList();
          });
        },
      ),
    );
  }
}
