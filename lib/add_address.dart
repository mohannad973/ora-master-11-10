import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'modules.dart';
import 'app_bar.dart';
import 'Utils/decorations.dart';
import 'Models/SignUpModel.dart';
import 'package:http/http.dart' as http;
import 'package:ora_app/sign_up.dart';
class Address extends StatefulWidget {
  final AddressModul address;


  const Address({Key key, this.address}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

Future<SignUpModel> register(String email, String password) async{
  final String apiUrl = "http://ora.hashtagweb.online/api/register";
  final response = await http.post(apiUrl,body:{
    "email":email,
    "password":password
  } );


  if(response.statusCode==200){
    final String responseString = response.body;
    return signUpModelFromJson(responseString);

  }else{
    return null;
  }

}

class _AddressState extends State<Address> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(context, barWithBack(context), Text ('Add Address'),barWithSearch(context)),
       body: AddressFormUI(),

    );

  }
  
}

class AddressFormUI extends StatefulWidget {
  @override
  _AddressFormUIState createState() => _AddressFormUIState();
}

class _AddressFormUIState extends State<AddressFormUI> {
  String countryCode='';
  final TextEditingController countryController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController adreesLine1Controller = TextEditingController();
  final TextEditingController adressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Form(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Country',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(border: Border.all()),
                    child:CountryCodePicker(
                      initialSelection: 'DE',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: true,
                      favorite: ['+49'],
                      alignLeft: true,
                      onChanged: (CountryCode code){
                        setState(() => countryCode = code.toString());
                      },
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: fullNameController,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Address Line 1',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: adreesLine1Controller,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Address Line 2',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: adressLine2Controller,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'City',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: cityController,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'State',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: stateController,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Zip Code',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: zipCodeController,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom : 8.0 , left: 3.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: phoneController,
                      decoration: inputDecoration().copyWith(hintText: ''),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ) ,
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: RaisedButton(
              color: Color(0xFF275C5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              onPressed: () {
                final addressModul = AddressModul(countryCode,fullNameController.text,adreesLine1Controller.text,
                    adressLine2Controller.text,cityController.text,stateController.text,zipCodeController.text,phoneController.text);
              Navigator.pop(
                context

              );
              },
              child: Text(
                "Add address",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}

