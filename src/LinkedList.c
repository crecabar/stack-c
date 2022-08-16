#include <stdio.h>
#include <stdlib.h>
#include <LinkedList.h>

int createList(List *l, char value)
{
    Node *node;
    if(*l == NULL) {
        node = createNode(value, NULL);
        *l = node;

        return 0;
    }

    return -1;
}

int printList(const List l)
{
    int count = 0;
    List p = l;
    if (l == NULL) {
        return -1;
    } else {
        while (p != NULL) {
            printNode(*p);
            count ++;
            p = p->link;
        }
    }

    return count;
}

int appendValue(List *l, char value)
{
    if (*l == NULL) {
        printf("I shouldn't be here\n");
        return createList(l, value);
    } else {
        Node *node = createNode(value, *l);
        *l = node;

        return 0;
    }

    return -1;
}

int deleteList(List *l)
{

    return -1;
}

void printNode(Node node)
{
    printf("| %c | %s ", node.data, (node.link == NULL ? "NULL\n" : "->"));
}

Node *createNode(char value, Node *link)
{
    Node *node = (Node*)malloc(sizeof(Node));
    (*node).data = value;
    (*node).link = link;

    return node;
}
