# jast-shiny
Just another shiny template

## Purpose
Shiny is an R package that makes it easy to build interactive web apps straight from R: So-called “shiny-apps”. These apps can be hosted on a webpage as standalone apps, they can be embedded in  Markdown documents, or they can be part of a dashboard. 

This repository contains an RStudio project template that allows you to quickly set up a shiny app - without having to spend hours on learning shiny. We want to flatten the learning curve! Also, this project template is structured based on best practices.

### System requirements
What you need:
* A current R installation
* Best editor to use: RStudio
* Optionally: renv. 
	* Renv is a package that allows you to install R packages in a project-specific R library.  It uses a so-called lockfile that specifies the versions of R as well as of all libraries used in a project. This ensures that we are all using the same libraries and avoid unexpected behaviour due to different versions of packages. In general, this is a great way to increase computational reproducibility of your work!
	* The given renv-lockfile uses R 4.2.1. 
	* You can always choose to not use renv (delete the renv-folder, renv.lock and .Rprofile-file) - or delete the lock-file and create it based on your own needs.
	* Learn more about [renv](https://cran.r-project.org/web/packages/renv/vignettes/renv.html)


### Requirend R-skills
All you need to know is R and the tidyverse. If you’re not using the tidyverse yet, we strongly recommend you do so. It really does make life easier! Check: [https://www.tidyverse.org/learn/](https://www.tidyverse.org/learn/)



## What's included in this Repo

Besides this readme file, the repo of this template contains the following elements:

* A license file, which specifies the license.
* An R-project file. If you are not used to working with projects, read this: [https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects)
* A renv.lock file: This file sets up your R in a way that everything which shiny needs is available (all packages, libraries, etc.)
* The file server.R which sets the main parameters for the server, if the app is hosted on a server. In this template all parameters for the server are contained in this file and nowhere else in the R-code.
* The file ui.R which sets the main parameters for the user interface of the app. Again, following the logic that in this template we separate the different elements of the app as much as possible, all parameters related to the ui should be defined in this file.
* The file app.r, which is the core of your actual app. Here you can define what the app displays, in what manner, etc. While the files for the server and the ui can be left as they are in order to use the default values, the app.R file is the one you have to adapt in order to build your own shiny app.
* A series of folders (renv, R, www and data) in which you can place things that your shiny app needs. Having these folders keeps things nice and tidy in your repository. More specifically, the folders are:
	* Renv: the basic settings of R (packages, etc.) that you need in order for you shiny app to work. See also the file “renv.lock” as described above.
	* R: This folder contains functions on which your shiny app might rely on.
	* Data: This folder contains all the necessary data which your shiny app uses.

You can find a schematic overview over the content including more precise guidance where to put your content in the instructions section.

### Features
* App structure using separated files for server.R and ui.R
* Folder structure to keep a neat server.R
* Sample of all standard input widgets
* Commented code to give you examples where to do what

## How to get started
Before we start, the principle of this template is that we provide you with a working shiny app that you can then modify in order to set up your own. Like the “what’s in the repo” section specified, you mainly will be working in the **server.R,** **ui.R** files and the scripts in the **R-folder**. In order to make working with the files easier, they contain a lot of comments to help understand how the code works.

### Get your local version
This is a template repo, so you can use it to create your own repo out of it and clone your repo on your computer. Alternatively, if you are not so familiar with git, you can download it as a zip archive. 
tinytex::install_tinytex()
time to start with shiny???

### Running the app
After setting up the renv environment or installing the required packages, you can run the shiny app from your local machine out of RStudio: whenever you are in one of the files app.R, ui.R, or server.R, you will see a "Run App"-Button in the upper right corner of the script window.

### Modifying the project to build your own app

#### Reactivity
Shiny introduces so called reactivity: code is executed as a reaction on user actions/input and knows, which parts of the code depend on these changes, leading to "chain reaction" of re-computations of  all affected variables and outputs. For deeper understanding, read more [here](https://mastering-shiny.org/basic-reactivity.html) and visit a short course [here](https://minecr.shinyapps.io/03-reactivity/#section-reactive-elements).

#### Adding your own functionality
1. Decide which input widgets (e.g., slider, text field, buttons) you need
	In which way should the user of your app be able to interact with your app?
	Tip: start with one (if necessary)
2. Think of where the data is coming from

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
#### A word on secrets
Please pay attention to not check in any passwords or API-tokens to git. Instead, add such secrets as environment variables to your project. An efficient workflow is the following:
1. Add a **file secret_keys.R** to your project folder.
2. If you work with git, add a line `secret_keys.R` to your **.gitignore** file
3. When deploying your app, don't upload this file to RStudio connect or shinyapps.io
4. You can create environment variables in the following way
	````
	Sys.setenv(name_of_my_secret_variable="my secret key")
	````
5. Whenever you start a fresh R session locally, source the file **secret_keys.R**
6. Whereever you need the secret value, you can access it through the following command (the parameter unset specifies the value that Sys.getenv returns if the environment variable with that name does not exist)
	````
	Sys.getenv("name_of_my_secret_variable", unset = NA)
	````

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