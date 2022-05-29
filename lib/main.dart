import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/psychologist/dating_dates.dart';
import 'package:psychohelp_app/pages/psychologist/home_psycho.dart';
import 'package:psychohelp_app/pages/psychologist/list_patients.dart';
import 'package:psychohelp_app/pages/psychologist/profile_psycho.dart';

void main() {
  runApp(
      new MaterialApp(home: new Home_psycho(), routes: <String, WidgetBuilder>{
    Dating_dates.routeName: (BuildContext context) => new Dating_dates(),
    List_patients.routeName: (BuildContext context) => new List_patients(),
    Profile_psycho.routeName: (BuildContext context) => new Profile_psycho(),
  }));
}
