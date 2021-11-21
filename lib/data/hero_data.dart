import 'package:flutter_application_2/data/image_data.dart' as image_data;
import 'package:flutter_application_2/model/hero_hr.dart';


final listOfHeros = <HeroHr>[
   HeroHr(
    id: 1,
    name: 'Marques Brownlee',
    description: 'Tech Reviewer',
    urlImage: image_data.mkbhd,
    powers: 'A public speeking',
    rate: 3,
  ),
  HeroHr(
    id: 2,
    name: 'Elliot',
    description: 'Profissional Hacker, he speacks to Mr robot sometimes',
    urlImage: image_data.mrRobot,
    powers: 'Networking, definatly social skills',
    rate: 3,
  ),
  HeroHr(
    id: 3,
    name: 'Elon Musk',
    description: 'Tesla owner',
    urlImage: image_data.elon,
    powers: 'Rockets',
    rate: 3,
  ),
];

