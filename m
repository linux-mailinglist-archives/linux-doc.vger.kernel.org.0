Return-Path: <linux-doc+bounces-86520-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELrcNUEe/mkRnAAAu9opvQ
	(envelope-from <linux-doc+bounces-86520-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 19:32:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52E4FA014
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 19:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F1EC303852E
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 17:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632723E7161;
	Fri,  8 May 2026 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cIjwvtvU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B081AA8;
	Fri,  8 May 2026 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261542; cv=none; b=S0/0075ESS5nlJt120T+22oevDBCEKg4p8XNJpKWatUCvDqEQsp4V9DbQiKqg1vfmN4adAFkf+75fOZQmdpg9eGOhp+yLEps1uY7qnZPlBWzTnahkwwqtr5TFqIz0WMeO6aRMN6/f583HWpR6AFMdv66mle10iHXdoKkAKXzeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261542; c=relaxed/simple;
	bh=hVPRSg/Aw0I1iOxX29ZJQVzFj0tLkTvJRdEgtd6gtFQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KOItpEaEQi++iBml158VTCUvu6sTIbB7c137AHq1vjujYGYbB9jTSDiumnVMLFwJ71a0r2xRwcaePHizM43nCAOd1X/lkWiHcAI+TA5Gw8VP/AFSpOetDJj60iBlmfwE1me0a76TMeoegyWVN3kHzV9mvWJMIp7manKR4ZSKlFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cIjwvtvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36103C2BCB0;
	Fri,  8 May 2026 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778261541;
	bh=hVPRSg/Aw0I1iOxX29ZJQVzFj0tLkTvJRdEgtd6gtFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cIjwvtvUImu7UJUAxjtcmuA/pRzJ7AAThBot1FXPvuxh/gq3FKF152tCWY9BcRscQ
	 IT5yOPpH7MAoFkpgf4gFE78JZcCSamL/xFz8GQl9Nw55LGdLBqwqk/VO3hvuyN0B5i
	 BaUT7wXFf6L1LOPx82+PG9GOWSD2vcRnthOL5zYQ=
Date: Fri, 8 May 2026 10:32:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: rppt@kernel.org, peterx@redhat.com, david@kernel.org, ljs@kernel.org,
 surenb@google.com, vbabka@kernel.org, Liam.Howlett@oracle.com,
 ziy@nvidia.com, corbet@lwn.net, skhan@linuxfoundation.org,
 seanjc@google.com, pbonzini@redhat.com, jthoughton@google.com,
 aarcange@redhat.com, sj@kernel.org, usama.arif@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 00/14] userfaultfd: working set tracking for VM guest
 memory
Message-Id: <20260508103220.aa46427b6f4c5d0247d2afb0@linux-foundation.org>
In-Reply-To: <cover.1778254670.git.kas@kernel.org>
References: <cover.1778254670.git.kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2E52E4FA014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86520-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,linux-foundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri,  8 May 2026 16:55:12 +0100 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> This series adds userfaultfd support for tracking the working set of
> VM guest memory, so a VMM can identify cold pages and evict them to
> tiered or remote storage.
> 
> v1: https://lore.kernel.org/all/20260427114607.4068647-1-kas@kernel.org/

Thanks.  I'll duck v2 for now, await more review.

> Assisted-by: Claude:claude-opus-4-6

For my education, and perhaps for others: can you please explain how
you used Claude in the preparation of this series?


