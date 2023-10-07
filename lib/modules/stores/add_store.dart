import 'package:cham_city_center/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../generated/l10n.dart';
import '../../shared/Colors.dart';
import '../stores/stores.dart';

TextEditingController addNameController = new TextEditingController();
TextEditingController addPhoneController = new TextEditingController();
TextEditingController addInvestorNameController = new TextEditingController();
TextEditingController addDescriptionController = new TextEditingController();

class AddStore extends StatelessWidget {
  late String floor;
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddStore({required String floor}) {
    this.floor = floor;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var cubit = AppCubit.get(context);
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: MyAppBar(context: context, title: S.of(context).add_store),
        body: BackGround(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextFormField(
                        controller: addNameController,
                        hint: S.of(context).name,
                        prefixIcon: Icons.title,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).val_name;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                        controller: addPhoneController,
                        hint: S.of(context).phone,
                        prefixIcon: Icons.phone,
                        type: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).val_phone;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                        controller: addInvestorNameController,
                        hint: S.of(context).investor_name,
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return S.of(context).investor_name_val;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                        controller: addDescriptionController,
                        hint: S.of(context).description),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioListTile(
                              activeColor: Colors.amber,

                              title: Text(
                                S.of(context).store,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 's',
                              groupValue: cubit.type,
                              onChanged: (value) {
                                cubit.changeType(value!);
                              }),
                          RadioListTile(
                            activeColor: Colors.amber,
                              title: Text(S.of(context).restaurant,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 'r',
                              groupValue: cubit.type,
                              onChanged: (value) {
                                cubit.changeType(value!);
                              }),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: MyColors.dark_blue,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: MyButton(
                          title: S.of(context).add,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit
                                  .insetToDataBase(
                                      name: addNameController.text,
                                      floor: floor,
                                      phone: int.parse(addPhoneController.text),
                                      description:
                                          addDescriptionController.text,
                                      investor_name:
                                          addInvestorNameController.text,
                                      type: cubit.type)
                                  .then((value) {
                                print('done');
                                addNameController.clear();
                                addPhoneController.clear();
                                addDescriptionController.clear();
                                addInvestorNameController.clear();
                                cubit.getFromDataBase(
                                    type: 'floors',
                                    value: floor,
                                    db: cubit.database);
                                Navigator.pop(context,floor);

                              });
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
