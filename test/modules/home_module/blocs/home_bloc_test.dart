import 'package:app/core/_core.dart';
import 'package:app/modules/base_module/blocs/_blocs.dart';
import 'package:app/modules/home_module/blocs/_blocs.dart';
import 'package:app/modules/home_module/core/usecases/_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../base_module/mock_data.dart';
import '../mock_data.dart';

class GetMotelsUseCaseMock extends Mock implements GetMotelsUseCase {}

class BaseBlocMock extends Mock implements BaseBloc {}

void main() {
  late HomeBloc homeBloc;
  late BaseBloc baseBlocMock;
  late GetMotelsUseCase getMotelsUseCaseMock;

  var timeout = const Duration(seconds: 10);

  setUp(() {
    baseBlocMock = BaseBlocMock();
    getMotelsUseCaseMock = GetMotelsUseCaseMock();
    homeBloc = HomeBloc(baseBlocMock, getMotelsUseCaseMock);
  });

  tearDown(() {
    homeBloc.close();
    reset(getMotelsUseCaseMock);
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

    test('GetMotelsListEvent - change loading and list', () {
      // Assert
      when(() => baseBlocMock.state)
          .thenReturn(BaseState(selectedLocation: mockLocationsModel.first));
      when(() => getMotelsUseCaseMock(location: mockLocationsModel.first.location))
          .thenAnswer((_) async => mockPagination);

      // Action
      homeBloc.add(GetMotelsListEvent());

      // Assert
      expectLater(
        homeBloc.stream,
        emitsInOrder(
          [
            homeBloc.state.copyWith(loading: true),
            homeBloc.state.copyWith(loading: false, motels: mockPagination.motels),
          ],
        ),
      ).timeout(timeout);
    });
  });

  group('Fail Cases', () {
    test('GetMotelsListEvent - change failure state and empty motels and loading false', () {
      // Arrange
      var failure = Failure(title: 'title', message: 'message');
      when(() => baseBlocMock.state)
          .thenReturn(BaseState(selectedLocation: mockLocationsModel.first));
      when(() => getMotelsUseCaseMock(location: mockLocationsModel.first.location))
          .thenThrow(failure);

      // Action
      homeBloc.add(GetMotelsListEvent());

      // Assert
      expectLater(
        homeBloc.stream,
        emitsInOrder(
          [
            homeBloc.state.copyWith(loading: true),
            homeBloc.state.copyWith(loading: false, failure: failure, motels: []),
          ],
        ),
      ).timeout(timeout);
    });

    test('FailureEvent - change failure state and empty motels and loading false', () {
      // Arrange
      var failure = Failure(title: 'title', message: 'message');
      when(() => baseBlocMock.state)
          .thenReturn(BaseState(selectedLocation: mockLocationsModel.first));

      // Action
      homeBloc.add(FailureEvent(failure));

      // Assert
      expectLater(
        homeBloc.stream,
        emits(homeBloc.state.copyWith(failure: failure, loading: false, motels: [])),
      ).timeout(timeout);
    });
  });
}
