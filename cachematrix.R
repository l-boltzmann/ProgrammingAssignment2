## Put comments here that give an overall description of what your
## functions do

# The two functions together should invert an input matrix, cache the result in 
# the output of makeCacheMatrix. Succeeding calls to invert the matrix should
#find the cached inverse and not recompute it. The call should be
#  cacheSolve(makeCacheMatrix(y))
# I know I'm close but I can't quite get it to work.

## Write a short comment describing this function
#The matrix to be inverted (y in the code) actually lives in the global environment.
# Should cache the inverse.
makeCacheMatrix <- function(x = matrix()) {
    m<- matrix()
    set <- function(y) {
        x <<- y   #y is some matrix created outside.
        m <<- NULL
    }
    
    get <- function() x
    setInverse <- function(solve) m <<- solve   
    getInverse <- function() m
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function
# On first call invokes makcCacheMatrix, m fails the if test and makeCacheMatrix 
# calculates the inverse.  Subsequent calls get inverse from cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.na(m))
    {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    m
}
