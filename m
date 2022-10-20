Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41AF9605567
	for <lists+linux-doc@lfdr.de>; Thu, 20 Oct 2022 04:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiJTCR1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 22:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiJTCRZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 22:17:25 -0400
Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71F816E287;
        Wed, 19 Oct 2022 19:17:14 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VScsArB_1666232227;
Received: from 30.221.97.125(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VScsArB_1666232227)
          by smtp.aliyun-inc.com;
          Thu, 20 Oct 2022 10:17:09 +0800
Message-ID: <30621b3b-47ba-d612-cfb0-583d779691a3@linux.alibaba.com>
Date:   Thu, 20 Oct 2022 10:17:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH V4 1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
To:     Baoquan He <bhe@redhat.com>
Cc:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
        bagasdotme@gmail.com, k-hagio-ab@nec.com, lijiang@redhat.com,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
        hschauhan@nulltrace.org, yixun.lan@gmail.com
References: <20221019103623.7008-1-xianting.tian@linux.alibaba.com>
 <20221019103623.7008-2-xianting.tian@linux.alibaba.com>
 <Y1CtreAKT/SEh4vN@MiWiFi-R3L-srv>
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <Y1CtreAKT/SEh4vN@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/10/20 上午10:08, Baoquan He 写道:
> On 10/19/22 at 06:36pm, Xianting Tian wrote:
>> Add arch_crash_save_vmcoreinfo(), which exports VM layout(MODULES, VMALLOC,
>> VMEMMAP ranges and KERNEL_LINK_ADDR), va bits and ram base for vmcore.
>>
>> Default pagetable levels and PAGE_OFFSET aren't same for different kernel
>> version as below. For pagetable levels, it sets sv57 by default and falls
>> back to setting sv48 at boot time if sv57 is not supported by the hardware.
>>
>> For ram base, the default value is 0x80200000 for qemu riscv64 env and,
>> for example, is 0x200000 on the XuanTie 910 CPU.
>>
>>   * Linux Kernel 5.18 ~
>>   *      PGTABLE_LEVELS = 5
>>   *      PAGE_OFFSET = 0xff60000000000000
>>   * Linux Kernel 5.17 ~
>>   *      PGTABLE_LEVELS = 4
>>   *      PAGE_OFFSET = 0xffffaf8000000000
>>   * Linux Kernel 4.19 ~
>>   *      PGTABLE_LEVELS = 3
>>   *      PAGE_OFFSET = 0xffffffe000000000
>>
>> Since these configurations change from time to time and version to version,
>> it is preferable to export them via vmcoreinfo than to change the crash's
>> code frequently, it can simplify the development of crash tool.
>>
>> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>> ---
>>   arch/riscv/kernel/Makefile     |  1 +
>>   arch/riscv/kernel/crash_core.c | 23 +++++++++++++++++++++++
>>   2 files changed, 24 insertions(+)
>>   create mode 100644 arch/riscv/kernel/crash_core.c
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index db6e4b1294ba..4cf303a779ab 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -81,6 +81,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
>>   obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>>   obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
>>   obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>> +obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
>>   
>>   obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>>   
>> diff --git a/arch/riscv/kernel/crash_core.c b/arch/riscv/kernel/crash_core.c
>> new file mode 100644
>> index 000000000000..3e889d0ed7bd
>> --- /dev/null
>> +++ b/arch/riscv/kernel/crash_core.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <linux/crash_core.h>
>> +#include <linux/pagemap.h>
>> +
>> +void arch_crash_save_vmcoreinfo(void)
>> +{
>> +	VMCOREINFO_NUMBER(VA_BITS);
>> +	VMCOREINFO_NUMBER(phys_ram_base);
>> +
>> +	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
>> +	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>> +	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
>> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
>> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
>> +#ifdef CONFIG_64BIT
>> +	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
>> +	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
>> +#endif
>> +
>> +	if (IS_ENABLED(CONFIG_64BIT))
>> +		vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
> Wondering why you don't put KERNEL_LINK_ADDR exporting into the above
> ifdeffery scope, with that you can save one line of "IS_ENABLED(CONFIG_64BIT)".
I followed the rule in print_vm_layout() of arch/riscv/mm/init.c, which 
used IS_ENABLED when print the value of KERNEL_LINK_ADDR.
