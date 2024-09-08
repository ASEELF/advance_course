


//this mapper converts the response into a non nullable objects(model)

import 'package:advanced_course/data/extensions.dart';

import '../../domain/model.dart';
import '../responses/responses.dart';


const EMPTY= " ";
const ZERO=0;

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(
        this?.numOfNotifications?.orZero()?? ZERO,
        this?.name?.orEmpty()?? EMPTY,
        this?.id?.orEmpty()?? EMPTY);

  }
}


extension ContactResponseMapper on ContactsResponse?{
  Contacts toDomain(){
    return Contacts(
        this?.email?.orEmpty()?? EMPTY,
        this?.phone?.orEmpty()?? EMPTY,
        this?.link?.orEmpty()?? EMPTY
    );

  }
}


extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(

        this?.contacts?.toDomain(),
        this?.customer?.toDomain()
    );

  }
}


