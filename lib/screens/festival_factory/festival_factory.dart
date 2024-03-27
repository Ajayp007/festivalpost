class MaptoModel
{
  String? name,date,image,disc;

  MaptoModel(this.name,this.date,this.image,this.disc);

  factory MaptoModel.myfestival(Map myfestival) {
    MaptoModel m1 = MaptoModel(myfestival["name"],myfestival["date"],myfestival["image"],myfestival["disc"]);
    return m1;
  }

}

class FestivalModel
{
  String? name,image,disc;
  List<String> imageList =[];

  FestivalModel(this.name,this.image,this.imageList,this.disc);

}