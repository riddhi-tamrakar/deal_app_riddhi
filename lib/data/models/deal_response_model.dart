import 'deal_model.dart';

class DealResponseModel {
  final List<DealModel> deals;

  DealResponseModel({required this.deals});

  factory DealResponseModel.fromJson(Map<String, dynamic> json) {
    final rawList = json['deals'] as List<dynamic>? ?? [];
    return DealResponseModel(
      deals: rawList.map((e) => DealModel.fromJson(e)).toList(),
    );
  }
}