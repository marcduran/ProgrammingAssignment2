## I don't really understand what this program does.
## Although I was able to reproduce the expected behavior I don't
## think I deserve credit for what I did. I just adapted the code
## provided as an example for vectors in order to make it work for 
## matrices. 

## inv is the result of inverting the matrix with the function
## 'solve'. The factors 'setinv' and 'getinv' are just
## 'setmean' and 'getmean' renamed.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
