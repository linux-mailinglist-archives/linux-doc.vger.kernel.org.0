Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9AA481AEC
	for <lists+linux-doc@lfdr.de>; Thu, 30 Dec 2021 09:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237778AbhL3I4Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Dec 2021 03:56:16 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:15992 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhL3I4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Dec 2021 03:56:16 -0500
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JPhqp1l9vzZdvT;
        Thu, 30 Dec 2021 16:52:54 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 16:56:13 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 16:56:12 +0800
Subject: Re: [PATCH v19 02/13] x86/setup: Use parse_crashkernel_high_low() to
 simplify code
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Borislav Petkov <bp@alien8.de>
CC:     Dave Young <dyoung@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        <kexec@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Chen Zhou" <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>
References: <20211228132612.1860-1-thunder.leizhen@huawei.com>
 <20211228132612.1860-3-thunder.leizhen@huawei.com> <Ycs3kpZD/vpoo1AX@zn.tnic>
 <b017a8ea-989b-c251-f5c8-a8a7940877cf@huawei.com>
 <YcwN9Mfwsh/lPbbd@dhcp-128-65.nay.redhat.com> <YcwyZRDJUMniSaY9@zn.tnic>
 <Ycw8n2BvJzH9wJKG@dhcp-128-65.nay.redhat.com>
 <21736ba2-883d-1037-dbe8-299e40f7ad13@huawei.com> <YcySEdyhXysDSKn/@zn.tnic>
 <933554c7-1fc6-8e7a-9569-9f8441e50ddf@huawei.com>
Message-ID: <1f5b61b0-24b1-0cbe-5c2b-aef5df020c48@huawei.com>
Date:   Thu, 30 Dec 2021 16:56:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <933554c7-1fc6-8e7a-9569-9f8441e50ddf@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/12/30 10:39, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/12/30 0:51, Borislav Petkov wrote:
>> On Wed, Dec 29, 2021 at 11:04:21PM +0800, Leizhen (ThunderTown) wrote:
>>> Chen Zhou and I tried to share the code because of a suggestion. After so many
>>> attempts, it doesn't seem to fit to make generic. Or maybe I haven't figured
>>> out a good solution yet.
>>
>> Well, you learned a very important lesson and the many attempts are not
>> in vain: code sharing does not make sense in every case.
>>
>>> I will put the patches that make arm64 support crashkernel...high,low to
>>> the front, then the parse_crashkernel() unification patches. Even if the
>>> second half of the patches is not ready for v5.18, the first half of the
>>> patches is ready.
>>
>> I think you should concentrate on the arm64 side which is, AFAICT, what
>> you're trying to achieve.
> 
> Right, a patchset should focus on just one thing.
> 
>>
>> The "parse_crashkernel() unification" needs more thought because, as I
>> said already, that doesn't make a whole lot of sense to me.
> 
> Yes, because it's not a functional improvement, it's not a performance optimization,
> it's also not a fix for a known bug, it's just a programmer's artistic pursuit.
> 
>>
>> If you want to enforce the fact that "low" makes sense only when "high"
>> is supplied, parse_crashkernel_high_low() is not the right thing to do.
>> You need to have a *single* function which does all the parsing where
>> you can decide what to do: "if high, parse low", "if no high supplied,
>> ignore low" and so on.

In fact, this is how my current function parse_crashkernel_high_low() is
implemented.

+	/* crashkernel=X,high */
+	ret = parse_crashkernel_high(cmdline, 0, high_size, &base);
+	if (ret)			//crashkernel=X,high is not specified
+		return ret;
+
+	if (*high_size <= 0)		//crashkernel=X,high is specified but the value is invalid
+		return -EINVAL;		//Sorry, the type of high_size is "unsigned long long *", so less than zero is impossible
+
+	/* crashkernel=Y,low */
+	ret = parse_crashkernel_low(cmdline, 0, low_size, &base);	//If crashkernel=Y,low is specified, the parsed value is stored in *low_size
+	if (ret)
+		*low_size = -1;		//crashkernel=Y,low is not specified


> 
> I understand your proposal, but parse_crashkernel_high_low() is a cost-effective
> and profitable change, it makes the current code a little clearer, and avoid passing
> unnecessary parameters "system_ram" and "crash_base" when other architectures use
> parse_crashkernel_{high|low}().
> 
> I actually followed your advice in the beginning to do "parse_crashkernel() and
> parse_crashkernel_{high|low}() unification". But I found it's difficult and the
> end result may not be as good as expected. So I introduced parse_crashkernel_high_low().
> 
> The parameter "system_ram" and "crash_base" of parse_crashkernel() is not need by
> "crashkernel=X,[high,low]". And parameter "low_size" of parse_crashkernel_high_low()
> is not need by "crashkernel=X[@offset]". The "parse_crashkernel() unification"
> complicates things. For example, the parameter "crash_size" means "low or high" memory
> size for "crashkernel=X[@offset]", but only means "high" memory size for "crashkernel=X,high".
> So we'd better give it two names with union.
> 
>>
>> And if those are supported on certain architectures only, you can do
>> ifdeffery...
> 
> I don't think so. These __init functions are small and architecture-independent, and do not
> affect compilation of other architectures. There may be other architectures that use
> it in the future, such as the current arm64.
> 
>>
>> But I think I already stated that I don't like such unifications which
>> introduce unnecessary dependencies between architectures. Therefore, I
>> won't accept them into x86 unless there's a strong compelling reason.
>> Which I don't see ATM.
> 
> OK.
> 
>>
>> Thx.
>>
> 

-- 
Regards,
  Zhen Lei
