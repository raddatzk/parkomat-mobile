### Version 2.0
This version does not offer many visible new features, but brings some important **internal** changes.

**UI**:
* The change log is now a separate screen with easier readability, instead of the old information bar that was displayed at the bottom of the screen.
* The network connection indicator has been updated to respond faster to network changes.
* Updates of the app are done directly through the Play Store or App Store.
  **With this update the app no longer checks if a new version is available.**

**Internal**: 
* The change log now supports the Markdown syntax and is no longer loaded from the github servers, but is included with the app directly.
* The app now uses the new health endpoint in the Parkomat backend to check the connection.
  Earlier versions retrieved the full parking situation, which resulted in much more network traffic.

**Miscellaneous**:
* The source code was clearly cleaned up.
* There were certainly some bugs, which are all fixed now ;) 
