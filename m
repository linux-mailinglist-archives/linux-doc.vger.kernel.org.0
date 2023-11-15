Return-Path: <linux-doc+bounces-1387-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92A7DBDE0
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 17:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9528BB20D8E
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 16:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95FE19442;
	Mon, 30 Oct 2023 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7D618E3A
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 16:31:33 +0000 (UTC)
X-Greylist: delayed 165 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Oct 2023 09:31:29 PDT
Received: from p3plwbeout22-04.prod.phx3.secureserver.net (p3plsmtp22-04-2.prod.phx3.secureserver.net [68.178.252.60])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78F2FC
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 09:31:29 -0700 (PDT)
Received: from mailex.mailcore.me ([94.136.40.143])
	by :WBEOUT: with ESMTP
	id xV87q1AHYvd3NxV88qxv9l; Mon, 30 Oct 2023 09:28:44 -0700
X-CMAE-Analysis: v=2.4 cv=VI8YI/DX c=1 sm=1 tr=0 ts=653fd9bc
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=AUd_NHdVAAAA:8
 a=FXvPX3liAAAA:8 a=RxiQ5PF5XbUlaTgh13YA:9 a=QEXdDO2ut3YA:10
 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: xV87q1AHYvd3N
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=[192.168.178.90])
	by smtp05.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1qxV8D-0002PF-6R; Mon, 30 Oct 2023 16:28:49 +0000
Message-ID: <332ff885-f621-883a-696a-e8247fb43ecc@squashfs.org.uk>
Date: Mon, 30 Oct 2023 16:28:40 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] docs: filesystems: document the squashfs specific
 mount options
To: Ariel Miculas <amiculas@cisco.com>
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 serge@hallyn.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org
References: <20231029161924.50648-1-amiculas@cisco.com>
 <bd039dc7-cfe5-c210-b65e-0cba3186ee0b@squashfs.org.uk>
 <qgwx4cjswrhzxqijsosix437xyw3ifglv6uz2d3nq7whkjqueo@c5pzoqtoqtgb>
 <46d308b2-5e59-862d-b429-e6ee418bc61e@squashfs.org.uk>
 <oonydtkv6anpjbugjvqkp4byqlf3aiwkwf4g7y5w5tthivxomh@b4w4jyceaepz>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <oonydtkv6anpjbugjvqkp4byqlf3aiwkwf4g7y5w5tthivxomh@b4w4jyceaepz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfLIBLo9MzFVKo/3fDXJ8SEJIZbHn/dw0P3cnXkWxQA/bfG6XpVa8AiM0ymCgm9s5Dz0xvNuvme3KnHbQkYS7F5hk6l1OXnRxIqr1qWCz/Kua/JFhEPzp
 nGoFsRAiZgJhgRw6qyObEGVqmBNo4OIyILMxF3pDFG291fhghyMxKBmg+VWKeIxr+KigMlR5YB3thMbhar53XcVsAhsOd/2rg7CZsz/CQpoPJIkeO2+TJX6t
 t+DLD4+ythBlN00ZqHnpsg==

On 30/10/2023 16:09, Ariel Miculas wrote:
> On 23/10/30 03:40PM, Phillip Lougher wrote:
>> On 30/10/2023 12:57, Ariel Miculas wrote:
>>> On 23/10/29 08:33PM, Phillip Lougher wrote:
>>>> On 29/10/2023 16:19, Ariel Miculas wrote:
>>>>> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
>>>>> can be used to specify the decompression mode: single-threaded,
>>>>> multi-threaded, percpu or the number of threads used for decompression.
>>>>> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set and
>>>>> SQUASHFS_DECOMP_MULTI is set, the "threads" option can also be used to
>>>>> specify the number of threads used for decompression. This mount option
>>>>> is only mentioned in fs/squashfs/Kconfig, which makes it difficult to
>>>>> find.
>>>>>
>>>>> Another mount option available is "errors", which can be configured to
>>>>> panic the kernel when squashfs errors are encountered.
>>>>>
>>>>> Add both these options to the squashfs documentation, making them more
>>>>> noticeable.
>>>>>
>>>>> Signed-off-by: Ariel Miculas <amiculas@cisco.com>
>>>>
>>>> Looks good to me.
>>>>
>>>> Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>
>>>
>>> Unfortunately, it seems this is not quite correct either:
>>> There is the config option SQUASHFS_MOUNT_DECOMP_THREADS:
>>> ```
>>> 	bool "Add the mount parameter 'threads=' for squashfs"
>>> 	depends on SQUASHFS
>>> 	depends on SQUASHFS_DECOMP_MULTI
>>> 	default n
>>> 	help
>>> 	  Use threads= to set the decompression parallel mode and the number of threads.
>>> 	  If SQUASHFS_CHOICE_DECOMP_BY_MOUNT=y
>>> 	      threads=<single|multi|percpu|1|2|3|...>
>>> 	  else
>>> 	      threads=<2|3|...>
>>> 	  The upper limit is num_online_cpus() * 2.
>>> ```
>>> that depends on SQUASHFS_DECOMP_MULTI.
>>> So I think I should take my v1 patch and specify that the "threads="
>>> mount option depends on SQUASHFS_MOUNT_DECOMP_THREADS. There's no need
>>> to specify SQUASHFS_DECOMP_MULTI, because SQUASHFS_MOUNT_DECOMP_THREADS
>>> already depends on it.
>>
>> Sorry, you have to specify SQUASHFS_DECOMP_MULTI to be able to specify
>> SQUASHFS_MOUNT_DECOMP_THREADS if SQUASHFS_DECOMP_BY_MOUNT is unselected.
> Agree.
>>
>> Just try it, do make menuconfig, ensure SQUASHFS_CHOICE_DECOMP_BY_MOUNT
>> is unselected, select Single threaded decompression and you won't be
>> able to specify SQUASHFS_MOUNT_DECOMP_THREADS.
> True.
>>
>> That was the point of my review. What bit don't you understand?
> But SQUASHFS_DECOMP_MULTI is not enough, you need to specify
> SQUASHFS_MOUNT_DECOMP_THREADS in order to use the "threads=" mount
> option.
> So instead of saying
> ```
> If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
> SQUASHFS_DECOMP_MULTI is set:
> ```
> wouldn't it be right to actually say:
> ```
> If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
> SQUASHFS_MOUNT_DECOMP_THREADS is set:
> ```?
> 
> As you've mentioned, you could only set SQUASHFS_MOUNT_DECOMP_THREADS
> when SQUASHFS_DECOMP_MULTI is selected. That happens in two cases:
> * either SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, in which case it also
>    selects SQUASHFS_MOUNT_DECOMP_THREADS
> * either SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set,
>    SQUASHFS_DECOMP_MULTI is set and SQUASHFS_MOUNT_DECOMP_THREADS is also
>    set
> 
> So I wouldn't even mention SQUASHFS_DECOMP_MULTI in the documentation,
> only SQUASHFS_MOUNT_DECOMP_THREADS, because the latter always depends on
> the former. And the "threads=" mount option is only available when
> SQUASHFS_MOUNT_DECOMP_THREADS is set (which is the configuration I've
> missed in v1 and v2).
> 

You seem determined to create an unpleasant argument here by trying to 
argue your first patch was correct, and I, as merely the maintainer, 
can't tell you to change it to how I want it.

If, as you pointed out in your first patch, the purpose is to
document the mount options, then the fact that threads=xxx
option depends on SQUASHFS_DECOMP_MULTI being selected is
important, and should be mentioned.

I have accepted your V2.  If you want to withdraw it now, please
do so.  But I will not accept further patches from you, nor
respond to any more of your emails.

It is never a good look to argue with the maintainer, when I am
trying to help you make your patch better. You attitude means this
has been a waste of my time so far.

Phillip

> Regards,
> Ariel
>>
>> Phillip
>>
>>> What do you think?
>>>
>>> Regards,
>>> Ariel
>>>
>>


