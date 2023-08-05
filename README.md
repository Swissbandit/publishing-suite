Welcome to the publishing-suite git of crowetic.

These scripts are built to be utilized for publishing videos on QDN.

Down the line there will be further use cases added, but the initial versions are built for publishing VIDEOS only.

## -----DETAILS----

The scripts contain the ability to:

- Download and publish videos from various video hosting platforms.
- Publish entire folders full of videos on local machine.
- Re-encode videos (with the help of ffmpeg).
- Create and publish a base64 screenshot along with video metadata in a metadata.json file for usage in various Q-Apps.
- Ensure that the published data has correctly written information so that publish does not fail.
- Creates both the Qortal on-chain metadata and metadata.json file for allowing on-chain metadata searches.

The scripts in their initial version have been HEAVILY tested for Brighteon during the build-out of the QBrighteon Q-App, and lightly tested for YouTube and Unite videos.

Other video platforms have not been tested as of Aug 3 2023.

YouTube and Unite videos were only very lightly tested as of Aug 3 2023

## -----USAGE-----

To utilize the scripts, first, figure out which method you're going to use to publish. (The scripts DO have built-in help documentation, but it is not perfect as of initial versions.)
Many improvements will be taking place over time.

Ensure that you have the 'publish-videos-qdn' script CONFIGURED BEFORE RUNNING, with the privkey of the account you will be publishing, registered name, and other required information.
You must EDIT the script as of first version, and input the required information.
If you do not know how to acquire your Qortal account's private key, ask crowetic for assistance, or ask someone in the community. 

### More Details coming soon as the first release is made, etc.
