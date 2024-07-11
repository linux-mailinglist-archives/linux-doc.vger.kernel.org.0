Return-Path: <linux-doc+bounces-20532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90492EF62
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B35283A40
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 19:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5125716EBF0;
	Thu, 11 Jul 2024 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OPZeoeMp"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF616EB5E
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725205; cv=none; b=SxFsedHgaHTRqdhbzWrFaU0RN7sUyXDurAbpij5av1kUuoLbHDl5/J89wr66l8rLjYrmW7nKEdnzVYOc4ADU1jBKAhGINBCgvaOR1hwX+INFWPqqdyVVFi89tgGrgFNdYxJnSmDMCsrDLyD1iEgGVmMyV6QzxKe6PPAwUYlny58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725205; c=relaxed/simple;
	bh=IPwjW9zXDZj0GjSWo+ya1iX9LOavMvZQSGNliR7UjEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4EDNF2FY0wQJz3Jg7woo1Sj8xGQ+XDHmHjYCf9HPNHAH2JjJHXx/BNKt8/6U3AxD8/d/RwVaAR/HJEPUGEy8ZnhVkuqPD9nkjaryeAORzbMDaDoG2peWlGyFS9Pyjqx72mF/sz66VEEli/7Bhr9pVzzSmia5N8X3BSw0BhjD3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OPZeoeMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720725202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1JVyAyiTtlCI1FBawwo7Uxh6OheB0hyVqTCLlGomRo=;
	b=OPZeoeMp2/xCQMuBR7Y0oGmCZlYJji1N0csZNm44+EkeIHIL1dmrVcYlN0dB9ldV0RAY2r
	ojWG5cBdjD4pgQtzFU6vH7T4xVmVbJfv5d+E1fksQjbLh+0kzXLhJyoA8Cj4WYXoEqnsOz
	XF+DTAg25DhpRa9QgonEX9YVFdPjVco=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-5kLsRJz8M3iw1AZ5-zhIVg-1; Thu,
 11 Jul 2024 15:13:17 -0400
X-MC-Unique: 5kLsRJz8M3iw1AZ5-zhIVg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 306051955F66;
	Thu, 11 Jul 2024 19:13:15 +0000 (UTC)
Received: from [10.22.64.119] (unknown [10.22.64.119])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38CF61955F40;
	Thu, 11 Jul 2024 19:13:13 +0000 (UTC)
Message-ID: <c54651db-1a06-49f6-aea7-02768ad70756@redhat.com>
Date: Thu, 11 Jul 2024 15:13:12 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240710182353.2312025-1-longman@redhat.com>
 <20240711134927.GB456706@cmpxchg.org>
 <4e1078d6-6970-4eea-8f73-56a3815794b5@redhat.com>
 <ZpAT_xu0oXjQsKM7@slm.duckdns.org>
 <76e70789-986a-44c2-bfdc-d636f425e5ae@redhat.com>
 <ZpAoD7_o8bf6yVGr@slm.duckdns.org>
 <e5348a85-22eb-48a6-876d-3180de5c7171@redhat.com>
 <ZpArhD49OonR6Oz6@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZpArhD49OonR6Oz6@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


On 7/11/24 14:59, Tejun Heo wrote:
> On Thu, Jul 11, 2024 at 02:51:38PM -0400, Waiman Long wrote:
>> On 7/11/24 14:44, Tejun Heo wrote:
>>> Hello,
>>>
>>> On Thu, Jul 11, 2024 at 01:39:38PM -0400, Waiman Long wrote:
>>>> On 7/11/24 13:18, Tejun Heo wrote:
>>> ...
>>>> Currently, I use the for_each_css() macro for iteration. If you mean
>>>> displaying all the possible cgroup subsystems even if they are not enabled
>>>> for the current cgroup, I will have to manually do the iteration.
>>> Just wrapping it with for_each_subsys() should do, no? for_each_css() won't
>>> iterate anything if css doesn't exist for the cgroup.
>> OK, I wasn't sure if you were asking to list all the possible cgroup v2
>> cgroup subsystems even if they weren't enabled in the current cgroup.
>> Apparently, that is the case. I prefer it that way too.
> Yeah, I think listing all is better. If the list corresponded directly to
> cgroup.controllers, it may make sense to only show enabled ones but we can
> have dying ones and implicitly enabled memory and so on, so I think it'd be
> cleaner to just list them all.

That will means cgroup subsystems that are seldomly used like rdma, misc 
or even hugetlb will always be shown in all the cgroup.stat output. I 
actually prefer just showing those that are enabled. As for dying memory 
cgroups, they will only be shown in its online ancestors. We currently 
don't know how many level down are each of the dying ones.

Cheers,
Longman


