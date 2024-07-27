import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/add_pages/art_add.dart';
import '../pages/add_pages/gym_add.dart';
import '../pages/add_pages/home_add.dart';
import '../pages/add_pages/movie_add.dart';
import '../pages/add_pages/music_add.dart';
import '../pages/add_pages/shop_add.dart';
import '../pages/add_pages/study_add.dart';
import '../pages/add_pages/travel_add.dart';
import '../pages/add_pages/work_add.dart';
import '../pages/all_task_page.dart';
import '../pages/art_page.dart';
import '../pages/gym_page.dart';
import '../pages/home_page.dart';
import '../pages/hometask_page.dart';
import '../pages/movie_page.dart';
import '../pages/music_page.dart';
import '../pages/shop_page.dart';
import '../pages/study_page.dart';
import '../pages/travel_page.dart';
import '../pages/work_page.dart';


class Routs {
  static List<GetPage> get pages => [
        GetPage(name: '/HomePage', page: () => const HomePage()),
        GetPage(name: '/AllTaskPage', page: () => const AllTasksPages()),
        GetPage(name: '/workpage', page: () => const WorkPage()),
        GetPage(name: '/musicpage', page: () => const musicPage()),
        GetPage(name: '/moviepage', page: () => const moviePage()),
        GetPage(name: '/studypage', page: () => const studyPage()),
        GetPage(name: '/hometaskpage', page: () => const homeTaskPage()),
        GetPage(name: '/shoppage', page: () => const shopPage()),
        GetPage(name: '/artpage', page: () => const artPage()),
        GetPage(name: '/travelpage', page: () => const travelPage()),
        GetPage(name: '/gympage', page: () => const gymPage()),
        //
        //
        //
        GetPage(name: '/workadd', page: () => const WorkAddPage()),
        GetPage(name: '/musicadd', page: () => const MusicAddPage()),
        GetPage(name: '/movieadd', page: () => const MovieAddPage()),
        GetPage(name: '/studyadd', page: () => const StudyAddPage()),
        GetPage(name: '/homeadd', page: () => const HomeAddPage()),
        GetPage(name: '/shopadd', page: () => const ShopAddPage()),
        GetPage(name: '/artadd', page: () => const ArtAddPage()),
        GetPage(name: '/traveladd', page: () => const TravelAddPage()),
        GetPage(name: '/gymadd', page: () => const GymAddPage()),
  
      ];
}
