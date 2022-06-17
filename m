Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA8D54F53F
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 12:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbiFQKVK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jun 2022 06:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiFQKVJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 06:21:09 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2FDF46A016
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 03:21:08 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9+MVaxiQVFIAA--.12730S3;
        Fri, 17 Jun 2022 18:21:01 +0800 (CST)
Message-ID: <8d3655da-dd5e-a76d-d183-605d0b9725c9@loongson.cn>
Date:   Fri, 17 Jun 2022 18:21:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] docs/LoongArch: Rewrite all the notes
To:     WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org,
        alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     corbet@lwn.net, jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, loongarch@lists.linux.dev
References: <cover.1655456950.git.siyanteng@loongson.cn>
 <ad1d2316a4240ae05697759990b7e0c6f94faa83.1655456950.git.siyanteng@loongson.cn>
 <6c0035de-4f45-48c0-1976-e521c81e29a2@xen0n.name>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <6c0035de-4f45-48c0-1976-e521c81e29a2@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9+MVaxiQVFIAA--.12730S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4fJw1xWr43tF15JryfCrg_yoW7WrW8pF
        ykJ3ySgr98JryxJw47Jr1UZFyrAFn7Ja1DWr1FgF18Jw43Zw1Fqr1avrsYgFyUGrW8AayI
        qr18tw4UZFyUA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
        Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
        j40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b52NNUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/17 17:39, WANG Xuerui 写道:
> On 2022/6/17 17:33, Yanteng Si wrote:
>> Since 0ea8ce61cb2c ("Documentation: LoongArch: Add
>> basic documentations"), Note is an admonition, But
>> it doesn't show correctly, let's fix it.
>
> The commit subject is a bit ambiguous: it sounds like some kind of -- 
> hmm, rewrite -- of the original sentences, while it's actually only a 
> migration to the reST note directive.
>
> I'd suggest re-phrasing the commit message to highlight the 
> "migration" nature instead.

OK! how about:

Fix notes rendering by using reST directives?


Thanks,

Yanteng

>
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   Documentation/loongarch/introduction.rst   | 15 +++++++++------
>>   Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
>>   2 files changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/loongarch/introduction.rst 
>> b/Documentation/loongarch/introduction.rst
>> index 2bf40ad370df..46e3f8d54067 100644
>> --- a/Documentation/loongarch/introduction.rst
>> +++ b/Documentation/loongarch/introduction.rst
>> @@ -45,10 +45,12 @@ Name              Alias Usage               
>> Preserved
>>   ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
>>   ================= =============== =================== ============
>>   -Note: The register ``$r21`` is reserved in the ELF psABI, but used 
>> by the Linux
>> -kernel for storing the percpu base address. It normally has no ABI 
>> name, but is
>> -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in 
>> some old code,
>> -however they are deprecated aliases of ``$a0`` and ``$a1`` 
>> respectively.
>> +.. Note::
>> +    The register ``$r21`` is reserved in the ELF psABI, but used by 
>> the Linux
>> +    kernel for storing the percpu base address. It normally has no 
>> ABI name,
>> +    but is called ``$u0`` in the kernel. You may also see ``$v0`` or 
>> ``$v1``
>> +    in some old code,however they are deprecated aliases of ``$a0`` 
>> and ``$a1``
> Nit: space after "code,".
>> +    respectively.
>>     FPRs
>>   ----
>> @@ -69,8 +71,9 @@ Name              Alias Usage               Preserved
>>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
>>   ================= ================== =================== ============
>>   -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however 
>> they are deprecated
>> -aliases of ``$fa0`` and ``$fa1`` respectively.
>> +.. Note::
>> +    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
>> +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
>>     VRs
>>   ----
>> diff --git a/Documentation/loongarch/irq-chip-model.rst 
>> b/Documentation/loongarch/irq-chip-model.rst
>> index 8d88f7ab2e5e..7988f4192363 100644
>> --- a/Documentation/loongarch/irq-chip-model.rst
>> +++ b/Documentation/loongarch/irq-chip-model.rst
>> @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
>> https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf 
>> (in English)
>>   -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller 
>> described
>> -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is 
>> "Legacy I/O
>> -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor 
>> Reference
>> -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 
>> 11.2 of
>> -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is 
>> "HyperTransport
>> -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor 
>> Reference
>> -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in 
>> Section 5 of
>> -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" 
>> described in
>> -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
>> +.. Note::
>> +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller 
>> described
>> +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
>> +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - HTVECINTC is "HyperTransport Interrupts" described in Section 
>> 14.3 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 
>> 5 of
>> +      "Loongson 7A1000 Bridge User Manual";
>> +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
>> +      "Loongson 7A1000 Bridge User Manual".
>
> This seems like tabular content disguised as a list, but I don't have 
> strong preferences here. You may try using a table for this 
> relationship between kernel-speak and manual-speak.
>
> With the nits addressed:
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>

