import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Future<T?> pushToScreen<T extends Object?>({String? routeName}) {
//   GlobalKey<NavigatorState>? navigatorKey;
//   var ctx = navigatorKey!.currentContext!;
//   WidgetsFlutterBinding.ensureInitialized();
//   return Navigator.of(ctx).push(
//     MaterialPageRoute(
//       builder: (context) => this,
//       settings: routeName == null ? null : RouteSettings(name: routeName),
//     ),
//   );
// }

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}


