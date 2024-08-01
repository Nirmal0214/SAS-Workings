
# Analytical Forecast: Leveraging SAS to Decode Meteorological Trends

## Overview

This SAS-based project analyzes and visualizes meteorological data from the `valentia.csv` dataset, focusing on key weather variables such as temperature, rainfall, and wind speed. Designed for a course titled "STAT40840", the script handles tasks including data importing, preprocessing, exploratory data analysis, and statistical summarization. The purpose is to draw meaningful insights from the data, exploring trends and relationships within various weather conditions over different time periods.


## Project Files

- **`valentia.csv`**: Dataset containing historical weather data.
- **`weather_analysis.sas`**: Main SAS script for processing and analyzing the dataset.

## Setup and Installation

To properly set up and run this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://[github.com/your-username/your-repo-name.git](https://github.com/Nirmal0214/SAS-Workings)
   cd SAS-Workings
   ```

2. **Dataset Preparation**:
   Place the `valentia.csv` file in the directory specified in the SAS script. Adjust the file path in the `weather_analysis.sas` script as necessary.

3. **SAS Installation**:
   Ensure SAS software is installed on your machine. If not, download it from [SAS's official website](https://www.sas.com/en_us/software/sas9.html).

## Usage

To perform the analysis:

1. Open SAS.
2. Load the `weather_analysis.sas` script.
3. Execute the script to process the data and generate outputs such as statistical summaries and visualizations.

## Script Components

- **Importing Data**: Loads the data from `valentia.csv` into a SAS dataset.
- **Displaying Dataset Contents**: Outputs metadata about the dataset using `PROC CONTENTS`.
- **Viewing Data**: Displays the first 15 rows of the dataset to give a preliminary view of the data.
- **Scatterplot Matrix**: Generates a scatterplot matrix for the year 2021 to examine relationships between variables like temperature, rainfall, and wind speed.
- **Renaming Variables**: Simplifies the names of variables for better clarity and ease of analysis.
- **Adding New Variable**: Introduces a new variable `wind_speed1`, which represents half of the original wind speed values.
- **Filtering Observations**: Filters and displays rows where the maximum temperature exceeds 25°C.
- **Statistical Summary**: Provides a statistical summary of temperature and rain variables using `PROC MEANS`.
- **Additional Plot**: Creates a histogram with a density overlay for wind speed to explore its distribution.

## Contributing

Contributions to enhance the project are welcomed. Please fork the repository and submit a pull request with your improvements. Make sure your changes are well-documented and include appropriate tests or examples.

## License

This project is made available under the MIT License. For more details, see the [LICENSE](LICENSE) file in the repository.

## Contact
- **Email**: [nirmalkumar0214@gmail.com](nirmalkumar0214@gmail.com)

Please feel free to reach out with any questions, suggestions, or potential collaborations. Your feedback is greatly appreciated!
