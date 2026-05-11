Return-Path: <linux-doc+bounces-86931-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JHUADxZAmosrgEAu9opvQ
	(envelope-from <linux-doc+bounces-86931-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 00:33:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383F516F3A
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 00:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EAB003004044
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B4D356742;
	Mon, 11 May 2026 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="N5nzfqYU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914A30EF92;
	Mon, 11 May 2026 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538719; cv=none; b=BbTINwwY/i6jxwFIOXtXUXMwPgwffmQLFyBK7Cxuiy3aOZqwVMc64WMS6ZtbdJ2tnJRn8S7jwRJYqck1uQ5g1SXvJ1w9HypYBpBaeW9Dm5d8p1A5bXOgfi6PxzSGLAPIVVnmW3au9a0GNpvD4jWa9nlmkRCbqB6DpEHX05ZxQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538719; c=relaxed/simple;
	bh=f9BcVCkaWUGp7bONaHdPiA7vTuTkWS/NeEmdZAr0Vl8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JJsn88Bt2vHZyh4RdVnffF7EemZ89AtFOlzTk78eZ7IzC5ZsMlULh3PbS7L0/Ue70EwjhSTvzO5GLo737e6UexN8XxwoWinqhRhSvxultmCc/qp5ME8Sz6cWu48GV0n95rxhmLtGw7e2JehxbyrW3EavGFJMMHaD6Bp8LWPG9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=N5nzfqYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB003C2BCB0;
	Mon, 11 May 2026 22:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778538719;
	bh=f9BcVCkaWUGp7bONaHdPiA7vTuTkWS/NeEmdZAr0Vl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N5nzfqYUNVqnt07VsMz+fG5TVSwLpJYOkviYktgycKHl6l0qjHlArM2nvfarw6toW
	 mVZ/5pvTNAq5+3KxgY2XOpqeKbe2O3cYCDjAbK8lRR1VK3VK9cbE+HbpRhtrDXQOim
	 KVtY0Ovx4jWIValrAIOP9vHTt6eoed9QmLzrQCNY=
Date: Mon, 11 May 2026 15:31:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Breno Leitao <leitao@debian.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-Id: <20260511153158.bad58633e2c8d247322ebb4b@linux-foundation.org>
In-Reply-To: <agHUp8ulaWJ75WU5@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
	<20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
	<af5Z2IvtS5pVorSl@laps>
	<agG_PZ3qcl6TwLnL@gmail.com>
	<agHUp8ulaWJ75WU5@tiehlicka>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3383F516F3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86931-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:mid,linux-foundation.org:dkim,suse.com:email]
X-Rspamd-Action: no action

On Mon, 11 May 2026 15:07:51 +0200 Michal Hocko <mhocko@suse.com> wrote:

> > 2) It's common to run hundreds of different kernel versions across a
> >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
> >    requires building and deploying hundreds of individual livepatches—
> >    far less practical than a simple sysfs write.
> 
> LP is certainly a more laborous solution.

<another please-educate-akpm email>

Does a livepatch *have* to be distributed as a ready-to-load kernel
module?

Is it not possible to distribute a "livepatch" to the fleet as a single
string?  Send out "make function some_bad_function() return -EINVAL"
and let scripting on each machine figure out how to locally write,
build, sign and install such a livepatch?

That would require that each machine locally contains enough data for
it to be able to build a kernel for the currently-running kernel, and
that each machine contains a build environment.

I *think* this is feasible on distro-based machines?  But perhaps not
on stripped-down hyperscalar boxen?

