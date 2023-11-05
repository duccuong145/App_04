import 'package:flutter/material.dart';
import 'package:my_app/pages/home/widget/home_categoty.dart';
import 'package:my_app/pages/home/widget/home_slider.dart';
import 'package:my_app/provider/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home page')),
      ),
      body: const Padding(
        padding: dcPading,
        child: Column(
          children: [
            HomeSlider(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Danh mục sản phẩm',
                    style: fdCategory,
                  ),
                ),
                Text(
                  'Xem tất cả',
                  style: fdCategory,
                )
              ],
            ),
            szSizedbox,
            HomeCategory(),
          ],
        ),
      ),
    );
  }
}
