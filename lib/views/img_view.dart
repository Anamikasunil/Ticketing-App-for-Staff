import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/API/api.dart';

class ImgView extends StatefulWidget {
  String image ;
   ImgView({
    required this.image,
    super.key});

  @override
  State<ImgView> createState() => _ImgViewState();
}

class _ImgViewState extends State<ImgView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.image}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network('$MAIN_API${widget.image}'),
    );
  }
}