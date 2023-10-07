import 'package:cham_city_center/shared/components.dart';
import 'package:flutter/material.dart';

import '../../cubit/app_cubit.dart';
import '../../generated/l10n.dart';

TextEditingController searchController =TextEditingController();
class AllStores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return Scaffold(
        appBar: MyAppBar(context: context, title: ""),
        body: BackGround(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  // MyTextFormField(
                  //   onChange: (value){
                  //     cubit.getFromDataBase(type: 'search', value: value, db: cubit.database);
                  //   },
                  //     controller: searchController, hint: S.of(context).search),
                  // SizedBox(height: 20,),

                  (cubit.data == null && cubit.data!.length == 0)
                      ? Center()
                      : Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                                StoreItem(cubit.data![index], context),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: cubit.data!.length),
                      ),
                ],
              )),
        ));
  }
}
