import '../screens/festival_factory/festival_factory.dart';

Global g1 = Global();

class Global
{
  List<Map> festival = [
    {'name':'Shankranti','date':'14/01/2024','image':'assets/images/shan_main.jpeg','disc':'Makara Sankranti is regarded as important for spiritual practices and accordingly, people take a holy dip in rivers, especially Ganga, Yamuna, Godavari, Krishna '},
    {'name':'Holi','date':'25/03/2024','image':'assets/images/holi_main.jpg','disc':'Holi is a popular and significant Hindu festival celebrated as the Festival of Colours, Love, and Spring. It celebrates the eternal and divine love of the deities Radha and Krishna.'},
    {'name':'Rakshabandhan','date':'12/10/2024','image':'assets/images/raks_main.jpeg','disc':'Raksha Bandhan is a popular and traditionally Hindu annual rite or ceremony that is central to a festival of the same name celebrated in South Asia. '},
    {'name':'Diwali','date':'27/11/2024','image':'assets/images/diwalimain.webp','disc':'Diwali is the Hindu festival of lights, with variations celebrated in other Indian religions. It symbolises the spiritual "victory of light over darkness, good over evil, and knowledge over ignorance".'},
  ];

  List<String>shankranti = [
    "assets/images/shan1.jpeg",
    "assets/images/shan2.jpeg",
    "assets/images/shan3.jpeg",
  ];

  List<String> holi =[
    "assets/images/holi1.webp",
    "assets/images/holi2.jpg",
    "assets/images/holi3.jpg",
  ];

  List<String> raksha = [
    "assets/images/raks1.webp",
    "assets/images/raks3.jpg",
    "assets/images/raks_main.jpeg",
  ];
  List<String> diwali =[
    "assets/images/diwali1.jpg",
    "assets/images/diwali2.jpg",
    "assets/images/diwalimain.webp",
  ];

  String? contactName;
  String? contactEmail;
  String? contactPhone;
  String? contactAdd;
  String? profileImage;

  List<MaptoModel> myfestival=[];



  void generate() {
    myfestival = festival.map((e) => MaptoModel.myfestival(e)).toList();
  }

}