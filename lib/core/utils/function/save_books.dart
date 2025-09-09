import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
