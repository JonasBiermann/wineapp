library my_prj.globals;

import 'package:week_of_year/week_of_year.dart';

bool currentTheme = true;
final date = DateTime.now();
int week = date.weekOfYear;
int year = date.year;
String? language;
int age = 0;
