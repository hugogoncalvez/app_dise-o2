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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ///TODO Una idea para animaciones utilizando AnimatedContainer probar quitar y mirar como se ve sin el widget y con el widget
          AnimatedContainer(
            duration: Duration(milliseconds: 300),

            ///TODO todo debe ser porcentaje nada valores fijos
            width: selected ? size.width * 0.135 : size.width * 0.12,
            height: selected ? size.width * 0.135 : size.width * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: selected ? Color(0xff3654D0) : Colors.white,
              border: Border.all(
                color: selected ? Color(0xff3654D0) : Colors.white,
                width: 4.0,
              ),
            ),
            child: Icon(
              icon,
              size: selected ? size.width * 0.10 : size.width * 0.09,
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
