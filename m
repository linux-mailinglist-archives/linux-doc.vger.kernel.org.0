Return-Path: <linux-doc+bounces-91620-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/tIAgsnKGqr/AIAu9opvQ
	(envelope-from <linux-doc+bounces-91620-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:45:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21B6614CE
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nxvUtw12;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91620-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91620-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12132310B073
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBC13403F7;
	Tue,  9 Jun 2026 14:28:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A8633D6C1;
	Tue,  9 Jun 2026 14:28:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015312; cv=none; b=qHpTS6lvwa1N2iE+nl48Vzt7mpjI2sPnNveobl5fJ4hCf7Uol1jOg5gwrPb+JV0WetvjFroCTMqFSR4vXWhjBpVTeYNnRuHcnuyk2Rt4QsZWGK4cd7FKRDL8Ly9j60tEYF0KC8ov1B8TJDuNkTzDtlFuVDKqBQPhU1gYM5DOC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015312; c=relaxed/simple;
	bh=agXCFejo95mnebyqU0S6rkDQvUiDbZF6/aXVKkQ96WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpO/J/xdKa2znV0THiH5+U4W+m5n90QFElllMaP+h+m1tMvCQBGncTU/F25CdMsuujqeH+vGqFl4iETAHeJcKZOTlCrkjBuWKiHFp0GE+XFizOzifKcudxucKsRWn9Eq74HyR0U+hWwh8cT10DB8t+4af4edfHjTM3bJZPcm6bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxvUtw12; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C9B1F00893;
	Tue,  9 Jun 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015311;
	bh=aa2gR31Z+8UFx2QrssjKKZ0Vpf6BD+KhrKV/ts3/hy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nxvUtw12BzdowvW6doCOqJdXcqyuVIacRLC4e7BndyxqZ+McgcwfO4iU0KIK3BO0A
	 yEKD11yhv/rVzzKGKg5Rt32vbh2VDCLCFII0WSE8hKgloU6/3+cPAWQpPX+4SOoZxv
	 FxbJVT6foUrvVMnpuY/1BSaa9Ab9r0J/5MAgp885qLHSpFWOKGxXSKzQI5b86H+gGV
	 FwfugoaaqvH3BwgEe522Ih0ipMDOnb22CAMFivk/+6TD1OrYDuaPTytoIiXw90Th+C
	 w8ji26r27NRIPm7n97Icko9yQL4yB6aUWSWY7d5I2Gpr7Km3DUfR9NOC2PL/bL59eY
	 ULCPm9GMIFQnw==
From: SeongJae Park <sj@kernel.org>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Lian <lianux.mm@gmail.com>
Subject: Re: [PATCH] Docs/damon: add TLB flush policy document
Date: Tue,  9 Jun 2026 07:28:21 -0700
Message-ID: <20260609142823.68951-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAN_Opa8sqs-V-jFrGZa6jwJKdHqT=7JPeLKcU8E-cCM74ON4DA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91620-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kunwu.chan@gmail.com,m:sj@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lianux.mm@gmail.com,m:kunwuchan@gmail.com,m:lianuxmm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,infradead.org,google.com,suse.com,lwn.net,linuxfoundation.org,lists.linux.dev,kvack.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,damonitor.github.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB21B6614CE

On Tue, 9 Jun 2026 16:11:30 +0800 KunWu Chan <kunwu.chan@gmail.com> wrote:

> On Sat, Jun 6, 2026 at 8:54 AM SeongJae Park <sj@kernel.org> wrote:
> >
> > Hi Kunwu and Lian,
> >
> > On Fri,  5 Jun 2026 11:10:08 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:
[...]
> > Mainly due to the verbosity, as I above mentionedd, I'm not sure if the current
> > shape of this patch is the best to be merged as is.  I also find the background
> > part of the document is a kind of duplicate of some information in design.rst.
> > What about putting only essential information in a condensed way on the
> > design.rst?
> >
> Thanks, SJ. I agree — this document reads more like an article than short docs.
> 
> I'll follow your suggestion and submit it as a blog post to the DAMON
> project blog instead.
> 
> Will send a PR to [2] soon. Thanks for the clear guidance.

Sounds good, looking forward to the PR!

> 
> > [1] https://damonitor.github.io/site_about
> > [2] https://github.com/damonitor/damonitor.github.io/tree/master/blog_src


Thanks,
SJ

[...]

