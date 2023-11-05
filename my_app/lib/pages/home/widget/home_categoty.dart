import 'package:flutter/material.dart';
import 'package:my_app/apps/routes/routes.dart';
import 'package:my_app/provider/category_provider.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future categoryFuture;
  @override
  void didChangeDependencies() {
    categoryFuture = Provider.of<CategoryProvider>(context).getCategory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryFuture,
      initialData: [],
      builder: (context, snapshot) {
        var categoryData = [];
        if (snapshot.hasData) {
          categoryData = snapshot.data! as List;
        } else {
          return Container(
            child: Text(snapshot.error.toString()),
          );
        }
        return SizedBox(
          height: 70,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.categoryPage,
                    arguments: {
                      'id': categoryData[index].id,
                      'name': categoryData[index].name,
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: const [],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            categoryData[index].image,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(categoryData[index].name),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
