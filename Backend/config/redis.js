const { createClient } = require("redis");

const redisClient = createClient({
  password: process.env.REDIS_PASSWORD,
  socket: {
    host: "redis-19383.crce176.me-central-1-1.ec2.redns.redis-cloud.com",
    port: 19383,
  },
});

redisClient.on("error", (err) => console.log("Redis Client Error", err));

const connectRedis = async () => {
  if (!redisClient.isOpen) {
    await redisClient.connect();
    console.log("Redis connected successfully");
  }
};

module.exports = {
  redisClient,
  connectRedis,
};
