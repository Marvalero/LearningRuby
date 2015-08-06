# Introduction
Desing matters because of the need for change software (add
funcionality, solve bugs,..). So we must want our application to be easy
to change.

In OO, we use to use object to interact using messages. So this object
have dependencies.

The desing has two component: write the code for the feature and create
code that is amenable to being changed.

1: Desing Principles
-----------------------------------------------
SOLID:
  - Single Responsibility
  - Open-Closed
  - Liskov Substitution
  - Interface Segregation
  - Dependency Inversion

2: Designing Classes
----------------------------------------------
Fundaments of OO: classes and message

Criteria to write software: 
  - It does what it is supposed to do right now 
  - It is also easy to change later. Remmember that “ Desing is more the art of preserving changeability than the act of achieving perfection "

Code must be TRUE:
   - Transparent: the consequences of change are obvious
   - Reasonable: cost of change must be proportional to benefits of change
   - Usable: should be usable in new unexpected contexts
   - Exemplary: people must want to perpetuate these qualities

Single responsability: Classes should do the smallest possible useful thing.
   * Ask you: Is this the best way to organise the code? If your code will change, classes must be easy to reuse.

          Class with many responsibilities -> Class with many reasons to change -> if the application break, all those things (and classes that depends on it) will break. 
   * Know if our class contains behaviour that belongs somewhere else: rephrase every method has a question “Please lovely Class, what is your..?"
   * Cohesion: We must be able to describe a Class without using the words “and” neither “or”. That means that it has more than a single responsibility or central purpose (Ask you: What is the purpose of this class??).

"Improve it now” vs “Improve it later”: applications are never perfectly designed. Every choice has a price. 

DRY: Don’t Repeat Yourself

#### Good practices:
   - Hide instance variables. Even from the class that defines them (using attr_reader). 
   - Hide data structures. You could use Ruby Struct Class to wrap an structure.
   - Extract extra responsibilities from methods. Create new methods with code that is used  by other methods.
        - If a bit of code inside a method needs a comment, extract that bit into a separate method
   - Isolate extra responsibilities in classes. Maybe define a Struct with some methods.

3: Dependencies
------------------------------------------




