import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quickmart/models/category_model.dart';
import 'package:quickmart/models/product_model.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/reducers/route_reducer.dart';
import 'package:quickmart/store/view_models/product_view_model.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/utils/category_icon_config.dart';
import 'package:quickmart/utils/scroll_up_widget.dart';

class HomeScreen extends StatefulWidget implements ScrollUpWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  void onResetTab() {
    refreshController.position?.moveTo(0, duration: const Duration(milliseconds: 600));
  }

  @override
  final RefreshController refreshController = RefreshController(initialRefresh: false);
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  List<ProductModel> trendProduct = [];
  List<CategoryModel> categories = [];
  List<ProductModel> latestProduct = [];
  bool isLoading = true;

  double calculateDiscount(double price, double discountPercent) {
    // Menghitung nilai diskon
    double discountAmount = price * (discountPercent / 100);
    
    // Menghitung harga setelah diskon
    double finalPrice = price - discountAmount;

    return finalPrice;
  }

  Future<void> initialize({bool clearCache = false}) async {
    try {
      trendProduct = await ProductViewModel.instance.getTrendDiscountProduct(clearCache: clearCache);
      categories = await ProductViewModel.instance.getFourCategories(clearCache: clearCache);
      latestProduct = await ProductViewModel.instance.getLatestProduct(clearCache: clearCache);
      isLoading = false;
      if (mounted) {
        setState(() {
          
        });
      }
    } catch(e) {
      print(e.toString());
      isLoading = false;
    }
  }

  void onRefresh() async {
    await initialize(clearCache: true);
    widget.refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      await initialize();
    });
  }

  @override
  void dispose() {
    super.dispose();
    trendProduct.clear();
  }

  @override
  bool wantKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
        automaticallyImplyLeading: false,
        leadingWidth: 120,
        foregroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
        scrolledUnderElevation: 0,
        leading: Container(
          width: 104,
          height: 40,
          margin: const EdgeInsets.only(left: 10),
          child: Image.asset(
            store!.state.scheme == ThemeScheme.light ? 
            "assets/icon/app_icon/app_icon_no_label@2x.png" :
            "assets/icon/app_icon/app_icon_dark_no_label@2x.png",
            width: 104,
            height: 40,
          ),
        ),
        actions: [
          Icon(
            OctIcons.search,
            size: 30,
            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
          ),
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 40,
              height: 40,
              color: ThemeColors.blue,
              child: Image.network(
                store!.state.user.image,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: widget.refreshController,
        onRefresh: onRefresh,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: ThemeColors.cyan
              ),
              child: Swiper(
                itemCount: trendProduct.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Image.network(
                            trendProduct[index].thumbnail,
                            width: 140,
                            height: 140,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: ThemeColors.primaryBlack,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.1,
                                      color: ThemeColors.primaryColorDark
                                    )
                                  ]
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "${trendProduct[index].discout.floor()}% OFF",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: ThemeColors.primaryWhite,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                trendProduct[index].title,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: ThemeColors.primaryBlack,
                                  shadows: [
                                    Shadow(
                                      color: ThemeColors.lightGrey2,
                                      blurRadius: 2
                                    ),
                                  ]
                                ),
                              ),
                              Text(
                                "Exclusive Sales",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 30,
                                  color: ThemeColors.primaryBlack,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: ThemeColors.lightGrey2,
                                      blurRadius: 4
                                    ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                pagination: SwiperPagination(
                  margin: const EdgeInsets.all(5.0),
                  builder: DotSwiperPaginationBuilder(
                    color: ThemeColors.netralGrey,
                    activeColor: ThemeColors.primaryColorLight,
                    activeSize: 10,
                    size: 10
                  )
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      store!.dispatch(RouteReducer(
                        action: ActionOperation.setHomeTab,
                        payload: HomeTab.categories
                      ));
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.primaryColorLight
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      width: 100,
                      height: 50,
                      margin: index == 0 ? 
                      const EdgeInsets.only(left: 10, right: 5) : 
                      const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ThemeColors.lightGrey2,
                          width: 0.2
                        ),
                        color: Colors.transparent
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            categoryIcon(categories[index].slug),
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            categories[index].name,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Product",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.primaryColorLight
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: 0.8,
              shrinkWrap: true,
              children: List.generate(latestProduct.length, (index) {
                return SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 138,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ThemeColors.cyan
                        ),
                        alignment: Alignment.center,
                        child: Image.network(
                          latestProduct[index].thumbnail,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        latestProduct[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                        ),
                      ),
                      Text(
                        "\$${calculateDiscount(latestProduct[index].price, latestProduct[index].discout).floorToDouble()}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                        ),
                      ),
                      Text(
                        "\$${latestProduct[index].price.floorToDouble()}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.lightGrey2,
                          decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}