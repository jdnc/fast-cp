This folder has the source code for both the cp -r implementation,
using both the POSIX AIO and the kernel AIO. 

Requirements
------------
	* g++ version >= 4.8
	* python 2.7 (to generate workloads)
	* libaio
	* librt

Compiling the source
---------------------

Run make in the given folder. This should generate two executables in the same folder:
posix-cp and kernel-cp

To run cp -r with kernel AIO :
	  
	  ./kernel-cp <source> <destination>

To run cp -r for POSIX AIO :

       	  ./posix-cp <source> <destination>

To remove executables :
   
	   make clean


Generating Workloads
---------------------
To automatically set up a directory tree with required depth and for particular file size(in KB).
   1) Create the root of the directory tree
      mkdir <root>

   2) python workload.py <root> <num_files> <depth> <file_size>


Notes
-----
    * The kernel-cp will currently work only for file-sizes that are multiples of the block
      size. This is a restriction of using the O_DIRECT flag.
    * If your kernel-cp fails with EAGAIN, you may need to increase the queue size via
      	 1) echo 131072 > /proc/sys/fs/aio-max-nr
      	 2) Change the Q_MAX defined at the top of kernel-cp.c to 65536
