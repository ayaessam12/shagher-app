import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             ToggleSwitch(
      minHeight: 28,
      minWidth: 28.0,
      cornerRadius: 20.0,
      activeBgColors: [[Colors.white30], [Colors.white]],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.blue,
      inactiveFgColor: Colors.redAccent,
      initialLabelIndex: 1,
      totalSwitches: 2,
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    );

  }
}
