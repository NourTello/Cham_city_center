import 'package:cham_city_center/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../generated/l10n.dart';
import '../all/all.dart';
import '../floors/floors.dart';
import '../restaurants/all_restaurants.dart';
import '../stores/all_stores.dart';
import '../stores/stores.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);

    return Scaffold(
      appBar: MyAppBar(context: context),
      body: BackGround(
        child: GridView.count(
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(18),
          children: [
            HomeCards(
                title: S.of(context).floors,
                width: width,
                height: height,
                onTap:()=> Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Floors()))),
            HomeCards(
                title: S.of(context).all,
                width: width,
                height: height,
                onTap: ()
                {
                  cubit.getFromDataBase(type:'all', value:"", db: cubit.database);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => All()));
                    }),
            HomeCards(
                title: S.of(context).stores,
                width: width,
                height: height,
                onTap:()
                {
                  cubit.getFromDataBase(type:'stores', value:"", db: cubit.database);

                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllStores()));
                    }),
            HomeCards(
                title: S.of(context).restaurants,
                width: width,
                height: height,
                onTap: ()
                {
                  cubit.getFromDataBase(type:'restaurants', value:"", db: cubit.database);

                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllRestaurants()));
                    })
          ],
        ),
      ),
    );
  }
}
