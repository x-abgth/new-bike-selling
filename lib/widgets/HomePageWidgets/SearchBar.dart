import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        size: 35,
      ),
      onPressed: () {
        showSearch(
          context: context,
          delegate: DataSearch(),
        );
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  DataSearch()
      : super(
          searchFieldStyle: TextStyle(
              fontFamily: "Heebo", fontSize: 15, color: Colors.grey[500]),
          searchFieldLabel: "SEARCH BIKES",
        );
  final bikes = [
    "DUKE 250",
    "DUKE 200",
    "DUKE 125",
    "DUKE 390",
    "RC 125",
    "RC 200",
    "RC 390",
    "Husqvarna",
    "ADVENTURE 390",
  ];

  static const historyLength = 5;
  List<String> recentSearches = [];
  List<String> filteredRecentSearches;
  String selectedTerm;

  List<String> filterSearchTerms({@required String filter}) {
    if (filter != null && filter.isNotEmpty) {
      return recentSearches.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return recentSearches.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (recentSearches.contains(term)) {
      // This method will be implemented soon
      putSearchTermFirst(term);
      return;
    }
    recentSearches.add(term);
    if (recentSearches.length > historyLength) {
      recentSearches.removeRange(0, recentSearches.length - historyLength);
    }
    // Changes in _searchHistory mean that we have to update the filteredSearchHistory
    filteredRecentSearches = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    recentSearches.removeWhere((t) => t == term);
    filteredRecentSearches = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions icon of appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results based on the selection
    return Card(
      elevation: 5,
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : bikes.where((p) => p.startsWith(query.toUpperCase())).toList();

    return Scaffold(
      backgroundColor: kPrimaryDark,
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          tileColor: kPrimaryDark,
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.history, color: Colors.white54),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.white38),
                )
              ],
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
