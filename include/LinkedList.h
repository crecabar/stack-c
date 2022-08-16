
#ifndef __LIST_H__
#define __LIST_H__

typedef struct _list
{
    char byte;
    struct _list *link;
}_list;

typedef _list* list;

int createList(list *l);
int printList(const list *l);
int appendValue(list *l, char value);
int deleteList(list *l);

#endif
