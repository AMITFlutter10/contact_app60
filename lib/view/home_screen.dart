import 'package:contact_app60/cubit/contact_cubit/contact_cubit.dart';
import 'package:contact_app60/view/widgets/default_form_field.dart';
import 'package:contact_app60/view/widgets/default_phone_form.dart';
import 'package:contact_app60/view/widgets/default_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  CountryCode myCountry = CountryCode(name:"EG" , dialCode:"+20" );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
  listener: (context, state) {
    if(state is InsertContactSuccessState)
      Navigator.pop(context);
  },
  builder: (context, state) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if(ContactCubit.get(context).isBottomSheetShow){
            if(formKey.currentState!.validate()){
              await ContactCubit.get(context).insertContacts(
                  name: nameController.text,
                  phone: "${myCountry.dialCode}${phoneController.text}");
            }
          }else {
          scaffoldKey.currentState!.showBottomSheet((context) {
            return Container(
              padding: EdgeInsets.all(10.h),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    DefaultFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter name";
                        }
                        return null;
                      },
                      hintText: "contact name",
                    ),
                    DefaultPhoneField(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter name";
                        }
                        return null;
                      },
                      onChange: (countryCode){
                        myCountry =countryCode;
                      },
                      hintText: "contact phone",
                    )
                  ],
                ),
              ),
            );
          })
              .closed.then((value)=>ContactCubit.get(context)
              .changeBottomSheet(isShown: false, 
              icon: Icon(Icons.person)));
        }},
        child: ContactCubit.get(context).floatingIcon,
    )
       
      
       
      );
  },
);
  
  }
}
