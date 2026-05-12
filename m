Return-Path: <linux-doc+bounces-87012-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI4NOsvNAmo+wwEAu9opvQ
	(envelope-from <linux-doc+bounces-87012-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:50:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A1851B47D
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E08E3125DD6
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 06:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B904368D59;
	Tue, 12 May 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlPKvL+n"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE2368D50;
	Tue, 12 May 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568070; cv=none; b=eY3DEcqfkl8uR/2nzNadJPM/8EwF7tAHn8YuQ6F0CDBogtiNh0uASQHxlZiNfkyNj1GaRFc2USP8DBLQUCvsHp96GExaEZsGctVYsttwG6FNh/DtRYR/KMN9TAcd4AiypcoShjUkKqqK6LQcRUAPO3p8+693Gbw5OhEYvb0iALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568070; c=relaxed/simple;
	bh=oxWVuXf2Q+qIDVnzvO9dtDJiy4wLIt3Faa3dDgXp9Lc=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=PerYpNYf8AC3HtBXA39yeNWw3UrK1CauAqzvEeKx+UirCdX/nBQfs2kYu7tf8lLQ23I5IiA66D7fuHHG2jDIiJU9loiUmxJOCwlwqlbsFbBp+zGmFGbdEDEMfUkNMCeAyE8vpzNn4Np4anpHeXcuSabCSe49ScxKx4xhzeyTsDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlPKvL+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B22C2BCB8;
	Tue, 12 May 2026 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568068;
	bh=oxWVuXf2Q+qIDVnzvO9dtDJiy4wLIt3Faa3dDgXp9Lc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=HlPKvL+ni2sd4CBxgthfeQwrGo0IsRduiHzJ1nVZpmvwGVjn+c8qOFW2AbmWMplSQ
	 ylDpgbcrBph9eQSIfNdxdXw82j4g1M39Xjmkb8r4w5kNyfPq4aBcwSMFhUWi0pbjqP
	 GbFp2YHg+BurLz0hO/3LCx1zIF3z5nCPWQjScOzrku5mJdfKIgYjAxekiJG7dp7B6g
	 vmmre1UfugJZO3Hfm/yxOlDNIRqfaHlwqy/19iCQRyuMY8HoHwHZpDWEbfT/4qMX3m
	 3r/0OWhbkUUISS1PCBw+Biw4YjxX8zSlGnRENfOuyUacdiEwyLlkugw8RAMONuJyzX
	 ot54VnjstABEQ==
Content-Type: multipart/mixed; boundary="===============4948874120813433763=="
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6eb07d559a41965a3a9b186b4c28c0942cf1bfb982d539b92c76c27b08db0b04@mail.kernel.org>
In-Reply-To: <20260512055919.95716-2-kaitao.cheng@linux.dev>
References: <20260512055919.95716-2-kaitao.cheng@linux.dev>
Subject: Re: [PATCH RESEND bpf-next v10 1/8] bpf: refactor __bpf_list_del to take list node pointer
From: bot+bpf-ci@kernel.org
To: kaitao.cheng@linux.dev,ast@kernel.org,corbet@lwn.net,martin.lau@linux.dev,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,shuah@kernel.org,chengkaitao@kylinos.cn,skhan@linuxfoundation.org,memxor@gmail.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-doc@vger.kernel.org,vmalik@redhat.com,linux-kselftest@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 12 May 2026 06:41:06 +0000 (UTC)
X-Rspamd-Queue-Id: 44A1851B47D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87012-lists,linux-doc=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,lwn.net,iogearbox.net,gmail.com,fomichev.me,google.com,kylinos.cn,linuxfoundation.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.kernel.org:mid]
X-Rspamd-Action: no action

--===============4948874120813433763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index baa12b24bb64..9cd7b028592c 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2550,22 +2550,24 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
>  	return bpf_list_push_back(head, node, meta__ign, off);
>  }
>
> -static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
> +static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
> +					    struct list_head *n)
>  {
> -	struct list_head *n, *h = (void *)head;
> +	struct list_head *h = (void *)head;
>  	struct bpf_list_node_kern *node;
>
>  	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
>  	 * called on its fields, so init here
>  	 */
> -	if (unlikely(!h->next))
> +	if (unlikely(!h->next)) {
>  		INIT_LIST_HEAD(h);
> +		return NULL;
> +	}
>  	if (list_empty(h))
>  		return NULL;
>
> -	n = tail ? h->prev : h->next;
>  	node = container_of(n, struct bpf_list_node_kern, list_head);
> -	if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
> +	if (unlikely(READ_ONCE(node->owner) != head))
>  		return NULL;
>
>  	list_del_init(n);
> @@ -2575,12 +2577,16 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
>
>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
>  {
> -	return __bpf_list_del(head, false);
> +	struct list_head *h = (void *)head;
> +
> +	return __bpf_list_del(head, h->next);
>  }

The new code reads h->next before __bpf_list_del checks if the list is
initialized. If the list is uninitialized (h->next is NULL), a NULL pointer
is passed to __bpf_list_del.

While __bpf_list_del eventually initializes the list and returns NULL without
dereferencing the NULL pointer, this is counterintuitive - passing a
potentially garbage value that is later ignored.

Can you move the initialization check into the top-level kfuncs
(bpf_list_pop_front and bpf_list_pop_back) to ensure the list_head passed to
__bpf_list_del is always valid? You could initialize the list and return NULL
in that case - we know it's empty.

This concern was raised by Emil Tsalapatis in v8:
https://lore.kernel.org/bpf/DH6W7K2SLPYB.PCO7FQ6CR1YZ@etsalapatis.com/

>
>  __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
>  {
> -	return __bpf_list_del(head, true);
> +	struct list_head *h = (void *)head;
> +
> +	return __bpf_list_del(head, h->prev);
>  }


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25716874656
--===============4948874120813433763==--

