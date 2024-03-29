
import 'package:hive/hive.dart';
part 'picture_cat_model.g.dart';
@HiveType(typeId: 0)
class PicCat  extends HiveObject {
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String type;

  PicCat(  {
    required this.image,
    required this.type,
  });

  factory PicCat.fromJosn({required String image ,required String type}) {
    return PicCat(
      image: image,
      type: type,
    );
  }
}
