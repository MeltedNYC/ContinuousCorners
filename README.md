# UIBezierPath+ContinuousCorners

A Swift extension for creating a `UIBezierPath` with smooth rounded corners that will match the iPhone X. 

`+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]` will also give you smooth corners, but does not allow you to specify the radius for each corner individually - this does.

Based on [everdrone/react-native-super-ellipse-mask](https://github.com/everdrone/react-native-super-ellipse-mask) + [sugarmo/SGMSuperEllipsePath](https://github.com/sugarmo/SGMSuperEllipsePath) and converted to Swift.

**Note:** In order to match the iPhone X corner radius I used a value of `38.5` that was found by [Kyle Bashour](https://kylebashour.com/posts/finding-the-real-iphone-x-corner-radius).

## Example

![Example](example.png)
