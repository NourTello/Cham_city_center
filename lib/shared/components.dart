import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../generated/l10n.dart';
import '../main.dart';
import 'Colors.dart';
import 'fonts.dart';

Widget ListItem(
        {required String title,
        required double height,
        required double width,
        Color? color,
        required Function() onTap}) =>
    GestureDetector(
      child: Container(
        height: height / 10,
        width: double.infinity,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: Fonts.normalFont),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (color == null) ? Colors.indigo[800] : color),
      ),
      onTap: onTap,
    );

AppBar MyAppBar({String title = "", required context}) {
  String lang = (box.read('lang') != null) ? box.read('lang') : 'ar';
  return AppBar(
    centerTitle: true,
    backgroundColor: MyColors.dark_blue,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: Fonts.largeFont),
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.more_vert_rounded),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocBuilder<AppCubit, AppStates>(
                builder: (context, state) {
                  var cubit = AppCubit.get(context);
                  return AlertDialog(
                    title: Text(S.of(context).select_lang),
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      RadioListTile(
                          activeColor: Colors.amber,
                          title: Text(
                            'English',
                            textAlign: TextAlign.right,
                          ),
                          value: 'en',
                          groupValue: lang,
                          onChanged: (value) {
                            cubit.changeSelectedLanguage(value);
                            lang = 'en';
                          }),
                      RadioListTile(
                          activeColor: Colors.amber,
                          title: Text('العربية', textAlign: TextAlign.right),
                          value: 'ar',
                          groupValue: lang,
                          onChanged: (value) {
                            cubit.changeSelectedLanguage(value);
                            lang = 'ar';
                          }),
                      MyButton(
                          title: S.of(context).ok,
                          onPressed: () {
                            cubit.changeAppLanguage(lang);
                            Navigator.pop(context);
                          })
                    ]),
                  );
                },
              );
            },
          );
        },
      ),
    ],
  );
}

Widget MyTextFormField(
    {required TextEditingController controller,
    String? Function(String?)? validator,
    IconData? prefixIcon,
    required String hint,
    TextInputType type = TextInputType.text,
    onChange,
    }) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    validator: validator,
    textAlign: TextAlign.right,
    keyboardType: type,
    controller: controller,
    onChanged: onChange,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: Icon(prefixIcon),
        // prefixIcon: Icon(prefixIcon),
        enabled: true,
        hintText: hint,
        filled: true,
        fillColor: Colors.white),
  );
}


// Widget StoreItem({
//   required String name,
//   required int phone,
//   required String type,
// }) =>
//     Row(children: [
//       Container(
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: (type == 's')
//             ? Icon(Icons.shopping_bag_sharp)
//             : Icon(Icons.restaurant),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Expanded(
//         child: Container(
//           alignment: Alignment.centerRight,
//           child: Text(
//             name,
//             style: TextStyle(fontSize: Fonts.largeFont),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Text(
//         phone.toString(),
//         style: TextStyle(color: Colors.grey, fontSize: Fonts.normalFont),
//       ),
//     ]);

Widget StoreItem( Map store,context) {
  return Container(
    padding: EdgeInsets.all(18),
    child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(store['name'],style: TextStyle(color: Colors.white,fontSize: Fonts.largeFont),)),
              Text('${store['phone']}',style: TextStyle(color: Colors.amber,fontSize: Fonts.normalFont),),

            ],
          ),
          Text(
            store['description'],
            style: TextStyle(
              color: Colors.white70
            ),
          ),
          Text(
            S.of(context).investor_name+" :  "+
            store['investor_name'],
            style: TextStyle(
                color: Colors.grey
            ),
          ),

        ],
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ));
}

Widget BackGround({required Widget child}) => Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        MyColors.dark_blue,
        Color(0xFF0E26AF),
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
    );
Widget HomeCards(
    {required String title,
    required double width,
    required double height,
    required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: Fonts.largeFont),
      ),
      alignment: Alignment.center,
      width: width / 3,
      height: height / 3,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

Widget MyButton({required title, required onPressed}) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              colors: [Colors.amber.shade700, Colors.amber.shade400],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
