# Movie App

Movies is a native iOS application that lets users discover popular movies, explore detailed information, watch official trailers, and read user reviews. Built with SwiftUI and MVVM architecture, the app provides a clean, responsive, and modern experience powered by The Movie Database (TMDB) API.

## Features

- **Movie List**: See popular movies in a responsive grid layout powered by the TMDB API
- **Movie Details**: View detailed information including poster, backdrop, title, runtime, release date, rating, and overview.
- **Watch Trailer**: Play the official YouTube trailer directly within the app using a modal presentation.
- **User Reviews** : Read reviews submitted by users, including author details, ratings, and formatted dates.

## Screenshots
<img width="240" alt="Screenshot 2026-01-18 at 05 30 12" src="https://github.com/user-attachments/assets/50e7a5b6-f092-4392-8315-091c43ea364c" />

<img width="240" alt="Screenshot 2026-01-18 at 05 31 08" src="https://github.com/user-attachments/assets/3ff6e969-b030-448e-a01c-f6a337b86368" />

## Video Screenshot

https://github.com/user-attachments/assets/3c9f994b-95eb-4ac3-9890-84afea46bc9b

## Requirements

- iOS 17.0+
- Swift 5.0+

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/MovieTMDB.git
    cd MovieTMBD
    ```

2. Open the workspace in Xcode:

    ```bash
    open movies.xcodeproj
    ```

4. Build and run the project on your simulator or device.

## Usage

1. **Movie List:**:
    - Launch the app to view a grid of popular movies.
    - Scroll vertically to discover more movies.
    - Additional movies are loaded automatically as you reach the end of the list.
2. **Movie Details**:
    - Tap on a movie poster to open the movie detail screen.
    - View key information such as the movie poster, backdrop image, title, runtime, release date, rating, and overview.
    - Move right (toward 0) for warmer (reddish) tones and left (negative values) for cooler (bluish) hues.

3. **Watch Trailer**:
    - Tap the Trailer button on the movie detail screen.
    - The official YouTube trailer will be presented in a modal view.
    - If no trailer is available, an alert will be shown.
4. **Read Reviews**:
    - Scroll down to the Reviews section to read user reviews.
    - A preview of reviews is displayed for better readability.
    - If no reviews are available, a placeholder message will be shown.
  
Feel free to reach out if you have any questions or need further assistance!
