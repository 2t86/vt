# Video Tracker

A lightweight command-line tool to track and manage your video watch status.

## Features

- Track video watch status (watched, unwatched, skip)
- SQLite database for persistent storage
- Integration with `nnn` file manager
- Filter videos by status
- Statistics and progress tracking
- Safe file deletion (trash or permanent)

## Installation

1. Clone this repository
2. Run the initialization:
   ```bash
   ./bin/video-tracker init
   ```

3. Add to your `~/.bashrc` or `~/.zshrc`:
   ```bash
   export PATH="$PATH:~/vt/bin"
   export NNN_PLUG="f:vf;s:vs;d:vd"
   ```

## Usage

### Basic Commands

```bash
# Initialize database and config
video-tracker init

# Show statistics
video-tracker stats

# Filter videos by status
video-tracker filter unwatched
video-tracker filter watched
video-tracker filter skip

# Mark video status
video-tracker mark video.mp4 watched
video-tracker mark video.mp4 skip

# Delete video file
video-tracker delete video.mp4

# List videos
video-tracker list watched

# Clean up database
video-tracker cleanup
```

### Interactive Filter (for nnn)

```bash
video-tracker ifilt
```

## Configuration

Configuration file: `~/.video-tracker/config`

Default settings:
- Database path: `~/.video-tracker/tracker.sqlite`
- Mark threshold: 80%
- Supported formats: mp4, mkv, webm, avi, mov
- Auto cleanup: 90 days
- Use trash: enabled (requires `trash-cli`)

## Requirements

- bash
- sqlite3
- trash-cli (optional, for safe deletion)

## License

MIT
