# Otsu
Otsu's Implementation
Otsu's method works fine whenever an image has two classes associated
with it. However the Otsu's method must be modified in order to decide the
appropriate value for threshold for an image that has more than two classes. It is
unsupervised. Also the author mentions that as the number of classes increases
the selected thresholds decrease. The Otsu's method is used to minimize the
intra-class variance and thus it can be thought of as a brute force method that
enables searching and selecting the most optimal threshold for an image. It can
be termed as the most standard and easy to understand method for selecting
threshold automatically and also can be applied to several problems.Apart from
that it has implementations in MATLAB.

How to run the code:
1. Open MATLAB and select the filepath where fn_Otsu.m is stored.
2. Give filename as 'example.jpg'.
3. Run your program.
