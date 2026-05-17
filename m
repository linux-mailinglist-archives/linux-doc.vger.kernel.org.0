Return-Path: <linux-doc+bounces-88044-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A+4K9IKCmouwQQAu9opvQ
	(envelope-from <linux-doc+bounces-88044-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:37:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC75632BC
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F48430028B3
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 18:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7193CF048;
	Sun, 17 May 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJKsRJoY"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABD3CC9F3;
	Sun, 17 May 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043023; cv=none; b=OINnvXAewa8pYOcIqtN/J0fn7rGW28m5eGbf+iJij9uwcAYrachMNqERRPzzeuZIVlCiwzQLBOVfkYqI+KP8Su9gGChgjsfbn+2np+D4xVXWOcX8RR+ktzJKz3SdgH8OMiUEHSplsQRkaKZx2kSdUtJy2RHxXftN1787Jf5okTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043023; c=relaxed/simple;
	bh=C+SyJKDLu7Bb/+Y2+23ar4XFJMGe57MICkLTUWmQqus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7Jy+IHZWaACzXrVgiRKeyA3we6Uzz2oB6El2TpawsjxWL5Z136bjZo14vs0VIg67pApmtrjPnncBFpmi4rKSHZoxSW8Qa+V/S/quxmdLzz0DjubR3dPDsgwaLxrO+6/5gkwuTpp2YJ6BDh8HCEA+ZiaADe/iwkD6PrF51NECPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJKsRJoY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8FAC2BCB0;
	Sun, 17 May 2026 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779043022;
	bh=C+SyJKDLu7Bb/+Y2+23ar4XFJMGe57MICkLTUWmQqus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZJKsRJoYbsMp8e+Oodzd2DVfcMy73uE4Ln23GQaU/fKTFrbejdbatIIMTeegftDQW
	 1SqH+2mwthlzpr7tTchvLg4f7iofCT8UChl7AP1nr1UHEcDp2FLEJPlIgzJ0nvmWT7
	 Q+PJNlR1Bte9prfsQKNuREHoLJXm49whuzTTG+p0kQI9JVIAnq7J2GE6KsBqtQRCCa
	 53B9HRtymr2nH60XjCW4Rf4k7F3YCqWeVQ06B6lkJcld/1lve/+aLgl1caw4671940
	 a1ZhdOu4LJwWmpVwggYkYPB+oklX9hZ0ZF1GQE3MQja22U3w/YwmKIWtcQjeCuTm2/
	 vY4+AwFfHU0kA==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH 2/5] mm/damon/core: cap effective quota size to total monitored memory
Date: Sun, 17 May 2026 11:36:57 -0700
Message-ID: <20260517183658.4510-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516210357.2247-3-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53EC75632BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88044-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello Ravi,

On Sat, 16 May 2026 14:03:54 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> The DAMOS quota goal tuner can compute an effective size (esz) larger
> than the total monitored memory because it integrates over cumulative
> deltas without bounding by the actual workload size.  Once esz exceeds
> total monitored memory, the per-tick "remaining quota" arithmetic
> stops being meaningful: any scheme can apply to the entire monitored
> space and "remaining" stays positive indefinitely.

Nice finding!

> 
> Cap esz to the total size of all currently monitored regions as a
> final bound after all other quota calculations.  Add
> damon_ctx_total_monitored_sz() helper that sums region sizes across
> all targets.

You could also make an arbitrary cap by setting the static size quota.  That
is, if there are not only quota goal but also the size quota and/or time quota,
and the different types of quotas disagree about the real quota, DAMOS uses
smallest quota.  You could read damos_set_effective_quota() code and kernel-doc
comment of 'struct damos_quota' for more details.

So you could apply the total monitoring region size cap by setting the size
quota of the total monitoring region size.  Could that work for you?

Adding the total monitoring region size cap makes sense to me, and I think that
will make user experience better.  But, if the size quota based cap works, that
could also be handled on user space in an easier and even a betetr way.  If so,
I'd prefer the direction, to reduce kernel code complexity.  What do you think?


Thanks,
SJ

[...]

