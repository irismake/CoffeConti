import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Watermelon',
  ];
  bool _showSuggestions = false;
  FocusNode _focusNode = FocusNode();
  void _onFocusChange() {
    setState(() {
      _showSuggestions = _focusNode.hasFocus;
    });
  }

  List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(suggestions);

    matches.retainWhere(
        (suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField(
              suggestionsBoxVerticalOffset: 2,
              suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                  hasScrollbar: true,
                  constraints: BoxConstraints.expand(width: 355, height: 300)),
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  hintText: 'Search',
                  // contentPadding: EdgeInsets.symmetric(
                  //   vertical: 16.0, // Adjust the vertical padding
                  //   horizontal: 12.0, // Adjust the horizontal padding
                  // ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        style: BorderStyle
                            .none), // Set the border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                // Do something with the selected suggestion
              },
              noItemsFoundBuilder: (value) {
                var localizedMessage = "찾을 수 없습니다";
                return Text(localizedMessage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
