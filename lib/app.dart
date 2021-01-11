import 'package:flutter/material.dart';
import 'package:flutter_guide_two/screens/location_detail/location_detail.dart';
import 'package:flutter_guide_two/screens/locations/locations.dart';
import 'package:flutter_guide_two/style.dart';

const LocationsRoute = "/";
const LocationDetailRoute = "/location_detail";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments["id"]);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: AppBarTextStyle,
          ),
        ),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TitleTextStyle,
          // ignore: deprecated_member_use
          subtitle: SubTitleTextStyle,
          // ignore: deprecated_member_use
          caption: CaptionTextStyle,
          // ignore: deprecated_member_use
          body1: Body1TextStyle,
        ));
  }
}
