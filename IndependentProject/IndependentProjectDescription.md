# Masting & Competitive Exclusion in Story-Ideas: an Analysis of Inspiration Through Time

## Introduction

The most interesting dataset I can imagine working with is a very personal one. For two and a half years now I've been diligiently writing down everything that seemed like it might be part of a story, any story. This is a natural part of an aspiring writer's journey, but it also reveals itself as a data-set under scrutiny—each individual note is recorded with its day of inception and categorized by the project to which it belongs.

The act of making so many records has led me to suspect that there may be patterns in the data:  
* There appear to be days on which far more ideas are generated.  
* Some projects seem to muscle others aside.  
I'd like to determine whether these patterns—idea-masting days and projects that competitively exclude others—are in fact supported by the data.

<hr>

## Summary of Data to be Analyzed

These data are notes which are recorded by hand. They pertain mostly to stories I hope to write, and therefore include everything from small worldbuilding details to character ideas to plot points to premises. The main thrust of the analysis will be on the dates and the projects under which each note falls.

### Goals of a previous study also using this dataset

A year ago I used a portion of this dataset to test the assumption that more and better ideas come to a person while they are in the shower. I decided that what was considered a good idea was too subjective, and focused on the quantity of ideas generated. This analysis was possible because for about a year of the dataset I recorded each the time of arrival (to the minute) and where I was at the time. The common-knowledge hypothesis was rejected by the data, because the interval just after going to bed was found to be more productive.
**NOTE**: *this earlier study was done for EBIO1010 with Andy Martin & Lisa Corwin. It has not been published anywhere, so contact Marshall Pauley to see the Rscript, data, and results*

That previous study focused exclusively on averages for places and times of day, which is data I am no longer recording and will not factor into the analysis of this new study.

### Brief description of methodology that produced the data

The data were produced by one person (me) recording anything and everything that felt like inspiration for two and a half years.

### Type of data in this data set:  

This data set contains dates and data points which are categorized by project.

#### Format of data  

The typical format for the data is a date header followed by a series of notes.  
The date is normally formatted mm/dd/yy and enclosed in a box.  
Each data point is typically presented with it's project identifier first, followed by a black circle, and then the text-body of the note.

On the page the format usually looks like this:  
mm/dd/yy  
[project id] ⏺ [text body]


#### Size of data

The precise size of the data will not be known until it has been digitized, but in its paper medium the data has filled more than 1200 pages.

#### Any inconsistencies in the data files?  Anything that looks problematic?  

Problems are not limited to the aformentioned inconsistency in the data's format—the symbols, use of color, different inks, and the way the notes were arranged on the page changed over time. These factors, combined with the fact that my handwriting contains both a print and a cursive form for each letter, will make character recognition difficult.

#### What the data represent about the biology?

These data don't represent biology in a particularly direct fashion. Through the goals of this study, I intend to discover whether the data shows that certain biological principles have analogous patterns in the output of the human mind.

<hr>

## Detailed Description of Analysis to be Done and Challenges Involved

To reveal whether the patterns are present or not, my first task is to digitize the data set. Since the data now stretch more than 1200 pages, my first challenge is to find a way to automate the digitization process, at least partially. To do this, I will have to learn how to perform Optical Character Recognition in R. This will likely involve several packages as well as image processing with commandline utilities (manipulating 1200+ scanned pages in Photoshop, one at a time? Ain't nobody got time for that).

While automating the digitization will be the hardest part, once it's done I will still have the analysis ahead of me. The analysis will take two parts. In the first, I will need to plot the distribution of days by their note-abundance. If I get a bimodal distribution, that suggests that there are both days when inspiration is frequent, and days when it is sparse. I would then sort days into their appropriate categories and compare to see just how much more productive the masting days are. Anything other than a bimodal distribution will nullify my hypothesis that inspiration mimicks the pattern of mast seeding.

The second part of the analysis will be to plot the frequency of notes per project to identify stretches of time where one project consistently got more notes than any other per day. Once these spans of dominance are determined, I'd subset the data and compare the number of notes that each project received during that time frame and try to determine whether there were statistically different groups.


<hr>
