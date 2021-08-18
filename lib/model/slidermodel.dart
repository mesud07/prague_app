class Slidermodel{
  final title;
  final description;
  final urlname;

  Slidermodel(this.title, this.description, this.urlname);

}
List<Slidermodel> pageItemList = [
  Slidermodel("Welcome to PRAGUE COOLPASS", "The mobile app of prague CoolPass (formaerly Prague Card) will guide "
      "you to more than 100 best attractions in prague and enable you to buy a moile Pass or "
      "smart Card to enjoy free entries to these attractions.", "asset/images/slider1.jpg"),
  Slidermodel("EXPLORE PRAGUE ATTRACTIONS", "Find your way in Prague using this guide with offline navigation and receive"
      "most updated information about attractions around you.It is free to use this applications for information about the "
      "attractions and navigation.", "asset/images/slider2.jpg"),
  Slidermodel("..AND MUCH MORE ", "Browse the attractions, filter them by types areas or by your interests. Check the opening hours,"
      " nearest public transport stop, plan your own oute by marking favorite plaves, be informed about closures and changes, use navigation"
      "and much more.", "asset/images/slider3.jpg")
];