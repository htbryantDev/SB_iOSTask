# Student Beans iOS Task

## Conclusions from the candidate (Harry Bryant) 

###  Moving away from VIPER

Hopefully I have provided an example which  sufficiently demonstrates my ability. As you can see I decided to forgoe the use of VIPER for the following reasons:

- I haven't got any applied experience with VIPER. Although I am confident that I could have picked it up and completed the task following the existing architecture, I feel it would not result in a fair representation of my current ability.

- With the way that Apple moves, frameworks like SwiftUI + Combine are an inevitability. There is a wide consensus that these frameworks work really well with MVVM, and compelling evidence to suggest that MVVM was considered when they were initally built. Even though my current company does not leverage these frameworks, I thought it would be more important to demonstrate my understanding of the newer technology trends for this position.


### Leftover Work

- Write unit tests for ImageLoader by stubbing out the URLSession dependency. This would be done similar to the async tests in PhotosViewModelTests. 

### Extension work

- Implement Snapshot Testing for Views: I believe this to be the better way for verifying view code, rather than writing unit tests that assert the UI element's properties. (This is already made pretty hard with SwiftUI compared to UIKit). I'd probably use the following snapshot testing framework: https://github.com/pointfreeco/swift-snapshot-testing  

- Migrate Design System into separate package and import to project via SPM
 
- Add Persistance Layer to PhotosRequestService: A very simple approach would be to save down the successful JSON response to disk via the FileManager API. The file path could be composed of the URL + a timestamp which can be used to discern when to invalidate the caches' response. This should improve the performance of the app as it will reduce unnecessary repeated calls to the API, which will save the user's battery & data allowance.

- Given that the response result set is ~5000 items, it would be good to build an endpoint that supports pagination (10 items at a time, requesting the next page as the user scrolls to the bottom of the list). This should further improve the performance of the app due to the same reasons mentioned above.



