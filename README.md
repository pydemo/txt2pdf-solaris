# txt2pdf-solaris
Convert text reports to pdf files on Solaris

## How it works.
It connects to remote Linux server where `mpage` and `gs` are configured.

## Why it's needed.
On old Solaris box it was impossible to generate pdf.


## Example

```
bash-2.03$ ./xls2pdf.sh 1DGBL.xls
```

### Result

```
------------------------------------
Generating PDF for file 1DGBL.xls
------------------------------------
-rw-------   1 ops      staff       3611 Aug 18 11:02 1DGBL.pdf
###############################
#####Output saved to 1DGBL.pdf
###############################
PDF creation time:
18-08-2017 11:02:58
```
