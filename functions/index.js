const functions = require('firebase-functions');
const { exec } = require('child-process-promise');

const cors = require('cors')({ origin: true });

exports.buildAPK = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      await exec('flutter build apk --release --target=lib/MyHomePage.dart');
      res.status(200).send('APK generated successfully');
    } catch (error) {
      console.error('Error during build:', error);
      res.status(500).send('Build failed');
    }
  });
});


/*
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { exec } = require('child_process');

admin.initializeApp();

exports.buildApk = functions.https.onRequest((req, res) => {
  const { uid } = req.body;

  // Check if the request is coming from an authorized user
  if (!uid) {
    res.status(401).send('Unauthorized');
    return;
  }

  // Check if the user is authorized to trigger the build
  if (!isAuthorized(uid)) {
    res.status(403).send('Forbidden');
    return;
  }

  // Execute the build command
  exec('flutter build apk --release --target=lib/MyHomePage.dart', (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      res.status(500).send('Build failed');
      return;
    }
    if (stderr) {
      console.error(`Error: ${stderr}`);
      res.status(500).send('Build failed');
      return;
    }
    console.log(`Build output: ${stdout}`);
    res.status(200).send('Build successful');
  });
});

function isAuthorized(uid) {
  // Implement your authorization logic here
  // Check if the user with the given UID is authorized to trigger the build
  return true; // Replace with your authorization logic
}
*/
