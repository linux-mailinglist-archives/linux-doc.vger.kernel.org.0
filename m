Return-Path: <linux-doc+bounces-95886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EsleCvg4T2qRcQIAu9opvQ
	(envelope-from <linux-doc+bounces-95886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 08:00:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE972CF24
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 08:00:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=V5Tn6BZJ;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95886-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95886-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0ACF303BB33
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 05:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AC33ACEF0;
	Thu,  9 Jul 2026 05:58:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91143A9DAE;
	Thu,  9 Jul 2026 05:58:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576682; cv=none; b=YddUP8a2pr9rFKMOg/MyC2f99sDdR8C9wsWnbNb2E/qdB3+GhycOuey9AQ6+FZD613pUh3HVbg+LKCnxk3mxvYfHgSXF3R4Zsk0G4WORusZFweecaxK02CoZB4HReToaFD8yxTGnxHgbwaYPEObio8ziSRON5xhn2P6fjb6ji6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576682; c=relaxed/simple;
	bh=gE/pHNbx547YCQoActu6Ay3E6ZtMNlssx50Pc9LWjuM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=o3m3q8/CTmoGF0FASd/aS13FlID0fxvZqVMd/33rNPp0lj7aUcLFedofhQ5ipQNK/ZcUUm25RkpKirft2MP8IcvmgB890qqVsH62QadSGhoJ3nL7F/ul2NfpmOWCKFHOCjv1Fzm1jT11Y44/igxdX6ESwBeMs73r++AzP8xpvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V5Tn6BZJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607271F000E9;
	Thu,  9 Jul 2026 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783576680;
	bh=xf5NQPRm+PlThVUYalodcm0x+VRuVBSqRkIVWGLY/XA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V5Tn6BZJLkxVItaPfGtZTeio2YPQv0sF8JqMvvYBNPsA+qPaNDRenlKs/s836974k
	 qsTr8puf4xA6xFW00rVJXpAh43IXBail89YZzVeuxVqk817zVGM84AHJD+nZfh+GYX
	 5j81OJNXC8mbtvk/6gsvMKN/LQHLh/65mbf2rYmw=
Date: Wed, 8 Jul 2026 22:57:58 -0700
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
Subject: Re: [PATCH v10 14/15] selftests/mm: add userfaultfd RWP tests
Message-Id: <20260708225758.0c8bcf16598f82d84ea7f71f@linux-foundation.org>
In-Reply-To: <20260708111417.173443-15-kirill@shutemov.name>
References: <20260708111417.173443-1-kirill@shutemov.name>
	<20260708111417.173443-15-kirill@shutemov.name>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kirill@shutemov.name,m:rppt@kernel.org,m:peterx@redhat.com,m:david@kernel.org,m:ljs@kernel.org,m:surenb@google.com,m:vbabka@kernel.org,m:Liam.Howlett@oracle.com,m:ziy@nvidia.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:jthoughton@google.com,m:aarcange@redhat.com,m:sj@kernel.org,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kvm@vger.kernel.org,m:kernel-team@meta.com,m:kas@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95886-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shutemov.name:email,vger.kernel.org:from_smtp,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98FE972CF24

On Wed,  8 Jul 2026 12:14:15 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> Coverage for UFFDIO_REGISTER_MODE_RWP and UFFDIO_RWPROTECT:

I'm getting selftests build errors:

uffd-unit-tests.c: In function ‘uffd_register_rwp’:
uffd-unit-tests.c:624:25: error: ‘UFFDIO_REGISTER_MODE_RWP’ undeclared (first use in this function); did you mean ‘UFFDIO_REGISTER_MODE_WP’?
  624 |                 .mode = UFFDIO_REGISTER_MODE_RWP,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
      |                         UFFDIO_REGISTER_MODE_WP
uffd-unit-tests.c:624:25: note: each undeclared identifier is reported only once

<etc>

Seems that tools/include/uapi/linux/userfaultfd.h needs updates from
include/uapi/linux/userfaultfd.h?

I'll disable this patch for now.

