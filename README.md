# Viddl

![Viddl](http://i.imgur.com/OuHviqv.png "Viddl")

Use Viddl to quickly download, cut, crop and resize videos

Viddl can be used at the [command line](#command-line) or in [Ruby](#ruby)

## Installation

Viddl requires that both [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org) are installed before using.

Install Viddl using gem

`gem install viddl`

or using Bundler by adding the following to your Gemfile

`gem "viddl"`

## Usage

Running Viddl generates video clip files in the current directory

### Command Line

The command line usage and options are as follows

#### Download

With no options, Viddl will download the original video

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU
```

#### Cut

This will start the clip at 10 seconds into the original video and run for five seconds

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU -s 10 -d 5
```

Alternatively, this will also start the clip at 10 seconds into the original video and stop at 15 seconds

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU -s 10 -e 15
```

#### Resize

This will resize to 640 x 480

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU -w 640 -h 480
```

#### Crop

This will crop a 40 x 40 pixel box at position 20 x 20

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU --cx 20 --cy 20 --cw 40 --ch 40
```

#### Strip Audio

This will make the clip silent

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU --no-audio
```

#### Combine

Any or all of these options can be used together

```sh
viddl https://www.youtube.com/watch?v=6g4dkBF5anU -s 15 -e 22 --no-audio --cx 20 --cy 20 --cw 40 --ch 40 -w 640 -h 480
```

### Ruby

Similar to the command line, Ruby usage and options are as follows

```ruby
options = {
  start: 15,
  end: 22,
  audio: false,
  crop: {
    x: 20,
    y: 20,
    width: 40,
    height: 40
  },
  width: 640,
  height: 480,
  output_path: "assets/video"
}

video = Viddl::Video.download("https://www.youtube.com/watch?v=6g4dkBF5anU")
video.create_clip(options)
```

## License

Licensed under Apache 2.0, See the file LICENSE

Copyright (c) 2017 [Ari Russo](http://arirusso.com)
