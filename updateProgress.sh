#!/bin/sh

# If you want to run this as a cron job, on OSX you need to add the following to your PATH
# Not on OSX, you'll need to find the corresponding directories
# export PATH=/usr/local/bin:/Library/TeX/texbin/:$PATH

echo "Updating progress"
TEX_DOC='main.tex'
DOCUMENT='responses.pdf'
PROGRESSFILE='progress.csv'

# Setup CSV if it doesn't exist
if [ ! -f ${PROGRESSFILE} ]; then
    echo "timestamp,wordcount,pagecount" >> ${PROGRESSFILE}
fi

# WORDCOUNT=`detex {$TEX_DOC}  | wc -w`
WORDCOUNT=`texcount -sum -total -merge {$TEX_DOC} | grep "Sum count:" | tr -d "Sum count: "`
# PAGECOUNT=`mdls -name kMDItemNumberOfPages -raw ${DOCUMENT}`
# Use this line in OSX

# ToDo: need to be compiled tex sources and generate DOCUMENT (responses.pdf)
# PAGECOUNT=`mdls -name kMDItemNumberOfPages -raw ${DOCUMENT}`
PAGECOUNT=0
# Use this line in Linux
# PAGECOUNT=`pdfinfo ${DOCUMENT} | grep Pages | sed 's/[^0-9]*//'`

echo `date '+%Y-%m-%d %H:%M:%S'`,$WORDCOUNT,$PAGECOUNT >> $PROGRESSFILE
echo "Done! Page count ${PAGECOUNT}, word count ${WORDCOUNT}. Written to ${PROGRESSFILE}"
# plotting progress need to be modified
python plotProgress.py ${PROGRESSFILE}
python to_slack.py
