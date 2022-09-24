// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$animalAtom = Atom(name: '_HomeStore.animal', context: context);

  @override
  Animal? get animal {
    _$animalAtom.reportRead();
    return super.animal;
  }

  @override
  set animal(Animal? value) {
    _$animalAtom.reportWrite(value, super.animal, () {
      super.animal = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setCurrentAnimal(Animal animal) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setCurrentAnimal');
    try {
      return super.setCurrentAnimal(animal);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animal: ${animal}
    ''';
  }
}
