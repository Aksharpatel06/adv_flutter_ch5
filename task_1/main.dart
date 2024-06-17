import 'modal/main_modal.dart';
import 'utils/data.dart';

void main() {
  for (int i = 0; i < dataList.length; i++) {
    MainModal mainModal = MainModal.fromJson(dataList[i]);

    print("${mainModal.id} person details\n");
    print("id: ${mainModal.id}");
    print("name: ${mainModal.name}");
    print("username: ${mainModal.username}");
    print("email: ${mainModal.email}");
    print("address:");
    print("     street: ${mainModal.addressModal.street}");
    print("     suite: ${mainModal.addressModal.suite}");
    print("     city: ${mainModal.addressModal.city}");
    print("     zipcode: ${mainModal.addressModal.zipcode}");
    print("     geo:");
    print("       lng: ${mainModal.addressModal.geoModal.lng}");
    print("       lat: ${mainModal.addressModal.geoModal.lat}");
    print("phone: ${mainModal.phone}");
    print("website: ${mainModal.website}");
    print("company:");
    print("     name: ${mainModal.companyModal.name}");
    print("     catchPhrase: ${mainModal.companyModal.catchPhrase}");
    print("     bs: ${mainModal.companyModal.bs}\n\n");
  }
}
