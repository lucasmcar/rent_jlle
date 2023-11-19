import 'dart:isolate';

import 'package:flutter/foundation.dart';

class Tarefa {
  String? name;
  bool? isCompleted;

  Tarefa({@required this.name, @required this.isCompleted});
}
