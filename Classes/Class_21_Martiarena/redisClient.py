import redis

r = redis.Redis(host='localhost', port=6379, db=0)

r.set("key", "redis")

r.lpush("persona","fran")
r.lpush("persona","martiarena")
print(r.lrange("persona",0,-1))
