import 'package:flutter/material.dart';

class Flow extends StatelessWidget {
  final String fdate;

  Flow({Key? key, required this.fdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  fdate,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    height: 3.3,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Stepper(
                    margin: EdgeInsets.all(0),
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Container();
                    },
                    // onStepContinue: ,
                    // onStepCancel: ,
                    steps: [
                      Step(
                          title: Text("草稿"),
                          content: Container(),
                          isActive: true),
                      Step(
                          title: Text("待班主任审核"),
                          content: Container(),
                          isActive: false),
                      Step(
                          title: Text("结束"),
                          content: Container(),
                          isActive: false)
                    ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
