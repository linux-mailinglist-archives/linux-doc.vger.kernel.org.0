Return-Path: <linux-doc+bounces-87016-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CEaMPzNAmo+wwEAu9opvQ
	(envelope-from <linux-doc+bounces-87016-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:51:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599B51B4C9
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B73A3133D3F
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 06:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75158368D67;
	Tue, 12 May 2026 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q89Bm9Vx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AA36F8FC;
	Tue, 12 May 2026 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568085; cv=none; b=e8Fu735zKobc9VYGpTCtmHfxxbccHpS88XGQzGVhbm9gTAgRk1USGeAY0wf2LK69jZ/49s+Amj2XhPopgCKK8B87o8dRjOgZv8rRegyIRMymYD1/i2HbMLHxXiLNX1pfOZr7QHci7gKKkFzSz+J03HEGEO/r/SkVKmEoJsjYx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568085; c=relaxed/simple;
	bh=OmqLAzovAsaSAx2HdYYu7HBEbGsJQMUnMcjJAZxyhFQ=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=JfwUXjazL+pwBu+Q2fD/afCOl9UoQMxre30NfmzViLTPg4+SgRIr331ZKD2/iH28pTtVkMAKLu6l4R2GubzTNp0SgD/XjaP0UZE5z0TEDaWqrT50/b61/VvGfSTgsju/b2g5fgCDQc2Rzg3FObxTBi45I+E9aZJLnRNGdja1/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q89Bm9Vx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6694AC2BCB0;
	Tue, 12 May 2026 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568084;
	bh=OmqLAzovAsaSAx2HdYYu7HBEbGsJQMUnMcjJAZxyhFQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Q89Bm9VxjC8vs96rOOE6U/H+6bC5f25PtJtxvPnqQjO6QgnPFPhwDNKSix9JgdWwd
	 jIiAmdhetCUVnXkBQTW8DUC56pjxMGB1THiDPjHcYKoz78Tmqp1KdaWb9FKJYn4eVV
	 t6HS0A8Y9LqiX/naG8sv2S8TCIFCoPNNj04LwiOMftRfwLxEjUGg+D0RBfpvBCtRNY
	 rZRsD1+jjp0mtAwW/RpG3KBkbxH7Yo/vRFuofvexM/CmvOVgSGmwaVHUDv7QXCp8Sb
	 vqC4bCpiKeVSMx3BrLYjZ11rPQZbJBdq+REAcmckH39YVV39jiwAbz2Pw7jHncYf5F
	 p6dYErvqI3Jsw==
Content-Type: multipart/mixed; boundary="===============0226668782142828443=="
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f573f7e0a5140fe6254d2ddfd3f69add455fa25c67c020c0312e2c2ceeca7c69@mail.kernel.org>
In-Reply-To: <20260512055919.95716-6-kaitao.cheng@linux.dev>
References: <20260512055919.95716-6-kaitao.cheng@linux.dev>
Subject: Re: [PATCH RESEND bpf-next v10 5/8] bpf: Add bpf_list_add to insert node after a given list node
From: bot+bpf-ci@kernel.org
To: kaitao.cheng@linux.dev,ast@kernel.org,corbet@lwn.net,martin.lau@linux.dev,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,shuah@kernel.org,chengkaitao@kylinos.cn,skhan@linuxfoundation.org,memxor@gmail.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-doc@vger.kernel.org,vmalik@redhat.com,linux-kselftest@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 12 May 2026 06:41:22 +0000 (UTC)
X-Rspamd-Queue-Id: 4599B51B4C9
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
	TAGGED_FROM(0.00)[bounces-87016-lists,linux-doc=lfdr.de,bpf-ci];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--===============0226668782142828443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2570,6 +2570,16 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
>  	return bpf_list_push_back(head, node, meta__ign, off);
>  }
>
> +__bpf_kfunc int bpf_list_add(struct bpf_list_head *head, struct bpf_list_node *new,
> +			     struct bpf_list_node *prev, struct btf_struct_meta *meta,
> +			     u64 off)

The commit message states that 'prev' must already be in the list. How can a
BPF program obtain such a reference and pass it to this kfunc?

A node already in the list is tracked by the verifier as a non-owning
reference (PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF with ref_obj_id == 0).
The typical way to obtain this is via bpf_list_front() or bpf_list_back(),
which return non-owning references.

However, check_kfunc_args() in kernel/bpf/verifier.c handles
KF_ARG_PTR_TO_LIST_NODE by requiring owning references and rejects non-owning
references.

Without a similar distinction for KF_ARG_PTR_TO_LIST_NODE (as exists for
KF_ARG_PTR_TO_RB_NODE), is there any valid BPF register state that satisfies
both the verifier check and the runtime semantics stated in the commit
message?

The BPF CI bot reported this issue in v10. The author responded that this was
fixed in [PATCH bpf-next v10 7/8], which introduces the __nonown_allowed
annotation and corresponding verifier logic. However, patch 7/8 is not
present in this commit (feed006fb969), so the parameter lacks the
__nonown_allowed suffix and the verifier lacks the is_kfunc_arg_nonown_allowed()
check.

Reference: https://lore.kernel.org/bpf/cb7368c6062232b6ad5f9ab1c6a97bc8530566a8b3db5c4deefdd5ea63d31538@mail.kernel.org/

> +{
> +	struct bpf_list_node_kern *n = (void *)new, *p = (void *)prev;
> +	struct list_head *prev_ptr = &p->list_head;
> +
> +	return __bpf_list_add(n, head, &prev_ptr, meta ? meta->record : NULL, off);
> +}
> +

[ ... ]

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> @@ -19235,8 +19238,11 @@ struct bpf_insn addr[2] = { BPF_LD_IMM64(BPF_REG_2, (long)kptr_struct_meta) };
>  		int struct_meta_reg = BPF_REG_3;
>  		int node_offset_reg = BPF_REG_4;
>
> -		/* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs */
> -		if (is_bpf_rbtree_add_kfunc(desc->func_id)) {
> +		/* list_add/rbtree_add have an extra arg (prev/less),
> +		 * so args-to-fixup are in diff regs.
> +		 */

This isn't a bug, but the multi-line comment format doesn't follow the BPF
subsystem style. The preferred form in kernel/bpf/ has the opening /* on its
own line:

    /*
     * list_add/rbtree_add have an extra arg (prev/less),
     * so args-to-fixup are in diff regs.
     */

> +		if (desc->func_id == special_kfunc_list[KF_bpf_list_add] ||
> +		    is_bpf_rbtree_add_kfunc(desc->func_id)) {
>  			struct_meta_reg = BPF_REG_4;
>  			node_offset_reg = BPF_REG_5;
>  		}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25716874656
--===============0226668782142828443==--

