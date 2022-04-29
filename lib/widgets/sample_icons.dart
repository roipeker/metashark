import 'package:flutter/widgets.dart';
import 'package:metashark/commons.dart';

class SampleIcons extends StatelessWidget {
  const SampleIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trace(AppIcons.all.length);
    return Center(
      child: Wrap(
        runSpacing: 10, spacing: 10,
        children: [
          ...AppIcons.all.entries.map((entry) {
            return SizedBox(
              width: 30,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    entry.value,
                    color: Colors.black,
                    size: 24,
                  ),
                  Flexible(
                    child: Text(
                      entry.key.toString(),
                      style: TextStyle(fontSize: 7),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            );
          }).toList()
          // ...List.of(SharkIcons.all.values).map2((data) {
          //   return Icon(
          //     data,
          //     color: Colors.red,
          //     size: 48,
          //   );
          // }),
          // Icon(SharkIcons.airline_stops),
        ],
      ),
    );
  }
}
