## This is a set of two functions.
## The first one should create a special "matrix" from the original invertable matrix
## that can cache its inverse. 
## The second function should compute the inverse of the special "matrix" from the first function. 

## To be honest, I´ve just copied the code of the first function from the example ("makevector")
## and replaced the function "mean" by the function "solve". I also renamed the get- and set- variables.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## And this is the copy of the second function from the example ("cachemean") with the function "mean"
## replaced by the function "solve"and with the get- variables renamed.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


## I hope this two functions work properly with matrices,
## but I am afraid it would be too simple.


