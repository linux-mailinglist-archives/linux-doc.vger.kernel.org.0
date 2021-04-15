Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC229360F26
	for <lists+linux-doc@lfdr.de>; Thu, 15 Apr 2021 17:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhDOPlw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 11:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbhDOPlv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 11:41:51 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C60C061763
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 08:41:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id p6so17048323wrn.9
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
        b=BEj/1/8XPncnjRfRK8mLiZ1SoZ2+BwrE+a39LxPwB/MsIFJnzBAICQLZ2jiwGGbQov
         4zqh7un0jhEP1iNaKM1PurWOo4uOYi/n2gtxwCVm76y8egSWq0m6KnadRWC5DH8hi34C
         K41+UsN0jCiClEebcR9kPZsL0Lx6/VJV5Li9dNkP8mG/+bW6Uxqyyarpphfbe13+sVlb
         FizX/3RV1YXqCKanusixVoY8OxsNOXFXCWpfkOB2NeLmRvAHXodqwMYxxCYasGQZQftV
         OsBicx1g9iYrnNMRoDBiJ4p9GtlEji++P0zPJAhhkeDvxObWb1E6q5IO+XBq+ah9VkM2
         b8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
        b=FvVIjCgA9NEo6lahu/EnOCdSfTGoZL9N+D/MpuoG6R5Mhk7QuNOaULV4RnbtZxg4Pg
         Xhx9cGvhaxloQhGaXfp/1PvLSyPa90riqra3peTTwbCcKF9Gmn7Ed+awtsjradFdaVVN
         bdPClV6CN9wknKxADMZGx4FflrectgN5irzU+8GAmKGHgkgVyJsjLDqmUJNYZ9HF325Q
         NgyGGIFiq/5TvuBsRQygsEeyxOYIt/qzy9vmyak2dFsi6ryfXmX+E3fxiy41zhxfspDr
         ikWv2JyzeQT6/HTKp0U4M184mY7ANwbx1qO4lHzuHZBkx0Iy5s2NkyiN8QxF42GIOrzm
         6ziQ==
X-Gm-Message-State: AOAM531lH/q22UJmuaYAxeltiw0U2W7DZ46J5akKGAVNcMmvN0k0k4+K
        uotgn7vKGEMHoOqqN/5SB3BA8w==
X-Google-Smtp-Source: ABdhPJyLNMOWPYjLpplPAmINNkz2Fou+qVJXho8kWclmtHcejA/NRHvG9yzn7ifRTNHYBMXjICP1Nw==
X-Received: by 2002:a05:6000:ca:: with SMTP id q10mr4272021wrx.104.1618501286182;
        Thu, 15 Apr 2021 08:41:26 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.87.196])
        by smtp.gmail.com with ESMTPSA id l14sm1920076wmq.4.2021.04.15.08.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 08:41:25 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Jianlin Lv <Jianlin.Lv@arm.com>, bpf@vger.kernel.org
Cc:     corbet@lwn.net, ast@kernel.org, andrii@kernel.org, kafai@fb.com,
        songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
        kpsingh@kernel.org, davem@davemloft.net, kuba@kernel.org,
        illusionist.neo@gmail.com, linux@armlinux.org.uk,
        zlim.lnx@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        paulburton@kernel.org, tsbogend@alpha.franken.de,
        naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, iii@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, borntraeger@de.ibm.com, yoshfuji@linux-ipv6.org,
        dsahern@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com, udknight@gmail.com,
        mchehab+huawei@kernel.org, dvyukov@google.com, maheshb@google.com,
        horms@verge.net.au, nicolas.dichtel@6wind.com,
        viro@zeniv.linux.org.uk, masahiroy@kernel.org,
        keescook@chromium.org, tklauser@distanz.ch, grantseltzer@gmail.com,
        irogers@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iecedge@gmail.com
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
From:   Quentin Monnet <quentin@isovalent.com>
Message-ID: <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
Date:   Thu, 15 Apr 2021 16:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 4/15/21 11:32 AM, Jianlin Lv wrote:
>> For debugging JITs, dumping the JITed image to kernel log is discouraged,
>> "bpftool prog dump jited" is much better way to examine JITed dumps.
>> This patch get rid of the code related to bpf_jit_enable=2 mode and
>> update the proc handler of bpf_jit_enable, also added auxiliary
>> information to explain how to use bpf_jit_disasm tool after this change.
>>
>> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>

Hello,

For what it's worth, I have already seen people dump the JIT image in
kernel logs in Qemu VMs running with just a busybox, not for kernel
development, but in a context where buiding/using bpftool was not
possible. Maybe not a common case, but still, removing the debugging
mode will make that impossible. Is there a particular incentive to
remove the feature?

Best regards,
Quentin
