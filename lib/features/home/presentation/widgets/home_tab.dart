import 'dart:async';

import 'package:ecommerce/core/di/service_loacator.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_state_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/announcements_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  final List<String> _announcementsImagesPaths = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    _homeCubit = serviceLocator.get<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnnouncementsSection(
            imagesPaths: _announcementsImagesPaths,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          Column(
            children: [
              CustomSectionBar(
                sectionName: 'Categories',
                onViewAllClicked: () {},
              ),
              SizedBox(
                height: 270.h,
                child: BlocProvider(
                  create: (_) => _homeCubit,
                  child: BlocBuilder<HomeCubit, HomeStateCubit>(
                    builder: (context, state) {
                      if (state is GetCategoriesLoading) {
                        return const LoadingIndicator();
                      } else if (state is GetCategoriesFailure) {
                        return Center(
                          child: Text(
                            'Failed to load categories: ${state.message}',
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else if (state is GetCategoriesSucess) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (_, index) =>
                              CategoryItem(state.categories[index]),
                          itemCount: state.categories.length,
                          scrollDirection: Axis.horizontal,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ],
      ),
    );
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(
        () => _currentIndex =
            (_currentIndex + 1) % _announcementsImagesPaths.length,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
