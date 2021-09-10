Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625244067EA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Sep 2021 09:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhIJHpO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Sep 2021 03:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhIJHpN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Sep 2021 03:45:13 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3558FC061574;
        Fri, 10 Sep 2021 00:44:03 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id t13so319766vkm.4;
        Fri, 10 Sep 2021 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afAK0F8Qpxmyxp4dXVEbC4bRMlaABk3RvaT05w9xS2A=;
        b=GJWX5QDndpA0d9oqTjkB5UkJ1ysy3rBvVMKWZ8E+/0NvaCAYmJB7mz6n1NGuV33R4C
         YBP3Ve7M+/xg/rlrbn3cwFagQeEs3xxmmvrsuX5KtaYXKtEYggFkZg83Qx89a6w8AHIC
         5o0/6g97DzAi2eXN3ck2sHCQhNj2F8aDtXE3R+A8QxQGVvZ2S6nt6pXPONz+c7tCmcLh
         icVeGv25Uu8Ma2yt8ctPPOxfupicFWPLrSBad/95rBI3MKokNQNCiMc6lryRtv2And6H
         O9TQVvv6prTHu5yh/UjzVe5vE+TSVUv6s2Lon1oBuCh1Nnt03+Kd4USrvyz+WLgcI1ah
         ucMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afAK0F8Qpxmyxp4dXVEbC4bRMlaABk3RvaT05w9xS2A=;
        b=UGCqSOQ+LURLmoICmGkFa+vV8WATo2ORfPwPKTUVw34oSTvj+KGfjThiHhKsvXJRog
         1svbnNk+QQZ1j8goDrmwpm6QTTi3MtR0eIc/A6KG5aBUL2QOtM/pV8yuPiSdv40EZKra
         e4JtN+j1Y3o7qai0089d+Wm6b3Rfz9SFKh5HYAjsyfZLyIaDu2vh26Cb/zxl1OXAgbWQ
         usTc9/1Ez0vTTRmAYY1xz5863BZzUa1UUHCWy6RJ7g6AZzZBYhLlXWS/fAxEPvwmu9Au
         FXqaEE362w5lmfYg8s5MyThpLiW8Zapy4NvfWTKm1sSrxUkk8XhQewSYUQUZFPMl3mUw
         NVIw==
X-Gm-Message-State: AOAM530JFrM/khIyMh+NeYiTtaRd+sFs942zWD3K6wRyurjail/r2dfo
        k4dyPFJPafAhMdnAN7SV5JvptLMyeoKnajsZ+4Siltc9/h0=
X-Google-Smtp-Source: ABdhPJzNvHo871QC4d62Hwf3fF4JjQpGUq0KPSGdz7oCWxi/9dG5TWvYS6wcCgsJ9oUszhLDHP53ZW6hVNQ7+SvlDuA=
X-Received: by 2002:a1f:fc8f:: with SMTP id a137mr4383217vki.19.1631259842160;
 Fri, 10 Sep 2021 00:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210903095213.797973-1-chenhuacai@loongson.cn>
 <20210903095213.797973-19-chenhuacai@loongson.cn> <YTjbaz7iea1kwGYb@robh.at.kernel.org>
In-Reply-To: <YTjbaz7iea1kwGYb@robh.at.kernel.org>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 10 Sep 2021 15:43:49 +0800
Message-ID: <CAAhV-H6yPscb_wZRDjaY+h0HB8No-7muP87G+wWnUJdSPE00+g@mail.gmail.com>
Subject: Re: [PATCH V2 18/22] LoongArch: Add PCI controller support
To:     Rob Herring <robh@kernel.org>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Rob and Arnd,

On Wed, Sep 8, 2021 at 11:49 PM Rob Herring <robh@kernel.org> wrote:
>
> +linux-pci
>
> On the next version, Cc linux-pci list so PCI maintainers can review.
>
> On Fri, Sep 03, 2021 at 05:52:09PM +0800, Huacai Chen wrote:
> > Loongson64 based systems are PC-like systems which use PCI/PCIe as its
> > I/O bus, This patch adds the PCI host controller support for LoongArch.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/include/asm/device.h |  17 +++
> >  arch/loongarch/include/asm/dma.h    |  13 +++
> >  arch/loongarch/include/asm/pci.h    |  42 +++++++
> >  arch/loongarch/pci/acpi.c           | 174 ++++++++++++++++++++++++++++
> >  arch/loongarch/pci/msi.c            |  30 +++++
> >  arch/loongarch/pci/pci.c            | 169 +++++++++++++++++++++++++++
> >  6 files changed, 445 insertions(+)
> >  create mode 100644 arch/loongarch/include/asm/device.h
> >  create mode 100644 arch/loongarch/include/asm/dma.h
> >  create mode 100644 arch/loongarch/include/asm/pci.h
> >  create mode 100644 arch/loongarch/pci/acpi.c
> >  create mode 100644 arch/loongarch/pci/msi.c
> >  create mode 100644 arch/loongarch/pci/pci.c
> >
> > diff --git a/arch/loongarch/include/asm/device.h b/arch/loongarch/include/asm/device.h
> > new file mode 100644
> > index 000000000000..75693eeba5c6
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/device.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Arch specific extensions to struct device
> > + *
> > + * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
> > + */
> > +#ifndef _ASM_LOONGARCH_DEVICE_H
> > +#define _ASM_LOONGARCH_DEVICE_H
> > +
> > +struct dev_archdata {
> > +     unsigned long dma_attrs;
>
> Strange that no other arch needs something like this. Aren't DMA attrs
> accessed via ops functions?
OK, this will be removed, it comes from our old internal repo.

>
> > +};
> > +
> > +struct pdev_archdata {
> > +};
> > +
> > +#endif /* _ASM_LOONGARCH_DEVICE_H*/
> > diff --git a/arch/loongarch/include/asm/dma.h b/arch/loongarch/include/asm/dma.h
> > new file mode 100644
> > index 000000000000..a8a58dc93422
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/dma.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
> > + */
> > +#ifndef __ASM_DMA_H
> > +#define __ASM_DMA_H
> > +
> > +#define MAX_DMA_ADDRESS      PAGE_OFFSET
> > +#define MAX_DMA32_PFN        (1UL << (32 - PAGE_SHIFT))
> > +
> > +extern int isa_dma_bridge_buggy;
> > +
> > +#endif
> > diff --git a/arch/loongarch/include/asm/pci.h b/arch/loongarch/include/asm/pci.h
> > new file mode 100644
> > index 000000000000..e9f483396864
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/pci.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
> > + */
> > +#ifndef _ASM_PCI_H
> > +#define _ASM_PCI_H
> > +
> > +#include <linux/ioport.h>
> > +#include <linux/list.h>
> > +#include <linux/mm.h>
> > +#include <linux/types.h>
> > +#include <asm/io.h>
> > +
> > +#define PCIBIOS_MIN_IO               0x4000
> > +#define PCIBIOS_MIN_MEM              0x20000000
> > +#define PCIBIOS_MIN_CARDBUS_IO       0x4000
> > +
> > +#define HAVE_PCI_MMAP
> > +#define ARCH_GENERIC_PCI_MMAP_RESOURCE
> > +
> > +extern phys_addr_t mcfg_addr_init(int node);
> > +extern void pcibios_add_root_resources(struct list_head *resources);
>
> This is not a 'pcibios' function, so the name is not right. The
> intention is also to get rid of 'pcibios' functions.
OK, it should be removed.

>
> > +
> > +static inline int pci_proc_domain(struct pci_bus *bus)
> > +{
> > +     return pci_domain_nr(bus);
>
> Based on what newer arches do, should be just 'return 1'?
OK, it can just return 1.


>
> > +}
> > +
> > +/*
> > + * Can be used to override the logic in pci_scan_bus for skipping
> > + * already-configured bus numbers - to be used for buggy BIOSes
> > + * or architectures with incomplete PCI setup by the loader
> > + */
> > +static inline unsigned int pcibios_assign_all_busses(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +/* generic pci stuff */
> > +#include <asm-generic/pci.h>
> > +
> > +#endif /* _ASM_PCI_H */
> > diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
> > new file mode 100644
> > index 000000000000..d6e2f69b9503
> > --- /dev/null
> > +++ b/arch/loongarch/pci/acpi.c
> > @@ -0,0 +1,174 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
> > + */
> > +#include <linux/pci.h>
> > +#include <linux/acpi.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/dmi.h>
> > +#include <linux/slab.h>
> > +#include <linux/pci-acpi.h>
> > +#include <linux/pci-ecam.h>
> > +
> > +#include <asm/pci.h>
> > +#include <asm/loongson.h>
> > +
> > +struct pci_root_info {
> > +     struct acpi_pci_root_info common;
> > +     struct pci_config_window *cfg;
> > +};
> > +
> > +void pcibios_add_bus(struct pci_bus *bus)
> > +{
> > +     acpi_pci_add_bus(bus);
> > +}
> > +
> > +int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
> > +{
> > +     struct pci_config_window *cfg = bridge->bus->sysdata;
> > +     struct acpi_device *adev = to_acpi_device(cfg->parent);
> > +
> > +     ACPI_COMPANION_SET(&bridge->dev, adev);
> > +
> > +     return 0;
> > +}
> > +
> > +int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
> > +{
> > +     struct pci_config_window *cfg = bus->sysdata;
> > +     struct acpi_device *adev = to_acpi_device(cfg->parent);
> > +     struct acpi_pci_root *root = acpi_driver_data(adev);
> > +
> > +     return root->segment;
> > +}
> > +
> > +static void acpi_release_root_info(struct acpi_pci_root_info *ci)
> > +{
> > +     struct pci_root_info *info;
> > +
> > +     info = container_of(ci, struct pci_root_info, common);
> > +     pci_ecam_free(info->cfg);
> > +     kfree(ci->ops);
> > +     kfree(info);
> > +}
> > +
> > +static int acpi_prepare_root_resources(struct acpi_pci_root_info *ci)
> > +{
> > +     struct acpi_device *device = ci->bridge;
> > +     struct resource_entry *entry, *tmp;
> > +     int status;
> > +
> > +     status = acpi_pci_probe_root_resources(ci);
> > +     if (status > 0)
> > +             return status;
> > +
> > +     resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
> > +             dev_dbg(&device->dev,
> > +                        "host bridge window %pR (ignored)\n", entry->res);
> > +             resource_list_destroy_entry(entry);
> > +     }
> > +
> > +     pcibios_add_root_resources(&ci->resources);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Lookup the bus range for the domain in MCFG, and set up config space
> > + * mapping.
> > + */
> > +static struct pci_config_window *
> > +pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
> > +{
> > +     int ret;
> > +     u16 seg = root->segment;
> > +     struct device *dev = &root->device->dev;
> > +     struct resource cfgres;
> > +     struct resource *bus_res = &root->secondary;
> > +     struct pci_config_window *cfg;
> > +     const struct pci_ecam_ops *ecam_ops;
> > +
> > +     ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
> > +     if (ret) {
> > +             dev_err(dev, "%04x:%pR ECAM region not found, use default value\n", seg, bus_res);
> > +             root->mcfg_addr = mcfg_addr_init(0);
> > +             ecam_ops = &loongson_pci_ecam_ops;
> > +     }
> > +
> > +     cfgres.start = root->mcfg_addr + (bus_res->start << ecam_ops->bus_shift);
> > +     cfgres.end = cfgres.start + (resource_size(bus_res) << ecam_ops->bus_shift) - 1;
> > +     cfgres.flags = IORESOURCE_MEM;
> > +
> > +     cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> > +     if (IS_ERR(cfg)) {
> > +             dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> > +                     PTR_ERR(cfg));
> > +             return NULL;
> > +     }
> > +
> > +     return cfg;
> > +}
> > +
> > +struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
> > +{
> > +     struct pci_bus *bus;
> > +     struct pci_root_info *info;
> > +     struct acpi_pci_root_ops *root_ops;
> > +     int domain = root->segment;
> > +     int busnum = root->secondary.start;
> > +
> > +     info = kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info) {
> > +             pr_warn("pci_bus %04x:%02x: ignored (out of memory)\n", domain, busnum);
> > +             return NULL;
> > +     }
> > +
> > +     root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
> > +     if (!root_ops) {
> > +             kfree(info);
> > +             return NULL;
> > +     }
> > +
> > +     info->cfg = pci_acpi_setup_ecam_mapping(root);
> > +     if (!info->cfg) {
> > +             kfree(info);
> > +             kfree(root_ops);
> > +             return NULL;
> > +     }
> > +
> > +     root_ops->release_info = acpi_release_root_info;
> > +     root_ops->prepare_resources = acpi_prepare_root_resources;
> > +     root_ops->pci_ops = (struct pci_ops *)&info->cfg->ops->pci_ops;
> > +
> > +     bus = pci_find_bus(domain, busnum);
> > +     if (bus) {
> > +             memcpy(bus->sysdata, info->cfg, sizeof(struct pci_config_window));
> > +             kfree(info);
> > +     } else {
> > +             bus = acpi_pci_root_create(root, root_ops,
> > +                                        &info->common, info->cfg);
> > +             if (bus) {
> > +                     /*
> > +                      * We insert PCI resources into the iomem_resource
> > +                      * and ioport_resource trees in either
> > +                      * pci_bus_claim_resources() or
> > +                      * pci_bus_assign_resources().
> > +                      */
> > +                     if (pci_has_flag(PCI_PROBE_ONLY)) {
> > +                             pci_bus_claim_resources(bus);
> > +                     } else {
> > +                             struct pci_bus *child;
> > +
> > +                             pci_bus_size_bridges(bus);
> > +                             pci_bus_assign_resources(bus);
> > +                             list_for_each_entry(child, &bus->children, node)
> > +                                     pcie_bus_configure_settings(child);
> > +                     }
> > +             } else {
> > +                     kfree(info);
> > +             }
> > +     }
> > +
> > +     return bus;
> > +}
>
> It might be time for default implementations here that can be shared
> with arm64. The functions look the same or similar to the arm64
> version in many cases and why they are different isn't that clear to me
> not being all that familar with the ACPI code.
I agree, but I think that cannot be done in this series.

>
> > diff --git a/arch/loongarch/pci/msi.c b/arch/loongarch/pci/msi.c
> > new file mode 100644
> > index 000000000000..2888c5e11539
> > --- /dev/null
> > +++ b/arch/loongarch/pci/msi.c
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
> Is this copied from somewhere else? Otherwise, kernel code should be
> GPL-2.0-only.
>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/msi.h>
> > +#include <linux/pci.h>
> > +#include <linux/spinlock.h>
> > +
> > +static bool msix_enable = 1;
> > +core_param(msix, msix_enable, bool, 0664);
>
> The standard 'nomsi' command line param is not good enough?
Sometimes we want to enable msi but disable msix. :)
>
> > +
> > +int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> > +{
> > +     int id = pci_domain_nr(dev->bus);
> > +
> > +     if (!pci_msi_enabled())
> > +             return -ENOSPC;
>
> I would assume if the default implementation doesn't need this check,
> then neither do you.
Yes, it can be removed.

>
> > +
> > +     if (type == PCI_CAP_ID_MSIX && !msix_enable)
> > +             return -ENOSPC;
> > +
> > +     return msi_domain_alloc_irqs(pch_msi_domain[id], &dev->dev, nvec);
>
> Why does the standard way of getting the domain from the 'dev' not work?
Emm, it seems if I add pcibios_add_device() then we can use the
standard way. Thanks.

>
> > +
> > +}
> > +
> > +void arch_teardown_msi_irq(unsigned int irq)
> > +{
> > +     irq_domain_free_irqs(irq, 1);
> > +}
> > diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> > new file mode 100644
> > index 000000000000..68f36368b0df
> > --- /dev/null
> > +++ b/arch/loongarch/pci/pci.c
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
> > + */
> > +#include <linux/kernel.h>
> > +#include <linux/mm.h>
> > +#include <linux/export.h>
> > +#include <linux/init.h>
> > +#include <linux/acpi.h>
> > +#include <linux/types.h>
> > +#include <linux/pci.h>
> > +#include <linux/of_address.h>
> > +#include <linux/vgaarb.h>
> > +#include <asm/loongson.h>
> > +
> > +#define PCI_DEVICE_ID_LOONGSON_HOST     0x7a00
> > +#define PCI_DEVICE_ID_LOONGSON_DC       0x7a06
> > +
> > +int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
> > +                                             int reg, int len, u32 *val)
> > +{
> > +     struct pci_bus *bus_tmp = pci_find_bus(domain, bus);
> > +
> > +     if (bus_tmp)
> > +             return bus_tmp->ops->read(bus_tmp, devfn, reg, len, val);
> > +     return -EINVAL;
> > +}
> > +
> > +int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
> > +                                             int reg, int len, u32 val)
> > +{
> > +     struct pci_bus *bus_tmp = pci_find_bus(domain, bus);
> > +
> > +     if (bus_tmp)
> > +             return bus_tmp->ops->write(bus_tmp, devfn, reg, len, val);
> > +     return -EINVAL;
> > +}
>
> These should be moved to drivers/acpi/osl.c as weak functions.
>
> Really, I'm not sure they need to be weak because I think they'd work on
> x86 because bus_tmp->ops here should just point to the raw_pci_*
> functions. There would be more overhead of doing pci_find_bus every time
> though.
>
> > +
> > +/*
> > + * We need to avoid collisions with `mirrored' VGA ports
> > + * and other strange ISA hardware, so we always want the
> > + * addresses to be allocated in the 0x000-0x0ff region
> > + * modulo 0x400.
> > + *
> > + * Why? Because some silly external IO cards only decode
> > + * the low 10 bits of the IO address. The 0x00-0xff region
> > + * is reserved for motherboard devices that decode all 16
> > + * bits, so it's ok to allocate at, say, 0x2800-0x28ff,
> > + * but we want to try to avoid allocating at 0x2900-0x2bff
> > + * which might have be mirrored at 0x0100-0x03ff..
>
> Is this something you need to worry about on this h/w? arm64 and riscv
> don't seem to need this. If you do need this, then shouldn't everyone?
>
> Don't blindly copy code unless you know you need it. If multiple arches
> have the same code, then that's a sign of blindly copying stuff or a
> need to refactor into common code. It looks like some things are just
> copied from MIPS. The MIPS arch code is a mess and not a good choice to
> draw inspiration from (aka blindly copy). Pick more recently added
> architectures given they will more closely follow current rules as to
> what maintainers want.
I assume the "mirrored VGA ports" is a common request. But it seems we
can remove this at present, and recover it later if needed.

>
> > + */
> > +resource_size_t
> > +pcibios_align_resource(void *data, const struct resource *res,
> > +                    resource_size_t size, resource_size_t align)
> > +{
> > +     resource_size_t start = res->start;
> > +
> > +     if (res->flags & IORESOURCE_IO) {
> > +             /*
> > +              * Put everything into 0x00-0xff region modulo 0x400
> > +              */
> > +             if (start & 0x300)
> > +                     start = (start + 0x3ff) & ~0x3ff;
> > +     } else if (res->flags & IORESOURCE_MEM) {
> > +             /* Make sure we start at our min on all hoses */
> > +             if (start < PCIBIOS_MIN_MEM)
> > +                     start = PCIBIOS_MIN_MEM;
> > +     }
> > +
> > +     return start;
> > +}
> > +
> > +phys_addr_t mcfg_addr_init(int node)
> > +{
> > +     return (((u64)node << 44) | MCFG_EXT_PCICFG_BASE);
> > +}
> > +
> > +static struct resource pci_mem_resource = {
> > +     .name   = "pci memory space",
> > +     .flags  = IORESOURCE_MEM,
> > +};
> > +
> > +static struct resource pci_io_resource = {
> > +     .name   = "pci io space",
> > +     .flags  = IORESOURCE_IO,
> > +};
> > +
> > +void pcibios_add_root_resources(struct list_head *resources)
> > +{
> > +     if (resources) {
> > +             pci_add_resource(resources, &pci_mem_resource);
> > +             pci_add_resource(resources, &pci_io_resource);
>
> This doesn't look right. What if you have more than 1 root/domain? You
> need a io and memory space for each.
OK, I know.

>
> > +     }
> > +}
> > +
> > +static int __init pcibios_set_cache_line_size(void)
> > +{
> > +     unsigned int lsize;
> > +
> > +     /*
> > +      * Set PCI cacheline size to that of the highest level in the
> > +      * cache hierarchy.
> > +      */
> > +     lsize = cpu_dcache_line_size();
> > +     lsize = cpu_vcache_line_size() ? : lsize;
> > +     lsize = cpu_scache_line_size() ? : lsize;
> > +
> > +     BUG_ON(!lsize);
> > +
> > +     pci_dfl_cache_line_size = lsize >> 2;
> > +
> > +     pr_debug("PCI: pci_cache_line_size set to %d bytes\n", lsize);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __init pcibios_init(void)
> > +{
> > +     return pcibios_set_cache_line_size();
>
> Not really any reason to have 2 functions for this.
>
> And these aren't 'pcibios' calls.
I searched the whole tree. The function of setting
pci_dfl_cache_line_size is pcibios_init() for parisc, sparc, x86, and
pcibios_set_cache_line_size() for MIPS and IA64. So, it seems 2
functions are unnecessary, but the pcibios_ prefix is reasonable.

>
> > +}
> > +
> > +subsys_initcall(pcibios_init);
> > +
> > +int pcibios_dev_init(struct pci_dev *dev)
> > +{
> > +#ifdef CONFIG_ACPI
> > +     if (acpi_disabled)
>
> Won't this be true for !CONFIG_ACPI?
>
> > +             return 0;
> > +     if (pci_dev_msi_enabled(dev))
> > +             return 0;
> > +     return acpi_pci_irq_enable(dev);
>
> Looks to me like pcibios_alloc_irq() would be the better place for this
> instead of pcibios_enable_device().
Yes, that's better.

>
> > +#endif
>
> You'll have a build warning for !CONFIG_ACPI with no return value. But
> then again, I'd assume CONFIG_ACPI can't be disabled for this code and
> the ifdef is pointless.
Yes, CONFIG_ACPI can't be disabled.

>
> > +}
> > +
> > +int pcibios_enable_device(struct pci_dev *dev, int mask)
> > +{
> > +     int err;
> > +
> > +     err = pci_enable_resources(dev, mask);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     return pcibios_dev_init(dev);
> > +}
> > +
> > +void pcibios_fixup_bus(struct pci_bus *bus)
> > +{
> > +     struct pci_dev *dev = bus->self;
> > +
> > +     if (pci_has_flag(PCI_PROBE_ONLY) && dev &&
> > +         (dev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
>
> I don't think this is ever true because you don't have any way to set
> PCI_PROBE_ONLY.
Yes, this function is unneeded.

>
> > +             pci_read_bridge_bases(bus);
> > +     }
> > +}
> > +
> > +static void pci_fixup_vgadev(struct pci_dev *pdev)
> > +{
> > +     struct pci_dev *devp = NULL;
> > +
> > +     while ((devp = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, devp))) {
> > +             if (devp->vendor != PCI_VENDOR_ID_LOONGSON) {
> > +                     vga_set_default_device(devp);
> > +                     dev_info(&pdev->dev,
> > +                             "Overriding boot device as %X:%X\n",
> > +                             devp->vendor, devp->device);
> > +             }
> > +     }
> > +}
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC, pci_fixup_vgadev);
> > --
> > 2.27.0
> >
> >
