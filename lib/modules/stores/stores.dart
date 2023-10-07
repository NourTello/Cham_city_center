import 'package:cham_city_center/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../generated/l10n.dart';
import '../../shared/Colors.dart';
import '../stores/stores.dart';
import 'add_store.dart';
import 'edit_store.dart';
class Stores extends StatelessWidget {
  late String floor;
  Stores({required String floor}) {
    this.floor = floor;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: MyAppBar(context: context, title: floor),
      body: BackGround(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: (cubit.data == null && cubit.data!.length == 0)
              ? Center()
              : ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () => showBottomSheet(
                        backgroundColor:Colors.white.withOpacity(0.1) ,
                          context: context,
                          builder: (context) => Container(
                                height: height / 12,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        child: Column(
                                          children: [
                                            Icon(Icons.edit,color: Colors.white,),
                                            Text(S.of(context).edit,style: TextStyle(color: Colors.white,),)
                                          ],
                                        ),
                                        onTap: () {
                                          cubit.changeType(cubit.data![index]['type']);
                                          editDescriptionController.text =
                                              cubit.data![index]['description'];
                                          editInvestorNameController.text =
                                              cubit.data![index]['investor_name'];
                                          editPhoneController.text =
                                              '${cubit.data![index]['phone']}';
                                          editNameController.text =
                                              cubit.data![index]['name'];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => EditStore(
                                                        ID: cubit.data![index]
                                                            ['id'],
                                                        Floor: floor,
                                                      )));
                                        },
                                      ),
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                            child: Column(
                                              children: [
                                                Icon(Icons.delete,color: Colors.white,),
                                                Text(S.of(context).delete,style: TextStyle(color: Colors.white,))
                                              ],
                                            ),
                                            onTap: () => cubit
                                                .deleteRecord(
                                                    id: cubit.data![index]['id'],
                                                    floor: floor,
                                                    name: cubit.data![index]
                                                        ['name'])
                                                .then((value) =>
                                                    Navigator.pop(context))))
                                  ],
                                ),
                              )),
                      child: StoreItem(
                        cubit.data![index],context)),
              separatorBuilder: (context,index)=>SizedBox(height: 20,),

              itemCount: cubit.data!.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddStore(floor: floor)));
          }),
    );
  }
}
