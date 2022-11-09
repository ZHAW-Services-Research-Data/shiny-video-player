# shiny-video-player
A video player to quickly watch many videos

## Purpose
This video player was built to assist in a labeling task in the context of creating the ground truth for machine learning.
This video player allows to quickly navigate to and display videos of different individuals (aka trials). For each trial, a set of three videos is expected. Each video can be split in 5 phases. The timestamps of each phase of each video is specified in an excel file (ref. folder data).

## System requirements
What you need:
* A current R installation
* Best editor to use: RStudio


## Features
* Dark mode
* Autoplay of videos as an option
* Dropdown to select the trial (the dropdown is filled based on the excel sheet)
* 3 video player for different camera angles
* 6 play buttons per video player to jump to the different phases
* A separate tab showing the video list with the defined timestamps
* Configuration options:
	* Names of buttons (Phases)
	* Width of columns in main panel
	* Width of video players

## Running the app
Yyou can run the shiny app from your local machine out of RStudio: whenever you are in one of the files app.R, ui.R, or server.R, you will see a "Run App"-Button in the upper right corner of the script window.


#### Project structure
```
jast_shiny_template
|--- app.R.     - contains the runApp-command (normally no need to edit this file)
|--- ui.R.      - contains all elements that are displayed on your shiny-app-page, e.g., input widgets, plot-elements
|--- server.R   - contains all logic and calculations to react on user input and provide the content for the output elements defined in ui.R
|--- data/
     |--- files - containing your data (csv, rdata, xlsx,...)
|--- www/
     |--- media - resources that you want to display in your app, e.g., logo, other images (png, jpeg,...)
|--- R/                                      - scripts containing defintions, mostly functions that you will use in the server.R; the files are sourced in alphabetical order when starting the shiny app
     |--- 00_libraries.R                     - put here all R-packages that you need in your project
     |--- 00_library_functions.R             - functions that are candidates to put in an R package (that does not yet exist)
     |--- 01_theme_definition.R              - define here the design of the site and also your ggplot theme
     |--- 02_misc_functions.R                - define functions that help you reduce redundant code, like calculations you need in serveral locations of your code
     |--- 10_input_functions.R               - define functions that read in data and url parameters
     |--- 20_data_wrangling.R                - define functions that transform your data
     |--- 30_plot_functions.R                - define functions that create plots using ggplot
     |--- 40_output_functions.R              - define functions that  allow data output, e.g., to download datasets
     |--- 99_code_run_once_when_app_starts.R - e.g., loading data sets that won't change over the time of the deployment of the app
```


## Deploying and publishing the app
#### shinyapps
Shinyapps.io is a cloud service that provides a basic free plan to deploy and publish shiny apps. The different plans vary in the number of applications and active computation hours per month
https://www.shinyapps.io/
There is extensive documentation about this service [here](https://docs.rstudio.com/shinyapps.io/).

#### RStudio connect
If your organisation provides access to RStudio connect, you can connect your local RStudio with the RStudio connect server.
Steps to publish
1. click the publish button
2. select your account
3. select the files to upload (don't upload files that contain secrets!)
4. after uploading, visit the RStudio connect dashboard of your app and add all environment variables needed by your app
5. specify the visiblity/access level of your app
6. distribute and enjoy ;-)

#### Github actions
Purpose: deploy automatically when merging to main
Steps: todo

## FAQ
### Do I need to use renv?
No, you can use your local R installation and install all required packages into your usual R library folder (see above).

## Disclaimer
This is still under development and will be improved based on the feedback of the first users.
