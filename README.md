# Movie

This is a SwiftUI project implementing a movie list using the ImDb api.

## What I have implemented:

* Ability to click on a movie and display detail view
* Can swipe to delete
* Edit button enables deleting and rearranging of list
* Click button to extend the cell and see the crew names
* Detail view, can click the button to rearrange order
* Images download and cache
* Fetch data screen, if there is no data then the user is able to refresh the screen (used Charles to test this)
* Activity Indicator shows user the data is loading
* Basic Unit and Snapshot tests - uses dependency https://github.com/pointfreeco/swift-snapshot-testing for snapshot testing

## Issues I had:

* Images were downloaded once.  They took a long time to download and meant the user wasn’t seeing the images for a while.  Also when you scrolled up and down the images would disappear and not download again.  Therefore I introduced an image cache here.

* Added Result to handle both success and failure cases in the API call

* The NavigationView caused a gap between the header and the image in the detail view.  This issue occurs in a nested navigation view.  I found that you had to delete the navigation view for the nested view.

* Initially when implementing the fetch data screen, it would show before the first API call as the movies array would be empty.  I added a count so that it would only appear after this first call.

* Currently unable to get the ActivityIndicatorView to disappear if the API has finished fetching.  View stays currently.


## What I want to improve:

* A more smooth transition of the extension of the cell.
* I feel like there’s a better way of swapping the image on touch of the button.
* Obviously the layout isn’t ideal - all quite squished, alignment of the button looks funky.
* Currently on click every row expands rather than the individual row
* Quite slow - looking into this (started in last few commits)
* Figure out removing activity indicator view
* Testing
* Design pattern could be nicer

## What I would add if I had more time:

###### v1
* Testing
* Loading

###### v2
* Better layout / UI
* Error View
