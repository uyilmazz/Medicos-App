import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserViewModel extends ChangeNotifier {
  bool isUpcoming = true;

  User fakeUser = User(
      name: 'Wade Warrenn',
      address: '4517 Washington Ave. Manchester, Kentucky 39495',
      phoneNumber: '(603) 555-0123',
      email: 'abc@gmail.com',
      imageUrl: 'user_profile',
      zipCode: 27400,
      cart: Cart(cartItems: []));

  void changeAppointment(bool value) {
    isUpcoming = value;
    notifyListeners();
  }
}
