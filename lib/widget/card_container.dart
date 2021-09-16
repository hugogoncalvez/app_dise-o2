import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  //
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        height: (size.height < 535)
            ? size.height * 0.57
            : (size.height < 800)
                ? size.height * 0.48
                : size.height * 0.4,
        decoration: _createCard(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
