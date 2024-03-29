import 'package:equatable/equatable.dart';

class Hit extends Equatable {
  final int? id;
  final String? pageUrl;
  final String? type;
  final String? tags;
  final String? previewUrl;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatUrl;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? collections;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageUrl;

  const Hit({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json['id'] as int?,
        pageUrl: json['pageURL'] as String?,
        type: json['type'] as String?,
        tags: json['tags'] as String?,
        previewUrl: json['previewURL'] as String?,
        previewWidth: json['previewWidth'] as int?,
        previewHeight: json['previewHeight'] as int?,
        webformatUrl: json['webformatURL'] as String?,
        webformatWidth: json['webformatWidth'] as int?,
        webformatHeight: json['webformatHeight'] as int?,
        largeImageUrl: json['largeImageURL'] as String?,
        imageWidth: json['imageWidth'] as int?,
        imageHeight: json['imageHeight'] as int?,
        imageSize: json['imageSize'] as int?,
        views: json['views'] as int?,
        downloads: json['downloads'] as int?,
        collections: json['collections'] as int?,
        likes: json['likes'] as int?,
        comments: json['comments'] as int?,
        userId: json['user_id'] as int?,
        user: json['user'] as String?,
        userImageUrl: json['userImageURL'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pageURL': pageUrl,
        'type': type,
        'tags': tags,
        'previewURL': previewUrl,
        'previewWidth': previewWidth,
        'previewHeight': previewHeight,
        'webformatURL': webformatUrl,
        'webformatWidth': webformatWidth,
        'webformatHeight': webformatHeight,
        'largeImageURL': largeImageUrl,
        'imageWidth': imageWidth,
        'imageHeight': imageHeight,
        'imageSize': imageSize,
        'views': views,
        'downloads': downloads,
        'collections': collections,
        'likes': likes,
        'comments': comments,
        'user_id': userId,
        'user': user,
        'userImageURL': userImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      pageUrl,
      type,
      tags,
      previewUrl,
      previewWidth,
      previewHeight,
      webformatUrl,
      webformatWidth,
      webformatHeight,
      largeImageUrl,
      imageWidth,
      imageHeight,
      imageSize,
      views,
      downloads,
      collections,
      likes,
      comments,
      userId,
      user,
      userImageUrl,
    ];
  }
}
