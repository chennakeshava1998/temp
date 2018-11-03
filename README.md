Code that can flood the memory of a GPU. This code malloc's a huge amount of memory up until the threshold of a seg fault, and then goes into a infinite waiting loop.   
