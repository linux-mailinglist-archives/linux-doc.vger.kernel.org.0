Return-Path: <linux-doc+bounces-79402-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFurDqf8tWlN8AAAu9opvQ
	(envelope-from <linux-doc+bounces-79402-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 01:26:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258628FA7A
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 01:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36F02303CC1E
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 00:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6489D1C862D;
	Sun, 15 Mar 2026 00:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOm9hRGv"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402407260D;
	Sun, 15 Mar 2026 00:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773534372; cv=none; b=QWWqPoy6Xxqb3KlqEYVgK2TwCWQ4Bs8oMmnE0qnznANM6cD3QyqT2YqcoQE7zmlW0zDV8Mqvc+JaaV+0tGqXSc770cB7944c29wryXWyvD9L++VyxMCwPXUZOMjxocc7pizi0x9jGCYhEdlGzx9iGV/GEBCnuZjIFRBNFmpcK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773534372; c=relaxed/simple;
	bh=1sCvwrjbj+DjAx2QZdG6F13Pd2u4zTGhs2VeFPdIUyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzQideqaSXwGgZp560IWmJthMbm+hrdx7i+lOMSCL185JjnQbbnJbRqif5ogB1DGOqCb5ETCxDmIo8wf0dCBfarrilnwucqihRH7MXlOSjXLhNKOMo0XEU1irv5rUCbu/r96UvB87R+ZsP85Q7kEU0qnZUxmUBimRbNArILMiW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOm9hRGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD42DC116C6;
	Sun, 15 Mar 2026 00:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773534371;
	bh=1sCvwrjbj+DjAx2QZdG6F13Pd2u4zTGhs2VeFPdIUyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOm9hRGvVEJ/WNi1KJenyI8c+au+LcuSvcap9xpnOUs46n6Hzn3yMxewe9y/3RmuU
	 6vnJU7/9uTJS4ivQW1jxW6ZsGFsfMh9RBupLtXlRb6UcaHdlG9Xuu4VX8yRunm7G+a
	 WtzcPVgys/b1pAmUj/VhQTMiKsY4omLF0QvPvXTWw90t5wFlf7aiaZ3u1tff+/g60k
	 jT7C8VD26WID+hxbBGorJpPzPR8O12Ksp+DZP/vvImFAyCRxO9pND+THdVavTiCpXk
	 3Bi2t6dtzTGbDaO+Lil7VVpob1/29tSDen70kCxvZRYDqAYe0zh8pPyTeh5N6v7SvH
	 183AbuCSj2NPA==
From: SeongJae Park <sj@kernel.org>
To: Liew Rui Yan <aethernet65535@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm/damon: document exclusivity of special-purpose modules
Date: Sat, 14 Mar 2026 17:26:06 -0700
Message-ID: <20260315002608.77292-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAPLv50rMiS+PBFh6BQ1f1XZAJu=1hMOaSx6ySQgeHxAY=i1mQA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79402-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9258628FA7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 15 Mar 2026 04:37:34 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> On Sun, Mar 15, 2026 at 12:25 AM SeongJae Park <sj@kernel.org> wrote:
> >
> > Hello Liew,
> >
> Hello SeongJae,
> 
> >
> > And thank you for fixing this!  But, the broken "contents" directive is added
> > by a commit on damon/next tree [1] that not yet planned to be upstreamed.  That
> > is, seems this patch is based on damon/next tree.  As a result, this patch
> > cannot be cleanly applied on mm-new.  We prefer making patches based on mm-new
> > unless there is a reason.
> >
> Okay, I will make sure to follow this in my future submissions.
> 
> > >
> > > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > > Link: https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.org/T/#t
> >
> > I think it would be nice to give a context about the link.
> >
> That makes perfect sense.
> 
> >
> > Reviewed-by: SeongJae Park <sj@kernel.org>
> >
> Thank you again, this marks my first contribution to Linux, and I truly
> appreciate your guidance!

It's my honor to help your first contribution! :)

> 
> >
> > Assuming you agree to my above suggestions, I added this patch to the top area
> > of damon/next after dropping the "contents" directive fix and adding a simple
> > sentence describing the context of the link.  The change made to this patch for
> > that is as below.  If you don't mind, I will post it as v2 of this patch by
> > tomorrow morning in Pacific Time.  Please let me know if you have any comments
> > about the plan.
> >
> The plan sounds great to me. Thank you for taking care of the v2
> submission!

Great, I may post it tomorrow morning.


Thanks,
SJ

[...]

