import 'package:mobx/mobx.dart';
import 'package:zoorandomwiki/database/models/animal.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  Animal? animal;

  @action
  void setCurrentAnimal(Animal animal) {
    this.animal = animal;
  }
}
