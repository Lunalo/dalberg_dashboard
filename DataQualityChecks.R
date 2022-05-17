
Introduction <- '<h2>Introduction</h2><br>
<p>This section aims to outline various standardized approaches we use to ensure quality data is captured in the field</p><br>
<h3>Pilot Data</h3><br>
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
</table>'




