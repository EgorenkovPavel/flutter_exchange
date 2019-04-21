import 'flower.dart';

class Basket{
  List<BasketEntry> _flowers = [];

  addFlower(Flower flower, int amount){
    _flowers.add(BasketEntry(flower, amount));
  }

  int getLength(){
    return _flowers.length;
  }

  Flower getFlower(int pos){
    return _flowers[pos].flower;
  }

  int getAmount(int pos){
    return _flowers[pos].amount;
  }
}

class BasketEntry{
  Flower _flower;
  int _amount;

  BasketEntry(this._flower, this._amount);

  int get amount => _amount;

  Flower get flower => _flower;


}