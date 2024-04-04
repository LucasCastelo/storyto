import 'package:flutter/material.dart';
import 'package:storyto/src/fields/custom_text_field.dart';
import 'package:storyto/src/knob.dart';

class KnobManager extends ChangeNotifier {
  KnobManager();

  final Map<String, Knob> knobs = {};
  final ChangeNotifier rebuildKnobs = ChangeNotifier();
  final ChangeNotifier rebuildExhibit = ChangeNotifier();

  String? nString(String id) {
    if (knobs.keys.contains(id)) {
      final selectedKnob = knobs[id];
      if (selectedKnob?.value == null) {
        return null;
      } else {
        return knobs[id]?.value as String;
      }
    } else {
      final newKnob = NullableKnob(
        defaultValue: 'asdaa',
        startAsNull: false,
        inputBuilder: <String>(setValue, toggleNull) => Row(
          children: [
            Expanded(
              child: CustomTextField(
                onChanged: (v) => setValue(v as String),
              ),
            ),
            Container(
              color: Colors.red,
              child: GestureDetector(
                onTap: toggleNull,
                child: const Text(
                  "NULL",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }
}
