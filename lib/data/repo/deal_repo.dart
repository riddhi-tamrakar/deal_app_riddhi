import 'package:deal_app/data/service/api_service.dart';

import '../models/deal_model.dart';

class DealRepository {
  final _fields =
      'id,created_at,created_at_in_millis,image_medium,comments_count,store{name},title';

  Future<List<DealModel>> getDeals(String type, int page) async {
    final response = type == 'top'
        ? await ApiService.instance.getTopDeals(10, page, _fields)
        : await ApiService.instance.getDiscussedDeals(10, page, _fields);
    return response.deals;
  }
}
