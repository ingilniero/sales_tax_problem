# SalesTax Problem

# SalesTaxProblem

- [Problem](#problem-statemet)
- [Installation](#installation)
- [Test project](#testing)

## General Requirements
Use either Ruby or Javascript. If you feel more comfortable with another
language, please let us know and we can discuss.  Do not use any external
libraries to solve this problem. You may only use external libraries or tools
for building or testing purposes (e.g., Rspec, Jest, Mocha, etc.).

Include detailed instructions on how to run the application and an explanation
of assumptions you make (if any)

## IMPORTANT:

Please limit the amount of time you spend on the problem to 4 hours. If you
haven't completed the challenge within the allotted time, please submit the
work you have completed. Focus on implementing the requirements with the best
code you can produce within the given timeframe.

## Problem Statement

This problem requires some kind of input. You are free to implement any
mechanism for feeding the input into your solution. You should provide
suficient evidence that your solution is complete by, as a minimum, indicating
that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books,
food, and medical products that are exempt. Import duty is an additional sales
tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items
and their price (including tax), fnishing with the total cost of the items, and
the total amounts of sales taxes paid. The rounding rules for sales tax are
that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to
the nearest 0.05) amount of sales tax.  Write an application that prints out
the receipt details for these shopping baskets:

# specs

<table>
  <thead>
    <tr>
      <th>Input</th>
      <th>Output</th>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td>Input 1:</td>
      <td>Output 1:</td>
    </tr>
    <tr> 
      <td>2 book at 12.49</td>
      <td>2 book: 24.98</td>
    </tr>
    <tr> 
      <td>1 music CD at 14.99</td>
      <td>1 music CD: 16.49</td>
    </tr>
    <tr> 
      <td>1 chocolate bar at 0.85</td>
      <td>1 chocolate bar: 0.85</td>
    </tr>
    <tr>
      <td></td><td>Sales Taxes: 1.50</td>
    </tr>
    <tr>
      <td></td><td>Total: 42.32</td>
    </tr>
    <tr>
      <th>Input 2:</th>
      <th>Ouput 2:</th>
    </tr>
    <tr>
      <td>1 imported box of chocolates at 10.00 </td>
      <td>1 imported box of chocolates: 10.50</td>
    </tr>
    <tr>
      <td>1 imported bottle of perfume at 47.50 </td>
      <td>1 imported bottle of perfume: 54.65</td>
    </tr>
    <tr>
      <td></td>
      <td>Sales Taxes: 7.65</td>
    </tr>
    <tr>
      <td></td>
      <td>Total: 65.15</td>
    </tr>
    <tr>
      <th>Input 3:</th>
      <th>Output 3:</th>
    </tr>
    <tr>
      <td>1 imported bottle of perfume at 27.99</td>
      <td>1 imported bottle of perfume: 32.19</td>
    </tr>
    <tr>
      <td>1 bottle of perfume at 18.99</td>
      <td>1 bottle of perfume: 20.89</td>
    </tr>
    <tr>
      <td>1 packet of headache pills at 9.75</td>
      <td>1 packet of headache pills: 9.75</td>
    </tr>
    <tr>
      <td>3 imported boxes of chocolates at 11.25</td>
      <td>3 imported box of chocolates: 35.55 </td>
    </tr>
    <tr>
      <td><td>Sales Taxes: 7.90</td>
    </tr>
    <tr>
      <td></td>
      <td>Total: 98.38</td>
    </tr>
  </tbody>
</table>


## Installation

Recomend use this versions:

- ruby version `3.0.2`
- bundle version `2.3.7`

```bash
  bundle install
```

## Testing

```bash
  ruby -Ilib -e 'ARGV.each { |f| require f }' ./test/*_test.rb
```
