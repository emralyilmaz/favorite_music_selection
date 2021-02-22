import 'package:flutter/material.dart';

class ToggleSelectionModel {
  final String id;
  final String name;

  ToggleSelectionModel(this.id, this.name);
}

class ToggleSelection extends StatefulWidget {
  final List<ToggleSelectionModel> list;
  final Function onChange;

  const ToggleSelection({Key key, this.list, this.onChange}) : super(key: key);

  @override
  _ToggleSelectionState createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  List<ToggleSelectionModel> _selectedItems = [];

  _onSelectedItem(ToggleSelectionModel item) {
    int foundItemIndex =
        _selectedItems.indexWhere((element) => element.id == item.id);
    if (foundItemIndex > -1) {
      _selectedItems.removeAt(foundItemIndex);
    } else {
      _selectedItems.add(item);
    }

    widget.onChange(_selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return ToggleSelectionItem(
              item: widget.list[index],
              onSelect: _onSelectedItem,
            );
          }),
    );
  }
}

class ToggleSelectionItem extends StatefulWidget {
  final ToggleSelectionModel item;
  final Function onSelect;

  const ToggleSelectionItem({Key key, this.item, this.onSelect})
      : super(key: key);
  @override
  _ToggleSelectionItemState createState() => _ToggleSelectionItemState();
}

class _ToggleSelectionItemState extends State<ToggleSelectionItem> {
  bool _isSelected = false;

  _onItemSelect() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onSelect(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: 100,
        height: 30,
        child: FlatButton(
            color: _isSelected ? Colors.lime : Colors.grey[200],
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.circular(50)),
            onPressed: _onItemSelect,
            child: Text(
              widget.item.name,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: _isSelected ? Colors.white : Colors.black),
            )),
      ),
    );
  }
}
