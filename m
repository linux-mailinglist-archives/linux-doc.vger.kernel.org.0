Return-Path: <linux-doc+bounces-20504-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BDC92EA38
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 16:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764631C2356C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961271607A1;
	Thu, 11 Jul 2024 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bog8i5EU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE014BFA2
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706736; cv=none; b=GMTXuKGs+MyZs6ce6wNUiKKraBUuDK8mTp8roMAzi4bd8UnDh105ut10rlmRj7AI7jFSxKaaRqtmB6IDMtCl1bC5iDuW5EYY4v6yq3cYaWLjbjmo1vxFlWqQIeMd2jt1aU6OAaq5JY5KLoZsAzRCYnpOleAqqOo3HtXDlSlZhqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706736; c=relaxed/simple;
	bh=pdHjEk6NphKQXZKTA3loBzqdaHaXPicwt/zMw9bIAqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfRse+MpWSqjc1DI+A01GdUsZLjBOLyOj9MHyqHbplaQVeKKxXRfVYvqN9KQ1K1NmIfbRNUQPAesbN4JlDAGyOdXpy+TSmrvHnZfq4ig1gQXmyTq2j7QMI2h/z2G4HUljIoY+TjXn6sO8LFzcB7FhPSJL39Yb2e5o21MpzrfhOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bog8i5EU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720706734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcMpjV3SQMYu3fy21zizS1kikHKNzT57qmIavtokeXA=;
	b=bog8i5EU/ZEsCH2ZHM2tSJ4iCkm41l3V6/tV+v/q0H5MjaksuoXpu7uDb/4g450YHEeITj
	RVLU4kTz0mOZcvnEZqrSb9eWtQGVnOGXq7J5MZvoba6ApjrcnYLv7O+yNIsImE2Qi9MYA+
	Ha2aZP/WU8JXw9akH0hekRhn+92QY34=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-jfMGemq2PuWwBh9fGvdgfw-1; Thu,
 11 Jul 2024 10:05:27 -0400
X-MC-Unique: jfMGemq2PuWwBh9fGvdgfw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 852F21954238;
	Thu, 11 Jul 2024 14:05:25 +0000 (UTC)
Received: from [10.22.64.119] (unknown [10.22.64.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA4F11954217;
	Thu, 11 Jul 2024 14:05:23 +0000 (UTC)
Message-ID: <4e1078d6-6970-4eea-8f73-56a3815794b5@redhat.com>
Date: Thu, 11 Jul 2024 10:05:22 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240710182353.2312025-1-longman@redhat.com>
 <20240711134927.GB456706@cmpxchg.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240711134927.GB456706@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15


On 7/11/24 09:49, Johannes Weiner wrote:
> On Wed, Jul 10, 2024 at 02:23:52PM -0400, Waiman Long wrote:
>> @@ -3669,12 +3669,34 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
>>   static int cgroup_stat_show(struct seq_file *seq, void *v)
>>   {
>>   	struct cgroup *cgroup = seq_css(seq)->cgroup;
>> +	struct cgroup_subsys_state *css;
>> +	int ssid;
>>   
>> +	/* cgroup_mutex required for for_each_css() */
>> +	cgroup_lock();
>>   	seq_printf(seq, "nr_descendants %d\n",
>>   		   cgroup->nr_descendants);
>>   	seq_printf(seq, "nr_dying_descendants %d\n",
>>   		   cgroup->nr_dying_descendants);
>>   
>> +	/*
>> +	 * Show the number of live and dying csses associated with each of
>> +	 * non-inhibited cgroup subsystems bound to cgroup v2 if non-zero.
>> +	 */
>> +	for_each_css(css, ssid, cgroup) {
>> +		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
>> +		    (cgroup_subsys[ssid]->root !=  &cgrp_dfl_root))
>> +			continue;
>> +
>> +		seq_printf(seq, "nr_%s %d\n", cgroup_subsys[ssid]->name,
>> +			   css->nr_descendants + 1);
>> +		/* Current css is online */
>> +		if (css->nr_dying_descendants)
>> +			seq_printf(seq, "nr_dying_%s %d\n",
>> +				   cgroup_subsys[ssid]->name,
>> +				   css->nr_dying_descendants);
>> +	}
> I think it'd be better to print the dying count unconditionally. It
> makes the output more predictable for parsers, and also it's clearer
> to users which data points are being tracked and reported.
>
> With that, and TJ's "subsys" suggestion for the name, it looks good to
> me. Thanks!

Given the fact that for_each_css() iteration is filtering out csses that 
are absent, the dying counts follow the same logic of skipping it if 
there is no dying css. That also makes it easier to identify cgroups 
with dying descendant csses as we don't need filter out entries with a 0 
dying count. It also makes the output less verbose and let user focus 
more on what are significant.

I do understand that it makes it inconsistent with the ways 
nr_descendants and nr_dying_descendants are being handled as entries 
with 0 count are also displayed. I can update the patch to display those 
entries with 0 dying subsys count if other people also think that is the 
better way forward.

Cheers,
Longman

>


