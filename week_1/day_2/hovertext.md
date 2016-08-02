# Day 2 Lessons

## Bootstrap Hovertexts

Challenge: Find 4 images and create them as follows:

  ![Example](images/4images.png)

- Hint: Refer to what you've learnt with flexboxes so far, there are also examples inside `flexboxes.html`
and `hovertext.html` to help you.

- Once you've completed it, add the following into your `landing.scss` file

  ```
    .<your-class-name>:hover .invisible-layout {
      opacity: 1;
      transition: all 0.3s ease-in-out;
    }

    .invisible-layout {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 100%;
      width: 100%;
      opacity: 0;
    }

    .content {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      background-color: yellow;
      opacity: 0.5;
    }
  ```

- Once completed, you can add the following html into your flex elements:

  ```
  <div class="invisible-layout">
    <div class="content">
      <h3>I'm a watch!</h3>
    </div>
  </div>
  ```
