import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/crftsmen_in_category_cubit/cratftsmen_in_category_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/categories/craftsmen_list_view_builder_shimmer.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_item.dart';

class CraftsmenInCategory extends StatefulWidget {
  const CraftsmenInCategory({super.key, required this.categoryDetails});
  final Map<String, String> categoryDetails;

  @override
  State<CraftsmenInCategory> createState() => _CraftsmenInCategoryState();
}

class _CraftsmenInCategoryState extends State<CraftsmenInCategory> {
  @override
  void initState() {
    super.initState();
    context.read<CratftsmenInCategoryCubit>().getAllCraftsmenInCategory(
      widget.categoryDetails['categoryId']!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryDetails['categoryName']!)),
      body: BlocBuilder<CratftsmenInCategoryCubit, CratftsmenInCategoryState>(
        builder: (context, state) {
          if (state is CratftsmenInCategoryLoading) {
            return CraftsmenListViewBuilderShimmer();
          } else if (state is CratftsmenInCategoryFailure) {
            return Center(
              child: Text(
                'Failed to load craftsmen: ${state.apiErrorModel.message}',
              ),
            );
          } else if (state is CratftsmenInCategorySuccess) {
            return GridView.builder(
              itemCount: state.craftsmenList.craftsmen.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 80 / 90,
              ),
              itemBuilder: (context, index) {
                final craftsman = state.craftsmenList.craftsmen[index];
                return ServicesListViewItem(
                  image: '',
                  name: craftsman.user.name,
                  service: craftsman.specializations.first.name,
                  rating: craftsman.ratingsAverage.toString(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.craftmanDetailsScreen,
                      arguments: craftsman,
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No craftsmen available'));
          }
        },
      ),
    );
  }
}
