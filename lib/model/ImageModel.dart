class ImageModel{

  String? filename;
  String? url;

  ImageModel({this.filename,this.url});

  factory ImageModel.fromJson(Map<String,dynamic> json){
    return ImageModel(
      filename: json['filename'],
      url: json['url'],
    );
  }

}