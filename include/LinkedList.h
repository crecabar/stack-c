
#ifndef __LIST_H__
#define __LIST_H__

struct _node
{
    char data;
    struct _node *link;
};

typedef struct _node Node;
typedef Node *List;

int createList(List *l, char value);
int printList(const List l);
int appendValue(List *l, char value);
int deleteList(List *l);
void printNode(Node node);
Node *createNode(char value, Node *link);

#endif
