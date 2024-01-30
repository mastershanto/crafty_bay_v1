///todo: isCodingWorkCompleted?=>"No, work in progress";
library;

import 'package:flutter/material.dart';
import '../widgets/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key, this.category});

   String? category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();

}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: widget.category!=null?Text(widget.category.toString()):const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 100,
          primary: false,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .5, //It's important for making good shape for grid items
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return const ProductCardItem();
          },
        ),
      ),
    ),);
  }
}
