const multer = require("multer");
const sharp = require("sharp");
const AppError = require("../utils/appError");

const multerStorage = multer.memoryStorage();

const multerFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb(new AppError("Not an image! Please upload an image.", 400), false);
  }
};

const upload = multer({
  storage: multerStorage,
  fileFilter: multerFilter,
  limits: {
    fileSize: 5 * 1024 * 1024, // 5MB limit
  },
});

const uploadUserPhoto = upload.single("profilePicture");
const uploadPortfolioImages = upload.array("images", 5);

const resizeUserPhoto = async (req, res, next) => {
  if (!req.file) return next();

  req.file.filename = `user-${req.user.id}-${Date.now()}.jpeg`;

  await sharp(req.file.buffer)
    .resize(1024, 1024)
    .toFormat("jpeg")
    .jpeg({ quality: 90 })
    .toFile(`public/img/users/${req.file.filename}`);

  next();
};

const resizePortfolioImages = async (req, res, next) => {
  if (!req.files || req.files.length === 0) return next();

  req.body.images = [];

  await Promise.all(
    req.files.map(async (file, i) => {
      const filename = `craftsman-${req.user.id}-portfolio-${Date.now()}-${
        i + 1
      }.jpeg`;

      await sharp(file.buffer)
        .resize(1200, 800)
        .toFormat("jpeg")
        .jpeg({ quality: 90 })
        .toFile(`public/img/craftsmen-portfolio/${filename}`);

      req.body.images.push(filename);
    })
  );
  next();
};

module.exports = {
  uploadUserPhoto,
  uploadPortfolioImages,
  resizeUserPhoto,
  resizePortfolioImages,
};
