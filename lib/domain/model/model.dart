
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer{
  String id;
  String name;
  int numOfNotifications;
Customer(this.numOfNotifications,this.name,this.id);
}

class Contacts{
  String email;
  String phone;
  String link;

  Contacts(this.email,this.phone,this.link);
}

class Authentication{
  Customer? customer;
  Contacts? contacts;

  Authentication(this.contacts,this.customer);

}

class DeviceInfo{
  String name;
  String identifier;
  String version;
  DeviceInfo(this.name,this.identifier,this.version);
}