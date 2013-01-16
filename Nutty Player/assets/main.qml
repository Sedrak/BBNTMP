// Default empty project template
import bb.cascades 1.0
import bb.multimedia 1.0


Page {
    Container {
        id: appContainer
        background: Color.create("#ff999999")
        layout: DockLayout {
        }
        Container {
            id: contentContainer
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            layout: AbsoluteLayout {
            }
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 0
            }
            Container {
                id: buttonContainer
                objectName: buttonContainer
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                leftPadding: 20
                rightPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                Button {
                    id: stopButton
                    text: "Stop"
                    onClicked: {
                        videoWindow.visible = false;
                        myPlayer.stop()
                    }
                }
                Button {
                    id: playButton
                    text: "Play"
                    onClicked: {
                        myPlayer.sourceUrl = ""
                        myPlayer.setSourceUrl("/accounts/1000/appdata/com.example.MTMediaPlayer.testDev_MediaPlayer5d15698d/data/Los Angeles Overreacts to Cold Temperatures.mp4")
                        if (myPlayer.play() == MediaError.None) {
                            videoWindow.visible = true;
                            contentContainer.visible = true;
                            videoSurface.visible = true;
                            playButton.text = "Yes"
                        } 
                        else {
                            playButton.text = myPlayer.play()
                        }
                    }
                }
            }
            ForeignWindowControl {
                id: videoSurface
                objectName: "VideoWindow"
                windowId: "myFwControl"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 0
                    positionY: 0
                }
                updatedProperties: WindowProperty.Size | WindowProperty.Position | WindowProperty.Visible
                visible: boundToWindow
                preferredWidth: 768
                preferredHeight: 1280
                onVisibleChanged: {
                    console.log("foreignwindow visible = " + visible);
                }
                onBoundToWindowChanged: {
                    console.log("VideoWindow bound to mediaplayer!");
                }
            }
            attachedObjects: [
               /* Sheet {
                 * id: videoSheet
                 * objectName: "videoSheet"
                 * content: Page {
                 * }
                 * }, */
                MediaPlayer {
                    id: myPlayer
                    // The file to play.
                    sourceUrl: "/accounts/1000/appdata/com.example.MTMediaPlayer.testDev_MediaPlayer5d15698d/data/Los Angeles Overreacts to Cold Temperatures.mp4"

                    // Use the device's primary display to
                    // show the video.
                    videoOutput: VideoOutput.PrimaryDisplay

                    // The id of the ForeignWindow control to
                    // use as the rendering surface.
                    windowId: videoSurface.windowId
                }
            ]
        }
    }
}





/*


Page {
    Container {
        
        Button {
            id: playButton
            text: "Play"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                
                if (!player.isPlaying) {
                    console.log("myPlayer.isPlaying = true");
                    player.play();
                } else {
                    console.log("myPlayer.isPlaying = false");
                    player.pause();
                }
            }
        }
        
        ForeignWindowControl {
            id: videoSurface
            windowId: "myVideoSurface"
            updatedProperties: WindowProperty.Size | 
                    WindowProperty.Position | WindowProperty.Visible
            visible: boundToWindow
            preferredWidth: 640
            preferredHeight: 480
        } 
        
        attachedObjects: [
            MediaPlayer {
                
                id: player
                property bool isPlaying: false
                
                sourceUrl: "/accounts/1000/shared/videos/movie.mp4"
                videoOutput: VideoOutput.PrimaryDisplay
                windowId: videoSurface.windowId 
                
                onMediaStateChanged: {
                    if (player.mediaState == MediaState.Started) {
                        console.log("player Started");
                        
                        playButton.text = "Pause"
                        isPlaying = true;
                    
                    } else if (player.mediaState == MediaState.Paused) {
                        console.log("player Paused");
                        
                        playButton.text = "Play"
                        isPlaying = false;
                    
                    } else if (player.mediaState == MediaState.Stopped) {
                        console.log("player Stopped");
                        
                        playButton.text = "Play"
                        isPlaying = false;
                    }
                }
            }
        ] //attachedObjects
    }
}
*/