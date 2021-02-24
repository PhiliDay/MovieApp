# Movie

This is a SwiftUI project implementing a movie list using the IMDB api.
## What I have implemented:

* Ability to click on a movie and display detail view
* Can swipe to delete
* Edit button enables deleting and rearranging of list
* Click button to extend the cell and see the crew names
* Detail view, can click the button to rearrange order
* Images download and cache

## Issues I overcame:

* Images were downloaded once.  They took a long time to download and meant the user wasn’t seeing the images for a while.  Also when you scrolled up and down the images would disappear and not download again.  Therefore I introduced an image cache here.

* Added Result to handle both success and failure cases in the API call

* The NavigationView caused a gap between the header and the image in the detail view.  This issue occurs in a nested navigation view.  I found that you had to delete the navigation view for the nested view.


## What I want to improve:

* A more smooth transition of the extension of the cell.
* I feel like there’s a better way of swapping the image on touch of the button.
* Obviously the layout isn’t ideal - all quite squished, alignment of the button looks funky.
* Differentation in size of ImageView is clunky, would like to make a more efficient way to do this.
* Currently on click every row expands rather than the individual row

## What I would add if I had more time:

###### v1
* Loading screen
* Testing
* Fetch data screen
