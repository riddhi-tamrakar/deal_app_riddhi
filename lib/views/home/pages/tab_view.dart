import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deal_app/views/home/controller/deal_controller.dart';
import 'package:deal_app/views/widgets/deal_card.dart';


class TabView extends StatelessWidget {
  final String tabType;
  const TabView({super.key, required this.tabType});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DealController(tabType), tag: tabType);

    return Obx(() {
      if (controller.isLoading.value && controller.deals.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
        onRefresh: () async => controller.fetchDeals(refresh: true),
        child: ListView.builder(
          itemCount: controller.deals.length,
          itemBuilder: (_, index) => DealCard(
            deal: controller.deals[index],
            
          ),
        ),
      );
    });
  }
}
