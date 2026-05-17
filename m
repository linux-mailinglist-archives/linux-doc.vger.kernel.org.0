Return-Path: <linux-doc+bounces-88061-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Om/CHANCmqPwQQAu9opvQ
	(envelope-from <linux-doc+bounces-88061-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:48:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F65635A4
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1B63300A10F
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 18:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929FC3D1A82;
	Sun, 17 May 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SN3KVN+O"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DA2ECE91;
	Sun, 17 May 2026 18:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043633; cv=none; b=sxOfzA0LQU6PuwzxKlj4xb9P8Si1InAuMZQkLmx36YhS44Agphup/c+dRXN5KGBHj4Fx9q4q9OdbE3HBfDLs1sL1PXxBHVaRWsZUnaHG7wmDf+aUxjtxjteLm3vsYjkHTXNhaOnsBg7T1ZyAgLwLsegSdoSd1Tj9QKoNVnMFQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043633; c=relaxed/simple;
	bh=q0yo9dDFhdfYJZH46om+DDXSMlLk9yZyYFxDwNP5H2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/TdMDnaOqqeWwC5XzH8dzHAITp7Zkr3+ZrXTm7KShgAwhkf6S0GRq4tCNfnqHbLfXaVX+ExfDBiWUkswB4ru2r4EnatkEvYAU9l9jJYeBgtV6yxXbcN87n9Ha7XWcO/2ExaUl4Oc3pTaqB6dPA84EzGrL+9qjXtsjAqFl8VCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SN3KVN+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07F1C2BCB0;
	Sun, 17 May 2026 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779043633;
	bh=q0yo9dDFhdfYJZH46om+DDXSMlLk9yZyYFxDwNP5H2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SN3KVN+OmG+YdSHj8RmFq7bQsp31iwYIqyzerCEi4S9YLr2aGW6GrarlYu8N5KfpI
	 PRLxMH7RFr4ZHzgAh6nlDxuKg1wsVfg+7+ir2lAuUz+paDQgrva9SUc7VK3PMybwC6
	 LZm5O3+qfN79znFh/walN/wYHuKcZIPu4XL+hu8KbvZhOOdLgUM9xblR5u8EShTrGl
	 OhjnVG9KbVI/iG9yDYAJGrE0ZtonMUd3CcYMOz25f601ogVQi0zfDerCkOpdJLsnsG
	 WgJLI7g2BS+Wio+EhVuUJzaY4hhSjo1HaCFGPEB5u9XJzHWkPlXPQkScIN0lVViTc3
	 FM6Z/DJz5l/yA==
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
Subject: Re: [RFC PATCH 3/5] mm/damon/core: floor effective quota size at minimum region size
Date: Sun, 17 May 2026 11:47:04 -0700
Message-ID: <20260517184705.4652-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516210357.2247-4-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7B8F65635A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88061-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 16 May 2026 14:03:55 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> The CONSIST quota goal tuner initializes esz_bp to 0, producing an
> effective quota size (esz) of 1 byte on the first tick.
> damos_quota_is_full() rejects all regions when esz < min_region_sz
> (default PAGE_SIZE = 4096), so no regions can be tried and no
> feedback reaches the tuner — a bootstrapping deadlock.

That depend on whether the goal is already [over]-achieved.  If the goal is
achieved, the tuner will think no change is needed, so keep the
effectively-zero quota.  If the goal is over-achived, the tuner will think the
DAMOS scheme should be less aggressive, but it is already effectively-zero
quota, so keep having effectively-zero quota.

If the ogal is under-achived, the logic will iteratively increase the internal
esz (esz_bp), until it exceeds the min_region_sz, and finally start making some
effects.

So, unless the goal is already [over]-achieved, there is no deadlock.  If the
goal is already [over]-achieved, why we would want to make DAMOS do something?

Am I missing something?

I'd like to discuss this high level thing first, before digging deep into the
details.


Thanks,
SJ

[...]

