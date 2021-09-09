import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  final Map<String, IconData> categorias;
  final Function(String) onValueChanged;

  CategorySelectionWidget(
      {required this.categorias, required this.onValueChanged});

  @override
  _CategorySelectionWidgetState createState() =>
      _CategorySelectionWidgetState();
}

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;

  const CategoryWidget(
      {required this.name, required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: selected ? Color(0xff3654D0) : Colors.white,
              border: Border.all(
                color: selected ? Color(0xff3654D0) : Colors.white,
                width: selected ? 4.0 : 2.0,
              ),
            ),
            child: Icon(
              icon,
              size: 30.0,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          //
        ],
      ),
    );
  }
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  String currentItem = "Todas";

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    widget.categorias.forEach((name, icon) {
      widgets.add(GestureDetector(
        onTap: () {
          setState(() {
            currentItem = name;
          });
          widget.onValueChanged(name);
        },
        child: CategoryWidget(
          name: name,
          icon: icon,
          selected: name == currentItem,
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}
