# Additional Set up for Windows

There are additional configurations for windows:

- Use ``` gem 'pg', '>= 0.19.0.beta' ``` instead of the regular ``` gem 'pg' ```

- Download the windows installer for version 9.5.3 from [this site](http://www.enterprisedb.com/products-services-training/pgdownload#windows)

- Instructions on entering your windows environment path can be found [here](http://www.computerhope.com/issues/ch000549.htm)

- Once there, look for the ``` path ``` option and add these 2 new lines
  - ``` C:\Program Files\PostgreSQL\9.5\lib ```
  - ``` C:\Program Files\PostgreSQL\9.5\bin ```

- Run ```PGAdmin.exe ```, connect your database using right-click, use the password that you initially set during installation.

- Configure your ```database.yml``` in your new rails app folder, under ``` development ``` and ``` test ```, add ```username: postgres ```
and ```password: <the-password-you-set> ```

- Finally, proceed to [NodeJs](https://nodejs.org/en/) website and downloaded the most current NodeJS version and install.
