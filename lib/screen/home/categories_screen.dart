import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quickmart/models/category_model.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/view_models/product_view_model.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/utils/category_icon_config.dart';
import 'package:quickmart/utils/scroll_up_widget.dart';

class CategoriesScreen extends StatefulWidget implements ScrollUpWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();

  @override
  void onResetTab() {
    refreshController.position?.moveTo(0, duration: const Duration(milliseconds: 600));
  }

  @override
  final RefreshController refreshController = RefreshController(initialRefresh: false);
}

class _CategoriesScreenState extends State<CategoriesScreen> with AutomaticKeepAliveClientMixin {
  List<CategoryModel> allCategories = [];
  bool isLoading = true;

  Future<void> initialize({bool clearCache = false}) async {
    try {
      allCategories = await ProductViewModel.instance.getAllCategories(clearCache: clearCache);
      isLoading = false;
      if (mounted) {
        setState(() {
          
        });
      }
    } catch (e) {
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
    allCategories.clear();
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
        scrolledUnderElevation: 0,
        title: Text(
          "Categories",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: widget.refreshController,
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
            shrinkWrap: true,
            children: List.generate(allCategories.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColors.lightGrey2
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        categoryIcon(allCategories[index].slug),
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        allCategories[index].name,
                        softWrap: true,
                        maxLines: 2,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}