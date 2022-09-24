import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zoorandomwiki/database/models/animal.dart';
import 'package:zoorandomwiki/localization/app_localization.dart';
import 'package:zoorandomwiki/stores/home/home_store.dart';
import 'package:zoorandomwiki/theme/theme_colors.dart';
import 'package:zoorandomwiki/theme/theme_dimensions.dart';
import 'package:zoorandomwiki/utils/http_utils.dart';
import 'package:zoorandomwiki/utils/mixins/after_init_state.dart';
import 'package:zoorandomwiki/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterInitMixin {
  late AppLocalization _appLocalization;
  late ThemeData _theme;
  late HomeStore _homeStore;

  @override
  void afterInitState() {
    _theme = Theme.of(context);
    _appLocalization = AppLocalization.of(context);
    _homeStore = Provider.of<HomeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildAnimalImage(),
            _buildAnimalDetails(),
            const SizedBox(height: 50)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          final response = await HttpUtils.get();
          _homeStore.setCurrentAnimal(Animal.fromJson(response.body));
        },
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildAnimalDetails() {
    return Observer(builder: (_) {
      final animal = _homeStore.animal;
      if (animal == null) {
        return Container();
      }
      return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsText(
                hint: _appLocalization.animalName,
                content: animal.name,
              ),
              DetailsText(
                hint: _appLocalization.scientificName,
                content: animal.scientificName,
              ),
              DetailsText(
                  hint: _appLocalization.animalType,
                  content: animal.animalType),
              DetailsText(
                  hint: _appLocalization.activeTime,
                  content: animal.activeTime),
              DetailsText(
                hint: _appLocalization.lengthMin,
                content: animal.lengthMin,
                suffix: 'ft',
              ),
              DetailsText(
                hint: _appLocalization.lengthMax,
                content: animal.lengthMax,
                suffix: 'ft',
              ),
              DetailsText(
                hint: _appLocalization.weightMin,
                content: animal.weightMin,
                suffix: 'lb',
              ),
              DetailsText(
                hint: _appLocalization.weightMax,
                content: animal.weightMax,
                suffix: 'lb',
              ),
              DetailsText(
                hint: _appLocalization.lifespan,
                content: animal.lifespan,
                suffix: 'year(s)',
              ),
              DetailsText(
                hint: _appLocalization.habitat,
                content: animal.habitat,
              ),
              DetailsText(
                hint: _appLocalization.diet,
                content: animal.diet,
              ),
              DetailsText(
                hint: _appLocalization.geoRange,
                content: animal.geoRange,
              ),
            ],
          ));
    });
  }

  Widget _buildAnimalImage() {
    return Observer(builder: (_) {
      if (_homeStore.animal?.imageLink == null) {
        return Container(
          height: 250,
        );
      }
      return Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(_homeStore.animal!.imageLink!),
          ),
        ),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        StringUtils.formatAppName(_appLocalization.appName),
      ),
    );
  }
}

class DetailsText extends StatelessWidget {
  final String? hint;
  final String? content;
  final String? suffix;
  const DetailsText({
    Key? key,
    required this.hint,
    required this.content,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint ?? '',
          textAlign: TextAlign.start,
          style: theme.textTheme.headline6?.copyWith(
            color: ThemeColors.gray,
            fontWeight: FontWeight.w300,
            fontSize: ThemeDimensions.fontSmall,
          ),
        ),
        Text(
          '${(content ?? '')} ${(suffix ?? '')}',
          textAlign: TextAlign.start,
          style: theme.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
