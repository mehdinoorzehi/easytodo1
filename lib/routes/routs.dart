import '../persian/add_pages/p_music_add.dart';
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
import '../persian/add_pages/p_art_add.dart';
import '../persian/add_pages/p_gym_add.dart';
import '../persian/add_pages/p_home_add.dart';
import '../persian/add_pages/p_movie_add.dart';
import '../persian/add_pages/p_shop_add.dart';
import '../persian/add_pages/p_study_add.dart';
import '../persian/add_pages/p_travel_add.dart';
import '../persian/add_pages/p_work_add.dart';
import '../persian/p_all_task_page.dart';
import '../persian/p_art_page.dart';
import '../persian/p_gym_page.dart';
import '../persian/p_home_page.dart';
import '../persian/p_hometask_page.dart';
import '../persian/p_movie_page.dart';
import '../persian/p_music_page.dart';
import '../persian/p_shop_page.dart';
import '../persian/p_study_page.dart';
import '../persian/p_travel_page.dart';
import '../persian/p_work_page.dart';

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
        //
        //
        //
        GetPage(name: '/pworkadd', page: () => const pWorkAddPage()),
        GetPage(name: '/pmusicadd', page: () => const pMusicAddPage()),
        GetPage(name: '/pmovieadd', page: () => const pMovieAddPage()),
        GetPage(name: '/pstudyadd', page: () => const pStudyAddPage()),
        GetPage(name: '/phomeadd', page: () => const pHomeAddPage()),
        GetPage(name: '/pshopadd', page: () => const pShopAddPage()),
        GetPage(name: '/partadd', page: () => const pArtAddPage()),
        GetPage(name: '/ptraveladd', page: () => const pTravelAddPage()),
        GetPage(name: '/pgymadd', page: () => const pGymAddPage()),
        //
        //
        //
        GetPage(name: '/pHomePage', page: () => const pHomePage()),
        GetPage(name: '/pAllTaskPage', page: () => const pAllTasksPages()),
        GetPage(name: '/pworkpage', page: () => const pWorkPage()),
        GetPage(name: '/pmusicpage', page: () => const pmusicPage()),
        GetPage(name: '/pmoviepage', page: () => const pmoviePage()),
        GetPage(name: '/pstudypage', page: () => const pstudyPage()),
        GetPage(name: '/phometaskpage', page: () => const phomeTaskPage()),
        GetPage(name: '/pshoppage', page: () => const pshopPage()),
        GetPage(name: '/partpage', page: () => const partPage()),
        GetPage(name: '/ptravelpage', page: () => const ptravelPage()),
        GetPage(name: '/pgympage', page: () => const pgymPage()),
      ];
}
