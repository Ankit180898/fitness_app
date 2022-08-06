import 'package:flutter_svg/flutter_svg.dart';

class Swimming{
  SvgPicture image;
  String title;
  String location;
  double rating;

  Swimming({required this.title,required this.rating,required this.image,required this.location});


}

List<Swimming> swimmingDetails=[
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image: SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
  Swimming(image:SvgPicture.asset("assets/images/swim2.svg"), rating: 4.5, location: 'Whitefield, Bengaluru', title: 'Cult Fit',),
];