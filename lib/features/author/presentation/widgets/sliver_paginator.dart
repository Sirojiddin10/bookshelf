import 'package:bookshelf/assets/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverPaginator extends StatelessWidget {
  final FormStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final Widget emptyWidget;
  final ScrollPhysics? physics;
  final bool? hasItems;
  final VoidCallback? onRefresh;

  const SliverPaginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    this.onRefresh,
    required this.errorWidget,
    required this.emptyWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.loadingWidget,
    this.physics,
    this.hasItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == FormStatus.loading) {
      return SliverToBoxAdapter(child: loadingWidget ?? const Center(child: CupertinoActivityIndicator()));
    } else if (paginatorStatus == FormStatus.error || (hasItems != null && hasItems!)) {
      return SliverToBoxAdapter(child: errorWidget);
    } else {
      return SliverPadding(
        padding: padding!,
        sliver: itemCount == 0
            ? SliverToBoxAdapter(child: emptyWidget)
            : SliverList.separated(
                itemBuilder: (context, index) {
                  if (index == itemCount) {
                    if (hasMoreToFetch) {
                      fetchMoreFunction();
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  }
                  return itemBuilder(context, index);
                },
                separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox(),
                itemCount: itemCount + 1,
              ),
      );
    }
  }
}
