import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Providers/categories_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/drawer.dart';
import 'package:ora_app/list_products/Products_list.dart';
import 'package:ora_app/products.dart';
import 'package:ora_app/sub_categries_screen.dart';
import 'package:ora_app/widget/MainWidget.dart';
import 'package:provider/provider.dart';
import 'Models/cartModel.dart';
import 'Network/API.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SessionManager sessionManager = SessionManager();
  var categories = new List<CategoryResponseModel>();



  Future<List<CategoryResponseModel>> getCategories() async {
    final String apiUrl = 'http://ora.hashtagweb.online/api/getCategories';

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      debugPrint('responsetest: ${responseString}');
      setState(() {
        Iterable list = json.decode(response.body);
        categories =
            list.map((model) => CategoryResponseModel.fromJson(model)).toList();
      });
      return categoryResponseModelFromJson(responseString);
    } else {
      debugPrint('responsetest: ${response.statusCode.toString()}');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    // _getCategories();

    Provider.of<CategoriesProvider>(context, listen: false)
        .getCategories()
        .then((value) {});



  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Provider.of<CategoriesProvider>(context).categoryList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.teal,
                      ),
                    )
                  : ListView.builder(
                      itemCount: Provider.of<CategoriesProvider>(context,
                              listen: false)
                          .categoryList
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductList()),
                              );
                            },
                            child: MainWidget(
                                Provider.of<CategoriesProvider>(context)
                                    .categoryList[index]
                                    .engName,
                                Provider.of<CategoriesProvider>(context)
                                    .categoryList[index]
                                    .imageUrl,
                                context),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

    );
  }
}
