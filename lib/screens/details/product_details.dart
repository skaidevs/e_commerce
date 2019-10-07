import 'package:e_commerce/screens/home/Products.dart';
import 'package:e_commerce/screens/cart/cart.dart';
import 'package:e_commerce/screens/cart/cart_products.dart';
import 'package:e_commerce/screens/login_sign_up/custom_widget/custom_input_field.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/screens/details/product_details_ui.dart';
import 'package:e_commerce/widget/product_image.dart';
import 'package:e_commerce/screens/home/custom_widget/products_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productName;
  final productPicture;
  final productBrand;
  final productPrice;
  final ProductOnSale;

  ProductDetails(
      {this.productName,
      this.productPicture,
      this.productBrand,
      this.productPrice,
      this.ProductOnSale});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  var listDetails = <String>[
    "Name",
    "Age",
    "Name",
    "Age",
    "Name",
    "Age",
  ];

  String dummyText =
      "What is Lorem Ipsum? Lorem Ipsum nis simply dummy text of the pr"
      "inting and typesetting industry. Lorem Ipsum has been the industry's' "
      "standard dummy text ever since the 1500s, when an unknown printer took a"
      " galley of type and scrambled it to make a type specimen book. It has su"
      "rvived not only five centuries, but also the leap into electronic typese"
      "tting, remaining essentially unchanged. It was popularised in the 1960s "
      "with the release of Letraset sheets containing Lorem Ipsum passages, and"
      " more recently with desktop publishing software like Aldus PageMaker "
      "including versions of Lorem Ipsum. What is Lorem Ipsum? Lorem Ipsum "
      "nis simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's' standard dummy text ever since the"
      " 1500s, when an unknown printer took a galley of type and scrambled it "
      "to make a type specimen book. It has survived not only five centuries,";
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: white,
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
                      child: Icon(Icons.share),
                    ),
                  ],
                ),
              ],
              iconTheme: IconTheme.of(context),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProductImage(widget.productPicture),
//                    RecipeImage(widget.recipe.imageURL),
//                    RecipeTitle(widget.recipe, 25.0),
                  ],
                ),
              ),
              expandedHeight: 380.0,
              pinned: true,
              floating: false,
              elevation: 2.0,
              forceElevated: false,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "SELECT",
                      style:
                          TextStyle(color: black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "PRODUCT DETAILS",
                      style:
                          TextStyle(color: black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: Container(
          color: black,
          child: TabBarView(
            children: <Widget>[
              ProductDetailsScreen(widget.productName, widget.productPrice,
                  widget.productBrand, false),
              Text(
                dummyText,
                style: TextStyle(color: white, fontSize: 20.0),
              ),

//            IngredientsView(widget.recipe.ingredients),
//            PreparationView(widget.recipe.preparation),
            ],
            controller: _tabController,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 44,
                    width: 300.0,
                    child: RaisedButton(
                      color: white,
                      textColor: black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Text(
                        'ADD TO BAG',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () async {},
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border),
                    ),
                  )),
            ],
          ),
        ),
      ),

//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
////          updateFavorites(appState.user.uid, widget.recipe.id).then((result) {
////            // Toggle "in favorites" if the result was successful.
////            if (result) _toggleInFavorites();
////          });
//        },
//        child: Icon(
//          _inFavorites ? Icons.favorite : Icons.favorite_border,
//          color: Theme.of(context).iconTheme.color,
//        ),
//        elevation: 2.0,
//        backgroundColor: Colors.white,
//      ),
    );
  }
}
