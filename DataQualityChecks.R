
Introduction <- '<h2>Introduction</h2><br>
<p>This section displays analysis of the quality of the survey. 
The analysis covers different components of quality data control 
including completeness, consistency, accuracy, validity, and timeliness
of the data. The main goal of this section is to show the trustworthiness of the data being collected</p><br>

<p>The next part gives summaries of the steps taken to resolve data quality issues. </p>

<!--<h3>Pilot Data</h3><br>
<ul "list-style-type:circle;">
  <li>Pilot data is the result of conducting a pilot study that is a preliminary small-scale study that is conducted in order to decide how best to conduct a large-scale research project.
</li>
  <li>We usually conduct 10% of sample size of the main survey. Using pilot data, we can identify or refine a research question, figure out what methods are best for pursuing it, and estimate how much time and resources will be necessary to complete the larger version</li>
</ul>
<br>
<style>
table, th, td {
  border: 3px inset;
}
</style>
<table>
<tbody>
<tr>
<td>
<p><strong>CHECKS</strong></p>
</td>
<td>
<p><strong>HOW</strong></p>
</td>
<td>
<p><strong>STATISTICAL SOFTWARE</strong></p>
</td>
<td>
<p><strong>NATURE OF PROCESS</strong></p>
</td>
<td>
<p><strong>SUGGESTED PROCEDURE(S)</strong></p>
</td>
<td>
<p><strong>EXPECTED OUTPUT</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>Comprehensive capturing of all the information on the tool used</strong></p>
</td>
<td>
<ul>
<li>Counter check the questionnaire and the data</li>
<li>Generate codebook</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
</ul>
</td>
<td>
<ul>
<li>Manual/Automatic</li>
</ul>
</td>
<td>
<ul>
<li>SPSS-Codebook</li>
</ul>
</td>
<td>
<ul>
<li>No. of questions not captured</li>
<li>Spelling errors</li>
<li>Question numbering mistakes</li>
<li>List of skip questions</li>
<li>List of string, numeric, currency, date, etc question</li>
<li>List of open-ended questions</li>
</ul>
</td>
</tr>
<tr>
<td>
<p><strong>Data structure ; checking types of variables(Text,String, Integers)</strong></p>
</td>
<td>
<ul>
<li>Generate codebook</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Automatic</li>
</ul>
</td>
<td>
<ul>
<li>SPSS-Codebook</li>
<li>R (typeof(),is. functions</li>
</ul>
</ul>
</td>
<td>
<ul>
<li>Codebook summary for question</li>
<li>Summary of type variable, TRUE/FALSE</li>
</ul>
</td>
</tr>
<tr>
<td>
<p><strong>Average Interview completion time</strong></p>
</td>
<td>
<ul>
<li>Average the difference between starttime and endtime of the interview</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Automatic</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>Time and date wizards</li>
<li>Time difference syntax</li>
<li>R</>
<li>difftime() functions</li>
</ul>
</td>
<td>
<ul>
<li>Crosstabulation of completion time by interviewer</li>
<li>Max, Min, Range, Mean and sd</li>
</ul>
</td>
</tr>
<tr>
<td>
<p><strong>Survey Completion, number of complete cases or invalid values</strong></p>
</td>
<td>
<ul>
<li>Run a Missing Value Analysis</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Automatic</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>Missing function within variable</li>
<li>Missing function within cases</li>
<li>Frequencies</li>
<li>Invalid function</li>
</ul>
</td>
<td>
<ul>
<li>Summary of missing cases - percentages/frequencies</li>
</ul>
</td>
</tr>

<tr>
<td>
<p><strong>Unusual patterns(Values, Skips, Outliers, Blanks, Invalid entries)</strong></p>
</td>
<td>
<ul>
<li>Descriptive analysis - frequencies, crosstabs Sort cases</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Manual/Automatic</li>
</ul>
</td>
<td>
<ul>
<li>SPSS (Descriptive analysis,Sort cases)</li>
</ul>
</td>
<td>
<ul>
<li>Crosstabs of skip questions with interviewers</li>
<li>Crosstabs of skip questions with leading questions</li>
<li>Character length for text fields (questions)</li>
<li>Min, Max, Mean values for numeric/integer questions</li>
</ul>
</td>
</tr>

<tr>
<td>
<p><strong>Reliability and Validity of the data</strong></p>
</td>
<td>
<ul>
<li>Run reliability and validity analysis on Grouped question</li>
</ul>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Automatic</li>
</ul>
</td>
<td>
<ul>
<li>Group related questions - with the same measurement scales and the run reliability test.</li>
</ul>
</td>
<td>
<ul>
<li>Reliability coefficient</li>
</ul>
</td>
</tr>

<tr>
<td>
<p><strong>Possible Enumerator bias</strong></p>
</td>
<td>
<p>Run various checks on the data to get the following</p>
<ol>
<li>Interview durations</li>
<li>Minutes per question</li>
<li>Time between interviews.Unusual hours</li>
<li>Length of open-ended Questions</li>
<li>Attitude towards Skip questions</li>
<li>Enumerator completion Percentages</li>
</ol>
</td>
<td>
<ul>
<li>SPSS</li>
<li>R</li>
</ul>
</td>
<td>
<ul>
<li>Automatic</li>
</ul>
</td>
<td>
<ol>
<li>Difference between interview end and start time per interviewer</li>
<li>Difference between consecutive interviews per interviewer</li>
<li>Max and min on time variable & Plot time variables</li>
<li>Calculate field lengths for open ended questions and crosstab by interviewer</li>
<li>Crosstab skip question against interviewers</li>
<li>Run Frequencies/percentages of completed cases per interviewer</li>
</ol>
</td>
<td>
<ol>
<li>Highlighted interviewers with inconsistent outputs</li>
<li>Extreme/Unusual hours will be displayed as outliers</li>
<li>Interviewers’ percentages and frequencies</li>
</ol>
</td>
</tr>
</tbody>
</table>

<br>
<h3>Main Survey Daily Checks</h3><br>
<p>After the Pilot is done. The lessons learnt are used to Improve the data quality from the actual survey. 
We focus on checking data quality based on key factors. They include accuracy, completeness and consistency.
We also look at the quotas and documenting errors</p>
<style>
table, th, td {
  border: 3px inset;
}
</style>
<table>
<tbody>
<tr>
<td>
<p><strong>Daily Checks</strong></p>
</td>
<td>
<p><strong>What to Check</strong></p>
</td>
<td>
<p><strong>How</strong></p>
</td>
<td>
<p><strong>Comments</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>Completeness</strong></p>
</td>
<td>
<ul>
<li>All questions in the survey are complete i.e.(no missing tuples in the survey)
</li>
</ul>
</td>
<td>
<ul>
<li>Generate codebook</li>
</ul>
</td>
<td>
<ul>
<li>All questions in the questionnaire should be listed in the script and the dataset</li>
</ul>
</td>
</tr>
<tr>
<td>
<p><strong>Consistency</strong></p>
</td>
<td>
<ul>
<li>Check skips</li>
<li>Survey times</li>
<li>Interviewer Location</li>
<li>Screener/Demographic questions</li>
<li>Duplicate cases</li>

</ul>
</td>
<td>
<ul>
<li>Average the difference between start-time and end-time of the interview</li>
<li>Run a Missing Value Analysis</li>
<li>Descriptive analysis - frequencies, crosstabs, Sort cases</li>
<li>Run reliability and validity analysis on Grouped question</li>
</ul>
</td>
<td>
<ul>
<li>Flag out enumerators with definitive patterns of skips</li>
<li>Flag out cases mapped to locations outside the target area flag for clarification</li>
<li>Screener misses could be due to script/system fails, kindly check, flag and exclude from dataset</li>
<li>Establish duplicates based on a few unique variables and flag them as suspicious for clarification</li>
</ul>
</td>
</tr>


<tr>
<td>
<p><strong>Accuracy</strong></p>
</td>
<td>
<ul>
<li>Invalid entries</li>
<li>Missing values</li>
<li>Unusual entries (Outliers, Inliers)</li>
<li>Interviewer times (Odd hours)</li>
<li>Case Geolocation</li>
<li>Iteration checks</li>
<li>Logic checks Using Check questions</li>


</ul>
</td>
<td>
<ul>
<li>Average the difference between start-time and end-time of the interview </li>
<li>Run a Missing Value Analysis</li>
<li>Descriptive analysis - frequencies, crosstabs, Sort cases</li>
<li>Run reliability and validity analysis on Grouped question</li>
<li>Plot time variables</li>
<li>Using GPS, map out the case locations to the smallest Administrative unit</li>
<li>Asses all instances of iterations and ensure they map out correctly. (generate a codebook of iteration root questions to help quickly identify)</li>
<li>Identify check questions and run a side by comparison</li>
</ul>
</td>
<td>
<ul>
<li>Invalid entries should majorly be controlled from the script end, if not, questions are identified onto which to randomly perform the checks.</li>
<li>Missing values should always be skip accounted, otherwise flag as suspicious.</li>
<li>Each iteration should be pegged on valid response at the root question, otherwise flag as suspicious</li>
<li>Using check questions, make comparisons to ensure the responses are similar, otherwise flag as suspicious</li>

</ul>
</td>
</tr>


<tr>
<td>
<p><strong>Enumerator biases</strong></p>
</td>
<td>
<ul>
<li>Interview durations</li>
<li>Minutes per question</li>
<li>Time between interviews</li>
<li>Unusual hours</li>
<li>Length of open-ended Questions</li>
<li>Attitude towards Skip questions</li>
<li>Enumerator completion Percentages</li>
<li>Field Back checks</li>
<li>Field Accompaniment</li>
<li>Field back check summaries</li>

</ul>
</td>
<td>
<ul>
<li>Difference between interview end and start time per interviewer</li>
<li>Max and min on time variable & Plot time variables</li>
<li>Calculate field lengths for open ended questions and crosstab by interviewer.</li>
<li>Crosstab skip question against interviewers</li>
<li>Run Frequencies/percentages of completed cases per interviewer</li>
<li>FTLs run random concurrent Skip question surveys confirming the responses given by enumerators</li>
<li>Supervisors and TLs accompany random enumerators to the interview locations</li>

</ul>
</td>
<td>
<ul>
<li>Flag out cases with outlying interview durations for supervisor and TL callbacks the following day</li>
<li>Flag cases with outlying OE field lengths for Team Leader follow up.</li>
<li>Flag out Enumerators with definitive patterns regarding skip questions for field accompaniment</li>
<li>Flag out enumerators with outlying completion percentages for field accompaniment by TL or Supervisor</li>
<li>Download Back check data from field TLs for comparison with initial cases and flag inconsistent enumerators</li>
<li>Contact enumerator accompaniment and flag out non compliant Team leaders </li>

</ul>
</td>
</tr>



<tr>
<td>
<p><strong>Quotas</strong></p>
</td>
<td>
<ul>
<li>Interview quotas</li>
<li>Location quotas</li>
<li>Demographic quotas</li>
<li>Any other suggested by the client</li>

</ul>
</td>
<td>

</td>
<td>
<ul>
<li>Primarily focus on primary client quotas and report to field</li>
<li>Check demographic quotas and do comparisons with population comparisons, 
Flag out any suspicious trends to ensure the data collected is representative</li>

</ul>
</td>
</tr>

<tr>
<td>
<p><strong>Documentation</strong></p>
</td>
<td>
<ul>
<li>List of suspicious but data included cases</li>
<li>List of suspicious and excluded cases</li>
<li>Case Adjustments</li>


</ul>
</td>
<td>
<ul>
<li>Seclude and generate quality suspicious cases but that are part of the quota count, Comment out the clarification required from field</li>
<li>Seclude and generate quality suspicious cases but that are excluded from the quota count, Comment out the clarification required from field</li>
<li>Document all the changes made on the cases for easy backtracking</li>

</ul>
</td>
<td>
<ul>
<li>Compile all suspicious cases with their specific issues and send them back to the field for clarifications, back checking and/or accompaniment</li>


</ul>
</td>
</tr>

</tbody>
</table>-->
'




