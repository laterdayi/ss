part of '../index.dart';

class CustomLoading extends StatelessWidget {
  final bool? showBgColor;
  final String? description;
  const CustomLoading({super.key, this.description, this.showBgColor = true});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radius),
        color: showBgColor == true ? colorScheme.surface : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppTheme.padding * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CustomCircularProgressIndicator(),
            if (Utils.isNotNullOrBlank(description))
              Container(
                margin: EdgeInsets.only(top: AppTheme.margin),
                child: Text(
                  description ?? '',
                  style: TextStyle(color: colorScheme.onBackground),
                ),
              )
          ],
        ),
      ),
    );
  }
}
