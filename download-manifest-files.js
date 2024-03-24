const fs = require("fs");
const http = require("https");

// Path to the JSON file
const filePath = "manifest.json";
const downloadDir = "downloads";

const downloadFile = (uri, dest) => {
  const file = fs.createWriteStream(dest);
  http
    .get(uri, (response) => {
      response.pipe(file);
      file.on("finish", () => {
        file.close(() => {
          console.log(`Downloaded file from ${uri} to ${dest}`);
        });
      });
    })
    .on("error", (err) => {
      console.error(`Error downloading file from ${uri}:`, err);
    });
};

const downloadFiles = (jsonData) => {
  const rmFiles = jsonData.remoteFiles;
  const uris = Object.values(rmFiles).flatMap((remoteDs) =>
    remoteDs.map((ds) => ds.uriSrc.uri)
  );
  // Create the downloads directory if it doesn't exist
  if (!fs.existsSync(downloadDir)) {
    fs.mkdirSync(downloadDir);
  }
  uris.forEach((uri) => {
    const fileName = uri.split("/").pop();
    const dest = `${downloadDir}/${fileName}`;
    downloadFile(uri, dest);
  });
};

// Read the file
fs.readFile(filePath, "utf8", (err, data) => {
  if (err) {
    console.error("Error reading file:", err);
    return;
  }

  // Parse the JSON data
  const jsonData = JSON.parse(data);

  downloadFiles(jsonData);
});
