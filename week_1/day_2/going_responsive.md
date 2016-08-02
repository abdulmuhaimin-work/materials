# Day 2 Lessons

## Going Responsive

- Sometimes, flexboxes may not be as 'flexible' as you'd like them to be;

- For example, you'd like your grid layout to be even as often as possible in all media sizes

- This is where setting we introduce css breakpoints. Breakpoints are a css method to introduce
or remove certain stylings if the size of the media reaches a certain set limit.

- For example,

  ```
  @media all and (max-width: 1199px) {
    .grid {
      <add-this-styling>
    }
  }
  ```

- In all medias (mobile, laptop, tablets), the `grid` class will
have <add-this-styling> added once the size of the screen reaches 1199px or smaller.

- Now let's add it for our project.

- Proceed to the end of the `landing.scss` file and add the following:

```
  @media all and (max-width: 1199px) {
    .features {
      max-width: 600px;
    }
  }
```
