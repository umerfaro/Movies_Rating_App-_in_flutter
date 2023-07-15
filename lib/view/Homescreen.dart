import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/response/Status.dart';
import '../resources/Components/Round_Elevated_button.dart';
import '../resources/Components/Round_button.dart';
import '../utils/routes/Routes_name.dart';
import '../utils/utlis.dart';
import '../view_models/Home_view_Model.dart';
import '../view_models/User_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  HomeviewViewModel _homeviewViewModel = HomeviewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeviewViewModel.fetchMoviesListApi();
  }


  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          RoundElevatedButton(
            text: "Logout",
            onPressed: () {
              userPrefernece.remove().then((value){
                Navigator.pushNamed(context, RouteNames.login);
              });
            },
          )

        ],
      ),
      body: ChangeNotifierProvider<HomeviewViewModel>(
        create: (BuildContext context) => _homeviewViewModel,
        child: Consumer<HomeviewViewModel>(
            builder: (context, value, _){
              switch(value.moviesList.status){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(child: Text(value.moviesList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteNames.detailsscreen,arguments: {
                              "title": value.moviesList.data!.movies![index].title.toString(),
                              "image": value.moviesList.data!.movies![index].posterurl.toString(),
                              "releasedate": value.moviesList.data!.movies![index].releaseDate.toString(),
                              "Genres": value.moviesList.data!.movies![index].genres.toString(),
                              "Stoyline": value.moviesList.data!.movies![index].storyline.toString(),
                            }
                            );

                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25.0,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: value.moviesList.data!.movies![index].posterurl!.toString(),
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              ),
                              title: Text(value.moviesList.data!.movies![index].title!,style: TextStyle(fontSize: 13)),
                              subtitle: Text(value.moviesList.data!.movies![index].year!),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!)),
                                  SizedBox(width: 5),
                                  Utils.getStarRatingWidget(value.moviesList.data!.movies![index].ratings!),
                                ],
                              ),

                            ),
                          ),
                        );
                  });
                default:
                  return Container();

              }
            }),
      ) ,
    );
  }

}
