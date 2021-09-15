import 'package:app_diseno2/main.dart';
import 'package:flutter/material.dart';

class PagoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Payment',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_rounded,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Saved Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(primary: Color(0xff3654D0)),
                  onPressed: () {},
                  icon: Icon(Icons.highlight_off),
                  label: Text('Add New Card')),
            ]),
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.red),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _CheckBox(),
                            Text('xxxx'),
                            Text('xxxx'),
                            Text('xxxx'),
                            Text('1234'),
                            Container(
                                width: 50,
                                height: 50,
                                color: Colors.transparent,
                                child: Image(
                                    image:
                                        AssetImage('assets/master-logo.png')))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CheckBox extends StatefulWidget {
  const _CheckBox({
    Key? key,
  }) : super(key: key);

  @override
  __CheckBoxState createState() => __CheckBoxState();
}

class __CheckBoxState extends State<_CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
        shape: CircleBorder(),
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }
}
