import 'package:app/modules/home_module/blocs/_blocs.dart';
import 'package:app/modules/home_module/core/domain/usecases/get_motel_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMotelsUseCaseMock extends Mock implements GetMotelsUseCase{}
void main() {
  late HomeBloc homeBloc;
  late GetMotelsUseCase getMotelsUseCaseMock;

  var timeout = const Duration(seconds: 10);

  setUp(() {
    getMotelsUseCaseMock = GetMotelsUseCaseMock();
    homeBloc = HomeBloc(getMotelsUseCaseMock);
  });

  tearDown(() {
    homeBloc.close();
  });

  group('Success Cases', () {
    test('Initial State', () {
      expect(homeBloc.state.loading, false);
      expect(homeBloc.state.filters, {});
    });

    test('UpdateFilterEvent - Add Filter', () {
      // Action
      homeBloc.add(UpdateFilterEvent(key: 'key', value: 'value'));

      // Assert
      expect(homeBloc.state.filters, {});
      expect(homeBloc.state.loading, false);
      expectLater(
        homeBloc.stream,
        emitsInOrder(
          [
            homeBloc.state.copyWith(
              filters: {'key': 'value'},
              loading: false,
            ),
          ],
        ),
      ).timeout(timeout);
    });

    test('UpdateFilterEvent - Remove Filter', () {
      // Action
      homeBloc
        ..add(UpdateFilterEvent(key: 'key', value: 'value'))
        ..add(UpdateFilterEvent(key: 'key', value: 'value'));

      // Assert
      expectLater(
        homeBloc.stream,
        emitsInOrder(
          [
            homeBloc.state.copyWith(filters: {'key': 'value'}),
            homeBloc.state.copyWith(filters: {}),
          ],
        ),
      ).timeout(timeout);
    });
  });
}
