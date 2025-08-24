# How to Install HyperQB on macOS

This application is not signed with an Apple Developer Certificate. macOS includes security features that may prevent unsigned applications from running by default. Follow these steps to safely install and run HyperQB.

## Installation Steps

### Method 1: System Preferences

1. Try to open the app normally (it will be blocked)
2. Go to **System Preferences > Privacy & Security**
3. Under **Security**, You will see a message about HyperQB being blocked
4. Click **"Open Anyway"** next to the message
5. Confirm by clicking **"Open Anyway"** in the follow-up dialog

### Method 2: Terminal Command

If the above methods don't work, you can use Terminal:

```bash
sudo xattr -rd com.apple.quarantine /path/to/HyperQB.app
```

Replace `/path/to/` with the actual path to where you placed the app.

## Why This Happens

- Apple requires developers to sign applications with a paid Developer Certificate
- Unsigned apps trigger Gatekeeper, Apple's security feature
- This is normal for open-source or independent software
- The steps above safely allow you to run the application

## Troubleshooting

- **Still won't open?** Try moving the app to your Applications folder first
- **"Damaged" error?** The download may have been corrupted - try downloading again
- **Permission issues?** Make sure you have admin rights on your Mac
