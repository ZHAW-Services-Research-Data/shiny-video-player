
seek_and_play <- function(videoInputID, t, autoplay) {
  seekVideo(videoInputID, t)
  if (autoplay)
    playVideo(videoInputID)
}