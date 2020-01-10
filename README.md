# PrintStation
### [ 2017 Project ]

## Overview

* PrintStation is a dedicated web portal and mobile application for students and faculty to submit their print requests and get their documents printed. 
* The system allowed students and faculty to log on with their account, upload the document(s) they want to print and then send their print request from anywhere that has Internet access. 
* Both, students & faculty, can also place orders for stationery supplies such as pens, files, etc. 
* The purpose of this system is to make the printing, binding and purchasing process at a university much more convenient and efficient.
* The system would work based on a credit system and benefit both the students and the university.

## Implementation Details

### Web Application - [go](https://github.com/avikola/printstation/tree/master/PrintStation/PrintStation) - [screenshots](#web)

Built in C# with ASP.NET framework for front-end & back-end operations alongside MS SQL Server.

* [ASP.NET](https://dotnet.microsoft.com/apps/aspnet)

**APIs Used**

* iTextSharp - a .NET PDF library\
Used for counting the number of pages in pdf documents uploaded; for calculating price.

* Microsoft Word Object Library\
Used for counting the number of pages in .doc, .docx, .rtf documents uploaded; for calculating price.

* Simple Mail Transfer Protocol\
To send e-mail notifications to users, informing them that their orders are ready for collection.


### Mobile Application - [go](https://github.com/avikola/printstation/tree/master/PrintStation/PrintStation_M) - [screenshots](#mobile)

Mobile application built with Xamarin Framework that supports varying designs + portability across OSes.\
& SQLite for local database system management.

* [Xamarin](https://dotnet.microsoft.com/apps/xamarin)
* [SQLite](https://www.sqlite.org/index.html)

## Screenshots

### Web
<br/>

<div align="center">
<img src="https://github.com/avikola/printstation/blob/master/screenshots/web/home.jpg" alt="home" width="700"/>
<img src="https://github.com/avikola/printstation/blob/master/screenshots/web/printscreen.jpg" alt="print screen" width="700"/>
<img src="https://github.com/avikola/printstation/blob/master/screenshots/web/catalogue.jpg" alt="catalogue" width="700"/>
<img src="https://github.com/avikola/printstation/blob/master/screenshots/web/cart.jpg" alt="shopping cart" width="700"/>
</div>

<br/>

### Mobile
<br/>

<div align="center">
  <img src="https://github.com/avikola/printstation/blob/master/screenshots/mobile/home.png" alt="login" width="250"/>
  <img src="https://github.com/avikola/printstation/blob/master/screenshots/mobile/dash.png" alt="dashboard" width="250"/>
  <img src="https://github.com/avikola/printstation/blob/master/screenshots/mobile/cart.png" alt="cart" width="250"/>
</div>

<br/>
<br/>
<br/>
<br/>

<p align="center"><i>In Collaboration with Sreya Ratnika</i></p>
