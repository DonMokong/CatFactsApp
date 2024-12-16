# CatFactsApp
CatFactsApp is a fun and simple iOS application built with SwiftUI that fetches and displays random cat facts and images from an API. The app uses the [Random Cat Picture](https://developers.thecatapi.com/view-account/ylX4blBYT9FaoVd6OhvR?report=bOoHBz-8t) for retrieving cat images and [Random Cat Fact](https://github.com/wh-iterabb-it/meowfacts) for fetching random cat facts.


## Features
* Displays random cat facts with an option to fetch new facts on tap.
* Shows a random cat image along with each cat fact.
* Beautiful UI with a smooth user experience.
* Error handling and loading indicators when fetching data from the APIs.
* Customizable background image for a unique look and feel.

## Technologies Used
* SwiftUI: For building the user interface.
* Kingfisher: For handling asynchronous image loading and caching.
* Combine: For managing reactive data flow.
* URLSession: For making API requests.
* XCTest: For unit and integration testing.

## Requirements
* iOS 14.0 or higher.
* Xcode 12.0 or higher.


## Setup and Installation

### To get started with the CatFactsApp project, follow these steps:

1. Clone the repository:

```
git clone https://github.com/yourusername/CatFactsApp.git
```

2. Open the project:

* Open CatFactsApp.xcodeproj in Xcode.

3.Run the app:
* Select a simulator or a connected device.
* Press the Run button (⌘R) to build and run the app.

## Usage
1. When you open the app, you will be greeted with a Welcome screen and a Start button.
2. Tap Start to load a random cat fact and image.
3. The app will show the cat fact and image in a beautifully designed view.
4. Tap anywhere on the screen to fetch new random cat facts and images.

## Testing
### The app includes unit tests that test the logic and API integration. To run the tests:

1. Open the Test Navigator in Xcode (⌘5).
2. Select a test class or individual test cases.
3. Click the Run button to execute the tests.

## Test Coverage
* The app has tests for the `CatViewModel` to ensure data is fetched properly from the API.
* Mock data is used in the tests to simulate different API responses and ensure the app handles errors gracefully.

## Project Structure
* **CatFactsApp**: Main app code using SwiftUI.
* **CatViewModel**: ViewModel to manage the cat fact and image data.
* **CatService**: Service class for handling API requests.
* **Tests**: Unit tests for the app's logic and API integration.

## Contributing
We welcome contributions to CatFactsApp! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to your forked repository (`git push origin feature-name`).
5. Open a pull request to the main repository.


## Acknowledgments
* TheCatAPI for providing the cat images.
* CatFact API for supplying the random cat facts.
