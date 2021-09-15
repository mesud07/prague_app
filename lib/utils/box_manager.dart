class BoxManager{

  static BoxManager? _instance;
  static BoxManager get instance{
    _instance ??= BoxManager._init();
    return _instance!;
  }
  BoxManager._init();
   final favoritesbox = 'favorite_areas';
   final keyNameCounter = 'counterKey';


}


