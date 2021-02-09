//import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/splash_screen.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class CuppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: cuppingBlue,
      ),
      // theme: _cuppingTheme,
      //home: Home(title: APP_TITLE),
      home: Home(title: APP_TITLE),
      initialRoute: '/splash',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/splash') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => SplashScreen(),
      fullscreenDialog: true,
    );
  }
}

// final ThemeData _cuppingTheme = _buildCuppingTheme();

// ThemeData _buildCuppingTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     primaryColor: cuppingBlue,
//     buttonTheme: base.buttonTheme.copyWith(
//       buttonColor: cuppingGrey,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     ),
//     textTheme: _buildCuppingTextTheme(base.textTheme),
//   );
// }

// TextTheme _buildCuppingTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         bodyText1: base.bodyText1.copyWith(
//           fontWeight: FontWeight.w400,
//         ),
//       )
//       .apply(
//         fontFamily: 'Akzidenz-Grotesk BQ',
//       );
// }
