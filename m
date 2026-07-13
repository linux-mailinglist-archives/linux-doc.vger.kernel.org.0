Return-Path: <linux-doc+bounces-96579-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RlqGIpAMVWqNjQAAu9opvQ
	(envelope-from <linux-doc+bounces-96579-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 18:04:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D213E74D660
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 18:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aeYsF86g;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96579-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96579-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 742BC31764C0
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 15:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EE931E851;
	Mon, 13 Jul 2026 15:58:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDA43090D9;
	Mon, 13 Jul 2026 15:58:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958291; cv=none; b=tQJSGs5yUb8No5FJILYH923M/rOklnLg9Ml8z2FHbnPmTDeqW+KFcvUxx0cPasBlMCR/K26Fs6/g1hRZNVAMaMQvao/DC5N9dfAT25H28Q8HhOWIWUOxHcwcPqKPZukrOze9MonDl7hUviK863fesD+turA9iAEmwa1n1T/tijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958291; c=relaxed/simple;
	bh=W7eem1hxKBhR+qpjzH9sJ9OjOv3VJKcUDquaXYlqrJc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=M70R8XpYKphNeG1F/GU1YmXPdVjlnyy6wDsrr0PQUweb8ggn0ViY0D8xmFLizci+tHFhxTEhorMphyfdYqtysSvivOCqu+OCcwrp1ay+flX9NfLpax85RW1JxfDXuHL9uIOBMYNZpJL+LXSr6hJWJVfL6luJrh8FrnSWUt+Wfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeYsF86g; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405271F00ADB;
	Mon, 13 Jul 2026 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783958288;
	bh=7wJM8DAMKw46GCCUOJ84lZ1VhKPOJwTAzm+VqeGupW8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aeYsF86gJr53IfRDB1RqxivdjUIvzEMc74CYICJbuuLw/2SubhKRONGhF10y02Lkp
	 jV/9Z0boG1fR3xQa7N/s2ORvWWPb4F38nF1FYHaxG3OEY54gDKpBA0Kbnqq5ZGxpEB
	 rq3CZfewRRceQekqpp32X4ATzDl7hSJV+2QXNfmYEJllA4wFpGB1jg1+ZrADZaUM6E
	 gl83aR4yG7HhApOgNXIGTueLSOSZAxLobIak9OSxjZnfw6j2V/FKsNZHpnnFTV1ldm
	 wQEPtaYIkX/zFlhR/nYE0HnCZM2Sz0/lrrlQaAGkatqlQ3iVOAhgYnp1ESE6pLZo5C
	 pxFc0nAnBn5TA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/5] binfmt_misc: bpf-backed binary type handlers
From: Christian Brauner <brauner@kernel.org>
To: Farid Zakaria <farid.m.zakaria@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Andrii Nakryiko <andrii@kernel.org>, Kees Cook <kees@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>, 
 John Ericson <mail@johnericson.me>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
In-Reply-To: <DJXJM0838IJN.3AJ9MMQ89SUUR@gmail.com>
References: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
 <20260712-abluft-brutkasten-aufladen-c8063a4a1a0a@brauner>
 <DJX4IFO55D9S.3IV3K5XICJAEV@gmail.com>
 <20260713-unerlaubt-luftkammer-kosmetik-46532d395f9b@brauner>
 <DJXJM0838IJN.3AJ9MMQ89SUUR@gmail.com>
Date: Mon, 13 Jul 2026 17:57:53 +0200
Message-Id: <20260713-gekreische-membran-samtpfoten-6e0eb34e2a41@brauner>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021; i=brauner@kernel.org;
 h=from:subject:message-id; bh=W7eem1hxKBhR+qpjzH9sJ9OjOv3VJKcUDquaXYlqrJc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSFcrOc2nn2/tZvaXmvTeZkTFpuxnHv7D3Xa1O+fLnM9
 2Z31HoV/Y5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJdJszMvRu8XQ8odlSoLbg
 R9yru1zSvLEL93Lx9R6dMFfslWqImQgjw5weq6gb9nMM2Pe/CLVbr61ZMHVyiM+zwtQLyts3nrs
 rxwUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:farid.m.zakaria@gmail.com,m:brauner@kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:shuah@kernel.org,m:andrii@kernel.org,m:kees@kernel.org,m:viro@zeniv.linux.org.uk,m:jack@suse.cz,m:corbet@lwn.net,m:jannh@google.com,m:mail@johnericson.me,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:faridmzakaria@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96579-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,brauner:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D213E74D660

On 2026-07-13 08:19 -0700, Farid Zakaria wrote:
> On Mon Jul 13, 2026 at 1:20 AM PDT, Christian Brauner wrote:
> >> > - The single sleepable load op is split into two ops:
> >> >
> >> >       struct binfmt_misc_ops {
> >> >       	bool (*match)(struct linux_binprm *bprm);
> >> >       	int (*load)(struct linux_binprm *bprm);
> >> >       	char name[BINFMT_MISC_OPS_NAME_MAX];
> >> >       };
> >> >
> >> >   The non-sleepable match program runs from the RCU entry lookup
> >> >   walk itself, exactly like magic and extension matching: same
> >> >   registration order, same first-match-wins semantics, and it can
> >> >   only rely on the prefetched bprm->buf. It must be free of side
> >> >   effects since the walk may be restarted.
> >> >
> >> 
> >> Is relying on brpm->buf enough?
> >> Right now that's only 256 bytes I think, which is not enough to read
> >> segments we might care about. That worked fine when it was just a magic
> >> number but the idea with the eBPF program is to make decisions based on
> >> more data.
> >> 
> >> In the selftest I provided, the `PT_INTERP` segment is already at file
> >> offset 0x318 (792). I was imaginging NixOS having to support
> >> `PT_INTERP_NIX` in order for the produced binaries to be backwards
> >> compatible with older kernels.
> >> 
> >> The other idea would be to make the `match()` broad and select
> >> everything but then nearly all ELF64 binaries would match and then pay
> >> the price to `load()` and ultimately `-ENOEXEC`. Seems like it would
> >> make multiple BPF binfmt programs less useful.
> >
> > Ok, so your idea is to have multiple bpf programs that look for
> > different interpreters. Yeah, then you have to be able to sleep because
> > you need to be able to fault. It makes the code uglier but I can see how
> > that's useful. I'll see how nice I can make that.
> >
> 
> I mean... I thought that's the intent to binfmt_misc, to have multiple
> handlers -- with the expressiveness of eBPF vs. the limited

I was thinking of having one bpf program per type (elf, python, etc) but
I can see how it's useful to have multiple elf bpf handlers...

> > Ah, fun. binfmt_misc wasn't able to express this at all. It's good to
> > close that gap. This can just be done by adding
> > bpf_binprm_set_interp_arg().
> 
> What is "cool" about this is now it's also a net-new feature for shebags
> which the "old" binfmt_misc didn't support. Anyways, I was thining ahead
> about what I would need to support $ORIGIN fully and this was
> a remaining gap. We also explored this idea in a patch pre-BPF [1] but
> now that we've settled on this solution it seems much more natural.
> 
> 
> I was recently reached out by some Bazel people who are also interested
> in this $ORIGIN support. Interestingly they let me know that

Yeah, for build systemd it's very nice ofc.

> IllumOS/Solaris had support for it as well.

The whole $ORIGIN thing comes from Illumos/Solaris afair. So no big
surprise.


