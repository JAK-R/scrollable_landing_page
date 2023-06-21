

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/page_provider.dart';
import '../shared/custom_app_menu.dart';


import '../views/home_view.dart';
import 'package:scrollable_landing_page_web/ui/views/about_view.dart';
import 'package:scrollable_landing_page_web/ui/views/contact_view.dart';
import 'package:scrollable_landing_page_web/ui/views/location_view.dart';
import 'package:scrollable_landing_page_web/ui/views/pricing_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [

            _HomeBody(),

            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu())

            ]
          ),
      ),

    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(colors: [
      Colors.pink, Colors.black
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      )
  );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
        
      ],
    );
  }
}