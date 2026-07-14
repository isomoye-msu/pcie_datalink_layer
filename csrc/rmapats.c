// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  schedNewEvent (struct dummyq_struct * I1482, EBLK  * I1477, U  I619);
void  schedNewEvent (struct dummyq_struct * I1482, EBLK  * I1477, U  I619)
{
    U  I1772;
    U  I1773;
    U  I1774;
    struct futq * I1775;
    struct dummyq_struct * pQ = I1482;
    I1772 = ((U )vcs_clocks) + I619;
    I1774 = I1772 & ((1 << fHashTableSize) - 1);
    I1477->I665 = (EBLK  *)(-1);
    I1477->I666 = I1772;
    if (0 && rmaProfEvtProp) {
        vcs_simpSetEBlkEvtID(I1477);
    }
    if (I1772 < (U )vcs_clocks) {
        I1773 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1477, I1773 + 1, I1772);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I619 == 1)) {
        I1477->I668 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I665 = I1477;
        peblkFutQ1Tail = I1477;
    }
    else if ((I1775 = pQ->I1379[I1774].I688)) {
        I1477->I668 = (struct eblk *)I1775->I686;
        I1775->I686->I665 = (RP )I1477;
        I1775->I686 = (RmaEblk  *)I1477;
    }
    else {
        sched_hsopt(pQ, I1477, I1772);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
