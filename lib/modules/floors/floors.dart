import 'package:cham_city_center/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../generated/l10n.dart';
import '../stores/stores.dart';

class Floors extends StatelessWidget {
  const Floors({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(context: context, title: S.of(context).floors),
      body: BackGround(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) => ListItem(
                  onTap: () {
                    cubit.getFromDataBase(
                        type: 'floors',
                        value: cubit.floors[index],
                        db: cubit.database);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Stores(
                                  floor: cubit.floors[index],
                                )));
                  },
                  title: cubit.floors[index],
                  width: width,
                  height: height),
              separatorBuilder: (context, index) => SizedBox(
                    height: height / 50,
                  ),
              itemCount: cubit.floors.length),
        ),
      ),
    );
  }
}
