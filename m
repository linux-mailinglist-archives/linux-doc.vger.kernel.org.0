Return-Path: <linux-doc+bounces-93425-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tn8nG3dEPGqllwgAu9opvQ
	(envelope-from <linux-doc+bounces-93425-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 22:56:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6596C14BC
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 22:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=LthXA+29;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93425-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93425-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6325304743B
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 20:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886B53D75A6;
	Wed, 24 Jun 2026 20:56:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB253D810D
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 20:56:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334571; cv=none; b=dKR7E4CRbyigrCOwr1C71ij4n8Gn/RL1IZErcAjJuUG/lLWDNfxaYgSOSySeRgh8yknWO9NFSR6CjHW8CpqMFJ/+3erM10L8PmNNlYB0ZcuqOU7einM4uLiwdatmjfQjLOM8SkjCo4K97fy9+XnpvunxEYdIeQIx4fycIdc98MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334571; c=relaxed/simple;
	bh=04VIXOksKkDx6Sq3RxhffV+Olp6ZzGcGctFUuOt9TiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsujK10iUW9MpjLMr9C05RmwaBeGzyc5lNv7WbU5lX2iqX5a83PubTcXvptl8zsLcslIiBOCks7gzkQ29YAaosFJPpvFU7GmAxoB1IIZIZNPfPWCpC2adLmDUH+V15qff04vd/lxZaf0Eu0yKt69ru6feVT148cmWla9KcWBy0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LthXA+29; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782334569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMU3iG232OKcRHz+ruKPI8K5NJ5RGAsFaG+2rycxIsU=;
	b=LthXA+29BfWE0rKTPyT1qnfcz0GySitBfk5g7fZPLEdA8zxksdKbHimoRaBahomNkSEH6o
	XXUJgIPYowvbPOoUTvLyBsiGJ1G2wD1MQKPaxGTFNz7j2TWtATEKJDlisnz1dr90SmAYTX
	GTXe7nSK03MoG52JY/rv8wTp4vYtNLE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-A1jy18ZdOKSaZvGGK2Ei1Q-1; Wed,
 24 Jun 2026 16:56:04 -0400
X-MC-Unique: A1jy18ZdOKSaZvGGK2Ei1Q-1
X-Mimecast-MFC-AGG-ID: A1jy18ZdOKSaZvGGK2Ei1Q_1782334562
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D349C19560BE;
	Wed, 24 Jun 2026 20:56:01 +0000 (UTC)
Received: from [10.2.16.72] (unknown [10.2.16.72])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 149F11956094;
	Wed, 24 Jun 2026 20:55:58 +0000 (UTC)
Message-ID: <2bf8bb78-3da3-4d2d-9b1a-451214c1a50f@redhat.com>
Date: Wed, 24 Jun 2026 16:55:57 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cgroup/cpuset: Miscellaneous fixes and cleanups
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ridong Chen <ridong.chen@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260623230413.1984188-1-longman@redhat.com>
 <038bfbbc34714676b7a672b7f748aee4@kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <038bfbbc34714676b7a672b7f748aee4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93425-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:ridong.chen@linux.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[longman@redhat.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[longman@redhat.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD6596C14BC


On 6/24/26 3:47 PM, Tejun Heo wrote:
>> Waiman Long (2):
>>    cgroup/cpuset: Avoid unnecessary cpus & mems update in
>>      cpuset_hotplug_update_tasks()
>>    cgroup/cpuset: Rebind/migrate mm only for threadgroup leader in
>>      cpuset_update_tasks_nodemask()
> Applied 1-2 to cgroup/for-7.3. I folded in a few minor fixups: a
> changelog typo, the compute_effective_nodemask() kerneldoc parameter
> name (new_cpus to new_mems), and the comment and doc grammar nits Manuel
> noted. Also added Ridong's Reviewed-by to patch 1.

Thanks for the fixups.

Cheers,
Longman


