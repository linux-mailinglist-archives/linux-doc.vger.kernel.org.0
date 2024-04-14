Return-Path: <linux-doc+bounces-13659-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEBD89CF39
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 02:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BBD6282460
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 00:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A78D376;
	Tue,  9 Apr 2024 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FeajukWp"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20B18E
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712621572; cv=none; b=ctwHPEN9BpaqESQkpCJMHukJ/S3gyxBgHduv3aUvP/fgUTWDUFuhOMDXB6diQGPGLM2ZX6MZ3p7C2VmnQBHE6faLmlqD7K2jHkfn4T5X6hTCUQy74wtdY4wZY3IUHjNvETNbGlBzBir2arITG2T6Xuxv1xQqbrJNV+U5siPqGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712621572; c=relaxed/simple;
	bh=rA42DVPIz8tTwXvz9KosnbYvthn+MzPB6Blbd4aKlmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVo1l+H0nL2jzTtZtPn6pAR7Nt46Fu/3WM7UiClWS1EHePHM49fyP22ir6j/aYII7GZlI/PkTLCyq8v4bQuShoMITu7Un2sTj0+B24Mu8rAd1IPhv5Kilvl8eWWm9k/mbm5WGJccUSZafhtt65qlMaOEK9wlXnx8Tfsl/ynFRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FeajukWp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712621569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZMDqLk/ajYnQzQR/K3NrKQIpgpLukxRoVqcEZWTdt4=;
	b=FeajukWpXmOYjtqg5X9k62TKCUoE5RLkykb5zwgfObSI91a7P5cuSBR6Y7nQOToCD7yWiy
	Id2TEr3BSe/5q6syrW0wT16E1Da5rkaCYiv1fWpi4EyPj86v8hGeb/nRRjJH5plzLTbAZ1
	K6rogUA1xP8rWUuTamnH0nvln2FFj5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-YqHu-p8-MzCfFmqjip8zgg-1; Mon, 08 Apr 2024 20:12:45 -0400
X-MC-Unique: YqHu-p8-MzCfFmqjip8zgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D880802A6F;
	Tue,  9 Apr 2024 00:12:44 +0000 (UTC)
Received: from [10.22.34.20] (unknown [10.22.34.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77F11C09A05;
	Tue,  9 Apr 2024 00:12:43 +0000 (UTC)
Message-ID: <ec74bc9f-8e63-44b9-b3a6-ca7d6d366c69@redhat.com>
Date: Mon, 8 Apr 2024 20:12:43 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 6/9] selftests: cgroup: Add basic tests for pids
 controller
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>
References: <20240405170548.15234-1-mkoutny@suse.com>
 <20240405170548.15234-7-mkoutny@suse.com>
 <a45c2ece-acb4-4cff-9d53-f5c007c9b905@collabora.com>
 <qweowkm4wlfzovp3qhtkzbybeampodtwmpbp2kbtiqcrhmjtdt@syk4itfkpmfr>
 <41dd9c5a-0e07-4b98-9dfb-fb57eaa74fa2@collabora.com>
 <oosadt3f5i3qsvisrxe6hrs46ryfqbyxyk3a6jimd7cqczjtcw@dvlsm7eh3b6r>
 <4bae7682-801e-498f-88c9-9c9d45364bfc@collabora.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <4bae7682-801e-498f-88c9-9c9d45364bfc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


On 4/8/24 08:04, Muhammad Usama Anjum wrote:
> On 4/8/24 5:01 PM, Michal Koutný wrote:
>> On Mon, Apr 08, 2024 at 04:53:11PM +0500, Muhammad Usama Anjum <usama.anjum@collabora.com> wrote:
>>> ksft_test_result_report(tests[i].fn(root), tests[i].name)
>> $ git grep ksft_test_result_report v6.9-rc3 --
>> (empty result)
>>
>> I can't find that helper. Is that in some devel repositories?
> Sorry, I always do development on next. So it has been added recently. Try
> searching it on next:
>
> git grep ksft_test_result_report next-20240404 --

I don't believe it is a good idea to make this patch having a dependency 
on another set of patches in -next because the test won't run in a 
non-next environment. We can always have additional patches later on to 
modify the tests to use the newly available APIs.

Cheers,
Longman

>
>> Michal


