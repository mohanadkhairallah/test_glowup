import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/offer_repository.dart';
import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferRepository offerRepository = OfferRepository();

  OfferBloc() : super(Init()) {
    on<OfferEvent>((event, emit) async {
      if (event is GetHomeOffers) {
        emit(Loading());
        final response = await offerRepository.getOffers();
        response.fold((l) {
          emit(Error(l));
        }, (r) {
          print(r.length);
          emit(Success(r));
        });
      }
    });
  }
}
