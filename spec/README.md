# TLA+ Model

This directory contains the TLA+ project that defines the model for the source. \
In order to use an IDE such as [TLA+ toolbox](https://lamport.azurewebsites.net/tla/toolbox.html) is needed. You can also use vscode with the TLA+ plugin. 

The model consists of two modules:
- LinkedList.tla: Includes the definition of the linkedlist type and all operators that can be performed on it.
- main.tla: Includes the checking algorithm and all invariants that should hold true for the type.

##### LinkedList.tla
The linkedList module defines the operators, structure and how to generate arbitrary linked lists from a given domain.
The empty domain {} gives the empty linked list. For a given domain, a valid linked list will be generated by the LinkedList operator.
Due to the large space of possible linked lists (valid and invalid) given a domain, the length of a new linkedlist is very limited (maximum 6 labels). However concatenating or adding to a generated linked list does not have this limitation.  

##### main.tla
The model checking algorithm will apply the operators such as remove, add etc. in a sequence with generated lists.
the PlusCal [either](https://learntla.com/pluscal/behaviors/) keyword is used to generate an algorithm that will test different orders of applying operators.
If any invariant is found to not evaluate to TRUE at any stage of the algorithm, an error will be generated by the model checker. 

The invariants come in two "flavours"; some assert some property of the current list, and others assert some outcome of applying an operator on the current list.

### To run and verify the model:
- Start the toolbox and load the spec file ([main.tla](main.tla))
If any changes are made to the file, changes must be translated from PlusCal to TLA+ (File->Translate PlusCal Algorithm)

- Right click "models", found in the left hand "Spec Explorer", select "new model" and give it a name
- Double click the new model to open it.
- Provide values for the model constants, NULL -> NULL, VALUE can be set to a value e.g. 1, or a set e.g. {1,2}

For the model to perform any checking add the invariants:
- HasFirst
- HasLast
- NullNotInDomain
- ValidList
- RemoveInvariant
- RemovePrevInvariant
- InsertInvariant
- ConcatInvariant
- SwapInvariant
- NextInvariant
- ForEachedList
- ForEachedFromList

Run the model by pressing the run button ▶️

After this the model should run and pass.
