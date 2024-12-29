import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../helper/Shared/Local_NetWork.dart';
part 'app_language_event.dart';
part 'app_language_state.dart';

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {
  AppLanguageBloc() : super(AppLanguageInitial()) {
    on<AppLanguageEvent>((event, emit)  async{
      if (event is InithalAppLanguageEvent) {
        String? savedLanguage = await CashNetwork.getCashData(key: 'languageCode');
        if (savedLanguage != null && savedLanguage.isNotEmpty) {
          emit(AppChangeLanguage(languageCode: savedLanguage));
        } else {
          emit(AppChangeLanguage(languageCode: 'en'));
        }
      } else if (event is ArabicLanguageEvent) {
        await CashNetwork.insertTocash(key: 'languageCode', value: 'ar'); // حفظ اللغة العربية
        emit(AppChangeLanguage(languageCode: 'ar'));
      } else if (event is EnglishLanguageEvent) {
        await CashNetwork.insertTocash(key: 'languageCode', value: 'en'); // حفظ اللغة الإنجليزية
        emit(AppChangeLanguage(languageCode: 'en'));
      }
    });
  }
}
