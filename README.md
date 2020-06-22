# News
Helps the users browse the world wide news.
# Criteria
Built using MVC. Used Xcode 11.5 and Swift 5.2
No storyboard or Xibs. Built with programmatic UI.
(Planned on using MVVM, since there is not much change in state of data, I opted for MVC.
Deployment target is 13.0
# About App
This app has 2 screens. 1st screen has a search bar. Users can enter the serach term and the results are dynamically filtered and populated in the 1st screen. Each news article has author and title labels and a background image. Tapping on any article navigates the user to 2nd screen and also tapping on URL launches wkwebview.

 #1 Search functionality
 - Implemented using UISearchController. It comes with Cancel button, on tapping the cancel, it loads all the results.
 - Does not respond to white spaces and new line characters.
 - Filters the results for every character entry/deletion in SearchBar and dynamically updates the CollecttionView with subtle animation.
 - Used UICollectionViewDiffableDataSource, which keeps track of differences in the data automatically with animating changes(updates, insertions and deletions).
 
   #2 Card style items
   - News articles are loaded into card style collection view cells with horizontal scrolling.
   - Tapping any cell loads detail screen. Detail screen has "Read more" button(url param).
   - Detail screen has "Done" button, it dismisses the detail screen and shows landing screen.
   - Tapping "Read more" launches wkwebview with forward, backward and close buttons.
   - Close button dismisses webview.
   
   #3 Image Caching
   - cached the images using NSCache. When user scrolls left - right and right - left, first checks in the Cache and loads from cache, if not available in Cache, then only makes network request.

# To Do
- Room for improvement of code coverage.
- Lots of scope to give better user experience by opening the card cell in full screen mode with full details of news article without navigating the user to other screen (Just like AppStore, I tried but could not accomplish the desired results).
-  Lanscape orientation.
