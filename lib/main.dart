import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Providers/categories_provider.dart';
import 'package:ora_app/Providers/change_password_provider.dart';
import 'package:ora_app/Providers/get_subCats_provider.dart';
import 'package:ora_app/Providers/login_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/add_address.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/cart.dart';
import 'package:ora_app/catalogue.dart';
import 'package:ora_app/events_and_educations.dart';
import 'package:ora_app/existing_cards.dart';
import 'package:ora_app/landingPage/Splash_two.dart';

import 'package:ora_app/landingPage/splash_one.dart';
import 'package:ora_app/list_products/Products_list.dart';

import 'package:ora_app/products.dart';
import 'package:ora_app/profile.dart';
import 'package:ora_app/search/model/search/search_model.dart';
import 'package:ora_app/sign_in.dart';
import 'package:ora_app/sign_up.dart';
import 'package:ora_app/sub_categries_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contact_us/contact_us.dart';
import 'endo_systems/endo_systems.dart';
import 'home_page.dart';
import 'landingPage/landing_page.dart';
import 'my_orders/my_orders.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:  Color(0xFF0d8083)
  ));
  WidgetsFlutterBinding.ensureInitialized();
  LogInProvider mainProvider = new LogInProvider();
  SessionManager sessionManager = SessionManager();
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool value = sp.getBool("FIRST");
  if (value == null) {
    value = true;
  }


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LogInProvider>(create: (_) => LogInProvider()),


      ChangeNotifierProvider<ChangePasswordProvider>(create: (_) => ChangePasswordProvider()),
      ChangeNotifierProvider<SubCategoryProvider>(
          create: (context) => SubCategoryProvider()),
      ChangeNotifierProvider<CategoriesProvider>(
          create: (context) => CategoriesProvider()),
      ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
    ],

    child: MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0d8083),
        accentColor: Colors.white,
        cardColor: Color(0xFF275C5D),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => value ? LandingPage() : BottomBar(),
        '/splash': (context) => SecondSplash(),
         '/Home': (context) => BottomBar(),
         '/PROFILE': (context) => Profile(),
        '/IMPLANTS': (context) => SubCategories(),
        '/PROSTHETIC': (context) => SubCategories(),
        '/EVENTS & EDUCATIONS': (context) => EventsAndEducations(),
        '/CATALOGUE': (context) => Catalogue(),
         '/0': (context) => BottomBar(),
         '/1': (context) => MyCart(),
         '/2': (context) => Profile(),
        '/MY ORDERS': (context) => MyOrders(),
        '/Login | Register': (context) => SignIn(),
        '/reg': (BuildContext context) => SignUp(),
        '/address': (BuildContext context) => Address(),
        '/existing-cards': (BuildContext context) => ExistingCardsPage(),
        '/sub-categories': (BuildContext context) => SubCategories(),
        '/CONTACT US': (BuildContext context) => ContactUs(),
        '/ENDO SYSTEM': (BuildContext context) => EndoSystems(),
        '/products_list': (BuildContext context) => ProductList(),
      },
    ),
  ));
}
