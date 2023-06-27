# NEWS HOUSE

## DESCRIPTION OF THE APP
NEWSHOUSE is an amazing news mobile app that provides interesting and updated news to its users. The news is coming from a reliable API that keeps updating the app with latest news automaticaaly. The app also contains google ads, and no user information is collected; so users dont have to worry about data and privacy misuse. The app has a very nice and seamless user interface with great functionality.

## DESCRIPTION OF CODE BASE
The code base is structured with a total number of 4 folders which I used to structure my app in a very clean and orderlly manner. The first folder is named "model" and it contains the model structure file of the news responses. The next folder is called "providers"and it houses the provider file which contains the api call and some state management code. The next folder is called "screens" which contains all the screen files in the app. The last folder is named widgets and it contains all the extracted widgets in the app.

## HOW TO USE THE APP
After launching the app the first screen that comes up is the splash screen and it displays the logo of the app for 3 seconds. Then it moves to the news screen that displays a list of news in a listview builder. On tapping any of the news the app takes the user to the details screen of that news and displays a more detailed information on that particular news. The user is presented with buttons to take them back the the main news list.

## DESCRIPTION OF LIBRARIES USED
1. ### Provider
   I made use of the provider state management tool in the implementation of my API call and sharing of data within the app.
   
2. ### http
   I made use of the http package to enable me make network calls to the API.

3. ### google_mobile_ads
   I made use of google_mobile_ads to integrate google advertisement inorder to monetize my app.
   
4. ### flutter_native_splash
   I made use of flutter native splash to implement a splash screen and also to remove the white screen that comes up at the start of flutter apps.

## CHALLENGES FACED AND HOW I OVERCAME
   I had challenge with sorting data from the API but i used stackoverflow and google to get solutions that helped me solve the problem.
   
## FEATURES I WOULD LOVE TO ADD IF I HAD MORE TIME
   Automatic language detector.   
   
## LINK TO THE APK UPLOADED ON GOOGLEDRIVE
   ## DESCRIPTION OF THE APP
The countries app is a mobile application that displays the list of countries provided by the API given for the task. The app contains two basic screens; the first one displays the list of countries and  when a user tap on a country, it takes the user to the details screen where the user csn see more information about a country. The app also has two modal bottom sheet that leads to where a user can filter the countries according to region(continents). All the screens in the app are scrollable and responsive with top notch features. The app also has a very good searchable feature whereby a user can use to search for countries easily and seamlessly. The app also supports mode switch(dark & light theme) so a user can choose select the theme of his/her choice.

## DESCRIPTION OF CODE BASE
The code base is structured to have a total of 6 folders which I used to structure my app in a very clean and orderly way. One of the folder is named "screens" which contains all the screens in the app. There is another folder which I named "widgets" that contains all the extracted widgets in my app. There is a model's folder which contains all the model classes used in the app. There is another folder called API which houses the file I used to handle my API calls. There is another folder called consts which houses all the constant values in the app. There is another folder called styles which contains all the styling used in the app.

## HOW TO USE THE APP
After launching the app the first screen that comes up is the screen that displays the list of countries and their capital. If a user should tap on a country, it takes the user to the details screen that displays more information about a country. The app has a search bar that a user can use to search for a country and it comes up immediately. The app also has a filter option from the main screen that when tapped will pop up a modal bottom sheet that leads a user to the filtering by region(continent) option. At this point the user should select the continents he/she wants to view and press show result and the app filters the list to those regions. The app is intuitive and user friendly and also has a dark mode option to suite different users preference.

## DESCRIPTION OF LIBRARIES USED
1. ### Provider
   I made use of the provider state management tool in the implementation of my dark/light mode.

2. ### shared_preferences
   Shared_preferences was part of what i needed for the implentation of the light/dark mode.
   
3. ### http
   I made use of the http package to enable me make network calls to the API.

4. ### card_swiper & page_transition
   I made use of card_swiper & page_transition to transit between different images in my details screen to switch between flags and coat of arms of each countery.
   
5. ### Internet connection checker & connectivity plus
   I made use of these package to check for network connection related problems on the app.   

## CHALLENGES FACED AND HOW I OVERCAME
   I had challenge with sorting data from the API at first but i used stackoverflow and google to get solutions that helped me solve the problem. I also discovered that the API    has some mssing data like some continents have no data while others have, and some few other missing data.
   
## FEATURES I WOULD LOVE TO ADD IF I HAD MORE TIME
   Automatic language detector.   
   
## LINK TO THE APK UPLOADED ON GOOGLEDRIVE
   https://drive.google.com/file/d/1YqbxMyARpofeHo7J2vAb384QGIYIesvt/view?usp=share_link
