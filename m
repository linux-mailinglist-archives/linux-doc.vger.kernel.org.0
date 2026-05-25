Return-Path: <linux-doc+bounces-89391-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XoIfHIqjFGqXPAcAu9opvQ
	(envelope-from <linux-doc+bounces-89391-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 21:31:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3005CE066
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 21:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08E59301187D
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 19:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA382F0C62;
	Mon, 25 May 2026 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CiwsqtlS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0D7E0E8;
	Mon, 25 May 2026 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779737471; cv=none; b=Dd9+ZmX+pcuICMpNZb19OjipsDr/ylnk2bX+ZVQWCW0to7BioIPI6B3aOSP4LeRlV8Ukf8q2gjaXckYb2ksMWuzWQ7jOS7Ptzs1NYMWBZIu50XuhqHKFWYnf5QRCBT30e9xzO4JXscqsggKAJxaBgNRPKgOaIW2P0sHBQJ2BkiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779737471; c=relaxed/simple;
	bh=N8gKdsAi0eTXOEj0ow9BrIHwETIymwpVPAEdei5eMLk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uAhCVusHDDiJP7RMvPmycIn+BuTjYhoMtJnbciKo1KnOCk5OVMydNsT80rbFVIlufBoTU38E7zLechmd3M0mniZ9EDQf29qUfBPXUzVHPya2r8QgmR42WLJvmx5vg4NXSPGNEYYK/BbS5DpUy3LuShrxivryRxrxyRrrgvYWFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CiwsqtlS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC72C1F000E9;
	Mon, 25 May 2026 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779737469;
	bh=QvrEoRjjhq9hE4z0e/L8Y7gfSYwRsEYYg3744tOFPOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CiwsqtlSv5tLtltiP4np3cPPoXXu+ECJba3j5uIoAsOrZwr1PKr2Io2fOFRsFVGbj
	 sNOM6allwT3Ub4CpsT3bHF7ez01xQ60dt2dY7DIdIZU+YashBqk0aLBV2JXYaT1SJo
	 AVofEgKXf7njpIj9jFN0NIytr2OWDcVqwi99jS/E=
Date: Mon, 25 May 2026 12:31:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, rppt@kernel.org,
 peterx@redhat.com, david@kernel.org, ljs@kernel.org, surenb@google.com,
 vbabka@kernel.org, Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net,
 skhan@linuxfoundation.org, seanjc@google.com, pbonzini@redhat.com,
 jthoughton@google.com, aarcange@redhat.com, sj@kernel.org,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v4 03/14] mm: rename uffd-wp PTE accessors to uffd
Message-Id: <20260525123108.0b66d07c4be97dab3536dfde@linux-foundation.org>
In-Reply-To: <ahRf00RTI4_0Puux@thinkstation>
References: <20260525113737.1942478-4-kas@kernel.org>
	<20260525120513.C51E91F00A3A@smtp.kernel.org>
	<ahRf00RTI4_0Puux@thinkstation>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89391-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: BE3005CE066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 15:43:32 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> To: sashiko-reviews@lists.linux.dev

hm.  What's this.

Sashiko seems to have been useful this time around.

> Confirmed and pre-existing ... Will address in a separate
> patch on top of this series.

There are quite a few like this.  Would it be better to address these
existing issues immediately then base the new feature-add on top?

