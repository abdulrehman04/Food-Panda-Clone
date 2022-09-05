import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Search/Search%20Components/popular_search_pill.dart';
import 'package:reasa/View%20Models/Search%20View%20Model/search_view_model.dart';
import 'package:reasa/widgets.dart';

noTextSearchSiggestions(Function setQuery) {
  SearchViewModel search = Get.put(SearchViewModel());

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          search.recentSearches!.isEmpty
              ? Container()
              : poppinsText(
                  'Recent Searches',
                  weight: FontWeight.w600,
                  size: 18.sp,
                ),
          Obx(() {
            return Column(
              children: search.recentSearches!.map((e) {
                return ListTile(
                  onTap: () {
                    setQuery(e);
                  },
                  leading: const Icon(Icons.history),
                  title: poppinsText(
                    e,
                    align: TextAlign.start,
                  ),
                  trailing: InkWell(
                    onTap: () {
                      search.removeRecentSearch(e);
                      search.setRecentSearches();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 17,
                    ),
                  ),
                );
              }).toList(),
            );
          }),
          SizedBox(
            height: 15.h,
          ),
          poppinsText(
            'Popular Searches',
            weight: FontWeight.w600,
            size: 18.sp,
          ),
          SizedBox(
            height: 5.h,
          ),
          Wrap(
            children: [
              'savour',
              'kfc',
              'nashta',
              'subway foods rawalpindi',
              'savour',
              'kfc i10',
              'nashta',
              'subway'
            ].map<Widget>((e) {
              return InkWell(
                onTap: () {
                  setQuery(e);
                },
                child: popularSearchPill(e),
              );
            }).toList(),
          ),
        ],
      ),
    ),
  );
}
