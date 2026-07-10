Return-Path: <linux-doc+bounces-96283-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KjyzBN4LUWpG+gIAu9opvQ
	(envelope-from <linux-doc+bounces-96283-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 17:12:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7175D73C1DD
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 17:12:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UAET3Lve;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96283-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96283-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F43B3001870
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 14:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357AE34A3DB;
	Fri, 10 Jul 2026 14:59:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A1348C5A;
	Fri, 10 Jul 2026 14:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695554; cv=none; b=S/Kzb/Agp+s4xe4D0zjAlUg92XQnZpxc+S6gH6ujlawxqazsIrWC2qpj6t801LV+QtN+q6sMsg/V2I4oCbfZ3otu4zUSf1mvbzDFAvhGDjYshOhLUNPQlW5c5Y0VRLCFOO5qRb88fbFrIYu6+QNvooglarkpZjT/iFaUSKgHbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695554; c=relaxed/simple;
	bh=NXNQCLIrV+WdLw14BokOG34itnagsGEUs0NxFAH0G4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lk7ejLttb5mJpprKPU+wK9i6CtBaq1hYgK8c4JW8jEM2ZjbH6TSa+oTBt4pVEqkCbF+Eoy8l2YRS18QIGBFBU0M9aoPIigPMBhY0pDJLpfzg7CnYfsWcq17EGn78KLXbKBaQedklluyYvZOU48YjT8I+Y3+Yt8IQ6cbdB/o5REo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAET3Lve; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5381F000E9;
	Fri, 10 Jul 2026 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783695553;
	bh=kaHO7iM2fkBkcPXX7E/p4gh+FXOCsDoSAMVqpwRtKPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UAET3LveLjWX8B68X5OoBzwl8nLMnCMESO6AiBDf0f6br2bu+FSY99ro2+vJfAz64
	 DeRRmqxYubZ+aPo2o4mlrNDX9FsHGuEmWy2qhG53I9Rek1zIkK66Cq+mOMEOuYpHQp
	 dD8THo33ClgqdfHTq1T38PApc4m22RB+YxRdwdWwIALG5HPuP643Rw8eActmjWHK7v
	 kNNkfbzUpIfTOfTCHUeRWYnmxvsqN9tcLnlTLjMuZ2GFJ1TfdA3cDiBjpxdxjoclTR
	 qviEB7Y2/BMljyFgi75PuxISbyXnh9ZD2+cM/qv+VTd90REkj5HFX5D+bOys/r6NB1
	 sZ+wBLUtR32Lw==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/19] mm/damon: introduce data attributes only monitoring
Date: Fri, 10 Jul 2026 07:59:04 -0700
Message-ID: <20260710145905.27704-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710134651.18084-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96283-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7175D73C1DD

On Fri, 10 Jul 2026 06:46:29 -0700 SJ Park <sj@kernel.org> wrote:

> TL;DR: Introduce a way to get DAMON's best effort accuracy monitoring of
> user-demanding non-access data attributes.

Sashiko found no blocker for this series.  Sashiko sent findings to damon@
mailing list [1], and I replied to all the comments.  Please read those for
details.

[1] https://lore.kernel.org/damon/


Thanks,
SJ

[...]

