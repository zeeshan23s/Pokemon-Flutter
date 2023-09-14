import '../../exports.dart';

class PokemonCard extends StatelessWidget {
  final Color color;
  final String name;
  final String height;
  final String width;
  const PokemonCard(
      {super.key,
      required this.color,
      required this.name,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.screenHeight(context) * 0.33,
      width: Responsive.screenWidth(context) * 0.45,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: Responsive.screenHeight(context) * 0.25,
              width: Responsive.screenWidth(context) * 0.45,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                    Responsive.screenWidth(context) * 0.08),
              ),
              child: Column(
                children: [
                  SizedBox(height: Responsive.screenHeight(context) * 0.1),
                  Text(
                    name.replaceFirst(name[0], name[0].toUpperCase()),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kScaffoldColor),
                  ),
                  SizedBox(height: Responsive.screenHeight(context) * 0.015),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.screenWidth(context) * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'h: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.kScaffoldColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: height,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kScaffoldColor),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'w: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.kScaffoldColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: width,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kScaffoldColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.screenHeight(context) * 0.01),
                  IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.favorite_border, color: Colors.red))
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 5,
            right: 5,
            child: SizedBox(
              height: Responsive.screenWidth(context) * 0.35,
              width: Responsive.screenWidth(context) * 0.35,
              child: SvgPicture.asset(AppAssets.splashSVG),
            ),
          ),
        ],
      ),
    );
  }
}
