import 'package:redux/redux.dart';
import 'actions.dart';
import 'app_state.dart';

Reducer<AppState> reducer() {
  final combined = combineReducers([
    TypedReducer(_characterLoadingState),
    TypedReducer(_characterReadyState),
  ]);

  return combined;
}

AppState _characterLoadingState(
  AppState state,
  GetCharacterAction _,
) =>
    const LoadingState();

AppState _characterReadyState(
  AppState state,
  LoadedCharacterAction action,
) =>
    SuccessState(action.name, action.image);
