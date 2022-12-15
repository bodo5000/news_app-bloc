import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/api_cubit.dart';
import 'package:news_app/blocs/state/api_states.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/shared/constants/colors.dart';

class MoreInfoScreen extends StatelessWidget {
  final TopHeadLinesModel topHeadLinesModel;
  final int index;
  const MoreInfoScreen({
    Key? key,
    required this.topHeadLinesModel,
    required this.index,
  }) : super(key: key);

  Widget _divider() {
    return const SizedBox(
      height: 20.0,
    );
  }

  Widget _buildBlocBuilder() {
    return BlocBuilder<ApiCubit, ApiStates>(
      builder: (context, state) => _moreInfo(),
    );
  }

  Widget _moreInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _newsImage(),
          _divider(),
          _textSoucer(),
          _divider(),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: _descText(),
          ),
        ],
      ),
    );
  }

  Widget _newsImage() {
    return topHeadLinesModel.articles![index].urlToImage.toString() == 'null'
        ? Image.asset(
            'assets/images/place_holder_image.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          )
        : Image.network(
            '${topHeadLinesModel.articles![index].urlToImage}',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          );
  }

  Widget _descText() {
    return topHeadLinesModel.articles![index].description.toString() == 'null'
        ? const Text(
            'There is No Data Maybe It Will Come Later',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          )
        : Text(
            '${topHeadLinesModel.articles![index].description}',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.end,
          );
  }

  Widget _textSoucer() {
    return topHeadLinesModel.articles![index].source!.name.toString() == 'null'
        ? const Text(
            'There is No Source ',
            style: TextStyle(
              fontSize: 20.0,
              color: ColorsUsed.orangeColor,
            ),
          )
        : Text(
            '${topHeadLinesModel.articles![index].source!.name}',
            style: const TextStyle(
              fontSize: 20.0,
              color: ColorsUsed.orangeColor,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More Information',
        ),
      ),
      body: _buildBlocBuilder(),
    );
  }
}
