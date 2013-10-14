︠f143c344-9032-45b2-8c7d-618dab8ad4af︠
%cython
#clib flint

from libc.stdint cimport uint32_t, uint64_t
from libc.stdlib cimport strtoll, strtod, qsort
from libc.string cimport strchr, memcpy
from libc.stdio cimport FILE, fopen, fclose
from sage.symbolic.expression import Expression
from sage.symbolic.ring import SR

logx = SR('log(x)')

import numpy
cimport numpy

import subprocess

cdef extern from "stdio.h":
    ssize_t getline(char **, size_t *, FILE *)

cdef int uint64_cmp(const void *a, const void* b) nogil:
    if (<uint64_t *>a)[0] < (<uint64_t *>b)[0]:
        return -1
    elif (<uint64_t *>a)[0] > (<uint64_t *>b)[0]:
        return 1
    return 0

cdef class TriplesPlotter(object):

    cdef uint32_t *perm
    cdef uint64_t *c
    cdef double *q
    cdef uint32_t size

    def __cinit__(self, filename):
        p = subprocess.Popen(
                             ['wc', '-l', filename],
                             stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE)
        p.wait()
        result, err = p.communicate()
        if p.returncode:
            raise IOError(err)
        self.size = int(result.strip().split()[0])
        self.c = <uint64_t *>sage_malloc(sizeof(uint64_t)*self.size)
        self.q = <double *>sage_malloc(sizeof(double)*self.size)
        self.perm = <uint32_t *>sage_malloc(sizeof(uint32_t)*self.size)

    def __dealloc__(self):
        sage_free(self.c)
        sage_free(self.q)
        sage_free(self.perm)

    def __init__(self, filename):
        # big file
        # much faster to use stdio directly instead of
        # python's wrappers
        t = filename.encode("UTF-8")
        cdef char *fname = t

        cdef FILE *file
        file = fopen(fname, "rb")
        if file == NULL:
            raise IOError(2, "No such file or directory: '%s'" % filename)

        cdef char *line = NULL
        cdef size_t l = 0
        cdef ssize_t read
        cdef char *space
        cdef uint32_t i = 0ul

        while True:

            read = getline(&line, &l, file)
            if read == -1:
                break

            space = strchr(line, ' ') # a
            space = strchr(space+1, ' ') # b
            self.c[i] = strtoll(space, &space, 10)
            space = strchr(space+1, ' ') # rad
            self.q[i] = strtod(space, &space)

            i += 1ul

        fclose(file)

    def __getitem__(self, x):
        return self.c[x], self.q[x]

    cdef _bisect(self, double q):
        cdef uint32_t left, right, middle
        left, right = 0ul, self.size-1ul
        while left < right:
            middle = (left + right)/2ul
            if q < self.q[middle]:
                right = middle
            else:
                left = middle + 1ul
        return middle

    cdef _count(self, double q):
        if q < self[0][1]:
            return self.size
        elif q >= self[self.size-1ul][1]:
            return 0
        return self.size-self._bisect(q)

    def count(self, double q):
        return self._count(q)

    def __len__(self):
        return self.size

    cdef void _sorted_c(self, uint64_t *array, uint32_t count):
        memcpy(array, self.c+(self.size-count), count*sizeof(uint64_t))
        qsort(array, count, sizeof(uint64_t), &uint64_cmp)

    def plot(self, double q, func=logx, vertical_lines=True, **kwds):
        if not isinstance(func, Expression):
            raise ValueError("func must be an Expression")
        cdef uint32_t count, i
        count = self._count(q)

        cdef uint64_t *sorted_c = <uint64_t *>sage_malloc(count*sizeof(uint64_t))
        self._sorted_c(sorted_c, count)

        func = func._fast_float_(*func.arguments())
        cdef uint64_t interval
        tuples = []
        if count > 10000: # don't ever plot more than 20000 points
            interval = count/10000
        else:
            interval = 1

        for i in range(count):
            if not i%interval:
                tuples.append((func(sorted_c[i]), i+1))

        sage_free(sorted_c)

        from sage.plot.step import plot_step_function
        return plot_step_function(tuples, vertical_lines=vertical_lines, **kwds)

    def best_fit(self, double q, func=logx, *args, **kwds):
        if not isinstance(func, Expression):
            raise ValueError("func must be an Expression")
        cdef uint32_t count = self._count(q)
        cdef uint64_t *sorted_c = <uint64_t *>sage_malloc(count*sizeof(uint64_t))
        self._sorted_c(sorted_c, count)

        func = func._fast_float_(*func.arguments())
        cdef uint6

        cdef uint32_t i, j, interval, size
        if count > 12500: # don't ever interpolate with more than 25000 points
            interval = count/12500
            size = (count+interval-1)/interval
        else:
            interval = 1
            size = count
        cdef numpy.ndarray data = numpy.zeros([size, 2])
        j = 0ul
        for i in range(count):
            if not i%interval:
                data[j, 0] = func(sorted_c[i])
                data[j, 1] = i+1ul
                j += 1ul

        sage_free(sorted_c)
        from sage.numerical.optimize import find_fit
        return find_fit(data, *args, **kwds)




︡c1130256-b2aa-4fac-8a39-5682dadc2671︡{"once":false,"file":{"show":false,"uuid":"f9d413dd-7238-4a69-8a1d-12a54766d3cc","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/14284/spyx/_mnt_home_uHNlUmEE__sage_temp_compute1a_14284_dir_kA22jr_a_pyx/_mnt_home_uHNlUmEE__sage_temp_compute1a_14284_dir_kA22jr_a_pyx_0.html"}}︡{"html":"<a href='/blobs//mnt/home/uHNlUmEE/.sage/temp/compute1a/14284/spyx/_mnt_home_uHNlUmEE__sage_temp_compute1a_14284_dir_kA22jr_a_pyx/_mnt_home_uHNlUmEE__sage_temp_compute1a_14284_dir_kA22jr_a_pyx_0.html?uuid=f9d413dd-7238-4a69-8a1d-12a54766d3cc' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠44773f11-6f7b-42e0-aa95-2c7775a4933b︠
%time tp =TriplesPlotter("data_sorted")
︡03d03d92-e8b8-4c27-ab65-d6093b247b35︡{"stdout":"CPU time: 7.75 s, Wall time: 6.84 s"}︡{"stdout":"\n"}︡
︠95d16c24-8669-4066-8aa7-34fd27c21490︠
var('a,b')
@parallel
def multi_fitter(*args, **kwds):
    kwds['initial_guess'] = [y.right() for y in tp.best_fit(*args, **kwds)]
    return tuple(y.right() for y in tp.best_fit(*args, **kwds))
︡77a5a2e6-5731-4616-9125-538794008188︡{"stdout":"(a, b)\n"}︡
︠b499d90c-2d29-45dd-b794-615e1b068c22︠
%time tp.best_fit(1.4, model=x^b/a, parameters=[a,b], initial_guess=[100, 5], variables=[x])
︡ab40f39f-0dfd-4dc7-b94b-bffdaf773fd7︡{"stdout":"[a == 14.134409523669214, b == 2.078935525972992]\n"}︡{"stdout":"CPU time: 0.06 s, Wall time: 0.06 s\n"}︡
︠30d757f3-3e05-4fe9-8c7f-573633466181︠


%time  multi_fitter(1., model=x^b/a, parameters=[a,b], variables=[x])
︡5a5befad-1dac-4e6f-ae1a-5aa2f369dcd0︡
︠eaa2a13b-a993-4a20-86dc-e1e4207e438f︠
#f = open('fitting_data', 'w')
thing = multi_fitter([{'q':q, 'model':x^b/a, 'variables':[x], 'parameters':[a,b], 'initial_guess':[100, 5]} for q in srange(1, 1.4, 0.0004)])

data = [y[1] for y in thing]

f = open('fitting_data', 'w')
for s in data:
    f.write(' '.join(s) + '\n')

f.close()
︡6b08f5e6-3296-43b5-81a1-f7089ef971a2︡
︠61366703-7a98-4b0a-be4c-25646b086b20︠
list(multi_fitter([{'q':q, 'model':x^b/a, 'variables':[x], 'parameters':[a,b]} for q in (1.3,1.4)]))
︡702a6c33-90f7-4669-900a-a29be6277363︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 2, in multi_fitter\n  File \"_mnt_home_uHNlUmEE__sage_temp_compute1a_20000_dir_8eevFw_a_pyx_0.pyx\", line 149, in _mnt_home_uHNlUmEE__sage_temp_compute1a_20000_dir_8eevFw_a_pyx_0.TriplesPlotter.best_fit (_mnt_home_uHNlUmEE__sage_temp_compute1a_20000_dir_8eevFw_a_pyx_0.c:2993)\nTypeError: a float is required\n"}︡
︠976d2b31-ee2b-4c3e-a616-9f40a2d39a55︠
s.parallel?
︡e234550d-61b9-4bd6-86f3-0ef36844cb29︡{"stdout":"   File: /mnt/home/uHNlUmEE/sage-5.12.rc0/local/lib/python2.7/site-packages/sage/parallel/decorate.py\n   Docstring:\n      Create a \"parallel\"-decorated function. This is the object created\n   by \"parallel()\".\n\n"}︡
︠ded27790-a5e0-4f51-b18e-6b31cca73d79︠
.4/1000
︡8093f334-42cc-4e5e-838e-4e5ae14667e4︡{"stdout":"0.000400000000000000\n"}︡
︠19e69fa0-f394-4a3f-af3e-01a5f55fbbae︠
srange(1, 1.4, .0004)
︠d02f2bce-33e1-4c27-b3f5-738953da31fc︠
for t in s:
    print t
︡9b8b7a87-ce6d-4a1b-847a-c2eb4ae1d92e︡{"stderr":"Error in lines 1-2\nTraceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/sage_server.py\", line 633, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nTypeError: 'ParallelFunction' object is not iterable\n"}︡
︠783dfb1a-7788-402d-9ed7-8f2bbfcdf566︠
s[0].right()
︡c7d9803a-bd4e-4c7c-a184-e830a0c81454︡{"stdout":"2.9016017263064203e-05\n"}︡
︠811b9726-2b40-41b6-871d-4fc477a6c275︠
tp.plot(1.4)
︡695c91d8-4e1d-4b25-a6ea-eaa02d2524b0︡{"once":false,"file":{"show":true,"uuid":"29f0d99b-0d70-48e5-91f4-c0c33033299f","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/14284/tmp_Lzs2gj.png"}}︡
︠e7489ba7-0b65-444f-a259-83e534c0f352︠
Q = tp.plot(1.4, func=x)
︡e0666c39-a3c6-4664-aebb-68fcc7200409︡
︠99a716a4-19c3-4166-933f-a7738db50e4f︠
P = tp.plot(1.2)

︡8831ad95-5d02-439d-bfc9-4d1c20cec416︡
︠2e788f15-4d76-47c3-9906-1ee38133c7d9︠
P
︡22af0df3-57fb-4e58-8835-5c593781e218︡{"once":false,"file":{"show":true,"uuid":"a0501318-b97f-4aed-8991-ffc55bfba1cb","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/5158/tmp_bbaGtC.png"}}︡
︠541cdf61-04b3-4101-9ab9-4e4f862d6de8︠
P + plot(0.00013436328878819494*x^5.10130413850432, (x, 0, log(10**18)), color='red')
︡192f9b9c-7bf1-4ad6-a723-04fbdbc2256e︡{"once":false,"file":{"show":true,"uuid":"50877c46-3b2f-406f-a13d-0550f09a0255","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/5158/tmp_eSLLN9.png"}}︡
︠54b7a309-d93f-4c64-b173-ec02569c367a︠


P + plot(0.004158323595249009*x^3.4936973539430136, (x, 0, log(10**18)), color='green')
︡f47e7c62-5b0b-431c-ac1e-7d4af87eb8f7︡{"once":false,"file":{"show":true,"uuid":"0e16ad28-758e-4429-ae98-b92941605759","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/5158/tmp_yCGSFS.png"}}︡
︠4591c454-17f1-4f77-9c29-0ff8e4575c04︠
tp.plot(1.2)
︡fd4a32d3-3fd4-429b-9c2e-2ae7c7a7f118︡{"once":false,"file":{"show":true,"uuid":"a0501318-b97f-4aed-8991-ffc55bfba1cb","filename":"/mnt/home/uHNlUmEE/.sage/temp/compute1a/5158/tmp_T3ure6.png"}}︡
︠e9392e63-cb92-4d86-a8bd-93d328c35542︠
log._fast_float_?
︡7c76103c-9014-4631-a84e-bd9cac8c6497︡{"stdout":"[]\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/uHNlUmEE/.sagemathcloud/parsing.py\", line 391, in introspect\n    O = eval(obj if not preparse else preparse_code(obj), namespace)\n  File \"<string>\", line 1, in <module>\nAttributeError: 'function' object has no attribute '_fast_float_'\n"}︡
︠e77a8712-a5c4-4b2b-9ada-d53562cc44f3︠









