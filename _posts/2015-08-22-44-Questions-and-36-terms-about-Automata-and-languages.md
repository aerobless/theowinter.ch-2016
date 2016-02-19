---
layout: article
title: 44 questions about automata and languages
description: "44 questions that helped me prepare for an exam in theoretical computing, automata and languages."
category: articles
share: true
comments: true
tags: [HSR, CompSci]
image:
  feature: rappi_steg.jpg
--- 

This post is about automata and languages that are used in theoretical computing. I was supplied 44 questions as a help 
to prepare for the exam in "[Automaten und Sprachen](http://studien.hsr.ch/allModules/24404_M_AutoSpr.html)" at HSR. So 
I'm going ahead and try to answer all of them. Please note that the original course was held in german, so my translation of 
certain terms might not always be perfect.

1. **What is Σ\*?**  
Σ<sup>*</sup> is the number of words in the alphabet Σ.[^3]

2. **What is the difference between ε, Ø and {ε}?**  
    + Ø signifies the empty language  
    + ε signifies the empty word
    + {ε} stands for the language that consists only of the empty word = Σ<sup>0</sup> != Ø
<br><br>
3. **What's the difference between DEA/DFA and a NEA/NFA?**  
A nondeterministic finite automaton (NFA) has less strict rules then a deterministic finite automaton (DFA). Nondeterministic means it can transition to, and be in, multiple states at once.
Deterministic means that it can only be in, and transition to, one state at a time.[^4] 
When NFA model consists only of the main success path, failure paths don't have to be modelled, where as for a DFA all states have to be modelled. 
However every NFA can be transformed into a DFA.
<!--TODO: Insert graphic displaying example for NFA DFA-->

4. **How to compare two finite automatons?**  
To compare two finite automata one has to transform them into the minimal automaton form. The minimal automaton consists 
only of the bare minimum of necessary states and transitions.

5. **State three methods to show that a language _is_ regular**  
    + _NOT_ Pumping Lemma, see the source[^13]
    + Myhill–Nerode theorem
    + Closure properties of regular languages (set operations, concatenation, Kleene star, mirror, homomorphisms)[^5]
<br><br>    
6. **State two methods to show that a language _is not_ regular**  
    + [Pumping Lemma]({{ site.url }}/articles/Is-this-language-regular/) (Proof by contradiction)
    + Myhill–Nerode theorem[^5]
<br><br>    
7. **Describe the connection between DFAs, NFAs and regular expressions**  
Every nondeterministic finite automaton (NFA) can be transformed into a deterministic finite automaton (DFA). 
For every DFA a regular expression (regex) can be built that matches the words which the DFA would accept.

8. **How to prove that a language isn't regular with the pumping lemma?**  
[Full description here]({{ site.url }}/articles/Is-this-language-regular/)

9. **Describe DFAs for the languages Ø, {ε}, Σ<sup>\*</sup>**  
	+ DFA for the empty language Ø:    
	_--> o --Σ--> (o)_
	+ DFA for the language consisting only of the empty word {ε}:  
	_--> (o)_
	+ DFA for the empty language Ø:  
	_--> o_
<br><br>	
10. **Why are finite languages regular?**  
A finite language can be accepted by a finite machine.[^6]

11. **State an example for a irregular language**  
L = {0<sup>n</sup>1<sup>n</sup> | n ≥ 0}, also the language of palindromes is also not regular.

12. **What is a context free grammar?**  
Regular languages read the characters of a word from left to right, after every character it checks whether a word is accepted. 
There are problems where this isn't ideal, for example to check the nesting of brackets. This is a problem where a context free grammar can be used. 
It consists of a finite amount of variables, a finite amount of characters also called tokens, a number of rules that consist of variables and tokens, a start variable S.  
For example: 
	+ A --> ε  
	+ A --> AA  
	+ A --> (A)
<br><br>
13. **What's the meaning of w ∈ L(G)?**  
Word w is part of Language L with grammar G.

14. **What are the characteristics of the Chomsky normal form (CNF)?**  
Every grammar in CNF is context-free. Every grammar which is context-free can be translated into a grammar that is in CNF. 
CNF conversion is used in some algorithms as a processing step, e.g., the CYK algorithm.[^7]
		
15. **How to bring a grammar into Chomsky normal form (CNF)?**  
Any context free grammar can be translated into CNF. This is done by replacing rules that aren't in CNF (Bad) through rules that are CNF conform (Good):
	+ **Bad:**
		+ S --> A
		+ A --> Bc
		+ A --> cc
	+ **Good:**
		+ S<sub>0</sub> --> AB
		+ A --> a 
		+ S --> ε
<br><br>
16. **Is the Chomsky normal form unambiguous?**  
No it isn't.[^8]

17. **How to prove that a language is context-free?**  
The pumping lemma for context-free languages can be used to prove that a language is context-free by splitting the words into 5 parts (uvxyz) and then pumping. 
It can also be used to prove that a language isn't context-free.[^9][^10]

18. **How does a stack automaton (push down automaton - PDA) work?**  
Context-free grammars produce languages that can't be accepted by a DFA. In order for an automaton to accept such a language it needs a storage. 
Stack automatons solve this problem by providing a stack storage. The arrows in the graph of a stack automaton are labeled like this: *[INPUT], [ELEMENT ON STACK] --> [WRITE TO STACK]*. 
The items on the stack don't need to match with the input, they're part of their own alphabet. All valid operations for a stack machine work like the following examples:
	+ **Replace**: a,b -> c _(if input a, and b on top of stack, replace b with c)_
	+ **Push**: a, ε -> b _(if input a, push b on top of the stack)_
	+ **Pop**: a, b -> ε _(if input a, pop b off the top of the stack)_
	+ **Empty Transition**: a, ε -> ε _(if input a, do nothing & go to next input)_
	+ **Halt**: a, b -> c _(if input a, and b isn't on top of the stack, the machine halts)_
	+ **Start**: ε, ε -> $ _(push $ on top of the stack, useful to detect when the stack is empty)_
	+ **Stop**: ε, $ -> ε _(pop $ from the top of the stack, the stack should now be empty)_
<br><br>
19. **What properties are required for a language to have a stack automaton?**  
	+ be context-free
	+ (CNF?)
<br><br>	
20. **Describe a technique to show that a language isn't context-free**  
See Nr. 17, the pumping lemma for context-free languages can be used to prove that a language isn't context free. 
In order to prove this we assume that a language is regular, use the pumping lemma and then check if a the pumped word is still in the language. 
If it isn't we have proven that the language isn't context-free.

21. **What are grammars for the languages  Ø, {ε}, Σ<sup>\*</sup>?**  
<!-- TODO --> S --> ε, S --> S

22. **Describe the five typical steps to prove that a language isn't context-free with the pumping lemma**[^9]
	1. Assume that L is context-free
	2. According to the pumping lemma the pumping length N exists
	3. Construct a word, for example a<sup>N</sup>b<sup>N</sup>c<sup>N</sup> that is part of L.
	4. Divide the word into uvxyz so that ∣vxy∣ ≤ N and ∣vx∣ ≥ 0. For all i ≥ 0, uv<sup>i</sup>wx<sup>i</sup>y is in L.
	5. Pump v and y. If the word is still in L the language is context-free, otherwise it isn't.
<br><br>
	
23. **What is a typical _not_ context-free language?**
Languages that require a stack machine to track more then one character aren't recognized on a normal stack machine with 
only one stack. It is possible to require such a language on a stack machine that has the required number of stacks, but it's 
not possible on a standard stack automaton. An example for such a language is L = {a<sup>n</sup>b<sup>n</sup>c<sup>n</sup> | n ∈ N}.

24. **Is there a turing machine with only one state?**
No, since then there would be no transition function, so it wouldn't know whether to move left or right after a input.

25. **How many different languages can be recognized by turing machines with only two states?**  
A two state turing machine can be universal.[^11] A universal turing machine can simulate an arbitrary Turing machine on arbitrary input. 
So a two state turing machine can recognize all languages that can be recognized by a turing machine. The total amount of possible turing machines is countably infinite.

26. **Mention 3 types of turing machines**  
    1. Turing machines with only one band/storage.
    2. Multitrack turing machines (more then one band).
    3. Nondeterministic turing machines
<br><br>

27. **M is a nondeterministic turing machine with w ∈ Σ<sup>\*</sup>. What's the meaning of w ∈ L(M)?**  
There is a turing machine M that accepts the word w. <!-- TODO -->

28. **Why are there languages that aren't turing-recognizable?**  
A language is only turing-recognizable if it is enumerated by a enumerator. 
Intuitively, a language is Turing-recognizable if there is some computer program that, given a string in the language, 
can confirm that the string is indeed within the language.[^12]

29. **What's the difference between a turing-recognizable and a turing-decidable language?**  
A language is turing-recognizable if there is a turing machine with L=L(M). Words that aren't in the language aren't accepted but 
the machine will never stop, so you can't be certain if the machine will simply take a bit longer to recongize the word or if it really 
isn't part of the language.
A language is turing-decidable if it is recognized by a decider. A decider is a Turing machine tht stop for every input w ∈ Σ<sup>\*</sup>. 
Every Turing-decidable language is also turing-recognizable. The only difference is that a turing-decidable language the tm has to 
stop for any input, where as the tm for a turing-recognizable language might loop endlessly for certain input-words.

30. **How to demonstrate that a turing-recognizable language is turing-decidable?**  
In order for a language to be turing-decidable there has to be a decider. A non deterministic turing machine is a decider if every 
possible calculation layer terminates. So finding a decider proves that the language is decidable.

31. **What is the prototypical undecidable problem for turing machines?**  
The acceptance problem. It asks whether a turing machine M will recognize a input word w. 

32. **What is the reduction of a problem into another problem?**  
A reduction is an algorithm for transforming one problem into another problem. A reduction from one problem to another can 
be used to show that the second problem is just as difficult as the first.[^14]
 
33. **How to prove that a problem isn't decidable**  
One way is to reduce the problem into another problem that is known to be undecidable.

34. **What is an example for an undecidable problem?**  
The acceptance problem (see question 31). An other example would be the halting problem. A common explanation is the 
barber problem. A barber writes on a sign that he cuts the hair of all the people who don't cut their own hair. Now he can't 
decide whether to cut his own hair or not.

35. **What is the halting problem?**  
The halting problem is the problem of determining, from the description of any computer program and input, whether the program will 
finish running or continue to run forever.[^15]

36. **How is the performance of an algorithm when switching from a specialized turing machine to a standard turing machine?**  
The emulation of a specialized turing machine on a standard turing machine will decrease the performance.

37. **What is polynomial reduction?**  
Languages are sorted by difficulty (≤ p) through polynomial reduction.

38. **How is the performance if a nondeterministic turing machine is simulated on a deterministic turing machine?**  
A nondeterministic turing machine with a runtime of t(n) can be simulated in 2<sup>O(t(n))</sup> by a deterministic turing machine.[^3]

39. **What is the SAT problem?**
The sentence of Cook and Levin proves that SAT is a NP-complete problem. This means that any problem can be reduced to a SAT-problem 
in polynomial time. 

40. **What's the difference between a problem like SAT and the integral division of numbers?**
SAT is np-complete.

41. **How to test if a programming language is turing-complete?**  
In order for a programming language to be turing-complete it has to be possible to program a turing machine simulator.

42. **Why is the language LOOP not turing-complete?**  
LOOP isn't turing-complete because all LOOP programs terminate in every case, but there are turing machines that terminate never.

43. **Are there problems that can be sloved in (programming language) WHILE but not in (programming language) GOTO?**  
No, the goto command and the loop command are equal. A programming language can either offer a goto or a while loop control structure 
(or both) and still be turing-complete.

44. **Is it possible to write a compiler that translates C-Code to (programming language) Brainfuck?**  
Yes Brainfuck is turing-complete so every possible computation can be done using that language.

#Terminology[^3]

1. **Alphabet:** An alphabet contains all the valid characters of a language. It is designated by the character _Σ_.
2. **Word:** A word consists only of valid characters that are ordered in a way so that the word is part of the language definition.
3. **Empty word:** The empty word is the only word of length 0. It is designated by the character _ε_.
4. **Language:** A language is a subset of all possible character-combinations of an alphabet. The valid character-combinations are called words.
5. **Regular:** A language is regular if a DEA/DFA (Deterministic finite automaton) exists that accepts the language.
6. **DEA/DFA:** A deterministic finite automaton models a system with a finite number of different states. The 
transition between states happens deterministically when new data arrives. Formally a DFA consists of 5 elements:
a finite number of states (Q), a alphabet (Σ), one or more transition-functions, a start state (q0), one or more accepting states (F).
7. **Nondeterministic:** Something is nondeterministic when there is more then one possible transition from one state to another.
8. **NEA/NFA:** A Nondeterministic finite automaton doesn't need to obey the restrictions of a DEA/DFA. Every DEA/DFA is also a 
NEA/NFA. 
9. **Accept:** A automaton accepts a word if it fulfills it's language definition and consists of valid characters.
10. **Accepted language of a DEA/DFA:** A DEA/DFA naturally defines a language that consists of words that can be used as input
for the DEA/DFA. The DEA/DFA transitions theses words from a start state to a acceptance state.
11. **Regex:** Regular expressions are just as expressive as DEA/DFAs but more practical because of their simple syntax.
12. **Grammar:** A grammar generates a language by executing a set of rules on the start variable. This is repeated until no more
variables exist except for a chain of tokens. Grammars are used for context free languages and stack automatons.
13. **Context-free:** A context-free language (CFL) is generated by a context-free grammar (CFG). CFL are used because regular languages 
aren't very practical, many languages aren't regular. A DEA/DFA can't remember the amount of open brackets, to be able to do that it 
would need infinite states.
14. **Variable:** A placeholder for a value.
15. **Rule:** A context-free grammar (CFG) uses rules consisting of a variable and a chain of variables & tokens. 
A rule could look like this `A -> BCx`.
16. **Derivation:** Two derivations of a word are equivalent if they have the same derivation tree. 
17. **Parse-tree:** The parse-tree of a word of a context-free language is a representation of the used production rules.
18. **Generated language of a grammar:** A language that is generated by a context-free grammar (CFG).
19. **Stack automaton:** CFGs generate languages that are accepted by a DEA/DFA, that's why stack automatons were invented. 
A stack automaton consists of 6 elements: states (Q), entry-alphabet (Σ), stack-alphabet (Γ), transition-functions, start-state (q0), acceptance-states (F).
20. **Turing machine:** A Turing machine manipulates symbols on a strip of tape according to a table of rules. A turing machine 
can simulate the logic of any computer algorithm.
21. **Recognized language of a turing machine:** A language _L_ is turing-recognizable if there is a turing machine with _L = L(M)_.
22. **Decider:** A decider is a turing machine that stops for every input of w ∈ Σ<sup>*</sup>.
23. **Determinable language:** A language is determinable if a decider recognises the language.
24. **Acceptance problem:** The acceptance problem for turing-recognisable languages asks if the turing-machine M will recognise a
input word w. M itself can't be run because it's possible that M will run into an infinite-loop.
25. **Countable infinite:** A infinite amount A is countable infinite if it is as powerful as the natural numbers.
26. **Innumerable infinite:** A infinite amount A is innumerable infinite if there is no bijection between the natural numbers and A.
27. **Reduction:** Reduction is used to compare two languages. In the reduction process words from language A are mapped to language B.
28. **Polynomial runtime:** An algorithm can be solved in polynomial time if the number of steps required to complete the algorithm is O(n<sup>k</sup>) 
for some nonnegative integer k, were n is the complexity of the input. Polynomial-time algorithms are said to be "fast".[^1]
29. **P and NP:** The class P consists of languages that can be decided by a decider with a polynomial runtime. The class of problems 
that can't be decided by a polynomial turing machine is called NP (nondeterministic polynomial time).
30. **NP-complete:** A decision problem is NP-complete when it is both in NP and NP-hard. A problem p in NP is NP-complete if every other 
problem in NP can be transformed into p in polynomial time.[^2]
31. **Polynomial reduction:** Languages are sorted into difficulty-categories with the polynomial reduction.
32. **SAT:** The language `SAT = {φ | φ is a solvable logical formula}` is decidable. SAT is in NP because there is a polynomial verifier.
33. **3SAT:** 3SAT is NP-complete.
34. **Clique:** A k-Clique in a graph G is an amount of k corners of the graph, so that in G every corner of the subset is connected to every other corner.
Simplified: everyone knows everyone.
35. **Turing-complete:** A programming language is turing-complete if every calculable mapping can be formulated in that language.
36. **LOOP:** LOOP is a programming language with only one control structure, the iteration of a instruction block with a fixed amount of passes.


**Sources:**

[^1]: [Wolfram MathWorld: Polynomial Time](http://mathworld.wolfram.com/PolynomialTime.html)
[^2]: [Wikipedia: NP-Complete](https://en.wikipedia.org/wiki/NP-complete)
[^3]: [HSR AutoSpr Skript](https://github.com/AndreasFMueller/AutoSpr)
[^4]: [Mathematics StackExchange: Difference between NFA and DFA](http://math.stackexchange.com/questions/563829/difference-between-nfa-and-dfa)
[^5]: [Computer Science StackExchange](http://cs.stackexchange.com/a/1033)

[^6]: [Mathematics StackExchange](http://math.stackexchange.com/questions/216047/formally-prove-that-every-finite-language-is-regular)
[^7]: [Wikipedia: Chomsky Normal Form](https://en.wikipedia.org/wiki/Chomsky_normal_form)
[^8]: [Mathplanet](http://www.matheplanet.com/default3.html?call=viewtopic.php?topic=74594&ref=https%3A%2F%2Fwww.google.ch%2F)
[^9]: [Wikipedia: Pumping Lemma for context-free languages](https://en.wikipedia.org/wiki/Pumping_lemma_for_context-free_languages)
[^10]: [YouTube: The pumping lemma for CFL's](https://www.youtube.com/watch?v=T-d5_kv9Mlw)
[^11]: [Wikipedia: Wolfram's 2-state 3-symbol Turing machine](https://en.wikipedia.org/wiki/Wolfram%27s_2-state_3-symbol_Turing_machine)
[^12]: [Stackoverflow: Difference between Turing-Decidable and Co-Turing-Decidable](http://stackoverflow.com/a/10032433)
[^13]: [Wikipedia: Pumping Lemma for regular languages](https://en.wikipedia.org/wiki/Pumping_lemma_for_regular_languages)
[^14]: [Wikipedia: Reduction (complexity)](https://goo.gl/BPIvjl)
[^15]: [Wikipedia: Halting problem](https://en.wikipedia.org/wiki/Halting_problem)

{% include toc.html %}
