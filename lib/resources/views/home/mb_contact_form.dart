import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_shop/resources/widgets/button_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MBContactForm extends StatefulWidget {
  final bool withIcons;
  final String destinationEmail;
  final bool hasHeading;
  const MBContactForm({
    Key? key,
    this.hasHeading = true,
    required this.withIcons,
    required this.destinationEmail,
  }) : super(key: key);

  @override
  State<MBContactForm> createState() => _MBContactFormState();
}

class _MBContactFormState extends State<MBContactForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameEditingController = TextEditingController();

  final TextEditingController _phoneEditingController = TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _messageEditingController = TextEditingController();

  late GoogleMapController mapController;


  String name = '';
  String phone = '';
  String email = '';
  String message = '';

  String mcontent ='<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3453.6684889591766!2d31.232986914593635!3d30.046367225437855!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1458418bb92b5ad9%3A0xe0a4c8f95a81ac3!2zTGEgcG9pcmUgQ2FmZSDZhNin2KjZiNin2LE!5e0!3m2!1sen!2seg!4v1626118298155!5m2!1sen!2seg" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"> </iframe>';

  /// Overrides the parent's [initState] method.
  @override
  void initState() {
    super.initState();
  }

  @override
  void _onMapCreated (GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _phoneEditingController.dispose();
    _emailEditingController.dispose();
    _messageEditingController.dispose();
    super.dispose();
  }

  String? _validateName(String name) {
    // Regular Expression for fullname (a space between first name and second name)
    String nameRegExp = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    if (name.isEmpty) {
      // Name field should not be empty
      return 'Vui lòng nhập Họ Tên';
    }
    if (!RegExp(nameRegExp).hasMatch(name)) {
      // If the value in name field doesn't match with the regular expression
      // then it throws an error message.
      return 'Cho một khoảng trống giữa \nhọ và tên của bạn';
    }
    return null;
  }

  String? _validateMobile(String phone) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (phone.length == 0) {
      return 'Vui lòng nhập số điện thoại di động';
    }
    else if (!regExp.hasMatch(phone)) {
      return 'Vui lòng nhập số điện thoại di động hợp lệ';
    }
    return null;
  }

  String? _validateEmail(String email) {
    // Regular Expression for email
    String emailRegExp =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (email.isEmpty) {
      // Name field should not be empty
      return 'Vui lòng nhập email';
    }
    if (!RegExp(emailRegExp).hasMatch(email)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Nhập chính xác.\nví dụ: username@example.com';
    }
    return null;
  }


  String? _validateMessage(String name) {
    if (name.isEmpty) {
      // Message field should not be empty
      return 'Vui lòng nhập nội dung';
    }
    return null;
  }

  /// [_sendEmail] redirects to gmail app with the message and name
  /// entered by the user.
  void _sendEmail(
      {required String destEmail, required String body, required String name}) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    /// [emailLaunchUri] sends an email to the destination email.
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: destEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Feedback from $name',
        'body': body,
      }),
    );

    launch(emailLaunchUri.toString());
  }

  void _send() {
   // _formKey.currentState?.validate();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _sendEmail(
          name: name,
          destEmail: widget.destinationEmail,
          body: message,
        );
      });
    }

  }

  void _clear(){
    _nameEditingController.clear();
    _phoneEditingController.clear();
    _emailEditingController.clear();
    _messageEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size SizeMap = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 30,
        bottom: 30,

      ),

      child:Column(
        children: [

          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 35,
            ),
            child: Text('Lầu 3, Tòa nhà SaigonTel, Lô 46, CVPM Quang Trung, P. Tân Chánh Hiệp, Q. 12, TP HCM.\n\n Tel: 028.37154879 - Fax: 028.37154878 \n\n Email: nina@nina.vn \n\n Mã số thuế: 0310179646 \n\n Tài khoản:6150201014457 \n\n Mở tại: Ngân hàng Agribank - chi nhánh Xuyên Á-TP.Hồ Chí Minh',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

         /// Contact Form

          Form(
        key: _formKey,
        child: Card(

          color: Color(0XFFf4f4f4),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0,),),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),

                ),

                // Name Field
                TextFormField(
                  controller: _nameEditingController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateName(value!),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                   /* icon: widget.withIcons
                        ? const Icon(Icons.person_outline)
                        : null,*/
                    label: const Text('Họ tên'),
                    hintText: 'Nhập họ tên',
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),


                // Name Field
                TextFormField(
                  controller: _phoneEditingController,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateMobile(value!),
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      phone = value!;
                    });
                  },
                  decoration: InputDecoration(
                    label: const Text('Số điện thoại'),
                    hintText: 'Nhập số điện thoại',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),


                // Email Field
                TextFormField(
                  controller: _emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateEmail(value!),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Nhập Email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Message or Feedback Field
                TextFormField(
                  controller: _messageEditingController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateMessage(value!),
                  onChanged: (value) {
                    setState(() {
                      message = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      message = value!;
                    });
                  },
                  decoration: InputDecoration(
                    label: const Text('Nội dung'),
                    hintText: 'Nhập nội dung',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Submit button
                Container(
                  margin: const EdgeInsets.only(top: 20.0,left: 10,right: 0),
                  child:  Row(
                    children: <Widget>[
                      Expanded(
                        child: ButtonWidget(
                          label: "Gửi",
                          widthButton: 50,
                          heightIcon: 35,

                          paddingTop: 10,
                          paddingLeft: 5,
                          paddingRight: 5,
                          paddingBottom: 10,
                          textColor: Colors.white,
                          backgroundColor: Color(0XFFc5122a),
                          fontSize: 14,
                          borderColor: Color(0XFFc5122a),
                          borderRadius: 5.0,
                          onPress: _send,

                        ),
                      ),

                      Padding(padding: EdgeInsets.all(10)),

                      Expanded(
                        child: ButtonWidget(
                          label: "Nhập lại",
                          widthButton: 50,
                          heightIcon: 35,
                          paddingTop: 10,
                          paddingLeft: 5,
                          paddingRight: 5,
                          paddingBottom: 10,
                          textColor: Colors.white,
                          backgroundColor: Color(0XFF6c757d),
                          fontSize: 14,
                          borderColor: Color(0XFF6c757d),
                          borderRadius: 5.0,
                          onPress: _clear,

                        ),
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


          /// Contact Map

          Padding(padding: EdgeInsets.all(10)),

          Center(
            //child: HtmlWidget(mcontent.toString()),
            child: Container(
              height: SizeMap.height * 0.85,
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 15.0,
                ),
                key: ValueKey('uniqueey'),
                onMapCreated: _onMapCreated,
                markers: {
                  Marker(
                      markerId: MarkerId('anyUniqueId'),
                      position: LatLng(37.42796133580664, -122.085749655962),
                      infoWindow: InfoWindow(title: 'Some Location'))
                },
              ),
            ),
          ),


        ],
    ),


    );
  }
}