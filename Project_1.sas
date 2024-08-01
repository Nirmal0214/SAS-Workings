/* Cover Page */

proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "SAS Analysis of Meteorological Data" /
style=[font_size= 20pt just= c];

p '^{newline 6}';
p "Overview:" /
style=[font_size= 18pt just= left];
p "
This SAS script is designed for the analysis and visualization 
of meteorological data from the valentia.csv dataset, focusing on
 key weather variables across different time periods. The tasks include
 importing data, examining dataset structure, data preprocessing such as 
 renaming variables and adding new calculated fields, and conducting exploratory 
 data analysis through statistical summaries and visualizations like scatterplot 
 matrices and histograms. Each section of the script is clearly labeled and 
 structured to facilitate an understanding of the data's characteristics 
 and underlying patterns. The analysis is conducted within the framework 
 of SAS software, utilizing its powerful data management and analytical 
 capabilities to draw meaningful insights from the weather dataset." /
style=[font_size= 14pt color=BLUE font_style= italic just= c];
run;

proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Importing the Dataset:" /
style=[font_size= 18pt just= left];
/* Importing Data */
p '^{newline 1}';
p 'INFERENCE :-'/style=[font_size= 10pt fontweight=bold ];
p "&spaces Using SAS commands, the file was imported and changing new name weather in the local directory." /style=[font_size= 10pt ];
p '^{newline 1}';
run;
FILENAME REFFILE '/home/u63920244/my_shared_file_links/u63819461/datasets/valentia.csv';/*path of the csv file directory*/
PROC IMPORT DATAFILE=REFFILE
    DBMS=CSV REPLACE /*restores csv file every time code is exceuted */
    OUT=s40840.weather;/*weather file under S40840*/
    GETNAMES=YES; /*obtains the column names*/
RUN;

proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Dataset Contents" /
style=[font_size= 18pt just= left];
/* Displaying Dataset Contents */
PROC CONTENTS DATA=s40840.weather;
run;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Viewing the First 15 Rows of Data" /
style=[font_size= 18pt just= left];
/* Viewing Data */
PROC PRINT DATA=s40840.weather(OBS=15); /*Printing the first 15 rows*/
    VAR date month year maxtp mintp rain; /*specifying the variables to be printed*/ 
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Scatterplot Matrix for Selected Meteorological Variables" /
style=[font_size= 18pt just= left];
/* Scatterplot Matrix */
PROC SGSCATTER DATA=S40840.weather; /*specifying the dataset and type of plot to be plotted */
    WHERE year = 2021;/*declaring the year*/
    LABEL maxtp = 'Maximum Temperature';/* labeling variable to be shown in the graph*/
    LABEL mintp = 'Minimum Temperature';
    LABEL rain = 'Rain';
    LABEL wdsp = 'Wind Speed';
    MATRIX maxtp mintp rain wdsp / /*specifying the variables for which scatter matrix plot has to be plotted*/ 
        TRANSPARENCY=0.6 MARKERATTRS=(COLOR=blue SYMBOL=CIRCLEFILLED); /* specifying the color, transparency and symbol*/
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Renaming Variables" /
style=[font_size= 18pt just= left];
/* Renaming Variables */
DATA s40840.weather;
    SET s40840.weather;
    RENAME maxtp = max_temp /*changing the column names*/
           mintp = min_temp /*changing the column names*/
           wdsp = wind_speed; /*changing the column names*/
RUN;

PROC PRINT DATA=s40840.weather(OBS=10); /*Printing the first 10 rows*/
    VAR date month year max_temp min_temp wind_speed; /*specifying the variables to be shown*/
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Adding a New Derived Variable" /
style=[font_size= 18pt just= left];
/* Adding New Variable */
DATA s40840.weather;
    SET s40840.weather;
    wind_speed1 = round(wind_speed / 2, 0.1);/*Creating new variable and dividing wind speed by 2*/ 
RUN;

PROC PRINT DATA=s40840.weather(OBS=5);/*Printing the first 5 rows */
    VAR wind_speed wind_speed1;
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Filter" /
style=[font_size= 18pt just= left];
/* Filtering Observations */
title "Filtering for Days with Maximum Temperature Greater Than 25°C";
proc print data=s40840.weather;
    where max_temp > 25;
    var date month year max_temp min_temp rain; /* Include only specified variables */
    title "Days with Maximum Temperature Greater Than 25°C";
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Statistical Summary" /
style=[font_size= 18pt just= left];
/* Statistical Summary */
title "Statistical Summary of Temperature and Rain Variables";
proc means data=s40840.weather n mean median std max;
    var max_temp min_temp rain; /* Specify the variables to analyze */
    output out=work.temp_summary mean= mean median= median std= std max= max;
    format mean median std max 8.2; /* Format the statistics to 2 decimal places */
    title "Summary Statistics for Maximum and Minimum Temperature and Rain";
RUN;

PROC PRINT DATA=work.temp_summary;
    title "Printed Summary Statistics";
RUN;


proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "Histogram and Density Plot of Wind Speed" /
style=[font_size= 18pt just= left];
/* Additional Plot */
title "Histogram and Density Plot of Wind Speed";
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=s40840.weather;
    title "Histogram of Wind Speed with Density Overlay";
    histogram wind_speed / binwidth=1 binstart=0 fillattrs=(color=H0A58AC8) transparency=0.5; /* Light blue color for histogram bars */
    density wind_speed / type=kernel lineattrs=(color=darkred thickness=2); /* Dark red and thicker line for density */
    xaxis label="Wind Speed (km/h)";
    yaxis label="Frequency";
RUN;
ods graphics / reset;
