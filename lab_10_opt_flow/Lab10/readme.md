
The code was modified so that it also calculates the average magnitude and average orientation of the vector created by every pair of tracked dots in consecutive frames. this magnitude and orientation are used to establish the global orientation of motion and thus giving the decision if the object is moving left or right

Some delay on the estimation of these parameters is expected, due to the population of an internal buffer used to estimate the average magnitude and direction of the vectors. It is then expected that the change on the estimated motion direction could take a brief seconds.

All the necessary code should be contained in the ‘code’ directory, just run ‘python lk_track.py’
