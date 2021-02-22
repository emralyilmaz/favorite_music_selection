import 'package:favorite_music_selection2/toggle_selection.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _hasSelection = false;
  List<ToggleSelectionModel> _selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, bottom: 10),
              child: Text(
                "Match Your Favorites Musics",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.lime),
                  borderRadius: BorderRadius.circular(10)),
              height: 500,
              width: 500,
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: ToggleSelection(
                list: [
                  ToggleSelectionModel("1", "Blues"),
                  ToggleSelectionModel("2", "Hip Hop"),
                  ToggleSelectionModel("3", "Jazz"),
                  ToggleSelectionModel("4", "Alternative Metal"),
                  ToggleSelectionModel("5", "Pop"),
                  ToggleSelectionModel("6", "Dance"),
                  ToggleSelectionModel("7", "Funck"),
                  ToggleSelectionModel("8", "Rock"),
                  ToggleSelectionModel("9", "Progressive Rock"),
                  ToggleSelectionModel("10", "Alternative Rock"),
                  ToggleSelectionModel("11", "Stoner Rock"),
                  ToggleSelectionModel("12", "Classical"),
                  ToggleSelectionModel("13", "Instrumental"),
                  ToggleSelectionModel("14", "Techno"),
                  ToggleSelectionModel("15", "Progressive Trance"),
                ],
                onChange: (List<ToggleSelectionModel> selectionList) {
                  setState(() {
                    _selectedList = selectionList;
                    print(_selectedList.length);

                    if (_selectedList.length > 2) {
                      _hasSelection = true;
                    } else {
                      _hasSelection = false;
                    }
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: _selectedList.length == 0
                  ? Text("Please select at least 3 items.")
                  : Text("Selected: ${_selectedList.length} items"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: FlatButton(
                disabledColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
                color: _hasSelection ? Colors.lime : Colors.grey[200],
                onPressed: !_hasSelection ? null : () {},
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: _hasSelection ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
