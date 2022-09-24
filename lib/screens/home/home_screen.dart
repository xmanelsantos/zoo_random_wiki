import 'package:zoorandomwiki/localization/app_localization.dart';
import 'package:zoorandomwiki/stores/home/home_store.dart';
import 'package:zoorandomwiki/theme/theme_colors.dart';
import 'package:zoorandomwiki/theme/theme_dimensions.dart';
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          _homeStore.increment();
        },
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildAnimalDetails() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsText(hint: _appLocalization.animalName, content: 'nome'),
            DetailsText(hint: _appLocalization.scientificName, content: 'nome'),
            DetailsText(hint: _appLocalization.animalType, content: 'nome'),
            DetailsText(hint: _appLocalization.activeTime, content: 'nome'),
            DetailsText(hint: _appLocalization.lengthMin, content: 'nome'),
            DetailsText(hint: _appLocalization.lengthMax, content: 'nome'),
            DetailsText(hint: _appLocalization.weightMin, content: 'nome'),
            DetailsText(hint: _appLocalization.weightMax, content: 'nome'),
            DetailsText(hint: _appLocalization.lifespan, content: 'nome'),
            DetailsText(hint: _appLocalization.habitat, content: 'nome'),
            DetailsText(hint: _appLocalization.diet, content: 'nome'),
            DetailsText(hint: _appLocalization.geoRange, content: 'nome'),
          ],
        ));
  }

  Widget _buildAnimalImage() {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              // TODO(xmanelsantos): Depois de adicionar a chamada a API, implementar o link que vem do response
              'https://upload.wikimedia.org/wikipedia/commons/a/a4/DPPP_5348.jpg'),
        ),
      ),
    );
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
  final String hint;
  final String content;
  const DetailsText({Key? key, required this.hint, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          textAlign: TextAlign.start,
          style: theme.textTheme.headline6?.copyWith(
            color: ThemeColors.gray,
            fontWeight: FontWeight.w300,
            fontSize: ThemeDimensions.fontSmall,
          ),
        ),
        Text(
          content,
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
