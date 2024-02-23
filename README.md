# News Article API With UIKit Xib and VIPER Design Pattern

## Introduction
This project is a simple implementation of a News API using UIKit Xib and VIPER design pattern. It provides features to interact with news data.

## Usage
Once the project is running, you can explore the following functionalities:

### Categories
- View a list of available news categories.
- Select a category to see news sources related to that category.

### News Sources
- Browse through a list of news sources within a selected category.
- Search for news sources by name.

### Articles
- Choose a news source to view articles from that source.
- Search for articles by keywords within the selected news source.
- View detailed article content in a web view.

## VIPER Design Pattern
This project follows the VIPER design pattern, which stands for View, Interactor, Presenter, Entity, and Router. Each component has its responsibility, making the codebase modular and easy to maintain.

- **View:** Responsible for displaying UI and sending user actions to the Presenter.
- **Interactor:** Handles business logic and communicates with data sources.
- **Presenter:** Acts as an intermediary between View and Interactor, processes data, and updates the UI.
- **Entity:** Represents data objects used by the Interactor.
- **Router:** Handles navigation between different modules.

## Screenshots
<p float="left">
  <img src="https://github.com/marufboy/news-viper-uikit/assets/47018743/8d9efc08-6ca5-4986-87b6-a1c92cf2613f" width="200" />
  <img src="https://github.com/marufboy/news-viper-uikit/assets/47018743/36c16273-532a-4352-9b47-3172d187aedc" width="200" />
  <img src="https://github.com/marufboy/news-viper-uikit/assets/47018743/f96bce32-6d90-4299-b7c7-539cde81ea66" width="200" />
  <img src="https://github.com/marufboy/news-viper-uikit/assets/47018743/2525fe82-f73b-4390-9eeb-72fed9177507" width="200" />
</p>

## Credits
This project utilizes the News API for fetching news data. 

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
