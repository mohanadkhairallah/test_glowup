import '../../models/offer_model.dart';

abstract class OfferState {}

class Init extends OfferState {}

class Success extends OfferState {
  List<OfferModel>? offers;
  Success(this.offers);
}

class Error extends OfferState {
  String? error;
  Error(this.error);
}

class Loading extends OfferState {}
