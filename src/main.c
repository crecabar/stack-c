/*
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>

#include <LinkedList.h>

int main(int nArgs, char *vArgs[])
{
    List l = NULL;
    int nodes, result;

    result = appendValue(&l, 'c');
    printf("List l has been created %s\n", (result == 0 ? "successfuly" : "wrongly"));
    nodes = printList(l);
    printf("List l has %d nodes\n", nodes);

    result = appendValue(&l, 'D');
    nodes = printList(l);
    printf("List l has %d nodes\n", nodes);

    result = appendValue(&l, 'e');
    nodes = printList(l);
    printf("List l has %d nodes\n", nodes);

    return 0;
}