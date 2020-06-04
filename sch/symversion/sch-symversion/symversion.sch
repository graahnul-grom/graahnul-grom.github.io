v 20200604 2
T -34000 18000 9 8 1 0 0 3 1
inherited: no, attached: yes
T -32100 18800 9 8 1 0 0 3 1
parse err: attached
T -32100 18000 9 8 1 0 0 3 1
inherited: yes, attached: no
T -34000 17200 9 8 1 0 0 3 1
inherited > attached
T -32100 17200 9 8 1 0 0 3 1
inherited < attached
T -34000 18800 9 8 1 0 0 3 1
parse err: inherited
T -32700 16100 13 8 1 0 0 0 1
// V4, V5 => maj. chg. dlg
C -34400 18200 1 0 0 symversion_bad.sym
{
T -34000 18400 5 6 1 0 0 5 1
symversion=XXX
}
C -32500 18400 1 0 0 symversion_none.sym
{
T -32100 18500 21 8 1 1 0 4 1
refdes=V2
T -32100 18400 5 6 1 0 0 5 1
symversion=XXX
}
C -34400 17600 1 0 0 symversion_none.sym
{
T -34000 17700 21 8 1 1 0 4 1
refdes=V3
T -34000 17600 5 6 1 0 0 5 1
symversion=1.0
}
C -32500 17400 1 0 0 symversion_1.0.sym
{
T -32100 17700 21 8 1 1 0 4 1
refdes=V4
}
C -34400 16600 1 0 0 symversion_1.0.sym
{
T -34000 16800 5 6 1 0 0 5 1
symversion=0.9
T -34000 16900 21 8 1 1 0 4 1
refdes=V5
}
C -32500 16600 1 0 0 symversion_1.0.sym
{
T -32100 16800 5 6 1 0 0 5 1
symversion=1.1
}
T -31500 16800 8 8 1 1 0 4 1
refdes=V6
C -34400 15800 1 0 0 symversion_1.1.sym
{
T -34000 16000 5 6 1 0 0 5 1
symversion=1.0
T -34000 16100 21 8 1 1 0 4 1
refdes=V7
}
T -33900 16400 9 8 1 0 0 3 1
inherited minor > attached minor
