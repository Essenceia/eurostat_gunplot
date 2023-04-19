# reading csv file
set datafile separator ','

# X data type and output format
set xdata time
set timefmt "%Y-%m"
set format x "%Y-%m"

# data lable box
set key center bottom outside

# title
set title "Manufacturing industrial production in Germany, volume index of production (2015=100)"

# output graph size
set term png size 1500,700
set output "german_industry.png" 

# read all files in directory
dir="german_industry/"

# nase array
N=6
array fn[N]
array fl[N]
fn[1]="C"
fl[1]='Total manufacturing'
fn[2]="C10-C12"
fl[2]='Food products, beverages and tobacoo products'
fn[3]="C231"
fl[3]='Glass and glass products'
fn[4]="C241"
fl[4]='Basic iron and steel and ferro-alloys'
fn[5]="C23"
fl[5]='Other non-metallic mineral products'
fn[6]="C201"
fl[6]='Basic chemicals, fertilisers and nitrogen compounds, plastics and synthetic rubber in primary forms'

plot \
    for [i = 1:6] dir.fn[i] using 9:10 \
    title fl[i] \
    with linespoint
