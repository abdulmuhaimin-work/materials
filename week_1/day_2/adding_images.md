# Day 2 Lessons

## Adding Images in Rails

- Images in rails are added with the helper method `image_tag`

- For example:

  ```
  <%= image_tag "name-of-image.png" %>
  ```

- You can also add classes by passing it like this:

  ```
  <%= image_tag "name-of-image.png", class: "css-class" %>
  ```

- If you need more reference, refer to [image_tag](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-image_tag)
