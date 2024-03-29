import 'package:equatable/equatable.dart';

import 'hit.dart';

class ImageModel extends Equatable {
  final int? total;
  final int? totalHits;
  final Hit? hits;

  const ImageModel({this.total, this.totalHits, this.hits});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        total: json['total'] as int?,
        totalHits: json['totalHits'] as int?,
        hits: json['hits'] 
            ,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalHits': totalHits,
        'hits': hits,
      };

  @override
  List<Object?> get props => [total, totalHits, hits];
}
