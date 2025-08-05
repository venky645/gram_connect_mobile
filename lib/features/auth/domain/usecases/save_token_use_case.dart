import 'package:gram_connect/core/usecases/usecase.dart';
import 'package:gram_connect/services/shared_pref_service.dart';

class SaveTokenUseCase extends Usecase<void, String> {
  final SharedPrefService _sharedPrefService;
  SaveTokenUseCase(this._sharedPrefService);
  @override
  Future<void> call(String token) async {
    return _sharedPrefService.saveToken(token);
  }
}
