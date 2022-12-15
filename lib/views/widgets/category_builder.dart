import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/api_cubit.dart';
import 'package:news_app/blocs/state/api_states.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/shared/constants/colors.dart';
import 'package:news_app/shared/constants/screens_name.dart';
import 'package:news_app/shared/helpers/routes/argument_class.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({Key? key}) : super(key: key);

  Widget _buildBlocBuilder() {
    return BlocBuilder<ApiCubit, ApiStates>(
      builder: (context, state) {
        if (state is ApiLoadedState) {
          return _buildListView(context);
        } else {
          return _circularProgressIndicator();
        }
      },
    );
  }

  Widget _circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemBuilder: (context, index) => _listViewBuilder(
          context.read<ApiCubit>().topHeadLinesModel,
          index,
          context,
        ),
        separatorBuilder: (context, state) => _buildSperator(),
        itemCount: context.watch<ApiCubit>().topHeadLinesModel.articles!.length,
      ),
    );
  }

  Widget _buildSperator() {
    return Container(
      width: double.infinity,
      height: 3.0,
      color: ColorsUsed.orangeColor,
    );
  }

  Widget _listViewBuilder(
    TopHeadLinesModel topHeadLinesModel,
    int index,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ScreensName.MORE_INFO,
          arguments: Arguments(topHeadLinesModel, index),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageBuilder(topHeadLinesModel, index),
            const SizedBox(
              width: 10,
            ),
            _buildTextDescreption(topHeadLinesModel, index),
          ],
        ),
      ),
    );
  }

  Widget _imageBuilder(TopHeadLinesModel topHeadLinesModel, int index) {
    return Container(
      width: 150.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
      child: topHeadLinesModel.articles![index].urlToImage.toString() == 'null'
          ? const Image(
              width: 150.0,
              height: 200.0,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/place_holder_image.jpg',
              ),
            )
          : Image(
              width: 150.0,
              height: 200.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                topHeadLinesModel.articles![index].urlToImage.toString(),
              ),
            ),
    );
  }

  Widget _buildTextDescreption(TopHeadLinesModel topHeadLinesModel, int index) {
    return Expanded(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              topHeadLinesModel.articles![index].description.toString() ==
                      'null'
                  ? 'there is no Data may be it will come later'
                  : topHeadLinesModel.articles![index].description.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                topHeadLinesModel.articles![index].publishedAt.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBlocBuilder();
  }
}
