Return-Path: <linux-doc+bounces-21455-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D793D9D5
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 22:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3332AB20B76
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 20:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7725660B96;
	Fri, 26 Jul 2024 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzKbio5X"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700058222
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722026172; cv=none; b=IsRGXx7FN6Dv+Ke5OxpLmpS+4CfT30UTyzAQ/M/jcgpOrzMbzr1y1o49tcnY/R35IpfAxTPnILDIbo0uc4YWAxN7b0hgrhNvYA354ZdAk3cFoQ1YCIeceEQcFFSf3iODnKSjG46MMMCPEkzcCzUhWforNgp7s8HkZviaJKbFUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722026172; c=relaxed/simple;
	bh=1yGabOCDYzM1SvBWjFVdPbv5wXNwEiSrRlUjdMYFRN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTfA7lLRDV5/vTRgCpODLe/kfdzV0rmicI7RmUqQIsrY+tVJVtgTOmIWlZNRifFMJ/5muOg9PawOIW/aTF4JCtpWzZDMxUMypPJS6zGe5Ax7CCQZ7puaISfz57N+T2WuDgsVRDTCpz8oXFEkqlO9V/QFVI/K1sHL0XY2lY595hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzKbio5X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722026169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wm2UfiHnnlWhAZuLpVrEtIHN1JiWm1rRJEOIDoqpyDI=;
	b=fzKbio5XItwYN4j2r4NetcSi3QXD8ddQt+HghG2rpmWNvrpiG10zdlWk9gGBuZJBqUvIR9
	P7f6hkmVSkA534a64joV79SyDXlV0eayelaLsw2uY0HuaiPAr4UrlAKyeTFVwa/M5KdVZI
	GzPWhkSwOoFTsNL8+tN7qOG7074E6LM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-v_DfzpV-PtmoRShQskjrvQ-1; Fri,
 26 Jul 2024 16:36:08 -0400
X-MC-Unique: v_DfzpV-PtmoRShQskjrvQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B467D1955D52;
	Fri, 26 Jul 2024 20:36:05 +0000 (UTC)
Received: from [10.2.16.80] (unknown [10.2.16.80])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B2EF1955D45;
	Fri, 26 Jul 2024 20:36:02 +0000 (UTC)
Message-ID: <463d8e53-0cac-419e-bd2a-584eb1c0725e@redhat.com>
Date: Fri, 26 Jul 2024 16:36:01 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-cgroup v4] cgroup: Show # of subsystem CSSes in
 cgroup.stat
To: Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240711025153.2356213-1-longman@redhat.com>
 <23hhazcy34yercbmsogrljvxatfmy6b7avtqrurcze3354defk@zpekfjpgyp6h>
 <0efbedff-3456-4e6a-8d2d-79b89a18864d@redhat.com>
 <qozzqah5blnsvc73jrhfuldsaxwsoluuewvgpukzgcuud4nqgc@xnctlkgk5yjv>
 <ZqQBaeAH_IfpRTnv@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZqQBaeAH_IfpRTnv@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 7/26/24 16:04, Tejun Heo wrote:
> Hello,
>
> On Fri, Jul 26, 2024 at 10:19:05AM +0200, Michal Koutný wrote:
>> On Thu, Jul 25, 2024 at 04:05:42PM GMT, Waiman Long <longman@redhat.com> wrote:
>>>> There's also 'debug' subsys. Have you looked at (extending) that wrt
>>>> dying csses troubleshooting?
>>>> It'd be good to document here why you decided against it.
>>> The config that I used for testing doesn't include CONFIG_CGROUP_DEBUG.
>> I mean if you enable CONFIG_CGROUP_DEBUG, there is 'debug' controller
>> that exposes files like debug.csses et al.
>>
>>> That is why "debug" doesn't show up in the sample outputs. The CSS #
>>> for the debug subsystem should show up if it is enabled.
>> So these "debugging" numbers could be implemented via debug subsys. So I
>> wondered why it's not done this way. That reasoning is missing in the
>> commit message.
> While this is a bit of implementation detail, it's also something which can
> be pretty relevant in production, so my preference is to show them in
> cgroup.stat. The recursive stats is something not particularly easy to
> collect from the debug controller proper anyway.
>
> One problem with debug subsys is that it's unclear whether they are safe to
> use and can be depended upon in production. Not that anything it shows
> currently is particularly risky but the contract around the debug controller
> is that it's debug stuff and developers may do silly things with it (e.g.
> doing high complexity iterations and what not).
>
> The debug controller, in general, I'm not sure how useful it is. It does
> nothing that drgn scripts can't do and doesn't really have enough extra
> benefits that make it better. We didn't have drgn back when it was added, so
> it's there for historical reasons, but I don't think it's a good idea to
> expand on it.

I totally agree.

For RHEL, CONFIG_CGROUP_DEBUG isn't enabled in the production kernel, 
but is enabled in the debug kernel. I believe it may be similar in other 
distros. So we can't really reliably depend on using the debug 
controller to get this information which can be useful to monitor cgroup 
behavior in a production kernel.

Cheers,
Longman


