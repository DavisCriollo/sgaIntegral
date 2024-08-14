import 'package:flutter/material.dart';
class ThemeApp with ChangeNotifier {
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.blueAccent;

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  void updateTheme(Color primary, Color secondary) {
    _primaryColor = primary;
    _secondaryColor = secondary;
    notifyListeners();
  }

  ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),
    );
  }

  //*************COMBINACIÓN DE COLORES*************//

  final Color color1 = Color(0xFF0c7ee9);
  final Color color2 = Color(0xFF9d4343);

  List<Color> _combinedColors = [];

  ThemeApp() {
    _generateCombinedColors();
  }

  List<Color> get combinedColors => _combinedColors;

  void _generateCombinedColors() {
    _combinedColors = [
      _blendColors(color1, color2, 0.25),
      _blendColors(color1, color2, 0.5),
      _blendColors(color1, color2, 0.75),
      _blendColors(color1, color2, 1.0),
    ];
    notifyListeners();
  }

  Color _blendColors(Color c1, Color c2, double ratio) {
    return Color.fromRGBO(
      (c1.red * ratio + c2.red * (1 - ratio)).round(),
      (c1.green * ratio + c2.green * (1 - ratio)).round(),
      (c1.blue * ratio + c2.blue * (1 - ratio)).round(),
      1.0,
    );
  }
}
