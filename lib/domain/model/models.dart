// > onboarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.image, this.title, this.subTitle);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

// > login model

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class AuthObject {
  Contacts? customers;
  Contacts? contacts;
  AuthObject(this.customers, this.contacts);
}
