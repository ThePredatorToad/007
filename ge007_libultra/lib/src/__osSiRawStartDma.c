#include "libultra_internal.h"
#include "hardware.h"
s32 __osSiRawStartDma(s32 dir, void *addr)
{
    if (__osSiDeviceBusy())
        return -1;
    if (dir == 1)
    {
        osWritebackDCache(addr, 64);
    }
    HW_REG(SI_DRAM_ADDR_REG, void *) = (void*)osVirtualToPhysical(addr);
    if (dir == 0 /*read*/)
    {
        HW_REG(SI_PIF_ADDR_RD64B_REG, u32) = 0x1FC007C0;
    }
    else
    {
        HW_REG(SI_PIF_ADDR_WR64B_REG, u32) = 0x1FC007C0;
    }
    if (dir == 0)
    {
        osInvalDCache(addr, 64);
    }
    return 0;
}
