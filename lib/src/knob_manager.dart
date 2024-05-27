import 'package:flutter/material.dart';
import 'package:storyto/src/knobs/bool_knob.dart';
import 'package:storyto/src/knobs/color_knob.dart';
import 'package:storyto/src/knobs/integer_knob.dart';
import 'package:storyto/src/knobs/knob.dart';
import 'package:storyto/src/knobs/n_integer_knob.dart';
import 'package:storyto/src/knobs/n_selector_knob.dart';
import 'package:storyto/src/knobs/n_string_knob.dart';
import 'package:storyto/src/knobs/selector_knob.dart';
import 'package:storyto/src/knobs/string_knob.dart';

class KnobManager extends ChangeNotifier {
  KnobManager();

  final Map<String, Knob> knobs = {};
  final ChangeNotifier rebuildKnobs = ChangeNotifier();
  final ChangeNotifier rebuildExhibit = ChangeNotifier();

  String? nString(
    String id, {
    required String defaultValue,
    required bool startAsNull,
  }) {
    if (knobs.keys.contains(id)) {
      final selectedKnob = knobs[id];
      if (selectedKnob?.value == null) {
        return null;
      } else {
        return knobs[id]?.value as String;
      }
    } else {
      final newKnob = NStringKnob(
        defaultValue: defaultValue,
        startAsNull: startAsNull,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  bool nBool(
    String id, {
    required bool initialValue,
  }) {
    if (knobs.keys.contains(id)) {
      return knobs[id]!.value as bool;
    } else {
      final newKnob = BoolKnob(
        initialValue: initialValue,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  String string(
    String id, {
    required String initialValue,
  }) {
    if (knobs.keys.contains(id)) {
      return knobs[id]!.value as String;
    } else {
      final newKnob = StringKnob(
        initialValue: initialValue,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  int? nInteger(
    String id, {
    required int defaultValue,
    required bool startAsNull,
  }) {
    if (knobs.keys.contains(id)) {
      final selectedKnob = knobs[id];
      if (selectedKnob?.value == null) {
        return null;
      } else {
        return knobs[id]?.value as int;
      }
    } else {
      final newKnob = NIntegerKnob(
        defaultValue: defaultValue,
        startAsNull: startAsNull,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  int integer(
    String id, {
    required int initialValue,
  }) {
    if (knobs.keys.contains(id)) {
      return knobs[id]!.value as int;
    } else {
      final newKnob = IntegerKnob(
        initialValue: initialValue,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  Color color(
    String id, {
    required Color initialValue,
  }) {
    if (knobs.keys.contains(id)) {
      return knobs[id]!.value as Color;
    } else {
      final newKnob = ColorKnob(
        initialValue: initialValue,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  T? nSelectable<T>(
    String id, {
    required List<T> values,
    required bool startAsNull,
    required SelectorNameMarshal nameMarshal,
  }) {
    if (knobs.keys.contains(id)) {
      final selectedKnob = knobs[id];
      if (selectedKnob?.value == null) {
        return null;
      } else {
        return knobs[id]?.value as T;
      }
    } else {
      final newKnob = NSelectorKnob<T>(
        values: values,
        startAsNull: startAsNull,
        nameMarshal: nameMarshal,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value;
    }
  }

  T selectable<T>(
    String id, {
    required List<T> values,
    required T initialValue,
    required SelectorNameMarshal nameMarshal,
  }) {
    if (knobs.keys.contains(id)) {
      return knobs[id]?.value as T;
    } else {
      final newKnob = SelectorKnob<T>(
        values: values,
        nameMarshal: nameMarshal,
        initialValue: initialValue,
      );

      newKnob.addListener(rebuildExhibit.notifyListeners);

      knobs[id] = newKnob;

      rebuildKnobs.notifyListeners();
      return newKnob.value!;
    }
  }
}
