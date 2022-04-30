import 'package:metashark/commons.dart';
import 'package:metashark/data/countries.dart';

// TODO: find a common implementation for dropdowns.
class CountryDropdown extends StatelessWidget {
  final CountryVo current;
  final List<CountryVo> options;
  final ValueChanged<CountryVo?>? onChanged;

  const CountryDropdown({
    Key? key,
    required this.onChanged,
    required this.current,
    required this.options,
  }) : super(key: key);

  List<DropdownMenuItem<CountryVo>> getItems() {
    return options.mapIndexed2((index, e) {
      return DropdownMenuItem<CountryVo>(
        value: e,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                e.imageId,
                width: 24,
                height: 24,
              ),
              kGap8,
              Text(
                e.name,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),

      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.white,
        border: Border.all(color: Color(0xffECEBEE), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      // width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<CountryVo>(
        onChanged: onChanged,
        value: current,
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: kEmptyWidget,
        // selectedItemBuilder: ,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Color(0xffB9B9C3),
          ),
        ),
        menuMaxHeight: 240,
        alignment: Alignment.topLeft,
        items: getItems(),
      ),
    );
  }
}


// TODO: find a common implementation for dropdowns.
class CurrencyDropdown extends StatelessWidget {
  final CurrencyVo current;
  final List<CurrencyVo> options;
  final ValueChanged<CurrencyVo?>? onChanged;

  const CurrencyDropdown({
    Key? key,
    required this.onChanged,
    required this.current,
    required this.options,
  }) : super(key: key);

  List<DropdownMenuItem<CurrencyVo>> getItems() {
    return options.mapIndexed2((index, e) {
      return DropdownMenuItem<CurrencyVo>(
        value: e,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                e.iconId,
                width: 24,
                height: 24,
              ),
              kGap8,
              Text(
                e.name,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),

      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.white,
        border: Border.all(color: Color(0xffECEBEE), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      // width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<CurrencyVo>(
        onChanged: onChanged,
        // borderRadius: kBorderRadius8,
        value: current,
        // itemHeight: 50,
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: kEmptyWidget,
        // selectedItemBuilder: ,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Color(0xffB9B9C3),
          ),
        ),
        menuMaxHeight: 240,
        alignment: Alignment.topLeft,
        items: getItems(),
      ),
    );
  }
}



// TODO: find a common implementation for dropdowns.
class CurrencyNetworkDropdown extends StatelessWidget {
  final String current;
  final List<String> options;
  final ValueChanged<String?>? onChanged;

  const CurrencyNetworkDropdown({
    Key? key,
    required this.onChanged,
    required this.current,
    required this.options,
  }) : super(key: key);

  List<DropdownMenuItem<String>> getItems() {
    return options.mapIndexed2((index, e) {
      return DropdownMenuItem<String>(
        value: e,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SvgPicture.asset(
              //   e.iconId,
              //   width: 24,
              //   height: 24,
              // ),
              // kGap8,
              Text(
                e,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius8,
        color: Colors.white,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: kBorderRadius8,
        border: Border.all(color: const Color(0xffECEBEE), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      // width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        onChanged: onChanged,
        value: current,
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: kEmptyWidget,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Color(0xffB9B9C3),
          ),
        ),
        menuMaxHeight: 240,
        alignment: Alignment.topLeft,
        items: getItems(),
      ),
    );
  }
}

