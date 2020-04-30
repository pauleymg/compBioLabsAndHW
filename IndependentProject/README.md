# Seeking Biological Patterns in Inspiration

## Sorta-Biological Question

Can the patterns associated with two biological principles, mast seeding and competitive exclusion, be found in a non-biological data set?

## Context

Inspiration has remained an ambigious phenomenon, long unstudied by psychology (Thrash, Moldovan, Oleynick, and Maruskin 2014). In this dearth of research, establishing whether certain patterns exist in inspiration might be helpful in guiding future studies.  
Using biology as inspiration is nothing new—there's a field of engineering called "biomimetic design" which does exactly that. The two processes chosen, mast seeding and competitive exclusion, are useful because they are analogous to aspects of inspiration which are sometimes anecdotally reported:
* If as some claim, there are some days when "the Muse is with you" and others were it is absent, we should expect to find a pattern akin to mast seeding, with many days of little inspiration and a few days of high output, but few if any in between.
* Some writers report that a particular project or idea will seize hold so firmly that it prevents other ideas from forming. If true, this would be analogous to competitive exclusion, with the dominant project outcompeting others for limited attention and time.

## Methods

#### Data Source

This being a personal data set, there is no published data package outside of this repository.  
Data collection began in October of 2017, at a time when I finally had more ideas for stories than I could safely entrust to memory. Wanting to understand where they were coming from, the data were recorded systematically.

Ideas were written down as they occurred, with a header for each date and one or multiple notes below it. In the margin before the body of the idea a project moniker was written to keep track of which story, essay, or poem that particular idea belonged to.

The data set's handwritten form currently extends over 6 notebooks of varying sizes and bindings. Because the data were recorded over two and half years, and because I experimented somewhat with use of color and symbols, the system of recording fluctuates. This, combined with my handwriting, made digitization more difficult than expected. I originally planned to use Optical Character Recognition (OCR) to automate the process, but it turns out using OCR for handwriting requires training a neural network to recognize it, and that process can take days or weeks (Tesseract, 2020). I intend to try neural network solution on OCR when I have more time over summer, but for now I focused on transcribing the date, notebook, and project-identifier for the first 1805 ideas.

This is the most intelligible capture of my handwriting I got with packaged OCR tools:

![OCR gibberish](https://raw.githubusercontent.com/pauleymg/compBioLabsAndHW/master/IndependentProject/OCRoutput2.png)

#### The Analyses

In the first part, the data were transformed into a table based on the date and how many lines appeared for each date. This table of data was then graphed as a histogram and graphed to show the frequency of days on which a certain number of ideas were generated.

In the second part, the data were grouped by project in a table with the number of lines that belonged to each project. This data table was then sorted and plotted in a bar-plot.

## Results and Conclusion

For the first analysis, I looked for a bimodal distribution in the histogram that would indicate there were two types of days in terms of the abundance of inspiration. Based on anecdotal reports, I thought there might be a large quantity of days with just a few ideas, and smaller concentration at some higher number of ideas-per-day, with few observations falling between these two humps. Instead I got a decidedly unimodal curve.

![Not even slightly bimodal](https://raw.githubusercontent.com/pauleymg/compBioLabsAndHW/master/IndependentProject/IdeaPerDayFreq.png)

There is a definite difference in how productive a day can be (see those few days at the far right with twenty two ideas), but the trend is a smooth unimodal distribution, which doesn't support the anecdotal reports of two different classes of day (which we would expect if inspiration were behaving like mast seeding). In light of the data, I must hypothesize that the reports have been skewed toward the extreme ends because days when nothing comes and days when ideas arrive too fast to record stand out in memory.

For the second analysis, I expected there might be a significant gap between the frequency of the most prevalent idea. Human attention might be a limited resource, but time definitely is. The digitized data covers 14 months—a long time, but not unlimited. If projects were competing for time or brain power, one would expect the most effective competitor to soak up most of that resource, and be much more prolific as a result.

![Project "F&K" more than doubles next most abundant project](https://raw.githubusercontent.com/pauleymg/compBioLabsAndHW/master/IndependentProject/ProjectCompetition.png)

The leading project towers more than 2.5 times higher than the next most abundant, even though both are of the same type (both are incomplete novels with a few chapters drafted). Other projects rapidly dwindle into the low double and single digits. Seemed a pattern akin to competitive exclusion was present, but I regraphed with all the ideas that didn't affilate with a particular story project, just to be sure.

![Hypothesis doesn't feel so good](https://raw.githubusercontent.com/pauleymg/compBioLabsAndHW/master/IndependentProject/UNASvsProjects.png)

If the top-performing project were consuming all the time and concentration, there wouldn't so many project-independent ideas. I must conclude that what the writers around me reported was anecdotal, and more representative of the way we remember things than of inspiration.

## References

Tesseract. 2020. "How to use the tools provided to train Tesseract 4.00." Last modified February 6, 2020. [https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00](https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00)

Thrash, Todd, Emil Moldovan, Victoria Oleynick, and Laura Maruskin. 2014. "The Psychology of Inspiration." _Social and Personality Psychology Compass_ 8, no. 9: 495-510. [https://doi-org.colorado.idm.oclc.org/10.1111/spc3.12127](https://doi-org.colorado.idm.oclc.org/10.1111/spc3.12127)
