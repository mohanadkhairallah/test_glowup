import 'package:amjad/models/offer_model.dart';
import 'package:dartz/dartz.dart';

import '../remote_data/api_const.dart';
import '../remote_data/api_handler/base_api_client.dart';

class OfferRepository {
  Future<Either<String, List<OfferModel>>> getOffers() async {
    return BaseApiClient.get<List<OfferModel>>(
        url: ApiConst.getOffers,
        converter: (e) {
          return OfferModel.listFromJson(e["content"]["offers"]);
        });
  }
}
