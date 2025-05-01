# stock_market_app

A stock market app.

a flutter app that shows the stock market report of 10 random
companies with a date range and an auto complete search box to the UI. The autocomplete feature
filters the list returned from the API. The app Also, notify the user if the device is offline.

## Features
The app is multi platform (IOS & Android). The app has its own logo (not the default flutter one).

The app is able to run on both physical and virtual devices.

## Files and Modules
The app was designed using the MVVM design pattern. The files are in the respective folders which are:
1. Models - The holding folder for all the models and Classes for the Objects
2. Services - These are the files that are fetching the data from the internet and networks
3. Utils - These are constants files which are used by multiple files
4. View_Models - These are where the view models Classes are stored
5. Widgets - These is the file holding the widgets that were extracted and are reused
6. Screens - These are the screens and UI pages
7. main.dart - this is the main file that runs the app
8. The assets folder has the images and custom fonts used by the App

## Running the app
The app is quite straight forward to run, on the git Repository it doesn't have the build folder and
the pubspec.lock is also deleted thus you will need to download the dependencies before running
the app.

Please install the dependencies using ```flutter pub get``` command to install the dependencies.
The app was designed and made using the latest version of flutter.

The ```utils/constants.dart``` file has the internet and connection constants including the ```INTRADAY_TICKERS```
and the ```API_KEY``` there is also a ```localhost``` link that was used during development but you can ignore that

## Known Issues

The app fetches data from the marketplace API. They currently have the free paid versions of the
API, its highly advised that you input your ```API_Key```. The one that is there is limited to a 100
requests and can time out any moment. The file to change is ```/utils/constants.dart``` and change the
```API_KEY```.

If you don't have or you are angry at the API provider you can make and endpoint serving
```
{ "pagination": {
    "limit": 100,
    "offset": 0,
    "count": 10,
    "total": 10
    },
    "data": [
        {
    "open": 145.72,
    "high": 156.48,
    "low": 144.6,
   "last": 155.03,
    "close": 144.8,
    "volume": 1919193.0,
    "date": "2022-10-28T16:00:00+0000",
   "symbol": "AAPL",
    "exchange": "IEXG"
    },]
}
```

and then change the location the app goes to get the data from API to localhost and you are good to
go

## Dependencies
The app has a couple of external dependencies to enable it to run well, they include
```dio``` for the network connections and fetch actions. ```provider```
for the state and Promises management of the app ```connectivity_plus```
for checking the internet and network connectivity and ```intl``` for the date
and time conversions for easier reading and usage.

## Sign off
Feel free to play around with the app. The repo is public so you can always clone and make changes,
I am a big fan of open source and this is another one where anybody feels ok and willing to contribute
or correcting any mistake i made on the app, i am looking forward.

Live long and prosper
