Return-Path: <linux-doc+bounces-95862-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKtkOxYCT2rBYwIAu9opvQ
	(envelope-from <linux-doc+bounces-95862-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 04:06:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9972BD74
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 04:06:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b="a/aJCuzY";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95862-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95862-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E16130262E9
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 02:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C263090C1;
	Thu,  9 Jul 2026 02:06:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA322A1D4;
	Thu,  9 Jul 2026 02:06:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562764; cv=none; b=NXGq0TZHzz/RH8s9Ybo82AzHWQt8bSxQA5dvNYfMhrDcblhKuEXXqBpsAmP7/Prow1vTIY3wdvyC47NqssJiYqKi+lpAJxVqCgFIlyKvRQonGCeLHjJ8Hfe4M1sztkhmEbt9S2bNVaJoa0adomtucnjyXVsgKE3lwDdkAa7m65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562764; c=relaxed/simple;
	bh=4TBAMDs51nKjPI6X3lwgBRi/8vBA5L9Lw3sclcSgISA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tSf4sMsTKzoOAQzbxJazoW4/6FCKeRXSWZqnR0NeQYaqJy5deXw7D5ECLn7OOJOy8uZ1ODgyu2bav9XNp805da9zar5Npu9ZNdBl6nl2xa4uSk2KmdSfzMpML/xCbXPveIG1Srbfw54Rs3P84KDkaNOtxMnWfyim4Fmdo+9GGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a/aJCuzY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154F61F000E9;
	Thu,  9 Jul 2026 02:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783562762;
	bh=fh+v6z4LaKdRJWSZzxsh8LHRO9V5c51gNjIrY3QRuEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=a/aJCuzY0fXm/KWEGb0ilP5jrAq0B6hvKMSkgZF/S+3aNzXAlEM+zvP2EW1L3RgZE
	 zgq824Y1pp9qiAXd+ySxZTv4GUka/BKpsKEfJxXJ/L0MKkruHAz4ya3hD1V92d4h0n
	 HrqEsUuKptmUc5gKMWuOyZHy4qA9CrrMuMOgRqGM=
Date: Wed, 8 Jul 2026 19:06:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: rppt@kernel.org, peterx@redhat.com, david@kernel.org, ljs@kernel.org,
 surenb@google.com, vbabka@kernel.org, Liam.Howlett@oracle.com,
 ziy@nvidia.com, corbet@lwn.net, skhan@linuxfoundation.org,
 seanjc@google.com, pbonzini@redhat.com, jthoughton@google.com,
 aarcange@redhat.com, sj@kernel.org, usama.arif@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org, kernel-team@meta.com, kas@kernel.org
Subject: Re: [PATCH v10 00/15] userfaultfd: working set tracking for VM
 guest memory
Message-Id: <20260708190601.4cebdebf9d1f6e9aeebcb853@linux-foundation.org>
In-Reply-To: <20260708111417.173443-1-kirill@shutemov.name>
References: <20260708111417.173443-1-kirill@shutemov.name>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kirill@shutemov.name,m:rppt@kernel.org,m:peterx@redhat.com,m:david@kernel.org,m:ljs@kernel.org,m:surenb@google.com,m:vbabka@kernel.org,m:Liam.Howlett@oracle.com,m:ziy@nvidia.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:jthoughton@google.com,m:aarcange@redhat.com,m:sj@kernel.org,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kvm@vger.kernel.org,m:kernel-team@meta.com,m:kas@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95862-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88E9972BD74

On Wed,  8 Jul 2026 12:14:01 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> This series adds userfaultfd support for tracking the working set of
> VM guest memory, so a VMM can identify hot pages and reclaim cold ones
> to tiered or remote storage.

Thanks, I'll add this to mm-new.

Sashiko failed to apply so let's find an excuse for v11!

