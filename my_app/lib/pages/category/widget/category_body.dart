import 'package:flutter/material.dart';
import 'package:my_app/provider/category_provider.dart';
import 'package:my_app/provider/const.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  late Future productIncategoryFuture;
  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    productIncategoryFuture =
        Provider.of<CategoryProvider>(context).getProduct(arg['id']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productIncategoryFuture,
      initialData: [],
      builder: (context, snapshot) {
        return GridView.builder(
          padding: dcPading,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              footer: const ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: GridTileBar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.541),
                  title: Text('Iphone 15 Pro'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Aspernatur earum aut laboriosam.'),
                      SizedBox(height: 4),
                      Text(
                        '20.000.000 VND',
                        style: fdCategory,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.shopping_cart),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://cdn.ithinkdiff.com/wp-content/uploads/2023/02/iPhone-15-Pro-red-color.jpg'))),
              ),
            );
          },
        );
      },
    );
  }
}
