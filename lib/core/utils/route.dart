import 'package:get/get.dart';
import 'package:deal_app/views/home/pages/home_page.dart';


class AppRoutes {
  // A static list of pages (routes) used in GetX routing
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
    // GetPage(
    //   name: '/petDetails',
    //   page: () => PetDetails(),
    //   transition: Transition.fadeIn, // Optional: You can add transitions here
    // ),
    
  ];
}
