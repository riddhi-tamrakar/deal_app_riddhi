import 'package:dio/dio.dart';
import 'package:deal_app/core/constant/api_constants.dart';
import 'package:deal_app/data/models/deal_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static late ApiService _instance;
  static ApiService get instance => _instance;

  // ✅ Make this static so it works from main()
  static void init() {
    final dio = Dio(BaseOptions(headers: ApiConstants.headers));
    _instance = ApiService(dio);
  }

  @GET("/new")
  Future<DealResponseModel> getTopDeals(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("fields") String fields,
  ) async {
    final response = await _instance.getTopDeals(perPage, page, fields);
    // Save fetched data to local database
    return response;
  }

  @GET("/discussed")
  Future<DealResponseModel> getDiscussedDeals(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("fields") String fields,
  ) async {
    final response = await _instance.getDiscussedDeals(perPage, page, fields);
    // Save fetched data to local database
    return response;
  }
}
