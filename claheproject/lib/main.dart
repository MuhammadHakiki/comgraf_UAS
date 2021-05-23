import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:photo_basic_filters_example/color_filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final picker = ImagePicker();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> imageBytes;
  File images;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("CLAHE"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: new Container(
            child: images == null
                ? Center(
                    child: new Text('No image selected.'),
                  )
                : Image.file(new File(images.path)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
          backgroundColor: Colors.green,
        ),
      );

  Future<void> pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images = File(image.path);
      });
    }
  }

  Future<void> pickImage1() async {
    // ColorFiltered(
    //colorFilter: ColorFilters.invert,
    //colorFilter: ColorFilter.mode(Colors.orange, BlendMode.color),
    //child: buildImage(),
    //);
    setState(() {
      this.imageBytes = File(images.path).readAsBytesSync();
    });
  }

  Widget buildImage() {
    return imageBytes != null ? Image.memory(imageBytes) : Container();
  }
}
