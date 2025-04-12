import 'package:flutter/material.dart';
import 'package:deal_app/core/utils/colors.dart';
import 'package:deal_app/views/widgets/drawer.dart';
import 'tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          title: const Text('Deals'),
          bottom: const TabBar(
            labelColor: AppColors.cardBackground,
            unselectedLabelColor: AppColors.cardBackground,
            tabs: [
              Tab(text: 'TOP',),
              Tab(text: 'POPULAR'),
              Tab(text: 'FEATURED'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabView(tabType: 'top'),
            TabView(tabType: 'popular'),
            TabView(tabType: 'featured'),
          ],
        ),
      ),
    );
  }
}