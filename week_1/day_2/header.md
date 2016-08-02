# Day 2 Lessons

## Bootstrap Header

- Now, let's add the header file on your landing page.

- Bootstrap provides a way of creating headers. You can refer to them here: [Bootstrap Navbar](http://getbootstrap.com/components/#navbar)

- Let's start by creating a new folder under `app/views` and call it `partials`

- Create a new html erb file called `_header.html.erb` inside it.

- Let's copy the one created inside the `header.html` example file

  ```
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">MagicForums</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-dropdown" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>

        <div class="collapse navbar-collapse" id="header-dropdown">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Topics<span class="sr-only">(current)</span></a></li>
            <li><a href="#">Log In<span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
      </div>
    </nav>
  ```

and paste it into the `_header.html.erb` file.

- Now we'll need to make some pretty big adjustments to your stylesheets.

- But, before that, let's add some bootstrap javascript files into your rails application. Open
your `application.js` and add the following below `//= require jquery_ujs`

  ```
  //= require bootstrap-sprockets
  ```

- First, let's rename your `application.css` file into `application.scss` file.

- Add the following into it:

  ```
  @import "bootstrap-sprockets";
  @import "bootstrap";
  @import "font-awesome";

  @import "views/*";
  ```

- `@import "views/*"` means that we are importing all files inside the `views folder`

- Next, remove the following from `landing.scss`
  ```
  @import "bootstrap-sprockets";
  @import "bootstrap";
  ```

- Afterwards, create a new folder called `views` in your `stylesheets` folder and move `landing.scss` into it.

- Finally, create `header.scss` inside your `stylesheets/views` folder and add the following:

  ```
  .navbar {
    margin-bottom: 0;
    height: 52px;
  }
  ```

- `.navbar` is a bootstrap created class. However, there are certain css settings that we want to override from it,
particularly the `margin-bottom` settings, so we're setting it to 0 and locking the height to 52px.

- Finally, open your `landing.scss` file and amend the following inside `.background`

  ```
  .background {
    height: calc(100vh - 52px);
  }
  ```

- What this does is that it now calculates the difference of 100vh - 52px as the height; It is deducting the
height of the header to ensure that the photo still fits the full page vertically.

- Finally, try out the responsive view by dragging and shrinking your browser size, see what changes.

- Challenge, try making canges to your header, set a different background color, change the font-size and colors, change the height. Play around.
