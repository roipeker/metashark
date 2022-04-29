import 'package:metashark/commons.dart';

final _borderBase = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Color(0xffC7C7C7),
  ),
  borderRadius: kBorderRadiusPill,
);

final _borderFocus = _borderBase.copyWith(
  borderSide: const BorderSide(
    color: AppColors.primaryPurple,
    width: 2,
  ),
);

///C7C7C7
final _kInputTheme = InputDecorationTheme(
  hintStyle: const TextStyle(
    color: Color(0xffC7C7C7),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  contentPadding: const EdgeInsets.all(16),
  isCollapsed: true,
  isDense: true,
  alignLabelWithHint: true,
  border: _borderBase,
  enabledBorder: _borderBase,
  focusedBorder: _borderFocus,
);

class VoucherSearchDelegate extends SearchDelegate<String?> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = super.appBarTheme(context);
    const kSearchInputStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGrey,
    );
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        centerTitle: false,
        elevation: 10,
        // toolbarHeight: 56,
        iconTheme: const IconThemeData(
          size: 20,
          color: AppColors.appbarIconGrey,
        ),
        // foregroundColor: Colors.green,
      ),
      textTheme: theme.textTheme.copyWith(
        headline6: kSearchInputStyle,
      ),
    );
  }

  final List<String> searchData;

  VoucherSearchDelegate({required this.searchData})
      : super(
          searchFieldLabel: 'Search',
          searchFieldDecorationTheme: _kInputTheme,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(
          Icons.clear,
          color: AppColors.appbarIconGrey,
          size: 20,
        ),
      ),
      kGap16,
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // return SizedBox(
    //   width: 24,
    //   height: 24,
    //   child: AppMaterialButton(
    //     child: const Icon(AppIcons.arrow_back),
    //     onTap: () {
    //       close(context, '');
    //     },
    //   ),
    // );
    // return Icon(AppIcons.search, color: Color(0xffC7C7C7),);
    return IconButton(
      onPressed: () => close(context, query),
      icon: const Icon(AppIcons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Results should not be used, get suggestions instead');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var _query = query.trim();
    if (_query.isEmpty) {
      return const Align(
        alignment: Alignment(0, -0.9),
        child: NotFoundFish(
          boxSize: 200,
          text: 'Search for something..',
        ),
      );
    }

    final results = getResults(_query);
    if (results.isEmpty) {
      return const Align(
        alignment: Alignment(0, -0.9),
        child: NotFoundFish(
          boxSize: 200,
          text: 'No vouchers found..',
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (_, index) {
        var text = results[index];
        return ListTile(
          title: Text(text),
          onTap: () {
            close(context, text);
          },
        );
      },
    );
  }

  List<String> getResults(String q) {
    q = q.toLowerCase();
    return searchData
        .where((element) => element.toLowerCase().contains(q))
        .toList(growable: false);
  }
}
