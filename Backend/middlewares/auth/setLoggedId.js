const setLoggedId = (req, res, next) => {
  if (req.user.role === "client") {
    req.params.clientId = req.user.id;
  } else if (req.user.role === "craftsman") {
    req.params.craftsmanId = req.craftsman.id;
  }
  next();
};

module.exports = setLoggedId;
