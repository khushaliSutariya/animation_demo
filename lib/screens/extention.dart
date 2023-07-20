import 'package:flutter/material.dart';

extension StatelessScreenExtensions on StatelessWidget {
  Future<T?> pushToScreen<T extends Object?>(BuildContext context, {String? routeName}) {
    //  GlobalKey<NavigatorState>? navigatorKey;
    // var ctx = navigatorKey!.currentContext;
    WidgetsFlutterBinding.ensureInitialized();
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
        settings: routeName == null ? null : RouteSettings(name: routeName),
      ),
    );
  }

  PageRouteBuilder createRoute<T extends Object?>(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return (widget);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}

