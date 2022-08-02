import 'package:flutter/material.dart';
class ImageSize extends StatefulWidget {
  _NetworkImageSize createState() => _NetworkImageSize();
}

class _NetworkImageSize extends State<ImageSize> {
 String imageURL ="https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg";
  late Size imageSize = const Size(0.00, 0.00);
  void _getImageDimension() {
    Image image = Image.asset("images/demo-36-2337.jpg");
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          setState(() {
            imageSize =
                Size(myImage.width.toDouble(), myImage.height.toDouble());
          });
        },
      ),
    );
  }


  Widget build(BuildContext context) {
    return Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    imageURL,
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.all(7),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text('Get Image Size'),
                      onPressed: _getImageDimension,
                    ),
                  ),
                  Text(
                    imageSize != null
                        ? 'Image Width : ${imageSize.width.toString()} px'
                        : '',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    imageSize != null
                        ? 'Image Height : ${imageSize.height.toString()} px'
                        : '',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),


        );
  }


}