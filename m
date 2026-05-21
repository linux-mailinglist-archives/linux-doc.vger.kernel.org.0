Return-Path: <linux-doc+bounces-88744-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGydCo+uDmr6AwYAu9opvQ
	(envelope-from <linux-doc+bounces-88744-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 09:04:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3859FDDE
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 09:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A48C5303D127
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 07:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B0B397341;
	Thu, 21 May 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uksaI4hM"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E75395AF1
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346857; cv=none; b=I1iBo7Ur32+9W7+r4DxP2MU0zX0YdG9xYL7/reQ1UqzzGBkoasoL9TDYIxf56L4iBf2boe9FCxg4pogcjfzWGobk6pQ/ACxx0IIyQ/ZYxQASffrR3FrFX1Upp3Xz+vn5dudRH0im5rAy6+FEA774GjNUVTJZF2NWMCVKxPx3jQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346857; c=relaxed/simple;
	bh=BS0fGzXbKfEg3NPGeP858gXyAzpXGJF5jn+eF6WbGdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk/qcZuD4ICvcOOjJjp5tVfaMamOfQyz2DgQZ5gW28ZLYWYRuxX8Mlr0I47Betz8L4C21JiN/TcjcP/t6+/Mnd/IxCooMEKCmXx+xJVwGm6VAHn6smBbqMDrf61aqo9ZsUfVrHvjNorwdrZSk2MQZbQq67J02EyjOjA83kyMSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uksaI4hM; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <9e300669-8793-41a2-84a1-98fb8195e263@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779346837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4jVmpmnD2ykAokas/X3lk9Wju6nk7/v9FrN61iDdtk=;
	b=uksaI4hMnPFVdDq4c5Bb3ZjpEiYNcHN/F+CjLaJToiS+RJV2UtylKqYjKBZPMcwGZmZGI5
	4ZqE0DUVMaXXSb5rBgEp3kWuETBIVsskg4oWfnCrMmxQunwFe/5RowftvQpZwq9cOYh7Wu
	0sBsmINv8JZnSO8aLY4iYcPlD6TaqDA=
Date: Thu, 21 May 2026 14:59:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v11 4/8] bpf: Introduce the bpf_list_del kfunc.
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, ast@kernel.org, corbet@lwn.net,
 martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 chengkaitao@kylinos.cn, skhan@linuxfoundation.org, memxor@gmail.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
References: <20260521032306.97118-5-kaitao.cheng@linux.dev>
 <d1fb9e986434b92188b3b37514336794c49a807c0378badceda45c3c14bb9739@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <d1fb9e986434b92188b3b37514336794c49a807c0378badceda45c3c14bb9739@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linux.dev,iogearbox.net,gmail.com,fomichev.me,google.com,kylinos.cn,linuxfoundation.org,redhat.com,meta.com];
	TAGGED_FROM(0.00)[bounces-88744-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaitao.cheng@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,bpf-ci];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: B7D3859FDDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/5/21 12:08, bot+bpf-ci@kernel.org 写道:
>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
>> index 59855b434f0b..804c201c28f3 100644
>> --- a/kernel/bpf/helpers.c
>> +++ b/kernel/bpf/helpers.c
> 
> [ ... ]
> 
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index f3cf8d85bea0..35eebb5e7769 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> 
> [ ... ]
> 
>> @@ -11671,7 +11674,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>>
>>  	switch (node_field_type) {
>>  	case BPF_LIST_NODE:
>> -		ret = is_bpf_list_push_kfunc(kfunc_btf_id);
>> +		ret = is_bpf_list_push_kfunc(kfunc_btf_id) ||
>> +		      kfunc_btf_id == special_kfunc_list[KF_bpf_list_del];
> 
> This isn't a bug, but Eduard Zingerman suggested in v10 adding a
> is_bpf_list_del_kfunc() helper for consistency with the existing code style
> (similar to is_bpf_list_push_kfunc()). This would maintain the pattern used
> throughout the codebase for checking kfunc types.
> 
> Reference: https://lore.kernel.org/bpf/ca14a6fd8a1f3ce1e64c70b6d9ea2baf8df913ae.camel@gmail.com/

The reason for using is_bpf_list_push_kfunc() is that it groups multiple parallel
"kfunc_btf_id == special_kfunc_list[*]" checks into one helper, making the code
easier to reuse. If we added is_bpf_list_del_kfunc() here, it would only wrap a
single KF_bpf_list_del check, which is unnecessary. Also, more helpers such as
is_bpf_list_first/last may be added later, and overusing is_bpf_list_* helpers
would make the code more redundant.

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26204125015

-- 
Thanks
Kaitao Cheng


