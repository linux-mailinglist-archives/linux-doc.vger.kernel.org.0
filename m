Return-Path: <linux-doc+bounces-87055-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANdQBSPuAmryygEAu9opvQ
	(envelope-from <linux-doc+bounces-87055-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 11:08:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFA51D4B7
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 11:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ECDB303ABD2
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBED3A6EEE;
	Tue, 12 May 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jzUXdEt6"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E99B346AC1
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576241; cv=none; b=qDmF1vdKwzrKzkrIECWxv2G/AOiSp/LhE6mOfmUPw+0G/UbLfql6dFC+mzWAw3tUmkrBnwrcyvcSdubPGDOqqg06Y04ekyYEVh9qSwFrdTZ1R8n54V9cA5igy8TH0CmFW8F9ot/9WPDOj/hV3femj/SuQmkSt1ejm+Yj5KLIw28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576241; c=relaxed/simple;
	bh=Rlk7APYLUhRDFXVDwVWk3a09kszEYGfYDGOrXzHLDbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Whs7/Gviygqs+t7wmebBTkgwVjaFjCXYPxlVfNu0HbARjfFrVrzrs6x0SSZeGyC32IOg1SehcZJCuypTN9j3hGREWGeLqEXwGaBOLvZ3Vf/PkF2mKdDajwWCTtkpNpME03RqxhZOmRm+u/EFLgmonhsGHGUl8PHXX3GXqXpwbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jzUXdEt6; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4e1d29b5-38d5-4419-9f2b-1b421486ab46@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778576218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5i+1kkpA2Ee08JGHavIhKppUEEy/+Cg51zFy81CfIe4=;
	b=jzUXdEt6zqwwYcBlI0smv5otUDttm+oRSftGru12EDpf9GHYcMnaCjaWY7NoJvJFVaCbQR
	8JciHSfsAVzhs7nt7D0uKPRmYLJlMPaM5q/JJi7zyXuSdxLqrn44JwkgroMSjrTN39S40P
	Lw0RKjANJxPjuWB8OBXjP/YbBoN97UI=
Date: Tue, 12 May 2026 16:55:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND bpf-next v10 1/8] bpf: refactor __bpf_list_del to
 take list node pointer
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
References: <20260512055919.95716-2-kaitao.cheng@linux.dev>
 <6eb07d559a41965a3a9b186b4c28c0942cf1bfb982d539b92c76c27b08db0b04@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <6eb07d559a41965a3a9b186b4c28c0942cf1bfb982d539b92c76c27b08db0b04@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 00EFA51D4B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linux.dev,iogearbox.net,gmail.com,fomichev.me,google.com,kylinos.cn,linuxfoundation.org,redhat.com,meta.com];
	TAGGED_FROM(0.00)[bounces-87055-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

I have clarified this issue in the [PATCH bpf-next v10 1/8] patch,
with the link provided below:

https://lore.kernel.org/bpf/e908cd1a-a0ee-49b1-8528-c455bbd4c432@linux.dev/

在 2026/5/12 14:41, bot+bpf-ci@kernel.org 写道:
>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
>> index baa12b24bb64..9cd7b028592c 100644
>> --- a/kernel/bpf/helpers.c
>> +++ b/kernel/bpf/helpers.c
>> @@ -2550,22 +2550,24 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
>>  	return bpf_list_push_back(head, node, meta__ign, off);
>>  }
>>
>> -static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
>> +static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
>> +					    struct list_head *n)
>>  {
>> -	struct list_head *n, *h = (void *)head;
>> +	struct list_head *h = (void *)head;
>>  	struct bpf_list_node_kern *node;
>>
>>  	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
>>  	 * called on its fields, so init here
>>  	 */
>> -	if (unlikely(!h->next))
>> +	if (unlikely(!h->next)) {
>>  		INIT_LIST_HEAD(h);
>> +		return NULL;
>> +	}
>>  	if (list_empty(h))
>>  		return NULL;
>>
>> -	n = tail ? h->prev : h->next;
>>  	node = container_of(n, struct bpf_list_node_kern, list_head);
>> -	if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
>> +	if (unlikely(READ_ONCE(node->owner) != head))
>>  		return NULL;
>>
>>  	list_del_init(n);
>> @@ -2575,12 +2577,16 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
>>
>>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
>>  {
>> -	return __bpf_list_del(head, false);
>> +	struct list_head *h = (void *)head;
>> +
>> +	return __bpf_list_del(head, h->next);
>>  }
> 
> The new code reads h->next before __bpf_list_del checks if the list is
> initialized. If the list is uninitialized (h->next is NULL), a NULL pointer
> is passed to __bpf_list_del.
> 
> While __bpf_list_del eventually initializes the list and returns NULL without
> dereferencing the NULL pointer, this is counterintuitive - passing a
> potentially garbage value that is later ignored.
> 
> Can you move the initialization check into the top-level kfuncs
> (bpf_list_pop_front and bpf_list_pop_back) to ensure the list_head passed to
> __bpf_list_del is always valid? You could initialize the list and return NULL
> in that case - we know it's empty.
> 
> This concern was raised by Emil Tsalapatis in v8:
> https://lore.kernel.org/bpf/DH6W7K2SLPYB.PCO7FQ6CR1YZ@etsalapatis.com/
> 
>>
>>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
>>  {
>> -	return __bpf_list_del(head, true);
>> +	struct list_head *h = (void *)head;
>> +
>> +	return __bpf_list_del(head, h->prev);
>>  }
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25716874656

-- 
Thanks
Kaitao Cheng


