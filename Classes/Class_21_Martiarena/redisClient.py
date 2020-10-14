import redis

r = redis.Redis(host='localhost', port=6379, db=0)

#Strings
r.set("key", "redis")
print(r.get("key"))
print(r.dump("key")) #serialized data
print(f"The key Exists?={ r.exists('key')}")#Checks if the key exists, if so, it returns a 1, otherwise it will return a 0.
r.delete("key")  #In python is "delete" instead of DEL, because "del" is a python keyword


#Hashes
#r.hmset("alumno:1","nombre","Francisco","age",1)
#print(r.hget("alumno:1"))


#lists
iterations = 10
for x in range(iterations):
    r.lpush("counter", x)
print(r.lrange("counter",0,-1))
r.delete("counter")

r.lpush("persona","fran")
r.lpush("persona","martiarena")
print(r.lrange("persona",0,-1))
r.delete("persona")

#Sets
r.sadd("adds", "test1")
r.sadd("adds", "test2")
print(r.smembers("adds"))
r.delete("adds")
