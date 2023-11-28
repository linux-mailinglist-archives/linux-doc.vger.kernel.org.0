Return-Path: <linux-doc+bounces-3394-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4F7FC2F9
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 19:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72501F20F62
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 18:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FB639AD9;
	Tue, 28 Nov 2023 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTJBzSiB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3628D1727
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701195558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEKWLaDVIFRpkj9puYB4V6jOflCn8/al2pYPArL2FG8=;
	b=KTJBzSiBtEEKwIR5QMs3kOf19pdSsihoEbWaHP3uY0CkjmuaFpvhHZGJ4K1g1cCCq46DxG
	R7qBl6Zaax2yqDUd+ATERpEZPbD1uxI/tAFol5ydCIRK/a8Y02AeG0BXIRxTXAM1ii9Vol
	zbDkiYZRNWOflwmi96ULd/BdjEowDwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-Hmkm9F9RPhqpbpAeIIjApQ-1; Tue, 28 Nov 2023 13:19:12 -0500
X-MC-Unique: Hmkm9F9RPhqpbpAeIIjApQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6834E185A785;
	Tue, 28 Nov 2023 18:19:12 +0000 (UTC)
Received: from [10.22.17.248] (unknown [10.22.17.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDF5520268D8;
	Tue, 28 Nov 2023 18:19:11 +0000 (UTC)
Message-ID: <521b7c3d-6c30-4176-bd72-d5826eff70cb@redhat.com>
Date: Tue, 28 Nov 2023 13:19:11 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset: Expose cpuset.cpus.isolated
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20231127195105.290402-1-longman@redhat.com>
 <ZWYZfqAtObghsqxS@slm.duckdns.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZWYZfqAtObghsqxS@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4


On 11/28/23 11:46, Tejun Heo wrote:
> Hello,
>
> On Mon, Nov 27, 2023 at 02:51:05PM -0500, Waiman Long wrote:
>> The root-only cpuset.cpus.isolated control file shows the current set
>> of isolated CPUs in isolated partitions. This control file is currently
>> exposed only with the cgroup_debug boot command line option which also
>> adds the ".__DEBUG__." prefix. This is actually a useful control file if
>> users want to find out which CPUs are currently in an isolated state by
>> the cpuset controller. Remove CFTYPE_DEBUG flag for this control file and
>> make it available by default without any prefix.
>>
>> The test_cpuset_prs.sh test script and the cgroup-v2.rst documentation
>> file are also updated accordingly. Minor code change is also made in
>> test_cpuset_prs.sh to avoid false test failure when running on debug
>> kernel.
> Applied to cgroup/for-6.8 but I wonder whether this would be useful in
> non-root cgroups too. e.g. In a delegated partition which is namespaced,
> wouldn't this be useful too?
>
> Thanks.

For simplicity,we only maintain one cpumask of isolated CPUs that 
includes all the exclusive CPUs in isolated partitions. We haven't 
maintain separate masks for delegation purposes. We can certainly extend 
that if the needs arise. At this point, the set of isolated CPUs is 
mainly used for determining what kernel background services can be 
disabled to reduce interference from the whole kernel point of view.

Cheers,
Longman


