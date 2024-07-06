
import 'package:get/get.dart';

class FavoriteController extends GetxController{

  RxList<String> fruitList = ['orange','apple','mango','banana', 'grapes'].obs;
  RxList tempFruitList = [].obs;

  addToFavorite(String value){
    tempFruitList.add(value);
  }

  removeFromFavorite(String value){
    tempFruitList.remove(value);
  }

}