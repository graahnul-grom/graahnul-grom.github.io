[dmn]: this message was posted here:
https://github.com/lepton-eda/lepton-eda/issues/528
---------------------------------------------------

@nik570
Several points:

1. Happy New Year, Nicklas!
2. `lepton-sch2pcb` has nothing to do with errors in generated netlists.
As can be seen in its [man page](https://graahnul-grom.github.io/ref-man/lepton-sch2pcb.html),
it only invokes the netlister program three times to produce appropriate
files that can be read by the `pcb` layout editor.
3. Wherever the actual problem is, in situation where we want to discover
whether a particular tool do perform correctly a certain task, it's much
better to design a test case (as simple as possible) and do not try to find
where and why it misbehaves in large, complex projects.
4. Having said that, I propose to check whether `lepton-netlist` supports
more than two levels of hierarchy (IIUC, that is your problem, isn't it?).
I have constructed a set of hierarchical schematics (3 levels) for that purpose.
Let's begin with the following simple current source circuit (the first
level sub-circuit we want to make is enclosed in the green dotted box,
the second level one is in the dashed blue box):

![0-overview](https://user-images.githubusercontent.com/26083750/71750871-cc873900-2e8a-11ea-9146-395c938e8dda.png)

The hierarchy will look like this:

![1-hierarchy](https://user-images.githubusercontent.com/26083750/71750911-ee80bb80-2e8a-11ea-9306-0380fca5ed4d.png)

Main schematic:

![2-main](https://user-images.githubusercontent.com/26083750/71750950-0a845d00-2e8b-11ea-9ddd-51f6e11d4f3d.png)

First sub-schematic:

![3-cs](https://user-images.githubusercontent.com/26083750/71750963-1708b580-2e8b-11ea-99d9-c99a238be99d.png)

Second sub-schematic:

![4-rr](https://user-images.githubusercontent.com/26083750/71750985-2556d180-2e8b-11ea-9d22-fbf034c7a1fb.png)

`geda.conf` configuration file:

```ini
[gnetlist.hierarchy]
mangle-net-attribute=false
mangle-netname-attribute=false
mangle-refdes-attribute=false
```

Then we run `lepton-netlist` with the `PCB` backend:

```sh
$ lepton-netlist -o - -g PCB main.sch

GND       R3-2  V1-2  V2-2
base      Q1-2  R1-2
csin      R1-1  V2-1
emitter   Q1-3  R2-1
mid       R2-2  R3-1
vcc       Q1-1  V1-1
```

It looks like a correct netlist.
I did not use name mangling in this case for clarity, but have
had the same results when it is on.

Now try `lepton-sch2pcb` (the `project.sch2pcb` project file
is included in the archive attached):

```sh
$ lepton-sch2pcb project.sch2pcb
```

And, sure enough, if we can produce a correct netlist, there will be
no problems with `lepton-sch2pcb`. Here is our advanced board done:

![5-board](https://user-images.githubusercontent.com/26083750/71751121-94ccc100-2e8b-11ea-86f5-cb3ca739cfc1.png)

So, `lepton-netlist` works for me with multi-level hierarchical
schematics. Please check if it works for you.
Of course, this is a very simple example, but it's a "proof of concept",
nevertheless.
All required files are in the attached `tar.gz` archive along with
the `README` describing the archive's contents.

[hier2nick.tar.gz](https://github.com/lepton-eda/lepton-eda/files/4021032/hier2nick.tar.gz)
