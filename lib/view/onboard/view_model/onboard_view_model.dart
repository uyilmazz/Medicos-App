import 'package:flutter/material.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/extensions/string_extension.dart';
import '../model/onboard_model.dart';
import 'package:mobx/mobx.dart';
import '../../../core/init/language/locale_keys.g.dart';
part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  late BuildContext context;

  @observable
  List<OnBoard>? onboardList;

  @observable
  int pageViewItemIndex = 0;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    onboardList = [
      OnBoard('onboard1', LocaleKeys.startedSlider_lookingForaDoctor.locale),
      OnBoard(
          'onboard2', LocaleKeys.startedSlider_wantaDoctorAppointment.locale),
      OnBoard('onboard3', LocaleKeys.startedSlider_wantAnOnlineDoctor.locale),
    ];
  }

  @action
  void changePageViewItemIndex(int value) {
    pageViewItemIndex = value;
  }
}
