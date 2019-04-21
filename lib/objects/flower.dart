import 'dart:ui';

class Flower{
  final String _title;
  final String _description;
  final String _photoPath = 'https://flower-club.ru/media/zoo/images/roza-eksplorer_4c271182c36fd1e5edbe33e165756b0d.jpg';
  final String _country;
  final Color _color;
  final int _multiplicity;
  final int _available;
  final double _price;

  Flower({
    String title,
    String description,
    double price,
    String country,
    Color color,
    int multiplicity,
    int available}) :
        _available = available,
        _multiplicity = multiplicity,
        _color = color,
        _country = country,
        _price = price,
        _description = description,
        _title = title;

  String get title => _title;

  String get description => _description;

  String get photoPath => _photoPath;

  double get price => _price;

  int get available => _available;

  int get multiplicity => _multiplicity;

  Color get color => _color;

  String get country => _country;


}