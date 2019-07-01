# Beer-somelier
## Architecture
MVVM + RxSwift/RxCocoa

## Third party modules
* RxSwift
* RxCocoa
* SwiftyJSON - To easily parse API responses and map them into models
* SnapKit - To simplify the autolayout setup, since I didn't use Storyboards

## Known limitations

I didn't have time to implement the following, although, I had, at first, the intention to:
* **Persistence**: I would have use Realm or CoreDate to save the query and its results, and make the `BeerProvider`serve them when available instead of trying to get them from the Punk API.
* **Unit Tests**
* **Empty views**: I first designed the app to have some explanatory views when the user hadn't typed anything on the search bar or when the query returned an empty result.
* **Loader**: A loader to let the user know some process was being executed, and so he/she needed to wait (like when retrieving results from the API).
* **Error handling**: When there is no internet, or the was some kind of error while making the HTTP request, the user is not informed about it. I Made a `RequestError` enum to identify the cause of the error and make it easier to tell the user what exactly occurred, but it is not actually used.

## Additional notes

I usually use Alamofire or Moya (a layer on top of Alamofire) to make the HTTP Requests. Since the exercise asked to use the minimum third party libs possible and only a simplt `GET` call is necessary for this exercise, I decided to build an `APIManager` which performs a simple `URLRequest`.
