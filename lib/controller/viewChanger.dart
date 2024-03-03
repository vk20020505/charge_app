
import 'package:get/get.dart';

class viewChanger extends GetxController{
  RxBool viewControl= false.obs;


 void changeView(){
    viewControl.value = !viewControl.value;

  }
  
}